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
    public function new() {
        super(EmitterNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:EmitterNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:EmitterNode) {
        apply(node);
        node.emitter.setActive(true);
        node.emitter.setVisible(true);
    }

    private function onNodeRemoved(node:EmitterNode) {
        node.emitter.destroy();
    }

    private inline function apply(node:EmitterNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var emitter = node.emitter;
        emitter.setScale(scale.x, scale.y);

        if(emitter.moveEmitters) {
            for(name in Reflect.fields(node.emitter.emitters.list)) {
                var emitter = Reflect.field(node.emitter.emitters.list, name);
                emitter.setPosition(position.x / scale.x, position.y / scale.y);
                emitter.setAngle(transform.rotation);
            }
        } else {
            emitter.setPosition(position.x, position.y);
            emitter.setAngle(transform.rotation);
        }
    }
}
