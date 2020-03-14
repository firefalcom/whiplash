package whiplash.phaser.dragonbones;

@:allow(whiplash.phaser.dragonbones.ArmatureSystem)
class Armature {
    private var _o:Dynamic;

    public var animation(get, never):Dynamic;

    public function get_animation():Dynamic {
        return _o.animation;
    }

    public function new(?a, ?b) {
        _o = untyped whiplash.Lib.phaserScene.add.armature("mecha_1002_101d", "mecha");
        _o.setActive(false);
        _o.setVisible(false);
    }
}
