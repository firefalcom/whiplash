/**
 * Haxe extern of http://www.babylonjs.com/ 
 * by jmd from https://github.com/vujadin/BabylonHx and https://gist.github.com/postite/8972576
 */
package babylonx.mesh;
//
import babylonx.animations.Animation;
import babylonx.bones.Skeleton;
import babylonx.collisions.Collider;
import babylonx.materials.Effect;
import babylonx.materials.Material;
import babylonx.Engine;
import babylonx.materials.Material.MeshMaterial;
import babylonx.materials.StandardMaterial;
import babylonx.Scene;
import babylonx.tools.math.Vector2;
import babylonx.tools.Tools;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Plane;
import babylonx.tools.math.Quaternion;
import babylonx.tools.math.Ray;
import babylonx.tools.math.Vector3;
import babylonx.culling.BoundingInfo;
import babylonx.particles.ParticleSystem;
import js.html.webgl.Buffer;
//
typedef PickingInfo = { 
	public var hit : Bool ;
	public var distance : Float;
	public var pickedPoint :Vector3;
    public var pickedMesh : Mesh;
    @:optional public var bu :Float;
    @:optional public var bv : Float;
    @:optional public var faceId :Int;
	public function getNormal (): Vector3;
};
typedef BabylonGLBuffer = {
	buffer:Buffer,
	references:Int
}
//
@:native("BABYLON.Mesh")
extern class Mesh {	
	public static var BILLBOARDMODE_NONE(default,null) : Int; // = 0;
	public static var BILLBOARDMODE_X(default,null) : Int; // = 1;
	public static var BILLBOARDMODE_Y(default,null) : Int; // = 2;
	public static var BILLBOARDMODE_Z(default,null) : Int; // = 4;
	public static var BILLBOARDMODE_ALL(default,null) : Int; // = 7;
	//
	public var name:String;
	public var scaling:Vector3;
	public var rotationQuaternion:Quaternion;
	public var rotation:Vector3;
	public var position:Vector3;
	public var material:MeshMaterial; // MeshMaterial don't exist in native ; @see Material
	public var parent:Mesh;
	public var checkCollisions:Bool;
	public var subMeshes:Array<SubMesh>;	
	public var isVisible:Bool;
    public var isPickable :Bool;
    public var visibility:Float;
	public var animations:Array<Animation>;
	public var infiniteDistance:Bool;
	public var delayLoadState:Int;
	public var delayLoadingFile:String;
	public var billboardMode:Int;
	public var receiveShadows:Bool;
	public var onDispose:Void->Void;
	public var skeleton:Skeleton;
	public var renderingGroupId:Int;
	//
	public function new(name:String, scene:Scene);
	//
	static public function CreateSphere (name:String, segments:Float, diameter:Float, scene:Scene, ?updatable:Bool ) :Mesh ;
	static public function CreateCylinder(name:String, height:Float, diameterTop:Float, diameterBottom:Float, tessellation:Int, scene:Scene, ?updatable:Bool ) :Mesh ;
	static public function CreatePlane(name:String, size:Float, scene:Scene, ?updatable:Bool ) :Mesh ;	
	static public function CreateBox(name:String, height:Float, scene:Scene, ?updatable:Bool ) :Mesh ;	
	static public function CreateGround(name:String, width:Float, height:Float, subdivisions:Int, scene:Scene, updatable:Bool):Mesh ;	
	static public function CreateGroundFromHeightMap(name:String, url:String, width:Float, height:Float, subdivisions:Int, minHeight:Float, maxHeight:Float, scene:Scene, updatable:Bool):Mesh ;
	static public function ComputeNormal  (positions:Array < Float > , normals:Array < Float > , indices:Array < Int > ) : Void;
	//
	public function getBoundingInfo():BoundingInfo ;	
	public function getScene():Scene ;	
	public function getWorldMatrix():Matrix ;	
	public function getTotalVertices():Int  ;	
	public function getAbsolutePosition():Vector3  ;	
	public function setAbsolutePosition(absolutePosition:Dynamic ):Void;	
	public function getVerticesData(kind:String):Array<Float> ;		
	// public function getVertexBuffer(kind:String):VertexBuffer ; 
	// don't exists in older versions ,
	// so :
	public var _vertexBuffers :Dynamic<VertexBuffer>; // ex: Reflect.field( mesh._vertexBuffers , VertexBuffer.PositionKind ) ;
	inline public function getVertexBuffer  (kind:String) : VertexBuffer {
		return untyped _vertexBuffers[kind] ;
	}
	//
	public function isVerticesDataPresent(kind:String):Bool ;	
	public function getVerticesDataKinds():Array<String> ;
	public function setVerticesData(data:Array<Float>, kind:String, updatable:Bool):Void;	
	public function updateVerticesData(kind:String, data:Array<Float>):Void;
	public function getIndices():Array<Int> ;
	public function getTotalIndices():Int ;	
	public function getVertexStrideSize():Float ;		
	public function setPivotMatrix(matrix:Matrix):Void;	
	public function getPivotMatrix():Matrix ;	
	public function isSynchronized(updateCache:Bool ):Bool ;		
	public function isAnimated():Bool ;	
	public function isDisposed():Bool ;	
	public function markAsDirty(property:String):Void;	
	public function refreshBoudningInfo():Void;	
	public function _updateBoundingInfo():Void;	
	public function computeWorldMatrix(force:Bool ):Matrix ;	
	public function _createGlobalSubMesh():SubMesh ;	
	public function subdivide(count:Int):Void;	
	public function setIndices(indices:Array<Int>):Void;	
	public function bindAndDraw(subMesh:SubMesh, effect:Effect, wireframe:Bool):Void;	
	public function registerBeforeRender(func:Dynamic):Void;	
	public function unregisterBeforeRender(func:Dynamic):Void;	
	public function render(subMesh:SubMesh):Void;	
	public function getHierarchyEmittedParticleSystems():Array<ParticleSystem>;	
	public function getChildren():Array<Mesh> ;	
	public function isInFrustrum(frustumPlanes:Array<Plane>):Bool ;	
	public function setMaterialByID(id:String):Void;	
	public function getAnimatables():Array<Dynamic> ;	
	public function setLocalTranslation(vector3:Vector3):Void;	
	public function getLocalTranslation():Vector3 ;	
	public function bakeTransformIntoVertices(transform:Matrix):Void;
	public function intersectsMesh(mesh:Mesh, precise:Bool):Bool ;	
	public function intersectsPoint(point:Vector3):Bool ;	
	public function intersects(ray:Ray):PickingInfo; // { hit: Bool, distance:Float };	
	public function clone (name:String, ?newParent:Mesh, ?doNotCloneChildren:Bool) : Mesh;
	public function dispose(?doNotRecurse:Bool):Void;
}
