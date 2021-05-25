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
        if(!node.emitter._added) {
            whiplash.Lib.phaserScene.add.existing(node.emitter);
            node.emitter._added = true;
        }

        apply(node);
        node.emitter.setActive(true);
        node.emitter.setVisible(true);
    }

    private function onNodeRemoved(node:EmitterNode) {
        node.emitter.setActive(false);
        node.emitter.setVisible(false);
    }

    private inline function apply(node:EmitterNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var emitter = node.emitter;

        if(emitter.moveEmitters) {
            for(name in Reflect.fields(node.emitter.emitters.list)) {
                var emitter = Reflect.field(node.emitter.emitters.list, name);
                emitter.setPosition(position.x, position.y);
            }
        } else {
            emitter.setScale(scale.x, scale.y);
            emitter.setPosition(position.x, position.y);
            emitter.setAngle(transform.rotation);
        }
    }
}
