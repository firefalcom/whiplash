//
package babylonx.lights ;
//
import babylonx.Scene;
import babylonx.lights.shadows.ShadowGenerator ;
//
@:native("BABYLON.Light") extern class Light {
	public var name : String;
	public var id : String;
	public function new ( name : String, scene : Scene ) ;
	public var intensity : Float;
	public var isEnabled : Bool;
	public function getScene(  ) : Scene;
	public var getShadowGenerator : ShadowGenerator;
	public function dispose(  ) : Void;
}