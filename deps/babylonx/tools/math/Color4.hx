//
package babylonx.tools.math ;
//
@:native("BABYLON.Color4")
extern class Color4 {
	public var r : Float;
	public var g : Float;
	public var b : Float;
	public var a : Float;
	//
	public function new (initialR : Float, initialG : Float, initialB : Float, initialA : Float ) ;
	//
	public function addInPlace( right : Color4 ) : Void;
	public function add( right : Color4 ) : Color4;
	public function subtract( right : Color4 ) : Color4;
	public function subtractToRef( right : Color4, result : Color4 ) : Void;
	public function scale( factor : Float ) : Color4;
	public function toString(  ) : String;
	public function clone(  ) : Color4;
	public function Lerp( left : Float, right : Float, amount : Float ) : Color4;
	public function FromArray( array : Array<Float> ) : Color4;
	
}