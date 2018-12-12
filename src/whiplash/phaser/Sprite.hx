package whiplash.phaser;

class Sprite extends phaser.Sprite {
    public function new(?key, ?frame) {
        super(Lib.phaserGame, 0, 0, key, frame);
        Lib.phaserGame.add.existing(this);
        kill();
    }
}
