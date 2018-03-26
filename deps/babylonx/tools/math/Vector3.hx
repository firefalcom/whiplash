/**
* math package
*/
package babylonx.tools.math ;
//
@:native("BABYLON.Vector3")
extern class Vector3 {
	public var x:Float;
    public var y:Float;
    public var z:Float;
    //
    public function new(x:Float, y:Float, z:Float);
	//
	static public function Zero ():Vector3 ;
	static public function TransformCoordinatesToRef (vector:Vector3, transformation:Matrix, result:Vector3):Void ;
	static public function FromArray( array : Array<Float>, offset : Float ) : Void;
	static public function FromArrayToRef( array : Array<Float>, offset : Float, result : Vector3 ) : Void;
	static public function FromFloatsToRef( x : Float, y : Float, z : Float, result : Vector3 ) : Void;
	static public function Up(  ) : Vector3;
	static public function TransformCoordinates( vector : Vector3, transformation : Matrix ) : Vector3;
	static public function TransformCoordinatesFromFloatsToRef( x : Float, y : Float, z : Float, transformation : Matrix, result : Vector3 ) : Void;
	static public function TransformNormal( vector : Vector3, transformation : Matrix ) : Vector3;
	static public function TransformNormalToRef( vector : Vector3, transformation : Matrix, result : Vector3 ) : Void;
	static public function TransformNormalFromFloatsToRef( x : Float, y : Float, z : Float, transformation : Matrix, result : Vector3 ) : Void;
	static public function CatmullRom( value1 : Vector3, value2 : Vector3, value3 : Vector3, value4 : Vector3, amount : Float ) : Vector3;
	static public function Clamp( value : Vector3, min : Vector3, max : Vector3 ) : Vector3;
	static public function Hermite( value1 : Vector3, tangent1 : Vector3, value2 : Vector3, tangent2 : Vector3, amount : Float ) : Vector3;
	static public function Lerp( start : Vector3, end : Vector3, amount : Float ) : Vector3;
	static public function Dot( left : Vector3, right : Vector3 ) : Float;
	static public function Cross( left : Vector3, right : Vector3 ) : Vector3;
	static public function CrossToRef( left : Vector3, right : Vector3, result : Vector3 ) : Void;
	static public function Normalize( vector : Vector3 ) : Vector3;
	static public function NormalizeToRef( vector : Vector3, result : Vector3 ) : Void;
	static public function Unproject( source : Vector3, viewportWidth : Float, viewportHeight : Float, world : Matrix, view : Matrix, projection : Matrix ) : Vector3;
	static public function Minimize( left : Vector3, right : Vector3 ) : Vector3;
	static public function Maximize( left : Vector3, right : Vector3 ) : Vector3;
	static public function Distance( value1 : Vector3, value2 : Vector3 ) : Float;
	static public function DistanceSquared( value1 : Vector3, value2 : Vector3 ) : Float;
	//
	public function copyFromFloats(x:Float, y:Float, z:Float):Void ;
	public function addInPlace(otherVector:Vector3):Void ;
	public function equals(otherVector:Vector3):Bool ;
	public function toString(  ) : String;
	public function add( other : Vector3 ) : Vector3;
	public function addToRef( otherVector : Vector3, result : Vector3 ) : Void;
	public function suntractInPlace( otherVector : Vector3 ) : Void;
	public function subtract( other : Vector3 ) : Vector3;
	public function subtractToRef( otherVector : Vector3, result : Vector3 ) : Void;
	public function subtractFromFloatsTo( x : Float, y : Float, z : Float ) : Vector3;
	public function subtractFromFloatsToRef( x : Float, y : Float, z : Float, result : Vector3 ) : Void;
	public function negate(  ) : Vector3;
	public function scaleInPlace( scale : Float ) : Void;
	public function scale( scale : Float ) : Vector3;
	public function scaleToRef( scale : Float, result : Vector3 ) : Void;
	public function equalsToFloats( x : Float, y : Float, z : Float ) : Bool;
	public function multiplyInPlace( other : Vector3 ) : Void;
	public function multiply( other : Vector3 ) : Vector3;
	public function multiplyToRef( otherVector : Vector3, result : Vector3 ) : Void;
	public function multiplyByFloats( x : Float, y : Float, z : Float ) : Vector3;
	public function divide( other : Vector3 ) : Vector3;
	public function divideToRef( otherVector : Vector3, result : Vector3 ) : Void;
	public function length(  ) : Float;
	public function lengthSquared(  ) : Float;
	public function normalize(  ) : Void;
	public function clone(  ) : Vector3;
	public function copyFrom( source : Vector3 ) : Void;
}

	
	
	