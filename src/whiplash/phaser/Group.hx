package whiplash.phaser;

class Group extends phaser.gameobjects.Container {
    public function new() {
        super( Lib.phaserScene );
        Lib.phaserScene.add.existing( this );
    }
}
