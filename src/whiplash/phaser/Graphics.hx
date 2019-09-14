package whiplash.phaser;

class Graphics extends phaser.gameobjects.Graphics {
    public function new() {
        super(Lib.phaserScene);
        Lib.phaserScene.add.existing(this);
        setActive( false );
        setVisible( false );
    }
}
