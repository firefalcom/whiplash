package whiplash.tween;

class FloatTweenSequencer extends FloatTween {
    private var parameters:Array< {from:Float, to:Float, duration:Float, easing:Easing}> = [];
    private var index:Int = -1;

    public function new() {
        super(0, 0, 1);
    }

    public function add(from:Float, to:Float, duration:Float, easing:Easing) {
        parameters.push({from:from, to:to, duration:duration, easing:easing});

        if(index == -1) {
            setNext();
        }
    }

    override public function update(dt:Float) {
        super.update(dt);

        if(super.isCompleted()) {
            setNext();
        }
    }

    override public function reset() {
        index = -1;
        setNext();
    }

    override public function isCompleted():Bool {
        return index == parameters.length - 1 && super.isCompleted();
    }

    private function setNext() {
        if(parameters.length > index + 1) {
            ++index;
            var params = parameters[index];
            super.set(params.from, params.to, params.duration, params.easing);
        }
    }
}
