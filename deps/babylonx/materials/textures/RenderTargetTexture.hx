//
package babylonx.materials.textures ;
//
import babylonx.Scene;
import babylonx.Scene.Size2D;
//
@:native("BABYLON.RenderTargetTexture") 
extern class RenderTargetTexture extends Texture {
	public function new (name : String, size : Size2D, scene : Scene, generateMipMaps : Bool ) ;
	public var renderList : Array<Dynamic>;
	public var isRenderTarget : Bool;
	public var renderParticles : Bool;
	public var _onBeforeRender : Void -> Void;
	public var _onAfterRender : Void -> Void;
	public function resize( size : Size2D, generateMipMaps : Bool ) : Void;
	public function render(  ) : Void;
}




	