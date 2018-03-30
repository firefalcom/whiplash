package whiplash;

class PointLight {
    public var pointLight:babylonx.lights.PointLight;

    public function new(?pointLight:babylonx.lights.PointLight) {
        this.pointLight = pointLight;
    }
}
