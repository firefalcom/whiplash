//
package babylonx.culling ;
//
import babylonx.collisions.Collider;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Plane;
//
@:native("BABYLON.BoundingSphere") extern class BoundingSphere {
	public var minimum : Vector3;
	public var maximum : Vector3;
	public var center : Vector3;
	public var radius : Float;
	public var distance : Float;
	public var centerWorld : Vector3;
	public function new (minimum : Vector3, maximum : Vector3 ) : Void;
	public function _update( world : Matrix, scale : Float ) : Void;
	public function isInFrustrum( frustrumPlanes : Array<Plane> ) : Bool;
	public function intersectsPoint( point : Vector3 ) : Bool;
	public function intersects( sphere0 : BoundingSphere, sphere1 : BoundingSphere ) : Bool;
}