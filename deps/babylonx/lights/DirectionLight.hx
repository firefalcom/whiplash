//
package babylonx.lights ;
//

import babylonx.animations.Animation;
import babylonx.lights.Light;
import babylonx.Scene;
import babylonx.tools.math.Color3;
import babylonx.tools.math.Vector3;
//
@:native("BABYLON.DirectionalLight")extern class DirectionalLight extends Light {
	public var direction : Vector3;
	public var animations : Array<Animation>;
	public var position : Vector3;
	public var diffuse : Color3;
	public var specular : Color3;
	public function new( name : String, direction : Vector3, scene : Scene ) ;
}