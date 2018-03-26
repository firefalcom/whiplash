//
package babylonx.lights ;
//
import babylonx.Scene;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Color3;
import babylonx.animations.Animation;
//
@:native("BABYLON.SpotLight") extern class SpotLight {
	public var position : Vector3;
	public var direction : Vector3;
	public var angle : Float;
	public var exponent : Float;
	public var diffuse : Color3;
	public var specular : Color3;
	public var animations : Array<Animation>;
	public function new (name : String, position : Vector3, direction : Vector3, angle : Float, exponsent : Float, scene : Scene ) ;
}

