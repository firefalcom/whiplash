package whiplash.phaser;

class Emitter extends phaser.gameobjects.particles.ParticleEmitterManager {
    public var _added = false;
    public var moveEmitters:Bool = false;

    public function new(texture) {
        super(Lib.phaserScene, texture);
        setActive(false);
        setVisible(false);
    }
}
