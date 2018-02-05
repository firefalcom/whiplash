package whiplash;

#if under_test
typedef SourcePoint = {x:Float, y:Float};
#else
typedef SourcePoint = phaser.Point;
#end

@:forward
abstract Point(SourcePoint) to SourcePoint from SourcePoint {
    @:selfCall
    inline public function new(x:Float = 0.0, y:Float = 0.0) {
#if under_test
        this = { x:x, y:y };
#else
        this = new SourcePoint(x, y);
#end
    }

    @:op(A * B)
    inline static public function mul(a:Point, b:Float) {
        return new Point(a.x * b, a.y * b);
    }

    @:op(A / B)
    inline static public function div(a:Point, b:Float) {
        return new Point(a.x / b, a.y / b);
    }

    @:op(A + B)
    inline static public function add(a:Point, b:Point) {
        return new Point(a.x + b.x, a.y + b.y);
    }

    @:op(A - B)
    inline static public function min(a:Point, b:Point) {
        return new Point(a.x - b.x, a.y - b.y);
    }

    public function getDistance(other : Point):Float{
        var delta = ( this - other );
        return Math.sqrt( delta.x * delta.x + delta.y * delta.y );
    }

    public function getAngle() : Float{
        return Math.atan2( this.y, this.x );
    }
}
