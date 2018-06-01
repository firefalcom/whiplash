package whiplash.babylon;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;

class FreeCameraNode extends Node<FreeCameraNode> {
    public var transform:Transform3d;
    public var freeCamera:FreeCamera;
}

class FreeCameraSystem extends ListIteratingSystem<FreeCameraNode> {

    public function new() {
        super(FreeCameraNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:FreeCameraNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:FreeCameraNode) {
        apply(node);
    }

    private function onNodeRemoved(node:FreeCameraNode) {
    }

    private inline function apply(node:FreeCameraNode) {
        var o = node.freeCamera.o;
        if(o != null) {
            var transform = node.transform;
            var position = transform.position;
            var rotation = transform.rotation;
            o.position.x = position.x;
            o.position.y = position.y;
            o.position.z = position.z;
            o.rotation.x = rotation.x;
            o.rotation.y = rotation.y;
            o.rotation.z = rotation.z;
        }
    }
}
