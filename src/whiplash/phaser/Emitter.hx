package whiplash.phaser;

class Emitter extends phaser.gameobjects.particles.ParticleEmitterManager {
    public function new(maxParticles) {
        super(Lib.phaserScene, "");
        Lib.phaserScene.add.existing(this);
        setActive(false);
        setVisible(false);
    }
}
