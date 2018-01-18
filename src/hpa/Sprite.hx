package hpa;

class Sprite extends phaser.Sprite
{
    public function new(?key)
    {
        super(Lib.game, 0, 0, key);
        Lib.game.add.existing(this);
        kill();
    }
}
