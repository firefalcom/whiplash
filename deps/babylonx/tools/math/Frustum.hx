//
package babylonx.tools.math ;
//
@:native("BABYLON.Frustum") 
extern class Frustum {
	public var frustrumPlanes : Array<Plane>;
	public function new (transform : Matrix ) ;
	public function GetPlanes( transform : Matrix ) : Array<Plane>;
}