package hpa;

class Transform
{
    public var position:phaser.Point = new phaser.Point();

    public function new(x:Float = 0.0, y:Float = 0.0)
    {
        position.x = x;
        position.y = y;
    }
}
