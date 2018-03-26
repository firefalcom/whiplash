//
package babylonx.particles ;
//
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Color4;
//
@:native("BABYLON.Particle") extern class Particle {
	public var position : Vector3;
	public var direction : Vector3;
	public var lifetime : Float;
	public var age : Float;
	public var size : Float;
	public var angle : Float;
	public var angularSpeed : Float;
	public var color : Color4;
	public var colorStep : Color4;
	//
	public function new () ;
}