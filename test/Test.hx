package;

import js.Lib;
import js.Browser.document;
import phaser.Game;
import phaser.Phaser;
import ash.core.Entity;
import ash.core.Engine;
import ash.tools.ListIteratingSystem;
import ash.core.Node;
import whiplash.*;
import whiplash.math.*;
import whiplash.phaser.*;
import whiplash.babylon.components.*;

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
    var scene:BABYLON.Scene;
    var engine:ash.core.Engine;
    var sphereEntity:Entity;
    var sphereAdded:Bool;
    var keyTime:Float = 0;

    public function new() {
        whiplash.Lib.init({preload:preload, create:create, update:update});
        // whiplash.Lib.init({preload:preload, create:create, update:update}, whiplash.Lib.ENABLE_BABYLON);
        // whiplash.Lib.init({preload:preload, create:create, update:update}, whiplash.Lib.ENABLE_PHASER);
        engine = whiplash.Lib.ashEngine;
        engine.addSystem(new MoveSystem(), 1);
        engine.addSystem(new Move3dSystem(), 1);
        engine.addSystem(new Translate3dSystem(), 1);
    }

    function preload():Void {
        if(whiplash.Lib.phaserGame != null) {
            whiplash.Lib.phaserGame.load.image('logo', 'firefalcom.png');
        }
    }

    function create():Void {
        if(whiplash.Lib.phaserGame != null) {
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
        }

        if(whiplash.Lib.babylonEngine != null) {
            scene = new BABYLON.Scene(whiplash.Lib.babylonEngine);
            var entity = new Entity();
            entity.add(new Transform3d());
            entity.add(new Camera(new BABYLON.FreeCamera("Camera", BABYLON.Vector3.Zero(), scene), scene));
            entity.get(Transform3d).position = new BABYLON.Vector3(0, 0, -1);
            engine.addEntity(entity);
            var entity = new Entity();
            entity.add(new Light(new BABYLON.PointLight("Omni0", BABYLON.Vector3.Zero(), scene), scene));
            entity.add(new Translate());
            entity.add(new Transform3d());
            entity.get(Transform3d).position = new BABYLON.Vector3(0, 100, -100);
            engine.addEntity(entity);
            {
                var ps = new BABYLON.ParticleSystem("particles", 500, scene);
                ps.emitRate = 500;
                ps.particleEmitterType = new BABYLON.SphereParticleEmitter(1);
                ps.particleTexture = new BABYLON.Texture("./firefalcom.png", scene);
                ps.color1 = new BABYLON.Color4(1, 1, 1, 1.0);
                ps.color2 = new BABYLON.Color4(0, 0, 0, 0.0);
                ps.colorDead = new BABYLON.Color4(0, 0, 0, 0.0);
                ps.minLifeTime = 0.5;
                ps.maxLifeTime = 0.6;
                ps.minSize = 1;
                ps.maxSize = 1;
                ps.minEmitPower = 2;
                ps.maxEmitPower = 4;
                ps.gravity = new BABYLON.Vector3(0, -10, 0);
                ps.direction1 = new BABYLON.Vector3(0.5, 1, 0);
                ps.updateSpeed = 0.2;
                var entity = new Entity();
                entity.add(new Mesh(BABYLON.Mesh.CreateSphere("Sphere", 16, 3), scene));
                ps.emitter = entity.get(Mesh).o;
                ps.start();
                entity.add(new Move());
                entity.add(new Transform3d());
                entity.add(new ParticleSystem(ps, scene));
                entity.get(Transform3d).position.z = 8;
                engine.addEntity(entity);
                sphereEntity = entity;
                sphereAdded = true;
            }
        }
        whiplash.Input.setup(document.querySelector("#guiLayer"));
    }

    function update():Void {
        var dt = whiplash.Lib.getDeltaTime() / 1000;
        engine.update(dt);
        if(scene != null) {
            scene.render();
        }
        if(keyTime > 0.1 && whiplash.Input.keys[" "]) {
            sphereAdded = !sphereAdded;
            if(sphereAdded) {
                engine.addEntity(sphereEntity);
            } else {
                engine.removeEntity(sphereEntity);
            }
            keyTime = 0;
        } else {
            keyTime += dt;
        }

        if(whiplash.Input.mouseButtons[0]) {
            trace(whiplash.Input.mouseCoordinates);
        }
    }

    static function main():Void {
        new Test();
    }
}
