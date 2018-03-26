package whiplash;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;

class MeshNode extends Node<MeshNode> {
    public var transform:Transform3D;
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
        apply(node);
    }

    private function onNodeRemoved(node:MeshNode) {
    }

    private inline function apply(node:MeshNode) {
        var mesh = node.mesh.mesh;
        if(mesh != null) {
            var transform = node.transform;
            var position = transform.position;
            var rotation = transform.rotation;
            var scale = transform.scale;
            mesh.position.x = position.x;
            mesh.position.y = position.y;
            mesh.position.z = position.z;
            mesh.rotation.x = rotation.x;
            mesh.rotation.y = rotation.y;
            mesh.rotation.z = rotation.z;
            mesh.scaling.x = scale.x;
            mesh.scaling.y = scale.y;
            mesh.scaling.z = scale.z;
        }
    }
}
