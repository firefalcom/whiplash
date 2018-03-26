package babylonx.bones ;
//
import babylonx.animations.Animation;
import babylonx.tools.math.Matrix;
//
@:native("BABYLON.Bone")
extern class Bone {
	public var name : String;
	public var _skeleton : Skeleton;
	public var _matrix : Matrix;
	public var _baseMatrix : Matrix;
	public var _worldTransform : Matrix;
	public var _absoluteTransform : Matrix;
	public var _invertedAbsoluteTransform : Matrix;
	public var children : Array<Bone>;
	public var animation : Array<Animation>;
	//
	public function new ( name : String, skeleton : Skeleton, parentBone : Bone, matrix : Matrix ) ;
	//
	public function getParent(  ) : Bone;
	public var getLocalMatrix : Matrix;
	public var getAbsoluteMatrix : Matrix;
	public function _updateDifferenceMatrix(  ) : Void;
	public function updateMatrix( matrix : Matrix ) : Void;
	public function markAsDirty(  ) : Void;
}