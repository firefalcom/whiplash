package whiplash.phaser;

class Sprite extends phaser.Sprite {
    public function new(?key) {
        super(Lib.phaserGame, 0, 0, key);
        Lib.phaserGame.add.existing(this);
        kill();
    }
}
