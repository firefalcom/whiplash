package hpa;

@:forward
abstract Point(phaser.Point) to phaser.Point from phaser.Point
{
    @:selfCall
    inline public function new(x:Float = 0.0, y:Float = 0.0)
    {
        this = new phaser.Point(x, y);
    }

    @:op(A * B)
    inline static public function mul(a:Point, b:Float)
    {
        return new Point(a.x * b, a.y * b);
    }

    @:op(A / B)
    inline static public function div(a:Point, b:Float)
    {
        return new Point(a.x / b, a.y / b);
    }

    @:op(A + B)
    inline static public function add(a:Point, b:Point)
    {
        return new Point(a.x + b.x, a.y + b.y);
    }

    @:op(A - B)
    inline static public function min(a:Point, b:Point)
    {
        return new Point(a.x - b.x, a.y - b.y);
    }
}
