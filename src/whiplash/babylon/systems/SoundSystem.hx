package whiplash.babylon.systems;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import whiplash.babylon.components.*;

class SoundNode extends Node<SoundNode> {
    public var mesh:Mesh;
    public var sound:Sound;
}

class SoundSystem extends ListIteratingSystem<SoundNode> {

    public function new() {
        super(SoundNode, null, onNodeAdded, onNodeRemoved);
    }

    private function onNodeAdded(node:SoundNode) {
        var sound = node.sound;
        var mesh = node.mesh;
        if(sound.o != null && mesh.o != null) {
            sound.o.attachToMesh(mesh.o);
        }
    }

    private function onNodeRemoved(node:SoundNode) {
        var sound = node.sound;
        if(sound.o != null) {
            sound.o.detachFromMesh();
        }
    }
}
