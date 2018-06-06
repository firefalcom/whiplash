package whiplash;

import whiplash.math.Point;
import js.Browser.window;

class Input {
    static public var keys:Map<String, Bool> = new Map();
    static public var mouseButtons:Map<Int, Bool> = new Map();
    static public var mouseCoordinates:Point = new Point(0, 0);

    static public function setup(element:js.html.Element) {
        element.addEventListener("mousedown", function(e) {
            mouseButtons[e.button] = true;
            mouseCoordinates.x = e.clientX;
            mouseCoordinates.y = e.clientY;
        });
        element.addEventListener("mousemove", function(e) {
            mouseCoordinates.x = e.clientX;
            mouseCoordinates.y = e.clientY;
        });
        element.addEventListener("mouseup", function(e) {
            mouseButtons[e.button] = false;
            mouseCoordinates.x = e.clientX;
            mouseCoordinates.y = e.clientY;
        });
        window.addEventListener("keydown", function(e) {
            keys[e.key] = true;
        });
        window.addEventListener("keyup", function(e) {
            keys[e.key] = false;
        });
    }
}
