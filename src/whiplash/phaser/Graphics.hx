package whiplash.phaser;

class Graphics extends phaser.gameobjects.Graphics {
    public function new() {
        super(Lib.phaserScene);
        setActive( false );
        setVisible( false );
    }
}
