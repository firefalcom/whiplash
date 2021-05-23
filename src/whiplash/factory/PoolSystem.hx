package whiplash.factory;

import ash.tools.ListIteratingSystem;
import ash.core.*;

class PoolableNode extends Node<PoolableNode> {
    public var poolable:Poolable;
}

class PoolSystem extends ListIteratingSystem<PoolableNode> {
    private var engine:Engine;

    public function new() {
        super(PoolableNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    public override function addToEngine(engine:Engine) {
        this.engine = engine;
        super.addToEngine(engine);
    }

    public override function removeFromEngine(engine:Engine) {
        super.removeFromEngine(engine);
    }


    private function updateNode(node:PoolableNode, dt:Float):Void {
    }


    private function onNodeAdded(node:PoolableNode) {
    }

    private function onNodeRemoved(node:PoolableNode) {
        node.poolable.factory.put(node.entity);
    }

}
