package whiplash.babylon.components;

class Camera extends SceneObject<BABYLON.TargetCamera> {
    public function new(?o:BABYLON.TargetCamera, scene:BABYLON.Scene) {
        super(o, scene);
        o.getScene().removeCamera(o);
    }
}
