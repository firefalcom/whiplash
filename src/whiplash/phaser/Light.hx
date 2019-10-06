package whiplash.phaser;

class Light extends phaser.gameobjects.Light {
    public var o:phaser.gameobjects.Light;

    public function new(radius, r, g, b, intensity) {
        super(0, 0, radius, r, g, b, intensity);
    }
}
