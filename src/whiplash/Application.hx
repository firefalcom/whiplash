package whiplash;

import ash.fsm.EngineState;
import ash.fsm.EngineStateMachine;
import js.jquery.*;
import js.Browser.window;

class Application {
    public var engine:ash.core.Engine;
    public var uiEngine:ash.core.Engine;
    var game:phaser.Game;
    var esm:EngineStateMachine;
    var ingameEsm:EngineStateMachine;
    var uiEsm:EngineStateMachine;
    var pages:js.uipages.Group;
    var statePageMap:Map<String, String>;
    var timeFactor:Float = 1;

    public function new(width:Int = 800, height:Int = 600, parent:String = "body", whiplash_options:Int = 3) {
        new JQuery(window).on("load", function() {
            whiplash.Lib.init(width, height, parent, {preload:preload, create:create, update:update}, whiplash_options);
            uiEngine = new ash.core.Engine();
            engine = whiplash.Lib.ashEngine;
            game = whiplash.Lib.phaserGame;
            esm = new EngineStateMachine(engine);
            ingameEsm = new EngineStateMachine(engine);
            uiEsm = new EngineStateMachine(uiEngine);
            statePageMap = new Map<String, String>();
            onGuiLoaded();
        });
    }

    function preload():Void {
        DataManager.preload(whiplash.Lib.phaserScene);
    }

    function create():Void {
        AudioManager.init(whiplash.Lib.phaserScene);
    }

    function update(time:Float, delta:Float):Void {
        var t = delta / 1000;
        t *= timeFactor;
        engine.update(t);
        uiEngine.update(t);
    }

    function createState(name:String):EngineState {
        var state = new EngineState();
        esm.addState(name, state);
        return state;
    }

    function createIngameState(name:String):EngineState {
        var state = new EngineState();
        ingameEsm.addState(name, state);
        return state;
    }

    function createUiState(name:String, page:Null<String>):EngineState {
        var state = new EngineState();
        uiEsm.addState(name, state);

        if(page != null) {
            statePageMap.set(name, page);
        }

        return state;
    }

    function onResize() {
    }

    function onGuiLoaded() {
        pages = js.uipages.Lib.createGroup(new JQuery(".pages"));
        pages.showPage(".default");
        onResize();
    }

    public function changeState(stateName) {
        engine.updateComplete.addOnce(function() {
            esm.changeState(stateName);
        });
    }

    public function changeIngameState(stateName) {
        engine.updateComplete.addOnce(function() {
            ingameEsm.changeState(stateName);
        });
    }

    public function changeUiState(stateName) {
        uiEngine.updateComplete.addOnce(function() {
            uiEsm.changeState(stateName);
            var pageName = statePageMap.get(stateName);

            if(pageName != null) {
                pages.showPage(pageName);
            }
        });
    }

    public function delay(func, time_s:Float) {
        haxe.Timer.delay(func, Std.int(time_s * 1000 / timeFactor));
    }
}
