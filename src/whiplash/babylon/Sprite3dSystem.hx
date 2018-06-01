package whiplash.babylon;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;

class Sprite3dNode extends Node<Sprite3dNode> {
    public var transform:Transform3d;
    public var sprite:Sprite3d;
}

class Sprite3dSystem extends ListIteratingSystem<Sprite3dNode> {

    public function new() {
        super(Sprite3dNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:Sprite3dNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:Sprite3dNode) {
        apply(node);
        node.sprite.o.color.a = node.sprite._alpha;
    }

    private function onNodeRemoved(node:Sprite3dNode) {
        node.sprite._alpha = node.sprite.o.color.a;
        node.sprite.o.color.a = 0;
    }

    private inline function apply(node:Sprite3dNode) {
        var o = node.sprite.o;
        if(o != null) {
            var transform = node.transform;
            var position = transform.position;
            o.position.x = position.x;
            o.position.y = position.y;
            o.position.z = position.z;
        }
    }
}
