//
package babylonx.culling.octrees ;
//
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Plane;
import babylonx.tools.SmartArray;
import babylonx.mesh.Mesh;
import babylonx.Scene;
//
@:native("BABYLON.OctreeBlock") extern class OctreeBlock {
	public var subMeshes : Array<Mesh>;
	public var meshes : Array<Mesh>;
	public var _capacity : Float;
	public var _minPoint : Vector3;
	public var _maxPoint : Vector3;
	public var _boundingVector : Array<Vector3>;
	public function new (minPoint : Vector3, maxPoint : Vector3, capacity : Float ) : Void;
	public function addMesh( mesh : Mesh ) : Void;
	public function addEntries( meshes : Array<Mesh> ) : Void;
	public function select( frustrumPlanes : Array<Plane>, selection : SmartArray ) : Void;
}