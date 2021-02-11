package whiplash.phaser.spine;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class SpineNode extends Node<SpineNode> {
    public var transform:Transform;
    public var spine:Spine;
}

class SpineSystem extends ListIteratingSystem<SpineNode> {

    public function new() {
        super(SpineNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:SpineNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:SpineNode) {
        apply(node);
        node.spine._o.setActive(true);
        node.spine._o.setVisible(true);
    }

    private function onNodeRemoved(node:SpineNode) {
        node.spine._o.setActive(false);
        node.spine._o.setVisible(false);
    }

    private inline function apply(node:SpineNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var spine = node.spine._o;
        spine.setPosition(position.x, position.y);
        spine.setScale(scale.x, scale.y);
        spine.setAngle(transform.rotation);
    }
}
