package whiplash;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;

class MeshNode extends Node<MeshNode> {
    public var transform:Transform3d;
    public var mesh:Mesh;
}

class MeshSystem extends ListIteratingSystem<MeshNode> {

    public function new() {
        super(MeshNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:MeshNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:MeshNode) {
        node.mesh.o.isVisible = true;
        if(node.mesh.o.rotationQuaternion == null) {
            node.mesh.o.rotationQuaternion = new babylonx.tools.math.Quaternion(0, 0, 0, 1);
        }
        apply(node);
    }

    private function onNodeRemoved(node:MeshNode) {
        node.mesh.o.isVisible = false;
    }

    private inline function apply(node:MeshNode) {
        var o = node.mesh.o;
        if(o != null) {
            var transform = node.transform;
            var position = transform.position;
            var rotation = transform.rotation;
            var scale = transform.scale;
            o.position.x = position.x;
            o.position.y = position.y;
            o.position.z = position.z;
            o.rotationQuaternion.x = rotation.x;
            o.rotationQuaternion.y = rotation.y;
            o.rotationQuaternion.z = rotation.z;
            o.rotationQuaternion.w = rotation.w;
            o.scaling.x = scale.x;
            o.scaling.y = scale.y;
            o.scaling.z = scale.z;
        }
    }
}
