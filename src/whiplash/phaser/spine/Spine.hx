package whiplash.phaser.spine;

@:allow(whiplash.phaser.spine.SpineSystem)
class Spine {
    private var _o:Dynamic;

    public function new(name:String, ?a, ?b) {
        _o = untyped whiplash.Lib.phaserScene.add.spine(0, 0, name);
        _o.setActive(false);
        _o.setVisible(false);
    }

    public function setAnimation(name:String, loop:Bool):String {
        _o.setAnimation(1, name, loop);
        return name;
    }
}
