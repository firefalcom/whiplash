package whiplash;

import ash.fsm.EngineState;
import ash.fsm.EngineStateMachine;
import js.jquery.*;
import js.Browser.window;
import js.Browser.document;

class Application {
    public var engine:ash.core.Engine;
    public var uiEngine:ash.core.Engine;
#if phaser
    var game:phaser.Game;
#end
    var esm:EngineStateMachine;
    var ingameEsm:EngineStateMachine;
    var uiEsm:EngineStateMachine;
    var pages:js.uipages.Group;
    var statePageMap:Map<String, String>;

    var deltaTime:Float;
    var timeFactor:Float = 1;

    public function new(width:Int = 800, height:Int = 600, parent:String = "body") {
        new JQuery(window).on("load", function() {
            whiplash.Lib.init(width, height, parent, {preload:preload, create:create, update:update});
            whiplash.Input.setup(document.querySelector(parent));
            uiEngine = new ash.core.Engine();
            engine = whiplash.Lib.ashEngine;
#if phaser
            game = whiplash.Lib.phaserGame;
#end
            esm = new EngineStateMachine(engine);
            ingameEsm = new EngineStateMachine(engine);
            uiEsm = new EngineStateMachine(uiEngine);
            statePageMap = new Map<String, String>();
            onGuiLoaded();
        });
    }

    function preload():Void {

#if phaser
        DataManager.preload(whiplash.Lib.phaserScene);
#end
    }

    function create():Void {
#if phaser
        AudioManager.init(whiplash.Lib.phaserScene);
#end
    }

    function update(time:Float, delta:Float):Void {
        var delta_time = delta / 1000;
        delta_time *= timeFactor;
        whiplash.Input.update();
#if babylonjs
        BABYLON.Scene.MinDeltaTime = BABYLON.Scene.MaxDeltaTime = delta;
#end
        engine.update(delta_time);
        uiEngine.update(delta_time);
        whiplash.Input.postUpdate();
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
