package whiplash.babylon.systems;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import whiplash.babylon.components.*;

class LightNode extends Node<LightNode> {
    public var transform:Transform3d;
    public var light:Light;
}

class LightSystem extends ListIteratingSystem<LightNode> {

    public function new() {
        super(LightNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:LightNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:LightNode) {
        var light = node.light;
        light.scene.addLight(light.o);
        apply(node);
    }

    private function onNodeRemoved(node:LightNode) {
        var light = node.light;
        light.o.getScene().removeLight(light.o);
    }

    private inline function apply(node:LightNode) {
        var o = node.light.o;
        if(o != null) {
            var transform = node.transform;
            var position = transform.position;
            o.position.x = position.x;
            o.position.y = position.y;
            o.position.z = position.z;
        }
    }
}
