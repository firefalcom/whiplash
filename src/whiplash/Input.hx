package whiplash;

import whiplash.math.Point;
import js.Browser.window;
import js.Browser.navigator;
import js.html.Gamepad;

enum Axis {
    X;
    Y;
    Z;
    W;
}

class Input {
    static public var keys:Map<String, Bool> = new Map();
    static public var mouseButtons:Map<Int, Bool> = new Map();
    static public var mouseCoordinates:Point = new Point(0, 0);
    static public var mouseWheelDelta:Int = 0;

    static private var justPressedKeys:Map<String, Bool> = new Map();
    static private var gamepadStates:Array<Gamepad> = [];
    static private var nullAxes:Array<Float> = [0, 0, 0, 0];
    static private var previousGamepadButtons:Array<Array<Bool>> = [[], [], [], []];
    static private var previousGamepadAxes:Array<Array<Float>> = [nullAxes, nullAxes, nullAxes, nullAxes];

    static public function resetMouseWheelDelta() {
        mouseWheelDelta = 0;
    }

    static public function update() {
        justPressedKeys = new Map();
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null) {
                previousGamepadAxes[i] = g.axes;
                var previousButtons = previousGamepadButtons[i];
                for(b in 0...g.buttons.length) {
                    previousButtons[b] = g.buttons[b].pressed;
                }
            }
        }
        gamepadStates = navigator.getGamepads();
    }

    static public function isKeyJustPressed(name:String):Bool {
        return justPressedKeys[name];
    }

    static public function hasAxisJustValue(axe:Axis, value:Float):Bool {
        var a = Type.enumIndex(axe);
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null) {
                if(value > 0) {
                    if(g.axes[a] >= value && previousGamepadAxes[i][a] < value) {
                        return true;
                    }
                } else if(value < 0) {
                    if(g.axes[a] <= value && previousGamepadAxes[i][a] > value) {
                        return true;
                    }
                } else {
                    if(g.axes[a] == value && previousGamepadAxes[i][a] != value) {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    static public function getAxes():Array<Float> {
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null) {
                return g.axes;
            }
        }

        return nullAxes;
    }

    static public function isButtonJustPressed(button:Int):Bool {
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null && g.buttons[button].pressed && !previousGamepadButtons[i][button]) {
                return true;
            }
        }

        return false;
    }

    static public function isButtonPressed(button:Int):Bool {
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null && g.buttons[button].pressed) {
                return true;
            }
        }

        return false;
    }

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
        element.addEventListener("wheel", function(e) {
            mouseWheelDelta = e.deltaY;
        });
        window.addEventListener("keydown", function(e) {
            keys[e.key] = true;
            justPressedKeys[e.key] = true;
        });
        window.addEventListener("keyup", function(e) {
            keys[e.key] = false;
        });
    }
}
