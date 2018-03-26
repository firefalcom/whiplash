//
package babylonx.collisions ;
//
import babylonx.mesh.Mesh;
import babylonx.mesh.SubMesh;
import babylonx.mesh.VertexBuffer;
import babylonx.tools.math.Plane;
import babylonx.tools.math.Vector3;
//
@:native("BABYLON.Collider")
extern class Collider {
	public var radius : Vector3;
	public var retry : Float;
	public var basePointWorld : Vector3;
	public var velocityWorld : Vector3;
	public var normalizedVelocity : Vector3;
	public function new( ) ;
	public function _initialize( source : Vector3, dir : Vector3, e : Float ) : Void;
	public function _checkPontInTriangle( point : Vector3, pa : Vector3, pb : Vector3, pc : Vector3, n : Vector3 ) : Bool;
	public function _canDoCollision( sphereCenter : Vector3, sphereRadius : Float, vecMin : Vector3, vecMax : Vector3 ) : Bool;
	public function _testTriangle( subMesh : SubMesh, p1 : Vector3, p2 : Vector3, p3 : Vector3 ) : Void;
	public function _collide( subMesh : SubMesh, pts : VertexBuffer, indices : Array<Int>, indexStart : Float, indexEnd : Float, decal : Float ) : Dynamic;
	public function _getResponse( pos : Vector3, vel : Vector3 )  : Dynamic;
	/*
	public static function intersectBoxAASphere( boxMin : Vector3, boxMax : Vector3, sphereCenter : Vector3, sphereRadius : Float ) : Bool;
	public static function getLowestRoot( a : Float, b : Float, c : Float, maxR : Float ) : Dynamic;
	*/
}