package whiplash.phaser;

class Sprite extends phaser.gameobjects.Sprite {
    public function new(?key, ?frame) {
        super(Lib.phaserScene, 0, 0, key, frame);
        Lib.phaserScene.add.existing(this);
        setActive(false);
        setVisible(false);
    }
}
