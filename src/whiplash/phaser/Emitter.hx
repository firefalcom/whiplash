package whiplash.phaser;

class Emitter extends phaser.gameobjects.particles.ParticleEmitter {
    public function new(maxParticles) {
        super(null, null);
        /*Lib.phaserGame, 0, 0, maxParticles);
        Lib.phaserGame.add.existing(this);
        kill();*/
    }
}
