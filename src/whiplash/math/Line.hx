package whiplash.math;

class Line {
    public var a:Point;
    public var b:Point;

    public function new(a:Point, b:Point) {
        this.a = a;
        this.b = b;
    }

    public function getSquareLength() {
        return Vector2.getSquareDistance(a,b);
    }

    static public function getDistance(line:Line, point:Point):Float {
        var square_length = line.getSquareLength();

        if(square_length == 0) {
            return null;
        }

        var x1 = line.a.x;
        var y1 = line.a.y;
        var x2 = line.b.x;
        var y2 = line.b.y;

        var s = (((y1 - point.y) * (x2 - x1)) - ((x1 - point.x) * (y2 - y1)));

        return Math.abs(s) / Math.sqrt(square_length);
    }
}
