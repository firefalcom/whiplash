package whiplash.phaser;

class Sprite extends phaser.gameobjects.Sprite {
    public function new(?key, ?frame) {
        super(Lib.phaserScene, 0, 0, key, frame);
        setActive(false);
        setVisible(false);
    }
}
