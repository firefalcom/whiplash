package whiplash.phaser.spine;

@:allow(whiplash.phaser.spine.SpineSystem)
class Spine {
    private var _o:Dynamic;

    public var alpha(get, set):Float;

    public function new(name:String, ?animation:String, ?loop) {
        _o = untyped whiplash.Lib.phaserScene.add.spine(0, 0, name, animation, loop);
        _o.setActive(false);
        _o.setVisible(false);
    }

    public function setAnimation(name:String, ?loop:Bool):String {
        _o.setAnimation(1, name, loop);
        return name;
    }

    public function set_alpha(alpha:Float):Float {
        return _o.alpha = alpha;
    }

    public function get_alpha():Float {
        return _o.alpha;
    }

    public function getSpineGameObject() {
        return _o;
    }
}
