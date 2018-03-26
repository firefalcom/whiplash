//
package babylonx.tools ;
//
import babylonx.Scene;
import js.html.ImageElement;
//
@:native("BABYLON.Database") extern class Database {
	public var currentSceneUrl : String;
	public var db : Database;
	public var enableSceneOffline : Bool;
	public var enableTexturesOffline : Bool;
	public var manifestVersionFound : Float;
	public var mustUpdateRessources : Bool;
	public var hasReachedQuota : Bool;
	public var isUASupportingBlobStorage : Bool;	
	//
	public function new (urlToScene : String ) ;
	public function parseURL( url : String ) : String;
	public function ReturnFullUrlLocation( url : String ) : String;
	public function checkManifestFile(  ) : Void;
	public function openAsync( successCallback : Void->Void, errorCallback : Void->Void ) : Void;
	public function loadImageFromDB( url : String, image : ImageElement ) : Void;
	public function _loadImageFromDBAsync( url : String, image : ImageElement, notInDBCallback : Void->Void ) : Void;
	public function _saveImageIntoDBAsync( url : String, image : ImageElement ) : Void;
	public function _checkVersionFromDB( url : String, versionLoaded : Float ) : Void;
	public function _loadVersionFromDBAsync( url : String, callback : Int->Void, updateInDBCallback : Void->Void ) : Void;
	public function _saveVersionIntoDBAsync( url : String, callback : Int->Void ) : Void;
	public function loadSceneFromDB( url : String, sceneLoaded : String->Void, progressCallBack : Dynamic ) : Void;
	public function _loadSceneFromDBAsync( url : String, callback :String->Void, notInDBCallback : Void->Void ) : Void;
	
}

