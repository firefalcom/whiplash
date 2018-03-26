package whiplash;


class Lib {
    static public var phaserGame:phaser.Game;
    static public var babylonEngine:babylonx.Engine;
    static public var ashEngine:ash.core.Engine;

    static public function init(callbacks:Dynamic, systemsPriority:Int = 10) {
        phaserGame = new phaser.Game(800, 600, phaser.Phaser.CANVAS, 'haxe-phaser-ash test', callbacks);
        phaserGame.transparent = true;
        var canvas = js.Browser.document.getElementById("canvas3d");
        babylonEngine = new babylonx.Engine(cast canvas, true);
        ashEngine = new ash.core.Engine();
        ashEngine.addSystem(new SpriteSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new TextSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new GraphicsSystem(phaserGame), systemsPriority);
        ashEngine.addSystem(new MeshSystem(), systemsPriority);
    }
}
