//
package babylonx.particles ;
//
import babylonx.materials.textures.Texture;
import babylonx.Scene;
import babylonx.tools.math.Vector3;
import babylonx.tools.math.Color4;
//
@:native("BABYLON.ParticleSystem") 
extern class ParticleSystem {
	static public var BLENDMODE_ONEONE (default,null) : Float;
	static public var BLENDMODE_STANDARD (default,null) : Float;
	//
	public var name : String;
	public var id : String;
	public var gravity : Vector3;
	public var direction1 : Vector3;
	public var direction2 : Vector3;
	public var minEmitBox : Vector3;
	public var maxEmitBox : Vector3;
	public var color1 : Color4;
	public var color2 : Color4;
	public var colorDead : Color4;
	public var deadAlpha : Float;
	public var textureMask : Color4;
	public var particles : Array<Particle>;
	public var indices : Array<Float>;
	public var renderingGroupId : Float;
	public var emitter : Dynamic;
	public var emitRate : Float;
	public var manualEmitCount : Float;
	public var updateSpeed : Float;
	public var targetStopDuration : Float;
	public var disposeOnStop : Bool;
	public var minEmitPower : Float;
	public var maxEmitPower : Float;
	public var minLifeTime : Float;
	public var maxLifeTime : Float;
	public var minSize : Float;
	public var maxSize : Float;
	public var minAngularSpeed : Float;
	public var maxAngularSpeed : Float;
	public var particleTexture : Texture;
	public var onDispose : Void -> Void;
	public var blendMode : Float;
	//
	public function new (name : String, capacity : Float, scene : Scene ) ;
	//
	public function isAlive(  ) : Bool;
	public function start(  ) : Void;
	public function stop(  ) : Void;
	public function animate(  ) : Void;
	public function render(  ) : Float;
	public function dispose(  ) : Void;
	public function clone( name : String, newEmitter : Dynamic ) : ParticleSystem;
}