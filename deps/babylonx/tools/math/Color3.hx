/**
* math package
*/
package babylonx.tools.math ;
//
@:native("BABYLON.Color3")
extern class Color3 {
	public var r:Float;
    public var g:Float;
    public var b:Float;
    public function new(initialR:Float, initialG:Float, initialB:Float);
	//
	public function equals( otherColor : Color3 ) : Bool;
	public function toString(  ) : String;
	public function clone(  ) : Color3;
	public function multiply( otherColor : Color3 ) : Color3;
	public function mutilplyToRef( otherColor : Color3, result : Color3 ) : Void;
	public function scale( scale : Float ) : Color3;
	public function scaleToRef( scale : Float, result : Color3 ) : Void;
	public function copyFrom( source : Color3 ) : Void;
	public function copyFromFloats( r : Float, g : Float, b : Float ) : Void;
	public function FromArray( array : Array<Float> ) : Color3;
	
}


