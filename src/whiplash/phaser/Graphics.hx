package whiplash.phaser;

class Graphics extends phaser.Graphics {
    public function new() {
        super(Lib.phaserGame, 0, 0);
        Lib.phaserGame.add.existing(this);
        kill();
    }
}
