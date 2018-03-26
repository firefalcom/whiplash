//
package babylonx.cameras ;
//
import babylonx.animations.Animation;
import babylonx.collisions.Collider;
import babylonx.Scene;
import babylonx.tools.math.Vector2;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Matrix;

//
@:native("BABYLON.FreeCamera")
extern class FreeCamera extends Camera {
	public var rotation:Vector3;
	public var cameraDirection:Vector3;
    public var cameraRotation:Vector2;	
	public var ellipsoid:Vector3;
	public var _keys : Array<Float>;
	public var keysUp:Array<Int>;
	public var keysDown:Array<Int>;
	public var keysLeft:Array<Int>;
	public var keysRight:Array<Int>;
	public var _collider : Collider; 
	public var animations : Array<Animation>;
	public var speed : Float;
	public var checkCollisions:Bool;
	public var applyGravity:Bool;
	public var _needsMoveForGravity : Bool;
	//	
	public function new(name:String, position:Vector3, scene:Scene);
	//
	public function _computeLocalCameraSpeed(  ) : Float;
	public function setTarget( target : Vector3 ) : Void;
	public function _collideWithWorld( velocity : Vector3 ) : Void;
	public function _checkInputs(  ) : Dynamic;	
	public function _getViewMatrix():Matrix;
	
}