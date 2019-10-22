package whiplash.phaser;

class Camera extends phaser.cameras.scene2d.Camera {
    public var main:Bool = true;

    public function new(x, y, w, h) {
        super(x, y, w, h);
    }
}
