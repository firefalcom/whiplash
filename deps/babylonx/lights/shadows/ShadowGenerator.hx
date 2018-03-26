//
package babylonx.lights.shadows ;
//
import babylonx.Scene;
import babylonx.lights.Light;
import babylonx.tools.math.Matrix;
import babylonx.materials.textures.RenderTargetTexture;
import babylonx.mesh.Mesh;
//
@:native("BABYLON.ShadowGenerator")
extern class ShadowGenerator {
	public var _light : Light;
	public var _scene : Scene;
	public var _shadowMap : RenderTargetTexture;
	public var useVarianceShadowMap : Bool;
	//
	public function new ( mapSize : Float, light : Light ) ;
	//
	public function renderSubMesh( subMesh : Mesh ) : Void;
	public function isReady( mesh : Mesh ) : Bool;
	public function getShadowMap(  ) : RenderTargetTexture;
	public function getLight(  ) : Light;
	public function getTransformMatrix(  ) : Matrix;
	public function dispose(  ) : Void;
}