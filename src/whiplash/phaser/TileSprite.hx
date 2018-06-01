package whiplash.phaser;

class TileSprite extends phaser.TileSprite {
    public function new(w=0, h=0, ?key) {
        super(Lib.phaserGame, 0, 0, w, h, key);
        Lib.phaserGame.add.existing(this);
        untyped this.kill();
    }
}
