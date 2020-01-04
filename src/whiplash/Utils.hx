package whiplash;

class Utils {
    static public function getReadableTime(seconds:Int):String {
        var secLeft = seconds % 60;
        var minutes = Std.int(seconds / 60);

        var secString = Std.string(seconds);

        if(secLeft < 10) {
            secString = "0" + secString;
        }

        return minutes + ":" + secString;
    }
}

