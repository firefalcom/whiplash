//
package babylonx.collisions ;
//
import babylonx.tools.math.Vector3;
//
@:native("BABYLON.CollisionPlane")
extern class CollisionPlane {
	public var normal : Vector3;
	public var origin : Vector3;
	public var equation : Array<Float>;
	//
	public function new ( origin : Vector3, normal : Vector3 );
	//
	public function isFrontFactingTo( direction : Vector3, epsilon : Float ) : Bool;
	public function signedDistanceTo( point : Vector3 ) : Float;
	public function CreateFromPoints( p1 : Vector3, p2 : Vector3, p3 : Vector3 ) : CollisionPlane;
}