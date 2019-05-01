package whiplash.babylon.components;

class Material {
    public var o:BABYLON.Material;

    public var hasTime:Bool = false;
    public var time:Float = 0;

    public function new(material : BABYLON.Material) {
        o = material;
    }
}
