package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class BitmapTextNode extends Node<BitmapTextNode> {
    public var transform:Transform;
    public var sprite:BitmapText;
}

class BitmapTextSystem extends ListIteratingSystem<BitmapTextNode> {
    private var game:Game;

    public function new(game) {
        super(BitmapTextNode, updateNode, onNodeAdded, onNodeRemoved);
        this.game = game;
    }

    private function updateNode(node:BitmapTextNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:BitmapTextNode) {
        apply(node);
        node.sprite.revive();
    }

    private function onNodeRemoved(node:BitmapTextNode) {
        node.sprite.kill();
    }

    private inline function apply(node:BitmapTextNode) {
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
