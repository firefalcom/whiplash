package whiplash.babylon;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;

class ParticleSystemNode extends Node<ParticleSystemNode> {
    public var ps:ParticleSystem;
}

class ParticleSystemSystem extends ListIteratingSystem<ParticleSystemNode> {

    public function new() {
        super(ParticleSystemNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:ParticleSystemNode, dt:Float):Void {
    }

    private function onNodeAdded(node:ParticleSystemNode) {
        var ps = node.ps;
        ps.scene.addParticleSystem(ps.o);
    }

    private function onNodeRemoved(node:ParticleSystemNode) {
        var ps = node.ps;
        ps.scene.removeParticleSystem(ps.o);
    }

}
