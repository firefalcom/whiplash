//
package babylonx.postProcess;
//
@:native("BABYLON.PostProcess") 
extern class PostProcess implements Dynamic {
	public function new () ;
	//TODO //TODO //TODO //TODO //TODO 
}
@:native("BABYLON.PostProcessManager") extern class PostProcessManager {
	public var postProcesses : Array<PostProcess>;
	public var _prepareFrame : Void -> Dynamic ;
	public function new ( ) ;	
}

