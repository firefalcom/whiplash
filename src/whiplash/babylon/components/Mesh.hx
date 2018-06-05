package whiplash.babylon.components;

class Mesh extends SceneObject<BABYLON.Mesh> {
    public function new(?o:BABYLON.Mesh, scene:BABYLON.Scene) {
        super(o, scene);
        o.getScene().removeMesh(o);
    }
}
