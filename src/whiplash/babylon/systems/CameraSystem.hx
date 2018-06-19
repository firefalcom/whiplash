package whiplash.babylon.systems;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import whiplash.babylon.components.*;
import whiplash.common.components.Active;

class CameraNode extends Node<CameraNode> {
    public var transform:Transform3d;
    public var camera:Camera;
    public var active:Active;
}

class CameraSystem extends ListIteratingSystem<CameraNode> {
    public function new() {
        super(CameraNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:CameraNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:CameraNode) {
        var camera = node.camera;
        camera.scene.addCamera(camera.o);
        camera.scene.activeCamera = camera.o;
        apply(node);
    }

    private function onNodeRemoved(node:CameraNode) {
        var camera = node.camera;
        camera.o.getScene().removeCamera(camera.o);
    }

    private inline function apply(node:CameraNode) {
        var o = node.camera.o;
        if(o != null) {
            var transform = node.transform;
            var position = transform.position;
            var rotation = transform.rotation;
            o.position.copyFrom(position);
            o.rotationQuaternion.copyFrom(rotation);
        }
    }
}
