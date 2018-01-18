package;

import js.Lib;
import phaser.Game;
import phaser.Phaser;
import ash.core.Entity;
import ash.core.Engine;
import ash.tools.ListIteratingSystem;
import ash.core.Node;
import hpa.*;

class Move
{
    public var time:Float = 0.0;

    public function new()
    {
    }
}

class MoveNode extends Node<MoveNode>
{
    public var move:Move;
    public var transform:Transform;
}

class MoveSystem extends ListIteratingSystem<MoveNode>
{
    public function new()
    {
        super(MoveNode, updateNode);
    }

    private function updateNode(node:MoveNode, dt:Float):Void
    {
        node.move.time += dt;
        node.transform.position.x = Math.sin(node.move.time) * 200;
    }
}

class Test
{
    var game:Game;
    var engine:Engine;

    public function new()
    {
        game = new Game(800, 600, Phaser.CANVAS, 'haxe-phaser-ash test', { preload:preload, create:create, update:update });
        engine = new Engine();
        engine.addSystem(new SpriteSystem(game), 1);
        engine.addSystem(new MoveSystem(), 1);
    }

    function preload():Void
    {
        game.load.image('logo', 'firefalcom.png');
    }

    function create():Void
    {
        var entity = new Entity();
        entity.add(new Transform());
        entity.add(new Sprite('logo'));
        entity.add(new Move());
        engine.addEntity(entity);
    }

    function update():Void
    {
        engine.update(game.time.elapsed / 1000);
    }

    static function main():Void
    {
        new Test();
    }
}
