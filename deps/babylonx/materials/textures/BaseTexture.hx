package babylonx.materials.textures ;
//
import babylonx.Scene;
//
@:native("BABYLON.BaseTexture")
extern class BaseTexture {
	public var hasAlpha  : Bool ;
	public var _scene : Scene;
	public var delayLoadState : Float;
	public var level : Float;
	public var onDispose : Void->Void;
	//
    public function new (url:String, scene:Scene);
	//
	public function getInternalTexture(  ) : BaseTexture;
	public function isReady(  ) : Bool;
	public function getSize(  ) : Size2D;
	public function getBaseSize(  ) : Size2D;
	public function _getFromCache( url : String, noMipmap : Bool ) : BaseTexture;
	public function delayLoad(  ) : Void;
	public function releaseInternalTexture(  ) : Void;
	public function dispose(  ) : Void;
}


	