package whiplash.babylon.components;

class Light extends SceneObject<BABYLON.ShadowLight> {
    public function new(?o:BABYLON.ShadowLight, scene:BABYLON.Scene) {
        super(o, scene);
        o.getScene().removeLight(o);
    }
}
