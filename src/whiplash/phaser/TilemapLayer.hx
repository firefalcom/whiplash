package whiplash.phaser;

class TilemapLayer extends phaser.TilemapLayer {
    public function new(tilemap, index, w, h) {
        super(Lib.phaserGame, tilemap, index, w, h);
        Lib.phaserGame.add.existing(this);
        this.kill();
    }
}
