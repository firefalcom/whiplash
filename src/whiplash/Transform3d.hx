package whiplash;

import babylonx.tools.math.*;

class Transform3d {
    public var position:Vector3 = new Vector3(0, 0, 0);
    public var rotation:Quaternion = new Quaternion(0, 0, 0, 1);
    public var scale:Vector3 = new Vector3(1, 1, 1);

    public function new() {
    }

    public function setRotationFromYawPitchRoll(y:Float, p:Float, r:Float) {
        Quaternion.RotationYawPitchRollToRef(y, p, r, rotation);
    }
}
