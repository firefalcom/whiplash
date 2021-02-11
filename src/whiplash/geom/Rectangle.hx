package whiplash.geom;

import whiplash.math.Vector2;

class Rectangle {
    public var center:Vector2;
    public var extent:Vector2;
    public var rotation:Float;

    public function new(center, extent, rotation = 0.0) {
        this.center = center;
        this.extent = extent;
        this.rotation = rotation;
    }

    public function contains(point:Vector2) {
        var localPosition = Vector2.getRotatedVector(point - center, - rotation * Math.PI / 180);
        var halfWidth = extent.x / 2;
        var halfHeight = extent.y / 2;

        if(localPosition.x > - halfWidth && localPosition.x < halfWidth) {
            if(localPosition.y > - halfHeight && localPosition.y < halfHeight) {
                return true;
            }
        }

        return false;
    }
}
