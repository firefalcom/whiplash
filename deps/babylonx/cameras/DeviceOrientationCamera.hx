//
package babylonx.cameras ;
//
import babylonx.Scene;
import babylonx.tools.math.Vector3;
//
@:native("BABYLON.") extern class DeviceOrientationCamera extends FreeCamera {
	public var angularSensibility : Float;
	public var moveSensibility : Float;
	public function new (name : String, position : Vector3, scene : Scene ) ;
	public var _offsetX : Float;
	public var _offsetY : Float;
	public var _orientationGamma : Float;
	public var _orientationBeta : Float;
	public var _initialOrientationGamma : Float;
	public var _initialOrientationBeta : Float;
}