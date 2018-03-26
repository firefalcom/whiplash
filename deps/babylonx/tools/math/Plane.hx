//
package babylonx.tools.math ;
//
@:native("BABYLON.Plane") extern class Plane {
	public var normal : Vector3;
	public var d : Float;
	//
	public function new (a : Float, b : Float, c : Float, d : Float ) ;
	//
	public function normalize( ) : Void;
	public function transform( transformation : Matrix ) : Plane;
	public function dotCoordinate( point : Vector3 ) : Float;
	public function copyFromPoints( point1 : Vector3, point2 : Vector3, point3 : Vector3 ) : Void;
	public function isFrontFacingTo( direction : Vector3, epsilon : Vector3 ) : Bool;
	public function signedDistanceTo( point : Vector3 ) : Float;
	//
	static public function FromArray( array : Array<Float> ) : Plane;
	static public function FromPoints( point1 : Vector3, point2 : Vector3, point3 : Vector3 ) : Plane;
	static public function FromPositionAndNormal( origin : Vector3, normal : Vector2 ) : Plane;
	static public function SignedDistanceToPlaneFromPositionAndNormal( origin : Vector3, normal : Vector3, point :Vector3 ) : Float;
}
