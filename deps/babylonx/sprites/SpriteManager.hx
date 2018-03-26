//
package babylonx.sprites ;
//
import babylonx.Scene;
//
@:native("BABYLON.SpriteManager") 
extern class SpriteManager {
	public var name : String;
	public var cellSize : Float;
	public var indices : Array<Int>;
	public var index : Float;
	public var sprites : Array<Sprite>;
	public var onDispose : Void -> Void;	
	//
	public function new (name : String, imgUrl : String, capacity : Float, cellSize : Float, scene : Scene, ?epsilon : Float ) ;
	//
	public function render(  ) : Void;
	public function dispose(  ) : Void;
}
