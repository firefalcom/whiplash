package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class SpriteNode extends Node<SpriteNode> {
    public var transform:Transform;
    public var sprite:Sprite;
}

class SpriteSystem extends ListIteratingSystem<SpriteNode> {

    public function new() {
        super(SpriteNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:SpriteNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:SpriteNode) {
        var sprite = node.sprite;
        whiplash.Lib.phaserScene.add.existing(sprite);

        if(untyped sprite.body) {
            var transform = node.transform;
            var position = transform.position;
            untyped sprite.body.position.x = sprite.x = position.x;
            untyped sprite.body.position.y = sprite.y = position.y;
            untyped sprite.body.angle = transform.rotation;
        }

        apply(node);
        node.sprite.setActive(true);
        node.sprite.setVisible(true);
    }

    private function onNodeRemoved(node:SpriteNode) {
        node.sprite.setActive(false);
        node.sprite.setVisible(false);
        untyped whiplash.Lib.phaserScene.add.updateList.remove(node.sprite);
        untyped whiplash.Lib.phaserScene.add.displayList.remove(node.sprite);
    }

    private function apply(node:SpriteNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var sprite = node.sprite;

        if(sprite.body) {
            if(untyped !sprite.body.immovable) {
                position.x = sprite.x;
                position.y = sprite.y;
                transform.rotation = sprite.angle;
            } else {
                untyped sprite.body.position.x = position.x;
                untyped sprite.body.position.y = position.y;
                untyped sprite.body.angle = transform.rotation;
                sprite.setPosition(position.x, position.y);
                sprite.setAngle(transform.rotation);
            }

            sprite.setScale(scale.x, scale.y);
        } else {
            sprite.setPosition(position.x, position.y);
            sprite.setScale(scale.x, scale.y);
            sprite.setAngle(transform.rotation);
        }
    }
}
