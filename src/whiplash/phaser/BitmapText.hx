package whiplash.phaser;

class BitmapText extends phaser.gameobjects.BitmapText {
    public function new(font, ?text, ?size) {
        super(null, 0, 0, "", "", 10,0);/*Lib.phaserGame, 0, 0, font, text, size);*/
        Lib.phaserScene.add.existing(this);
        setVisible( false );
        setActive( false );
    }
}
