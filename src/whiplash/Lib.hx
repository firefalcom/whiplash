package whiplash;

import whiplash.phaser.*;
import whiplash.babylon.systems.*;
import js.Browser.document;

class Lib {
    static public var ENABLE_PHASER = 1;
    static public var ENABLE_BABYLON = 2;
    static public var phaserGame:phaser.Game;
    static public var babylonEngine:BABYLON.Engine;
    static public var ashEngine:ash.core.Engine;
    static public var babylonCanvas:js.html.CanvasElement;
    static public var getDeltaTime:Void->Float;

    static public function init(?width:Int = 800, ?height:Int = 600, ?parent:String = "body", ?callbacks: {?preload:Void->Void, ?create:Void->Void, ?update:Void->Void} = null, ?options:Int = 3, ?systemsPriority:Int = 10) {
        var parentElement = document.querySelector(parent);
        ashEngine = new ash.core.Engine();
        if(options & ENABLE_PHASER != 0) {
            phaserGame = new phaser.Game(width, height, phaser.Phaser.CANVAS, '', {preload:callbacks.preload, create:callbacks.create, update:callbacks.update});
            phaserGame.transparent = true;
            getDeltaTime = function() {
                return phaserGame.time.elapsed;
            }
        }
        if(options & ENABLE_BABYLON != 0) {
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
        }
        if(options & ENABLE_PHASER != 0) {
            ashEngine.addSystem(new SpriteSystem(phaserGame), systemsPriority);
            ashEngine.addSystem(new TileSpriteSystem(phaserGame), systemsPriority);
            ashEngine.addSystem(new TilemapLayerSystem(phaserGame), systemsPriority);
            ashEngine.addSystem(new TextSystem(phaserGame), systemsPriority);
            ashEngine.addSystem(new GraphicsSystem(phaserGame), systemsPriority);
        }
        if(options & ENABLE_BABYLON != 0) {
            ashEngine.addSystem(new LightSystem(), systemsPriority);
            ashEngine.addSystem(new MeshSystem(), systemsPriority);
            ashEngine.addSystem(new CameraSystem(), systemsPriority);
            ashEngine.addSystem(new ParticleSystemSystem(), systemsPriority);
            ashEngine.addSystem(new Sprite3dSystem(), systemsPriority);
            ashEngine.addSystem(new MaterialSystem(), systemsPriority);
            ashEngine.addSystem(new VisibilitySystem(), systemsPriority);
            ashEngine.addSystem(new SoundSystem(), systemsPriority);
        }
        if(options & ENABLE_PHASER == 0) {
            getDeltaTime = babylonEngine.getDeltaTime;
            haxe.Timer.delay(function() {
                callbacks.preload();
                callbacks.create();
                babylonEngine.runRenderLoop(callbacks.update);
            }, 1);
        }
    }
}

