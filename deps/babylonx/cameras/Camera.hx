//
package babylonx.cameras ;
//
import babylonx.Scene;
import babylonx.tools.math.Vector3;
import js.html.CanvasElement;
import babylonx.tools.math.Matrix;
//
@:native("BABYLON.Camera")
extern class Camera {
	static public var PERSPECTIVE_CAMERA (default,null) : Float;
	static public var ORTHOGRAPHIC_CAMERA (default,null) : Float;
	//
	public var name : String;
	public var id : String;
	public var position : Vector3;
	public var fov : Float;
	public var orthoLeft : Float;
	public var orthoRight : Float;
	public var orthoBottom : Float;
	public var orthoTop : Float;
	public var minZ : Float;
	public var maxZ : Float;
	public var intertia : Float;
	public var mode : Float;
	//
    public function new(name:String, position:Vector3, scene:Scene);
	//
	public function attachControl (canvas:CanvasElement, ?noPreventDefault:Bool ):Void ;
	public function detachControl (canvas:CanvasElement ):Void ;
	public function _update(  ) : Dynamic;
	public function getViewMatrix(  ) : Matrix;
	public function getProjectionMatrix(  ) : Matrix;
}
