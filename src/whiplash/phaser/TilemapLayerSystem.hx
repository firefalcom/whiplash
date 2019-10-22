package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class TilemapLayerNode extends Node<TilemapLayerNode> {
    public var tilemapLayer:TilemapLayer;
}

class TilemapLayerSystem extends ListIteratingSystem<TilemapLayerNode> {

    public function new() {
        super(TilemapLayerNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:TilemapLayerNode, dt:Float):Void {
    }

    private function onNodeAdded(node:TilemapLayerNode) {
        throw "";//node.tilemapLayer.revive();
    }

    private function onNodeRemoved(node:TilemapLayerNode) {
        throw "";//node.tilemapLayer.kill();
    }
}
