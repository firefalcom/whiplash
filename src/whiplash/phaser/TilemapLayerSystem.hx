package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class TilemapLayerNode extends Node<TilemapLayerNode> {
    public var transform:Transform;
    public var tilemapLayer:TilemapLayer;
}

class TilemapLayerSystem extends ListIteratingSystem<TilemapLayerNode> {

    public function new() {
        super(TilemapLayerNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:TilemapLayerNode, dt:Float):Void {
    }

    private function onNodeAdded(node:TilemapLayerNode) {
        apply(node);
        node.tilemapLayer.setActive(true);
        node.tilemapLayer.setVisible(true);
    }

    private function onNodeRemoved(node:TilemapLayerNode) {
        node.tilemapLayer.setActive(false);
        node.tilemapLayer.setVisible(false);
    }

    private inline function apply(node:TilemapLayerNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var tilemapLayer = node.tilemapLayer;
        tilemapLayer.setPosition(position.x, position.y);
        tilemapLayer.setScale(scale.x, scale.y);
    }
}
