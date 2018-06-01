package whiplash.babylon;

class Sprite3d {
    public var o:BABYLON.Sprite;
    public var _alpha:Float = 1.0;

    public function new(?o:BABYLON.Sprite) {
        this.o = o;
        o.color.a = 0;
    }
}
