/**
* materials package
*/
package babylonx.materials ;
//
import babylonx.materials.textures.BaseTexture;
import babylonx.materials.textures.Texture;
import babylonx.Scene;
import babylonx.tools.math.Color3;
//
@:native("BABYLON.StandardMaterial")
extern class StandardMaterial extends Material {
	public var diffuseTexture  : BaseTexture ;
	public var ambientTexture : Texture;
	public var specularTexture : Texture ;
	public var reflectionTexture : BaseTexture;	
	public var opacityTexture : Texture;
	public var emissiveTexture : Texture;
	public var bumpTexture : Texture;
	//
	public var ambientColor : Color3;
	public var diffuseColor : Color3;
	public var emissiveColor : Color3 ;
	public var specularColor  : Color3 ;
	//
	public var specularPower : Int ;	
	//
	public function new (name:String, scene:Scene);
	//
	public function getRenderTargetTextures(  ) : Array<Texture>;
	public function getAnimatables(  ) : Array<Texture>;
	public function clone (name:String):StandardMaterial ;
}

	
	
	