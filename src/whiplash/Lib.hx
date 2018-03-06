package whiplash;

import phaser.Game;

class Lib {
    static public var game:Game;

    static public function init(_game:Game, engine:ash.core.Engine) {
        game = _game;
        engine.addSystem(new SpriteSystem(game), 1);
        engine.addSystem(new TextSystem(game), 1);
        engine.addSystem(new GraphicsSystem(game), 1);
    }
}
