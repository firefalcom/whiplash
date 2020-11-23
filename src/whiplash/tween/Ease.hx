package whiplash.tween;

class Ease {
    static public function get(easing:Easing, f:Float) {

        return switch(easing) {
            case Linear:
                f;

            case EaseIn:
                f * f;

            case EaseOut:
                Math.sin(f * Math.PI / 2.0);

            case EaseInEaseOut:
                ((1.0 - Math.cos((f) * Math.PI)) * 0.5);
        };
    }
}
