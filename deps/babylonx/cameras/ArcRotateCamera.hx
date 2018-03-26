//
package babylonx.cameras ;//
import babylonx.Scene;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Matrix;
//
@:native("BABYLON.ArcRotateCamera") 
extern class ArcRotateCamera extends Camera {
	public var alpha : Float;
	public var beta : Float;
	public var radius : Float;
	public var target : Vector3;
	public var _keys : Array<Float>;
	public var keysUp : Array<Float>;
	public var keysDown : Array<Float>;
	public var keysLeft : Array<Float>;
	public var keysRight : Array<Float>;
	public var _viewMatrix : Matrix;
	public var inertialAlphaOffset : Float;
	public var interialBetaOffset : Float;
	public var lowerAlphaLimit : Float;
	public var upperAlphaLimit : Float;
	public var lowerBetaLimit : Float;
	public var upperBetaLimit : Float;
	public var lowerRadiusLimit : Float;
	public var upperRadiusLimit : Float;
	//
	public function new ( name : String, alpha : Float, beta : Float, radius : Float, target : Vector3, scene : Scene );
	//	
	public function setPosition( position : Vector3 ) : Void;
}

