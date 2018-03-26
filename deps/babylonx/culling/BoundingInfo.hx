//
package babylonx.culling ;
//
import babylonx.collisions.Collider;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Plane;
import babylonx.Scene.BabylonMinMax;

//
@:native("BABYLON.BoundingInfo") extern class BoundingInfo {
	public var boundingBox : BoundingBox;
	public var boundingSphere : BoundingSphere;
	//
	public function new (minimum : Vector3, maximum : Vector3 );
	//
	public function _update( world : Matrix, scale : Float ) : Void;
	public function extentsOverlap( min0 : Float, max0 : Float, min1 : Float, max1 : Float ) : Bool;
	public function computeBoxExtents( axis : Vector3, box : BoundingBox ) : BabylonMinMax ;
	public function axisOverlap( axis : Vector3, box0 : BoundingBox, box1 : BoundingBox ) : Bool;
	public function isInFrustrum( frustrumPlanes : Array<Plane> ) : Bool;
	public function _checkCollision( collider : Collider ) : Bool; 
	public function intersectsPoint( point : Vector3 ) : Bool;
	public function intersects( boundingInfo : BoundingInfo, precise : Bool ) : Bool;
	
}