package whiplash;

import whiplash.phaser.*;
import whiplash.babylon.systems.*;
import js.Browser.document;

class Lib {
#if phaser
    static public var phaserGame:phaser.Game;
#end
#if babylonjs
    static public var babylonEngine:BABYLON.Engine;
#end
    static public var ashEngine:ash.core.Engine;
    static public var babylonCanvas:js.html.CanvasElement;
    static public var getDeltaTime:Void->Float;

    static public function init(?width:Int = 800, ?height:Int = 600, ?parent:String = "body", ?callbacks: {?preload:Void->Void, ?create:Void->Void, ?update:Void->Void, ?render:Void->Void} = null, ?options:Int = 3, ?systemsPriority:Int = 10) {
        var parentElement = document.querySelector(parent);
        ashEngine = new ash.core.Engine();
#if phaser
        phaserGame = new phaser.Game(width, height, phaser.Phaser.CANVAS, parentElement, {preload:callbacks.preload, create:callbacks.create, update:callbacks.update, render:callbacks.render});
        phaserGame.transparent = true;
        getDeltaTime = function() {
            return phaserGame.time.elapsed;
        }
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
        ashEngine.addSystem(new SpriteSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TileSpriteSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TilemapLayerSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TextSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new BitmapTextSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new GraphicsSystem(phaserGame), systemsPriority);
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

