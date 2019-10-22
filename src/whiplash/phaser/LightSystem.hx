package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class LightNode extends Node<LightNode> {
    public var transform:Transform;
    public var light:Light;
}

class LightSystem extends ListIteratingSystem<LightNode> {
    public function new() {
        super(LightNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:LightNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:LightNode) {
        var light = node.light;
        var transform = node.transform;
        var position = transform.position;
        var color = untyped Phaser.Display.Color.GetColor(light.r, light.b, light.b);
        light.o = Lib.phaserScene.lights.addLight(position.x, position.y, color, light.radius, light.intensity);
        apply(node);
    }

    private function onNodeRemoved(node:LightNode) {
        var light = node.light;
        Lib.phaserScene.lights.removeLight(light.o);
        light.o = null;
    }

    private inline function apply(node:LightNode) {
        var transform = node.transform;
        var position = transform.position;
        var light = node.light;
        var o = light.o;
        o.set(position.x, position.y, light.radius, light.r, light.g, light.b, light.intensity);
    }
}
