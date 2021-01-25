package whiplash;

import whiplash.math.Point;

class TestSystem extends ash.core.System {
    
    public function new() {
        super();
    }

    public override function update(dt:Float) {
        

        if(whiplash.Input.isKeyJustPressed("r")) {
            trace("pressing r");
            whiplash.Input.setMouseCoordinates(new Point(500,500));
        }

        if(whiplash.Input.isKeyJustReleased("r")) {
            trace("releasing r");
        }
        if(whiplash.Input.isMouseButtonJustPressed(0)) {
            trace("pressing mouse button");
        }
        if(whiplash.Input.isMouseButtonJustReleased(0)) {
            trace("releasing mouse button");
        }
    }
}