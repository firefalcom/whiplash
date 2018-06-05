package whiplash.babylon;

class SceneObject<BabylonClass>{
    public var o:BabylonClass;
    public var scene:BABYLON.Scene;

    public function new(o:BabylonClass, scene:BABYLON.Scene) {
        this.o = o;
        this.scene = scene;
    }
}
