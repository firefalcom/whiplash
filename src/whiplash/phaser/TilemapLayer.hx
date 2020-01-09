package whiplash.phaser;

class TilemapLayer extends phaser.tilemaps.DynamicTilemapLayer {
    public function new(tilemap, index, tileset) {
        super(Lib.phaserScene, tilemap, index, tileset);
        Lib.phaserScene.add.existing(this);
        setActive(false);
        setVisible(false);
    }
}
