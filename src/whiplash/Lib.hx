package whiplash;

import js.Browser.document;

typedef Options = {
    width:Int
}

class Lib {
    static public var phaserGame:phaser.Game;
    static public var babylonEngine:babylonx.Engine;
    static public var ashEngine:ash.core.Engine;

    static public function init(?width:Int = 800, ?height:Int = 600, ?parent:String = "body", ?callbacks:{?preload:Void->Void, ?create:Void->Void, ?update:Void->Void} = null, ?systemsPriority:Int = 10) {
        phaserGame = new phaser.Game(width, height, phaser.Phaser.CANVAS, '', {preload:callbacks.preload, create:callbacks.create, update:callbacks.update});
        phaserGame.transparent = true;
        var canvas = js.Browser.document.createCanvasElement();
        document.querySelector(parent).appendChild(canvas);
        canvas.width = width;
        canvas.height = height;
        canvas.style.width = width+"px";
        canvas.style.height = height+"px";
        canvas.style.zIndex = "-1";
        canvas.style.position = "absolute";
        babylonEngine = new babylonx.Engine(canvas, true);
        ashEngine = new ash.core.Engine();
        ashEngine.addSystem(new SpriteSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TextSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new GraphicsSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new MeshSystem(), systemsPriority);
    }
}
