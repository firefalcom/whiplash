package whiplash.math;

typedef Base = BABYLON.Vector3;

@:forward
abstract Vector3(Base) to Base from Base {
    @:selfCall
    inline public function new(x:Float = 0.0, y:Float = 0.0, z:Float = 0.0) {
        this = new Base(x, y, z);
    }

    @:op(A * B)
    @:commutative
    inline static public function mul(a:Vector3, b:Float) {
        return new Vector3(a.x * b, a.y * b, a.z *b);
    }

    @:op(A / B)
    @:commutative
    inline static public function div(a:Vector3, b:Float) {
        return new Vector3(a.x / b, a.y / b, a.z / b);
    }

    @:op(A + B)
    inline static public function add(a:Vector3, b:Vector3) {
        return new Vector3(a.x + b.x, a.y + b.y, a.z + b.z);
    }

    @:op(A - B)
    inline static public function min(a:Vector3, b:Vector3) {
        return new Vector3(a.x - b.x, a.y - b.y, a.z - b.z);
    }

    public function getDistance(other : Vector3):Float{
        var delta = (this - other);
        return Math.sqrt(delta.x * delta.x + delta.y * delta.y + delta.z * delta.z);
    }

    public function getLength() : Float{
        return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
    }
}
