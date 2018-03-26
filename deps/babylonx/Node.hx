/**
 * Haxe extern of http://www.babylonjs.com/ 
 * by jmd from https://github.com/vujadin/BabylonHx and https://gist.github.com/postite/8972576
 */
//
package babylonx;
//
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Vector3;
//
@:native("BABYLON.Node")
extern class Node {	
	public var name:String;
	public var id:String;
	public var parent:Node;
	public var position:Vector3;
    public var _childrenFlag:Int;
    public var _isReady:Bool;
    public var _isEnabled:Bool;
	public var _scene:Scene;
	public var _cache:Dynamic;
	//
	public function new(scene:Scene) ;
	//
	public function _initCache() ;	
	public function updateCache(?force:Bool ) ;	
	public function _updateCache(?ignoreParentClass:Bool) ;
	public function _isSynchronized():Bool ;	
	public function _syncChildFlag() ;	
	public function isSynchronizedWithParent():Bool ;	
	public function isSynchronized(?updateCache:Bool):Bool;	
	public function hasNewParent(?update:Bool):Bool ;	
	public function _needToSynchonizeChildren(childFlag:Int):Bool ;	
	public function isReady():Bool ;	
	public function isEnabled():Bool ;	
	public function setEnabled(value:Bool);	
	public function isDescendantOf(ancestor:Node):Bool ;	
	public function _getDescendants(list:Array<Node>, results:Array<Node>) ;	
	public function getWorldMatrix():Matrix ;	
	public function getDescendants():Array<Node> ;	
}
