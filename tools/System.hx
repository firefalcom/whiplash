package game;

import ash.tools.ListIteratingSystem;
import ash.core.*;
import whiplash.phaser.*;

class ComponentNode extends Node<ComponentNode> {
    public var transform:Transform;
    public var shake:Component;
}

class ComponentSystem extends ListIteratingSystem<ComponentNode> {
    private var engine:Engine;

    public function new() {
        super(ComponentNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    public override function addToEngine(engine:Engine) {
        super.addToEngine(engine);
        this.engine = engine;
    }

    public override function removeFromEngine(engine:Engine) {
        super.removeFromEngine(engine);
    }

    private function updateNode(node:ComponentNode, dt:Float):Void {
    }

    private function onNodeAdded(node:ComponentNode) {
    }

    private function onNodeRemoved(node:ComponentNode) {
    }
}


