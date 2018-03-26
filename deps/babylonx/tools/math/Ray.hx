//
package babylonx.tools.math ;
//
import babylonx.Scene.Sphere ;
import babylonx.culling.BoundingBox ;
//
typedef RayTriangleIntersection = { public var hit : Bool; public var distance : Float; public var bu : Float; public var bv : Float; };
//
@:native("BABYLON.Ray") extern class Ray {
	public var origin : Vector3;
	public var direction : Vector3;
	public function new (origin : Vector3, direction : Vector3 ) ;
	public function intersectsBox( box : BoundingBox ) : Bool;
	public function intersectsSphere( sphere : Sphere ) : Bool;
	public function intersectsTriangle( vertex0 : Vector3, vertex1 : Vector3, vertex2 : Vector3 ) : RayTriangleIntersection;
	public function CreateNew( x : Float, y : Float, viewportWidth : Float, viewportHeight : Float, world : Matrix, view : Matrix, projection : Matrix ) : Ray;
}

