package whiplash;

class Graphics extends phaser.Graphics {
    public function new() {
        super(Lib.game, 0, 0);
        Lib.game.add.existing(this);
        kill();
    }
}
