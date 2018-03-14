package whiplash;

import phaser.Game;

class Lib {
    static public var game:Game;

    static public function init(_game:Game, engine:ash.core.Engine, systemsPriority:Int = 10) {
        game = _game;
        engine.addSystem(new SpriteSystem(game), systemsPriority);
        engine.addSystem(new TextSystem(game), systemsPriority);
        engine.addSystem(new GraphicsSystem(game), systemsPriority);
    }
}
