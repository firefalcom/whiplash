//
package babylonx.materials.textures ;
//
import babylonx.Scene;
import js.html.VideoElement ;
//
@:native("BABYLON.VideoTexture") extern class VideoTexture extends Texture {
	public function new (name : String, urls : Array<String>, size : Size2D, scene : Scene, generateMipMaps : Bool ) ;
	public var video : VideoElement;
	public var _autoLaunch : Bool;
	public var textureSize : Size2D;
	public function _update(  ) : Bool;
}
	
	
	

	
	