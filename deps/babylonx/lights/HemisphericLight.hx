//
package babylonx.lights ;
//
import babylonx.Scene;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Color3;
import babylonx.animations.Animation;
//
@:native("BABYLON.HemisphericLight") 
extern class HemisphericLight {
	public var direction : Vector3;
	public var diffuse : Color3;
	public var specular : Color3;
	public var groundColor : Color3;
	public var animations : Array<Animation>;
	public function new (name : String, direction : Vector3, scene : Scene ) ;
	public function getShadowGenerator( ) : Void;
}

