package hpa;

class Sprite
{
    public var sprite:phaser.Sprite;

    public var key:String;

    public function new(?key)
    {
        this.key = key;
    }
}
