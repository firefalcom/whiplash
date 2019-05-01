package whiplash.babylon.systems;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import whiplash.babylon.components.*;

class MaterialNode extends Node<MaterialNode> {
    public var mesh:Mesh;
    public var material:Material;
}

class MaterialSystem extends ListIteratingSystem<MaterialNode> {

    public function new() {
        super(MaterialNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:MaterialNode, dt:Float):Void {
        var material_node = node.material;

        if(material_node.hasTime) {
            material_node.time += dt;
            cast(material_node.o, BABYLON.ShaderMaterial).setFloat("time", material_node.time);
        }
    }

    private function onNodeAdded(node:MaterialNode) {
        var mesh = node.mesh;
        var material = node.material;
        mesh.o.material = material.o;
    }

    private function onNodeRemoved(node:MaterialNode) {
        node.mesh.o.material = null;
    }
}
