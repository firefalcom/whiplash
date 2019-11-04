package whiplash.babylon.components;

import whiplash.math.Vector3;
import BABYLON.Quaternion as Quaternion;

class Transform3d {
    public var position:Vector3 = new Vector3(0, 0, 0);
    public var rotation:Quaternion = new Quaternion(0, 0, 0, 1);
    public var scale:Vector3 = new Vector3(1, 1, 1);

    public function new() {
    }

    public function setRotationFromYawPitchRoll(y:Float, p:Float, r:Float) {
        Quaternion.RotationYawPitchRollToRef(y, p, r, rotation);
    }

    public function lookAt(targetPoint:Vector3) {
        var dv = new Vector3(0, 0, 0);
        var pos = position;
        pos.subtractToRef(targetPoint, dv);
        var yaw = -Math.atan2(dv.z, dv.x) - Math.PI / 2;
        var len = Math.sqrt(dv.x * dv.x + dv.z * dv.z);
        var pitch = Math.atan2(dv.y, len);
        BABYLON.Quaternion.RotationYawPitchRollToRef(yaw, pitch, 0, rotation);
    }
}
