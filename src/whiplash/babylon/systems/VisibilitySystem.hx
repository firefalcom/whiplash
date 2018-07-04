package whiplash.babylon.systems;

import ash.core.*;
import whiplash.common.components.Visible;
import whiplash.babylon.components.Mesh;
import whiplash.babylon.components.Sprite3d;

class MeshVisibiltyNode extends Node<MeshVisibiltyNode> {
    public var visible : Visible;
    public var mesh : Mesh;
}

class SpriteVisibiltyNode extends Node<SpriteVisibiltyNode> {
    public var visible : Visible;
    public var sprite : Sprite3d;
}

class VisibilitySystem extends System {

    var meshList : NodeList<MeshVisibiltyNode>;
    var spriteList : NodeList<SpriteVisibiltyNode>;

    public function new() {
        super();
    }

    override public function addToEngine(e:Engine) {
        super.addToEngine(e);
        meshList = e.getNodeList(MeshVisibiltyNode);
        spriteList = e.getNodeList(SpriteVisibiltyNode);
        meshList.nodeRemoved.add(onMeshRemoved);
        spriteList.nodeRemoved.add(onSpriteRemoved);
        meshList.nodeAdded.add(onMeshAdded);
        spriteList.nodeAdded.add(onSpriteAdded);
    }

    override public function removeFromEngine(e:Engine) {
        for(mesh in meshList) {
            mesh.mesh.o.isVisible = true;
        }
        for(sprite in spriteList) {
            sprite.sprite.o.isVisible = true;
        }
    }

    override public function update(dt:Float) {
        super.update(dt);
        for(mesh in meshList) {
            mesh.mesh.o.isVisible = mesh.visible.visible;
        }
        for(sprite in spriteList) {
            sprite.sprite.o.isVisible = sprite.visible.visible;
        }
    }


    private function onMeshAdded(node:MeshVisibiltyNode) {
        node.mesh.o.isVisible = node.visible.visible;
    }

    private function onMeshRemoved(node:MeshVisibiltyNode) {
        node.mesh.o.isVisible = true;
    }

    private function onSpriteAdded(node:SpriteVisibiltyNode) {
        node.sprite.o.isVisible = node.visible.visible;
    }

    private function onSpriteRemoved(node:SpriteVisibiltyNode) {
        node.sprite.o.isVisible = true;
    }

}