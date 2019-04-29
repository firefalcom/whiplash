package whiplash.phaser;

class TileSprite extends phaser.tilemaps.Tile {
    public function new(w=0, h=0, ?key) {
        super(null, 1,1,1,1,1,1,1);
            /*Lib.phaserGame, 0, 0, w, h, key);
        Lib.phaserGame.add.existing(this);
        untyped this.kill();*/
    }
}
