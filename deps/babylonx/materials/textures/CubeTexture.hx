//
package babylonx.materials.textures ;
//
import babylonx.Scene;
import babylonx.tools.math.Matrix;
//
@:native("BABYLON.CubeTexture")
extern class CubeTexture extends BaseTexture {	
	public var isCube : Bool;
	//
	public function new (url:String, scene:Scene) ;
	//
	public function _computeReflectionTextureMatrix() : Matrix;
}





	
	
	