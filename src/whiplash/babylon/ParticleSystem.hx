package whiplash.babylon;

class ParticleSystem extends SceneObject<BABYLON.ParticleSystem> {
    public function new(?o:BABYLON.ParticleSystem, scene:BABYLON.Scene) {
        super(o, scene);
        scene.removeParticleSystem(o);
    }
}
