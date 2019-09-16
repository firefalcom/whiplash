package whiplash.phaser;

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
        node.sprite.setActive(true);
        node.sprite.setVisible(true);
    }

    private function onNodeRemoved(node:TileSpriteNode) {
        node.sprite.setActive(false);
        node.sprite.setVisible(false);
    }

    private inline function apply(node:TileSpriteNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var sprite = node.sprite;
        sprite.x = Std.int(position.x);
        sprite.y = Std.int(position.y);
        sprite.setScale(scale.x, scale.y);
        sprite.angle = cast transform.rotation;
    }
}
