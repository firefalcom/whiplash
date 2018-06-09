package whiplash.babylon.components;

class Material {
    public var o : BABYLON.ShaderMaterial;

    public var hasTime : Bool = false;
    public var time : Float = 0;


    public function new(material : BABYLON.ShaderMaterial) {
        o = material;
    }
}