//
package babylonx.materials.textures ;
//
import babylonx.animations.Animation;
import babylonx.Scene;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Vector3;
//
@:native("BABYLON.Texture")
extern class Texture extends BaseTexture {
	static public var EXPLICIT_MODE  (default,null) : Float;
	static public var SPHERICAL_MODE  (default,null) : Float;
	static public var PLANAR_MODE  (default,null) : Float;
	static public var CUBIC_MODE  (default,null) : Float;
	static public var PROJECTION_MODE  (default,null) : Float;
	static public var SKYBOX_MODE  (default,null) : Float;
	static public var CLAMP_ADDRESSMODE  (default,null) : Float;
	static public var WRAP_ADDRESSMODE  (default,null) : Float;
	static public var MIRROR_ADDRESSMODE  (default,null) : Float;
	//
    public var name : String;
	public var url : String;
	public var animations : Array<Animation>;
	public var uOffset : Float;
	public var vOffset : Float;
	public var uScale : Float;
	public var vScale : Float;
	public var uAng : Float;
	public var vAng : Float;
	public var wAng : Float;
	public var wrapU : Float;
	public var wrapV : Float;
	public var coordinatesIndex : Float;
	public var coordinatesMode : Float;
	//
	public function new (url:String, scene:Scene, ?noMipMap:Bool, ?invertY:Bool);
	//
	public function _prepareRowForTextureGeneration( t : Vector3 ) : Vector3;
	public function _computeTextureMatrix(  ) : Matrix;
	public var _computeReflectionTextureMatrix : Matrix;
	public function clone(  ) : Texture;	
}

	
	
	

	
	