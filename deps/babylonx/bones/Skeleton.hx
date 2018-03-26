package babylonx.bones ;
//
import babylonx.animations.Animation;
import babylonx.Scene;
import babylonx.tools.math.Matrix;
//
@:native("BABYLON.Skeleton")
extern class Skeleton {
	public var id : Float;
	public var name : String;
	public var bones : Array<Bone>;
	public var _scene : Scene;
	public var _isDirty : Bool;
	//
	public function new( name : String, id : Float, scene : Scene ) ;
	//
	public function getTransformMatrices(  ) : Array<Matrix>;
	public function prepare(  ) : Void;
	public function getAnimatables(  ) : Array<Animation>;
	public function clone( name : String, id : Float ) : Skeleton;
}