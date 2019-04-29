package whiplash;

import whiplash.phaser.*;
import whiplash.babylon.systems.*;
import js.Browser.document;

class Lib {
#if phaser
    static public var phaserGame:phaser.Game;
    static public var phaserScene:phaser.Scene;
#end
#if babylonjs
    static public var babylonEngine:BABYLON.Engine;
#end
    static public var ashEngine:ash.core.Engine;
    static public var babylonCanvas:js.html.CanvasElement;

    static public function init(?width:Int = 800, ?height:Int = 600, ?parent:String = "body", ?callbacks: {?preload:Void->Void, ?create:Void->Void, ?update:Float->Float->Void, ?render:Void->Void} = null, ?options:Int = 3, ?systemsPriority:Int = 10) {
        var parentElement = document.querySelector(parent);
        ashEngine = new ash.core.Engine();
#if phaser

        var local_preload = function(){
                #if phaser
                phaserScene = untyped __js__ ("this");
                #end
                callbacks.preload();
        };
        phaserGame = new phaser.Game(
                { width: width, height: height, type: untyped Phaser.CANVAS, parent: parentElement,
                scene : {preload:local_preload, create:callbacks.create, update:callbacks.update, render:callbacks.render},
                render : {transparent:true}
                }
                );
#end
#if babylonjs
        babylonCanvas = js.Browser.document.createCanvasElement();
        parentElement.appendChild(babylonCanvas);
        babylonCanvas.classList.add('babylonCanvas');
        babylonCanvas.width = width;
        babylonCanvas.height = height;
        babylonCanvas.style.width = width+"px";
        babylonCanvas.style.height = height+"px";
        babylonCanvas.style.zIndex = "-1";
        babylonCanvas.style.position = "absolute";
        babylonEngine = new BABYLON.Engine(cast babylonCanvas, true);
#end
#if phaser
        ashEngine.addSystem(new GroupSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new SpriteSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TileSpriteSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TilemapLayerSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TextSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new BitmapTextSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new GraphicsSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new EmitterSystem(phaserGame), systemsPriority);
#end
#if babylonjs
        ashEngine.addSystem(new LightSystem(), systemsPriority);
        ashEngine.addSystem(new MeshSystem(), systemsPriority);
        ashEngine.addSystem(new CameraSystem(), systemsPriority);
        ashEngine.addSystem(new ParticleSystemSystem(), systemsPriority);
        ashEngine.addSystem(new Sprite3dSystem(), systemsPriority);
        ashEngine.addSystem(new MaterialSystem(), systemsPriority);
        ashEngine.addSystem(new VisibilitySystem(), systemsPriority);
        ashEngine.addSystem(new SoundSystem(), systemsPriority);
#end
#if !phaser
        getDeltaTime = babylonEngine.getDeltaTime;
        haxe.Timer.delay(function() {
            callbacks.preload();
            callbacks.create();
            babylonEngine.runRenderLoop(callbacks.update);
        }, 1);
#end
    }
}

