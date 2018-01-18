package hpa;

class Transform
{
    public var position:phaser.Point = new phaser.Point();
    public var rotation:Float;
    public var scale:phaser.Point = new phaser.Point();

    public function new(x = 0.0, y = 0.0, r = 0.0, sx = 1.0, sy = 1.0)
    {
        position.x = x;
        position.y = y;
        rotation = r;
        scale.x = sx;
        scale.y = sy;
    }
}
