//
package babylonx.cameras ;
//
import babylonx.Scene;
import babylonx.tools.math.Vector3;
//
@:native("BABYLON.TouchCamera")
extern class TouchCamera extends FreeCamera {
	public var _offsetX : Float;
	public var _offsetY : Float;
	public var _pointerCount : Float;
	public var _pointerPressed : Array<Float>;
	public var angularSensibility : Float;
	public var moveSensibility : Float;
	public function new ( name : String, position : Vector3, scene : Scene ) ;
}