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
    public function new() {
        super(BitmapTextNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:BitmapTextNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:BitmapTextNode) {
        apply(node);
        throw "";//node.sprite.revive();
    }

    private function onNodeRemoved(node:BitmapTextNode) {
        throw "";//node.sprite.kill();
    }

    private inline function apply(node:BitmapTextNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var sprite = node.sprite;
        sprite.setPosition(position.x, position.y);
        sprite.setScale(scale.x, scale.y);
        sprite.setAngle(transform.rotation);
    }
}
