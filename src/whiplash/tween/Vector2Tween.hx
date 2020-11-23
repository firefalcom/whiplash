package whiplash.tween;

import whiplash.math.Vector2;

class Vector2Tween {

    static public function get(from:Vector2, to:Vector2, easing:Easing, advance:Float):Vector2 {
        var f:Float = advance;

        if(f > 1) { f = 1; }

        f = Ease.get(easing, f);

        return from + (to - from) * f;
    }
}
