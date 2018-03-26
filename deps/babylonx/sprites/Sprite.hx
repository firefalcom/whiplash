//
package babylonx.sprites ;
//
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Color4;
//
@:native("BABYLON.Sprite") extern class Sprite {
	public var name : String;
	public var color : Color4;
	public var position : Vector3;
	public var size : Float;
	public var angle : Float;
	public var cellIndex : Float;
	public var invertU : Float;
	public var invertV : Float;
	public var disposeWhenFinishedAnimating : Bool;
	//
	public function new (name : String, manager : SpriteManager ) ;
	//
	public function playAnimation( from : Float, to : Float, loop : Bool, delay : Float ):Void;
	public function stopAnimation(  ) : Void;
	public function dispose(  ) : Void;
	public function _animate (deltaTime:Float):Void;
}
