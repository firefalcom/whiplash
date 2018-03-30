package whiplash;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;

class PointLightNode extends Node<PointLightNode> {
    public var transform:Transform3d;
    public var pointLight:PointLight;
}

class PointLightSystem extends ListIteratingSystem<PointLightNode> {

    public function new() {
        super(PointLightNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:PointLightNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:PointLightNode) {
        apply(node);
    }

    private function onNodeRemoved(node:PointLightNode) {
    }

    private inline function apply(node:PointLightNode) {
        var pointLight = node.pointLight.pointLight;
        if(pointLight != null) {
            var transform = node.transform;
            var position = transform.position;
            pointLight.position.x = position.x;
            pointLight.position.y = position.y;
            pointLight.position.z = position.z;
        }
    }
}
