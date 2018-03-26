//
package babylonx.materials.textures ;
//
import babylonx.Scene;
import babylonx.Scene.Size2D;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Plane;
//
@:native("BABYLON.MirrorTexture") 
extern class MirrorTexture extends RenderTargetTexture {
	public function new (name : String, size : Size2D, scene : Scene, generateMipMaps : Bool ) ;
	public var mirrorPlane : Plane;
	public function onBeforeRender(  ) : Void;
	public function onAfterRender(  ) : Void;
}





	
	
	