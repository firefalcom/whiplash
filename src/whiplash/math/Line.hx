package whiplash.math;

class Line {
    public var a:Point;
    public var b:Point;

    public function new(a:Point, b:Point) {
        this.a = a;
        this.b = b;
    }

    static public function distance(line:Line, point:Point):Float {
        var x1 = line.a.x;
        var y1 = line.a.y;
        var x2 = line.b.x;
        var y2 = line.b.y;
        var len = (((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));

        if(len == 0) {
            return null;
        }

        var s = (((y1 - point.y) * (x2 - x1)) - ((x1 - point.x) * (y2 - y1))) / len;

        return Math.abs(s) * Math.sqrt(len);
    }
}
