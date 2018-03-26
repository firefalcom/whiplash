//
package babylonx.lights ;
//
import babylonx.Scene;
import babylonx.animations.Animation ;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Color3;
//
@:native("BABYLON.PointLight")
extern class PointLight {
    public var position : Vector3;
	public var diffuse : Color3;
	public var specular : Color3;
	public var animations : Array<Animation>;
	public function new(name:String, position:Vector3, scene:Scene) ;	
}