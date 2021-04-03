package whiplash.phaser;

class Emitter extends phaser.gameobjects.particles.ParticleEmitterManager {
    public var moveEmitters:Bool = false;

    public function new(texture) {
        super(Lib.phaserScene, texture);
        Lib.phaserScene.add.existing(this);
        setActive(false);
        setVisible(false);
    }
}
