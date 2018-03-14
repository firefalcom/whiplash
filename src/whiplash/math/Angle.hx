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
}