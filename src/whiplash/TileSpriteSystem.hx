package whiplash;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class TileSpriteNode extends Node<TileSpriteNode> {
    public var transform:Transform;
    public var sprite:TileSprite;
}

class TileSpriteSystem extends ListIteratingSystem<TileSpriteNode> {
    private var game:Game;

    public function new(game) {
        super(TileSpriteNode, updateNode, onNodeAdded, onNodeRemoved);
        this.game = game;
    }

    private function updateNode(node:TileSpriteNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:TileSpriteNode) {
        apply(node);
        untyped node.sprite.revive();
    }

    private function onNodeRemoved(node:TileSpriteNode) {
        untyped node.sprite.kill();
    }

    private inline function apply(node:TileSpriteNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var sprite = node.sprite;
        sprite.position.x = position.x;
        sprite.position.y = position.y;
        sprite.scale.x = scale.x;
        sprite.scale.y = scale.y;
        sprite.angle = transform.rotation;
    }
}
