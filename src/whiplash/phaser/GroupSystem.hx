package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class GroupNode extends Node<GroupNode> {
    public var transform:Transform;
    public var group:Group;
}

class GroupSystem extends ListIteratingSystem<GroupNode> {
    private var game:Game;

    public function new(game) {
        super(GroupNode, updateNode, onNodeAdded, onNodeRemoved);
        this.game = game;
    }

    private function updateNode(node:GroupNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:GroupNode) {
        apply(node);
    }

    private function onNodeRemoved(node:GroupNode) {
    }

    private inline function apply(node:GroupNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var group = node.group;
        group.position.x = position.x;
        group.position.y = position.y;
        group.scale.x = scale.x;
        group.scale.y = scale.y;
        group.angle = transform.rotation;
    }
}
