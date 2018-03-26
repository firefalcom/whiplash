package babylonx.mesh ;
//
import babylonx.materials.Material;
import babylonx.culling.BoundingInfo;
import babylonx.Engine;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Plane;
import babylonx.tools.math.Ray;
import babylonx.mesh.Mesh.PickingInfo ;
import babylonx.mesh.Mesh.BabylonGLBuffer ;
//
@:native("BABYLON.SubMesh")
extern class SubMesh {
	public var materialIndex : Float;
	public var verticesStart : Float;
	public var verticesCount : Float;
	public var indexStart : Float;
	public var indexCount : Float;
	//
	public function new(materialIndex:Int, verticesStart:Int, verticesCount:Int, indexStart:Int, indexCount:Int, mesh:Mesh);
	//
	public function getBoundingInfo(  ) : BoundingInfo;
	public function getMaterial(  ) : Material;
	public function refreshBoundingInfo(  ) : Void;
	public function updateBoundingInfo( world : Matrix, scale : Vector3 ) : Void;
	public function isInFrustrum( frustumPlanes : Array<Plane> ) : Bool;
	public function render(  ) : Void;
	public function getLinesIndexBuffer( indices : Array<Float>, engine : Engine ) : BabylonGLBuffer;
	public function canIntersects( ray : Ray ) : Bool;
	public function intersects( ray : Ray, positions : Array<Vector3>, indices : Array<Float> ) : PickingInfo;
	public function clone( newMesh : Mesh ) : SubMesh;
	public function CreateFromIndices( materialIndex : Float, startIndex : Float, indexCount : Float, mesh : Mesh ) : SubMesh;	
}