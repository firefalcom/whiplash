package whiplash.babylon;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;

class DirectionalLightNode extends Node<DirectionalLightNode> {
    public var transform:Transform3d;
    public var directionalLight:DirectionalLight;
}

class DirectionalLightSystem extends ListIteratingSystem<DirectionalLightNode> {

    public function new() {
        super(DirectionalLightNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:DirectionalLightNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:DirectionalLightNode) {
        apply(node);
    }

    private function onNodeRemoved(node:DirectionalLightNode) {
    }

    private inline function apply(node:DirectionalLightNode) {
        var o = node.directionalLight.o;
        if(o != null) {
            var transform = node.transform;
            var position = transform.position;
            o.position.x = position.x;
            o.position.y = position.y;
            o.position.z = position.z;
        }
    }
}
