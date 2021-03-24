package whiplash.math;

class Angle {

    public static function getSmallest(angle:Float):Float {

        var result = angle % 360;

        if(result > 180) {
            result -= 360;
        } else if(result < -180) {
            result += 360;
        }

        return result;
    }

    public static function getClosest(angle:Float, otherAngle:Float):Float {
        var closestAngle = angle;
        var lowerAngle = otherAngle - 180;
        var upperAngle = otherAngle + 180;

        while(closestAngle > upperAngle) {
            closestAngle -= 360;
        }

        while(lowerAngle > closestAngle) {
            closestAngle += 360;
        }

        return closestAngle;
    }
}
