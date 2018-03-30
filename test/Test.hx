package;

import js.Lib;
import phaser.Game;
import phaser.Phaser;
import ash.core.Entity;
import ash.core.Engine;
import ash.tools.ListIteratingSystem;
import ash.core.Node;
import whiplash.*;
import babylonx.tools.math.*;
import babylonx.cameras.*;

class Move {
    public var time:Float = 0.0;

    public function new() {
    }
}

class MoveNode extends Node<MoveNode> {
    public var move:Move;
    public var transform:Transform;
}

class MoveSystem extends ListIteratingSystem<MoveNode> {
    public function new() {
        super(MoveNode, updateNode);
    }

    private function updateNode(node:MoveNode, dt:Float):Void {
        node.move.time += dt;
        var t = node.move.time;
        node.transform.position.x = 400 + Math.sin(t) * 200;
        node.transform.rotation += dt * 10;
        node.transform.scale.x = 1 + Math.cos(t) * 0.2;
        node.transform.scale.y = 1 + Math.cos(t) * 0.2;
    }
}

class Translate {
    public var time:Float = 0.0;

    public function new() {
    }
}

class Translate3dNode extends Node<Translate3dNode> {
    public var translate:Translate;
    public var transform:Transform3d;
}

class Translate3dSystem extends ListIteratingSystem<Translate3dNode> {
    public function new() {
        super(Translate3dNode, updateNode);
    }

    private function updateNode(node:Translate3dNode, dt:Float):Void {
        node.translate.time += dt;
        var t = node.translate.time;
        node.transform.position.x = Math.sin(t) * 100;
    }
}

class Move3dNode extends Node<Move3dNode> {
    public var move:Move;
    public var transform:Transform3d;
}

class Move3dSystem extends ListIteratingSystem<Move3dNode> {
    public function new() {
        super(Move3dNode, updateNode);
    }

    private function updateNode(node:Move3dNode, dt:Float):Void {
        node.move.time += dt;
        var t = node.move.time;
        node.transform.scale.x = 1 + Math.cos(t) * 0.2;
        node.transform.scale.y = 1 + Math.cos(t) * 0.2;
    }
}

class Test {
    var scene:babylonx.Scene;
    var engine:ash.core.Engine;

    public function new() {
        whiplash.Lib.init({preload:preload, create:create, update:update});
        engine = whiplash.Lib.ashEngine;
        engine.addSystem(new MoveSystem(), 1);
        engine.addSystem(new Move3dSystem(), 1);
        engine.addSystem(new Translate3dSystem(), 1);
    }

    function preload():Void {
        whiplash.Lib.phaserGame.load.image('logo', 'firefalcom.png');
    }

    function create():Void {
        var entity = new Entity();
        entity.add(new Transform());
        entity.add(new Sprite('logo'));
        entity.add(new Move());
        engine.addEntity(entity);
        engine.removeEntity(entity);
        entity.get(Sprite).anchor = new Point(0.5, 0.5);
        engine.addEntity(entity);
        var p = new Point(200, 150);
        entity.get(Transform).position = p * 2;

        entity = new Entity();
        entity.add(new Transform());
        entity.add(new Text("Whiplash!"));
        var text = entity.get(Text);
        text.anchor.set(0.5, 0.5);
        text.align = 'center';
        text.font = 'Arial Black';
        text.fontSize = 50;
        text.fontWeight = 'bold';
        text.stroke = '#000000';
        text.strokeThickness = 8;
        text.fill = 'white';
        text.addStrokeColor('#ff0000', 0);
        entity.get(Transform).position = new Point(400, 500);

        entity.add(new Graphics());
        var graphics = entity.get(Graphics);
        graphics.lineStyle(2, 0x0000FF, 1);
        graphics.drawRect(-200, 40, 400, 20);

        engine.addEntity(entity);

        scene = new babylonx.Scene(whiplash.Lib.babylonEngine);
        var camera = new FreeCamera("Camera", new Vector3(0, 1, 0), scene);

        var entity = new Entity();
        entity.add(new PointLight(new babylonx.lights.PointLight("Omni0", Vector3.Zero(), scene)));
        entity.add(new Translate());
        entity.add(new Transform3d());
        entity.get(Transform3d).position = new Vector3(0, 100, -100);
        engine.addEntity(entity);

        var entity = new Entity();
        entity.add(new Mesh(babylonx.mesh.Mesh.CreateSphere("Sphere", 16, 3, scene)));
        entity.add(new Move());
        entity.add(new Transform3d());
        entity.get(Transform3d).position.z = 8;
        engine.addEntity(entity);
    }

    function update():Void {
        engine.update(whiplash.Lib.phaserGame.time.elapsed / 1000);
        scene.render();
    }

    static function main():Void {
        new Test();
    }
}
