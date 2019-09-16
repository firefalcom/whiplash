package whiplash.phaser;

class TileSprite extends phaser.gameobjects.TileSprite {
    public function new(w=0, h=0, ?key) {
        super(Lib.phaserScene, 0, 0, w, h, key);
        Lib.phaserScene.add.existing(this);
        setActive(false);
        setVisible(false);
    }
}
