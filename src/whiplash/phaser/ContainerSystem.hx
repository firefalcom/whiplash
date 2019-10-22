package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class ContainerNode extends Node<ContainerNode> {
    public var transform:Transform;
    public var container:Container;
}

class ContainerSystem extends ListIteratingSystem<ContainerNode> {

    public function new() {
        super(ContainerNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:ContainerNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:ContainerNode) {
        apply(node);

        for(child in node.container.children) {
            Lib.ashEngine.addEntity(child);
        }

        node.container.setActive(true);
        node.container.setVisible(true);
    }

    private function onNodeRemoved(node:ContainerNode) {
        for(child in node.container.children) {
            Lib.ashEngine.removeEntity(child);
        }

        node.container.setActive(false);
        node.container.setVisible(false);
    }

    private inline function apply(node:ContainerNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var container = node.container;
        container.setPosition(position.x, position.y);
        container.setScale(scale.x, scale.y);
        container.setAngle(transform.rotation);
    }
}
