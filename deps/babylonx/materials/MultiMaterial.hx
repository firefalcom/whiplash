//
package babylonx.materials ;
//
import babylonx.Scene;
import babylonx.materials.Material.MeshMaterial;
//
@:native("BABYLON.MultiMaterial")
extern class MultiMaterial implements MeshMaterial  {
	public var subMaterials : Array<Material>;	
	//
	public function new (name:String, scene:Scene);
	//
	public function getSubMaterial( index : Float ) : Material;
}
