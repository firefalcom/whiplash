package babylonx.materials ;
//
import babylonx.Scene;
import js.html.CanvasElement;
import babylonx.tools.math.Matrix;
import babylonx.mesh.Mesh ;
//
@:native("BABYLON.Material")
extern class Material implements MeshMaterial {	
	public var backFaceCulling  : Bool ;
	public var wireframe  : Bool ;
	public var alpha  : Float ;
	public var name : String;
	public var id : String;
	public var checkReadyOnEveryCall : Bool;
	public var onDispose : Void -> Void;
	//
	public function new (name:String, scene:Scene);
	//
	public function isReady(  ) : Bool;
	public function getEffect(  ) : Effect;
	public function needAlphaBlending(  ) : Bool;
	public function needAlphaTesting(  ) : Bool;
	public function _preBind(  ) : Void;
	public function bind( world : Matrix, mesh : Mesh ) : Void;
	public function unbind(  ) : Void;
	public function baseDispose(  ) : Void;
	public function dispose(  ) : Void;
}
/*
* In native, Mesh.material contains Material or MultiMaterial  ;
*/
@:remove interface MeshMaterial { }	