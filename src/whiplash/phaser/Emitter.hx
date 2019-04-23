package whiplash.phaser;

class Emitter extends phaser.particles.arcade.Emitter {
    public function new(maxParticles) {
        super(Lib.phaserGame, 0, 0, maxParticles);
        Lib.phaserGame.add.existing(this);
        kill();
    }
}
