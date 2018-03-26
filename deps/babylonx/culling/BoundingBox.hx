//
package babylonx.culling ;
//
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Plane;
import babylonx.Scene;
//
@:native("BABYLON.BoundingBox") extern class BoundingBox {
	public var minimum : Vector3;
	public var maximum : Vector3;
	public var vectors : Array<Vector3>;
	public var center : Vector3;
	public var directions : Array<Vector3>;
	public var vectorsWorld : Array<Vector3>;
	public var minimumWorld : Vector3;
	public var maximumWorld : Vector3;
	/* var 'extends' in native can't exist in Haxe */
	public var _extends (get,set) : Vector3;
	//
	public function new (minimum : Vector3, maximum : Vector3 ) : Void;
	//
	public function _update( world : Matrix ) : Void;
	public function isInFrustrum( frustrumPlanes : Array<Plane> ) : Bool;
	public function intersectsPoint( point : Vector3 ) : Bool; 
	public function intersectsSphere( sphere : Sphere ) : Bool;
	public function intersectsMinMax( min : Vector3, max : Vector3 ) : Bool;
	public function IsInFrustrum( boundingVectors : Array<Vector3>, frustrumPlanes : Array<Plane> ) : Bool;
	public function intersects( box0 : BoundingBox, box1 : BoundingBox ) : Bool ;
	///
	inline function get__extends() :Vector3 { return untyped this['extends']; }
	inline function set__extends( v : Vector3 ):Vector3 { return untyped this['extends'] = v; }
}
