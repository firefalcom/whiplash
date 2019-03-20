package whiplash.phaser;

class Group extends phaser.Group {
    public function new(?parent) {
        super(Lib.phaserGame, parent);
    }
}
