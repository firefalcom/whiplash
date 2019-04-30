package whiplash.phaser;

class TilemapLayer extends phaser.tilemaps.DynamicTilemapLayer {
    public function new(tilemap, index, w, h) {
        super(Lib.phaserScene, tilemap, 1,null);
        Lib.phaserScene.add.existing(this);
        setActive(false);
        setVisible(false);
        /*Lib.phaserGame, tilemap, index, w, h);
        Lib.phaserGame.add.existing(this);
        this.kill();*/
    }
}
