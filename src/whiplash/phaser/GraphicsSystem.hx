package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class GraphicsNode extends Node<GraphicsNode> {
    public var transform:Transform;
    public var graphics:Graphics;
}

class GraphicsSystem extends ListIteratingSystem<GraphicsNode> {
    private var game:Game;

    public function new(game) {
        super(GraphicsNode, updateNode, onNodeAdded, onNodeRemoved);
        this.game = game;
    }

    private function updateNode(node:GraphicsNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:GraphicsNode) {
        apply(node);
        node.graphics.revive();
    }

    private function onNodeRemoved(node:GraphicsNode) {
        node.graphics.kill();
    }

    private inline function apply(node:GraphicsNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var graphics = node.graphics;
        graphics.position.x = position.x;
        graphics.position.y = position.y;
        graphics.scale.x = scale.x;
        graphics.scale.y = scale.y;
        graphics.angle = transform.rotation;
    }
}
