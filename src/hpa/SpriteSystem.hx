package hpa;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class SpriteNode extends Node<SpriteNode>
{
    public var transform:Transform;
    public var sprite:Sprite;
}

class SpriteSystem extends ListIteratingSystem<SpriteNode>
{
    private var game:Game;

    public function new(game)
    {
        super(SpriteNode, updateNode, onNodeAdded, onNodeRemoved);

        this.game = game;
    }

    public override function addToEngine(engine:Engine)
    {
        super.addToEngine(engine);
    }

    public override function removeFromEngine(engine:Engine)
    {
        super.removeFromEngine(engine);
    }

    private function updateNode(node:SpriteNode, dt:Float):Void
    {
        var position = node.transform.position;
        var sprite = node.sprite.sprite;
        sprite.position.x = position.x;
        sprite.position.y = position.y;
    }

    private function onNodeAdded(node:SpriteNode)
    {
        var position = node.transform.position;
        node.sprite.sprite = game.add.sprite(position.x, position.x, node.sprite.key);
    }

    private function onNodeRemoved(node:SpriteNode)
    {
        node.sprite.sprite.destroy();
        node.sprite.sprite = null;
    }
}
