package whiplash;

import whiplash.math.Point;
import whiplash.math.Vector2;
import js.Browser.window;
import js.Browser.navigator;
import js.html.Gamepad;

enum Axis {
    X;
    Y;
    Z;
    W;
}

enum GamepadButton {
    Face1;
    Face2;
    Face3;
    Face4;
    LeftShoulder;
    RightShoulder;
    LeftShoulderBottom;
    RightShoulderBottom;
    Select;
    Start;
    LeftAnalogueStick;
    RightAnalogueStick;
    PadTop;
    PadBottom;
    PadLeft;
    PadRight;
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
    static private var xyAxes:Vector2 = new Vector2(0, 0);
    static private var zwAxes:Vector2 = new Vector2(0, 0);

    static public function resetMouseWheelDelta() {
        mouseWheelDelta = 0;
    }

    static public function postUpdate() {
        justPressedKeys = new Map();
    }

    static public function update() {
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

    static public function hasJustAxisValue(axe:Axis, value:Float):Bool {
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

#if babylonjs // Required for Vectgor2.lengthSquared
    static public function hasJustXYAxesValue(threshold:Float = 0.6):Bool {
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            var previousAxes = previousGamepadAxes[i];
            if(g != null && previousAxes != null) {
                var axes = g.axes;
                xyAxes.set(axes[0], axes[1]);
                var squaredLength = xyAxes.lengthSquared();
                if(squaredLength > threshold * threshold) {
                    xyAxes.set(previousAxes[0], previousAxes[1]);
                    var previousSquaredLength = xyAxes.lengthSquared();
                    if(previousSquaredLength < threshold * threshold && previousSquaredLength < squaredLength) {
                        return true;
                    }
                }
            }
        }

        return false;
    }
#end

    static public function getXYAxes():Vector2 {
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null) {
                var axes = g.axes;
                xyAxes.set(axes[0], axes[1]);
                return xyAxes;
            }
        }

        xyAxes.set(0, 0);
        return xyAxes;
    }

    static public function getZWAxes():Vector2 {
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null) {
                var axes = g.axes;
                zwAxes.set(axes[2], axes[3]);
                return zwAxes;
            }
        }

        zwAxes.set(0, 0);
        return zwAxes;
    }

    static public function isButtonJustPressed(button:GamepadButton):Bool {
        var b = Type.enumIndex(button);
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null && g.buttons[b].pressed && !previousGamepadButtons[i][b]) {
                return true;
            }
        }

        return false;
    }

    static public function isButtonPressed(button:GamepadButton):Bool {
        var b = Type.enumIndex(button);
        for(i in 0...gamepadStates.length) {
            var g = gamepadStates[i];
            if(g != null && g.buttons[b].pressed) {
                return true;
            }
        }

        return false;
    }

    static public function setup(element:js.html.Element) {
        element.addEventListener("mousedown", function(e) {
            mouseButtons[e.button] = true;
            mouseCoordinates.x = e.offsetX;
            mouseCoordinates.y = e.offsetY;
        });
        element.addEventListener("mousemove", function(e) {
            mouseCoordinates.x = e.offsetX;
            mouseCoordinates.y = e.offsetY;
        });
        element.addEventListener("mouseup", function(e) {
            mouseButtons[e.button] = false;
            mouseCoordinates.x = e.offsetX;
            mouseCoordinates.y = e.offsetY;
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
