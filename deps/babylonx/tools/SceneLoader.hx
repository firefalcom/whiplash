//
package babylonx.tools ;
//
import babylonx.Engine;
import babylonx.Scene;
import babylonx.mesh.Mesh;
import babylonx.Scene;
//
@:native("BABYLON.SceneLoader") 
extern class SceneLoader { 
	static public function _ImportGeometry( parsedGeometry : Dynamic, mesh : Mesh ) : Void;
	static public function ImportMesh( meshName : String, rootUrl : String, sceneFilename : String, scene : Scene, ?then : Array<Dynamic>->Array<Dynamic>->Array<Dynamic>->Void ,?progressCallBack:String->Void) : Void;
	static public function Load( rootUrl : String, sceneFilename : String, engine : Engine, ?then : Scene->Void ,?progressCallBack:Dynamic) : Void;
}


