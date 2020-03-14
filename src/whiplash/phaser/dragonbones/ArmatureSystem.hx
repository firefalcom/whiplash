package whiplash.phaser.dragonbones;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class ArmatureNode extends Node<ArmatureNode> {
    public var transform:Transform;
    public var armature:Armature;
}

class ArmatureSystem extends ListIteratingSystem<ArmatureNode> {

    public function new() {
        super(ArmatureNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:ArmatureNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:ArmatureNode) {
        apply(node);
        node.armature._o.setActive(true);
        node.armature._o.setVisible(true);
    }

    private function onNodeRemoved(node:ArmatureNode) {
        node.armature._o.setActive(false);
        node.armature._o.setVisible(false);
    }

    private inline function apply(node:ArmatureNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var armature = node.armature._o;
        armature.setPosition(position.x, position.y);
        armature.setScale(scale.x, scale.y);
        armature.setAngle(transform.rotation);
    }
}
