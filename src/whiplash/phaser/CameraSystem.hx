package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class CameraNode extends Node<CameraNode> {
    public var transform:Transform;
    public var camera:Camera;
}

class CameraSystem extends ListIteratingSystem<CameraNode> {

    public function new() {
        super(CameraNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:CameraNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:CameraNode) {
        apply(node);

        if(node.camera.main) {
            whiplash.Lib.phaserScene.cameras.remove(whiplash.Lib.phaserScene.cameras.main);
        }

        whiplash.Lib.phaserScene.cameras.addExisting(node.camera, node.camera.main);
    }

    private function onNodeRemoved(node:CameraNode) {
        whiplash.Lib.phaserScene.cameras.remove(node.camera);
    }

    private inline function apply(node:CameraNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var camera = node.camera;

        if(untyped camera._follow != null) {
            position.setTo(camera.scrollX + camera.width * 0.5, camera.scrollY + camera.height * 0.5);
        } else {
            camera.setScroll(position.x - camera.width * 0.5, position.y - camera.height * 0.5);
        }

        camera.setAngle(transform.rotation);
    }
}
