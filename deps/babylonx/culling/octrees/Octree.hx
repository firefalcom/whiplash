//
package babylonx.culling.octrees ;
//
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Plane;
import babylonx.tools.Tools.SmartArray;
import babylonx.mesh.Mesh;
import babylonx.Scene;
//
@:native("BABYLON.Octree") extern class Octree {
	public var blocks : Array<OctreeBlock>;
	public var _maxBlockCapacity : Float;
	public var _selection : SmartArray;
	//
	public function new (maxBlockCapacity : Float ) : Void;
	//
	public function update( worldMin : Vector3, worldMax : Vector3, meshes : Array<Mesh> ) : Void;
	public function addMesh( mesh : Mesh ) : Void;
	public function select( frustrumPlanes : Array<Plane> ) : Void;
	public function _CreateBlocks( worldMin : Vector3, worldMax : Vector3, meshes : Array<Mesh>, maxBlockCapacity : Float, target : OctreeBlock ) : Void;
}