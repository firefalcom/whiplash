package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class EmitterNode extends Node<EmitterNode> {
    public var transform:Transform;
    public var emitter:Emitter;
}

class EmitterSystem extends ListIteratingSystem<EmitterNode> {
    private var game:Game;

    public function new(game) {
        super(EmitterNode, updateNode, onNodeAdded, onNodeRemoved);
        this.game = game;
    }

    private function updateNode(node:EmitterNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:EmitterNode) {
        apply(node);
        node.emitter.revive();
    }

    private function onNodeRemoved(node:EmitterNode) {
        node.emitter.destroy();
        node.emitter.kill();
    }

    private inline function apply(node:EmitterNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var emitter = node.emitter;
        emitter.position.x = position.x;
        emitter.position.y = position.y;
        emitter.scale.x = scale.x;
        emitter.scale.y = scale.y;
        emitter.angle = transform.rotation;
    }
}
