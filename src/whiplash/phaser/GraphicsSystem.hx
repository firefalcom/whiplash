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

        node.graphics.setActive(true);
        node.graphics.setVisible(true);
    }

    private function onNodeRemoved(node:GraphicsNode) {

        node.graphics.setActive(false);
        node.graphics.setVisible(false);
    }

    private inline function apply(node:GraphicsNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var graphics = node.graphics;
        graphics.setPosition( position.x, position.y );
        graphics.setScale( scale.x, scale.y );
        graphics.setAngle( transform.rotation );
    }
}
