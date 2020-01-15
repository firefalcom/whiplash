package whiplash;

import whiplash.phaser.*;
import whiplash.babylon.systems.*;
import js.Browser.document;

class Lib {
#if phaser
    static public var phaserGame:phaser.Game;
    static public var phaserScene:phaser.Scene;
    static public var phaserCanvas:js.html.CanvasElement;
#end
#if babylonjs
    static public var babylonEngine:BABYLON.Engine;
    static public var babylonCanvas:js.html.CanvasElement;
#end
    static public var ashEngine:ash.core.Engine;
    static public var getDeltaTime:Void->Float;

    static private function createCanvas(parentElement:js.html.Element, width:Int, height:Int) {
        var canvas = js.Browser.document.createCanvasElement();
        parentElement.appendChild(canvas);
        canvas.width = width;
        canvas.height = height;
        canvas.style.zIndex = "-1";
        canvas.style.position = "absolute";
        return canvas;
    }

    static public function init(?width:Int = 800, ?height:Int = 600, ?parent:String = "body", ?callbacks: {?preload:Void->Void, ?create:Void->Void, ?update:Float->Float->Void, ?render:Void->Void} = null, ?scaleMode, ?systemsPriority:Int = 10) {
        var parentElement = document.querySelector(parent);
        ashEngine = new ash.core.Engine();
#if babylonjs
        babylonCanvas = createCanvas(parentElement, width, height);
        babylonCanvas.classList.add('babylonCanvas');
        babylonEngine = new BABYLON.Engine(cast babylonCanvas, true);
#end
#if phaser
        var local_preload = function() {
            phaserScene = untyped __js__("this");
            callbacks.preload();
        };
        phaserCanvas = createCanvas(parentElement, width, height);
        phaserCanvas.classList.add('phaserCanvas');
        phaserGame = new phaser.Game({
            width: width, height: height, type: untyped Phaser.WEBGL, canvas: phaserCanvas,
            scene : {preload:local_preload, create:callbacks.create, update:callbacks.update, render:callbacks.render},
            render : {transparent:true},
            physics: {"default":'arcade'},
            scale : { mode: (scaleMode != null ? scaleMode : phaser.scale.scalemodes.RESIZE)}
        });
#end
#if phaser
        ashEngine.addSystem(new ContainerSystem(), systemsPriority);
        ashEngine.addSystem(new SpriteSystem(), systemsPriority);
        ashEngine.addSystem(new TileSpriteSystem(), systemsPriority);
        ashEngine.addSystem(new TilemapLayerSystem(), systemsPriority);
        ashEngine.addSystem(new TextSystem(), systemsPriority);
        ashEngine.addSystem(new BitmapTextSystem(), systemsPriority);
        ashEngine.addSystem(new GraphicsSystem(), systemsPriority);
        ashEngine.addSystem(new EmitterSystem(), systemsPriority);
        ashEngine.addSystem(new whiplash.phaser.LightSystem(), systemsPriority);
        ashEngine.addSystem(new whiplash.phaser.CameraSystem(), systemsPriority);
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
        var totalTime = 0.0;
        var updateLoop = function() {
            var dt = getDeltaTime();
            totalTime += dt;
            callbacks.update(totalTime, dt);
        };
        haxe.Timer.delay(function() {
            callbacks.preload();
            callbacks.create();
            babylonEngine.runRenderLoop(updateLoop);
        }, 1);
#end
    }
}

