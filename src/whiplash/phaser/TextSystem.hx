package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class TextNode extends Node<TextNode> {
    public var transform:Transform;
    public var sprite:Text;
}

class TextSystem extends ListIteratingSystem<TextNode> {
    private var game:Game;

    public function new(game) {
        super(TextNode, updateNode, onNodeAdded, onNodeRemoved);
        this.game = game;
    }

    private function updateNode(node:TextNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:TextNode) {
        apply(node);
        node.sprite.revive();
    }

    private function onNodeRemoved(node:TextNode) {
        node.sprite.kill();
    }

    private inline function apply(node:TextNode) {
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
