package whiplash;

import whiplash.math.Point;

class TestSystem extends ash.core.System {
    
    public function new() {
        super();
    }

    public override function update(dt:Float) {
        

        if(whiplash.Input.isKeyJustPressed("r")) {
            trace("pressing r");
            trace("mouse coord before : " + whiplash.Input.getMouseCoordinates());
            whiplash.Input.setMouseCoordinates(new Point(500,500));
            trace("mouse coord after : " + whiplash.Input.getMouseCoordinates());
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

        // if(whiplash.Input.isMouseButtonPressed(0)) {
        //     trace(whiplash.Input.getMouseCoordinates());
        // }
    }
}