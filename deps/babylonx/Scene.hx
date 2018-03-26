/**
 * Haxe extern of http://www.babylonjs.com/ 
 * by jmd from https://github.com/vujadin/BabylonHx and https://gist.github.com/postite/8972576
 */
//
package babylonx ;
//
import babylonx.bones.Skeleton;
import babylonx.layer.Layer;
import babylonx.lights.Light;
import babylonx.materials.Material;
import babylonx.materials.MultiMaterial;
import babylonx.materials.StandardMaterial;
import babylonx.materials.textures.Texture;
import babylonx.mesh.Mesh;
import babylonx.cameras.Camera;
import babylonx.particles.ParticleSystem;
import babylonx.postProcess.PostProcess;
import babylonx.sprites.SpriteManager;
import babylonx.tools.math.Color3;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Ray;
import babylonx.tools.math.Vector3;
//
typedef ScenePickResult = { public var hit : Bool; public var distance : Float; public var pickedMesh : Mesh; public var pickedPoint : Vector3; };
typedef Size2D = { public var width : Float; public var height : Float; };
typedef Sphere = { public var center : Vector3; public var radius : Float; };
typedef BabylonMinMax = {
	min: Float,
	max: Float
}
//
@:native("BABYLON.Scene")
extern class Scene {
	static public var FOGMODE_NONE (default,null) : Float;
	static public var FOGMODE_EXP (default,null) : Float;
	static public var FOGMODE_EXP2 (default,null) : Float;
	static public var FOGMODE_LINEAR (default,null) : Float;
	//
    public var beforeRender:Void->Void;
	public var afterRender:Void->Void;
	public var activeCamera:Camera ;
	public var collisionsEnabled:Bool ;
	public var gravity:Vector3 ;
	public var autoClear : Bool;
	public var clearColor : Color3; 
	public var ambientColor : Color3;
	public var fogMode : Float;
	public var fogColor : Color3;
	public var fogDensity : Float;
	public var fogStart : Float;
	public var fogEnd : Float;
	public var lights : Array<Light>;
	public var cameras : Array<Camera>;
	public var meshes : Array<Mesh>;
	public var materials : Array<Material>; 
	public var multiMaterials : Array<MultiMaterial>; 
	public var defaultMaterial : StandardMaterial; 
	public var textures : Array<Texture>;
	public var particlesEnabled : Bool;
	public var particleSystems : Array<ParticleSystem>;
	public var spriteManagers : Array<SpriteManager>;
	public var layers : Array<Layer>;
	public var skeletons : Array<Skeleton>;
	public var postProcessManager : PostProcessManager;
	//
	public function new(engine:Engine);
	//
	public function render ():Void ;
	public function pick (x:Float, y:Float, ?predicate:Bool):ScenePickResult ;
	public function getEngine(  ) : Engine;
	public function getTotalVertices(  ) : Float;
	public function getActiveVertices(  ) : Float;
	public function getActiveParticles(  ) : Float;
	public function getLastFrameDuration(  ) : Float;
	public function getEvaluateActiveMeshesDuration(  ) : Float;
	public function getRenderTargetsDuration(  ) : Float;
	public function getRenderDuration(  ) : Float;
	public function getParticlesDuration(  ) : Float;
	public function getSpritesDuration(  ) : Float;
	public function getAnimationRatio(  ) : Float;
	public function getRenderId (): Float ;
	public function isReady( ) : Bool;
	public function registerBeforeRender( func : Dynamic ) : Void;
	public function unregisterBeforeRender( func : Dynamic ) : Void;
	public function executeWhenReady( func : Dynamic ) : Void;
	public function getWaitingItemsCount(  ) : Float;
	public function beginAnimation( target : String, from : Float, to : Float, loop : Bool, speedRatio : Float, ?onAnimationEnd : Void->Void ) : Void;
	public function stopAnimation( target : String ) : Void;
	public function getViewMatrix(  ) : Matrix; 
	public function getProjectionMatrix(  ) : Matrix;
	public function getTransformMatrix(  ) : Matrix;
	public function setTransformMatrix(view:Matrix, projection:Matrix) :Void;
	public function activeCameraByID( id : Float ) : Void;
	public function getMaterialByID( id : Float ) : Material;
	public function getLightByID( id : Float ) : Light;
	public function getMeshByID( id : Float ) : Mesh;
	public function getLastMeshByID( id : Float ) : Mesh;
	public function getMeshByName( name : String ) : Mesh;
	public function isActiveMesh( mesh : Mesh ) : Bool;
	public function getLastSkeletonByID( id : Float ) : Skeleton;
	public function getSkeletonByID( id : Float ) : Skeleton;
	public function getSkeletonByName( name : String ) : Skeleton;
	public function _evaluateActiveMeshes(  ) : Void;	
	public function dispose( ) : Void;
	public function _getNewPosition( position : Vector3, velocity : Vector3, collider : Sphere, maximumRetries : Float ) : Vector3;
	public function _collideWithWorld( position : Vector3, velocity : Vector3, collider : Sphere, maximumRetries : Float ) : Vector3;
	public function createOrUpdateSelectionOctree(  ) : Void;
	public function createPickingRay( x : Float, y : Float, world : Matrix ) : Ray;
}


	
	
	