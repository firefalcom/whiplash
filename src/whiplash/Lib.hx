package whiplash;

import js.Browser.document;

class Lib {
    static public var phaserGame:phaser.Game;
    static public var babylonEngine:BABYLON.Engine;
    static public var ashEngine:ash.core.Engine;
    static public var babylonCanvas:js.html.CanvasElement;

    static public function init(?width:Int = 800, ?height:Int = 600, ?parent:String = "body", ?callbacks: {?preload:Void->Void, ?create:Void->Void, ?update:Void->Void} = null, ?systemsPriority:Int = 10) {
        phaserGame = new phaser.Game(width, height, phaser.Phaser.CANVAS, '', {preload:callbacks.preload, create:callbacks.create, update:callbacks.update});
        phaserGame.transparent = true;
        babylonCanvas = js.Browser.document.createCanvasElement();
        document.querySelector(parent).appendChild(babylonCanvas);
        babylonCanvas.width = width;
        babylonCanvas.height = height;
        babylonCanvas.style.width = width+"px";
        babylonCanvas.style.height = height+"px";
        babylonCanvas.style.zIndex = "-1";
        babylonCanvas.style.position = "absolute";
        babylonEngine = new BABYLON.Engine(cast babylonCanvas, true);
        ashEngine = new ash.core.Engine();
        ashEngine.addSystem(new SpriteSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TileSpriteSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TilemapLayerSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TextSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new GraphicsSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new PointLightSystem(), systemsPriority);
        ashEngine.addSystem(new DirectionalLightSystem(), systemsPriority);
        ashEngine.addSystem(new MeshSystem(), systemsPriority);
        ashEngine.addSystem(new FreeCameraSystem(), systemsPriority);
    }
}

