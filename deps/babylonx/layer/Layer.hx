//
package babylonx.layer;
//
import babylonx.materials.textures.Texture;
import babylonx.Scene;
import babylonx.tools.math.Color4;
import babylonx.materials.Effect;
import babylonx.mesh.Mesh.BabylonGLBuffer ;
//
@:native("BABYLON.Layer") 
extern class Layer {
	public var name : String;
	public var texture : Texture; 
	public var isBackground : Bool;
	public var color : Color4; 
	public var _scene : Scene;
	public var vertices : Array<Float>;
	public var indicies : Array<Float>;
	public var _indexBuffer : BabylonGLBuffer;
	public var _effect : Effect;
	public function new (name : String, imgUrl : String, scene : Scene, isBackground : Bool, color : Color4 ) : Void;
	public var onDispose : Void -> Void;
	public function render(  ) : Void;
	public function dispose(  ) : Void;
}