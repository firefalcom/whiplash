package whiplash.tween;

class FloatTween {
    private var value:Float;
    private var from:Float;
    private var to:Float;
    private var duration:Float;
    private var time:Float;
    private var easing:Easing;

    public function new(from:Float, to:Float, duration:Float, easing:Easing) {
        set(from, to, duration, easing);
    }

    inline public function getValue():Float {
        return value;
    }

    public function isCompleted():Bool {
        return time >= duration;
    }

    public function set(from:Float, to:Float, duration:Float, easing:Easing) {
        time = 0;
        this.duration = duration;
        this.from = from;
        this.to = to;
        this.easing = easing;
        value = from;
    }

    public function reset() {
        time = 0;
        value = from;
    }

    public function update(dt:Float) {
        var f:Float;
        time += dt;

        if(time > duration) {
            f = 1.0;
            time = duration;
        } else {
            f = time / duration;

            f = switch(easing) {
                case Linear:
                    f;

                case EaseIn:
                    f * f;

                case EaseInEaseOut:
                    ((1.0 - Math.cos((f) * Math.PI)) * 0.5);
            };
        }

        value = from + (to - from) * f;
    }
}
