//
package babylonx.tools ;
//
import babylonx.Scene;
import js.html.Element;
import js.html.ImageElement;
import js.html.ImageData;
//
@:native("BABYLON.Tools")
extern class Tools {
    static public var BaseUrl : String;
	static public var fpsRange : Float;
	static public var previousFramesDuration : Array<Float>;
	static public var fps:Float;
    static public var deltaTime:Float ;
	//
	static public function QueueNewFrame (func:Dynamic):Void ;	
	static public function ExtractMinAndMax( positions : Array<Float>, start : Float, count : Float ) : BabylonMinMax;
	static public function GetPointerPrefix(  ) : String;
	static public function RequestFullscreen( element : Element) : Void;
	static public function ExitFullscreen(  ) : Void;
	static public function LoadImage( url : String, onload :ImageData->Void, onerror : Dynamic, database : Database ) :ImageElement;
	static public function LoadFile( url : String, callback : String->Void, progressCallback :Dynamic,database : Database ) : Void;
	static public function isIE(  ) : Bool;
	static public function WithinEpsilon( a : Float, b : Float ) : Void;
	static public function GetFps(  ) : Float;
	static public function GetDeltaTime(  ) : Float;
	static public function _MeasureFps(  ) : Void;
	static public function DeepCopy( source : Dynamic, destination : Dynamic, doNotCopyList : Array<String>, mustCopyList : Array<String> ) : Void;
	static public function cloneValue( source :  Dynamic, destinationObject :  Dynamic) : Void;	
}
//
//
@:native("BABYLON.SmartArray") 
extern class SmartArray {
	public var data : Array<Dynamic>;
	public var length : Float;
	public function new (capacity : Float ) : Void;
	public function push( value : Dynamic ) : Void;
	public function pushNoDuplicate( value : Dynamic ) : Void;
	public function reset(  ) : Void;
	public function concat( array : SmartArray ) : Void;
	public function concatWithNoDuplicate( array : SmartArray ) : Void;
	public function indexOf( value : Dynamic ) : Float;
}
	
	

	
   