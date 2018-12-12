package whiplash.phaser;

class BitmapText extends phaser.BitmapText {
    public function new(font, ?text, ?size) {
        super(Lib.phaserGame, 0, 0, font, text, size);
        Lib.phaserGame.add.existing(this);
        kill();
    }
}
