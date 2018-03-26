//
package babylonx.tools.math ;
//
@:native("BABYLON.Vector2")
extern class Vector2 {
	public var x:Float;
    public var y:Float;
    //
    public function new(x:Float, y:Float);
	//
	public function toString(  ) : String;
	public function add( other : Vector2 ) : Vector2;
	public function subtract( other : Vector2 ) : Vector2;
	public function negate(  ) : Vector2;
	public function scaleInPlace( scale : Float ) : Void;
	public function scale( scale : Float ) : Vector2;
	public function equals( other : Vector2 ) : Bool;
	public function length(  ) : Float;
	public function lengthSquared(  ) : Float;
	public function normalize(  ) : Void;
	public function clone(  ) : Vector2;
	//
	static public function Zero ():Vector2 ;
	static public function CatmullRom( value1 : Vector2, value2 : Vector2, value3 : Vector2, value4 : Vector2, amount : Float ) : Vector2;
	static public function Clamp( value : Vector2, min : Vector2, max : Vector2 ) : Vector2;
	static public function Hermite( value1 : Vector2, tangent1 : Vector2, value2 : Vector2, tangent2 : Vector2, amount : Float ) : Vector2;
	static public function Lerp( start : Vector2, end : Vector2, amount : Float ) : Vector2;
	static public function Dot( left : Vector2, right : Vector2 ) : Float;
	static public function Normalize( vector : Vector2 ) : Vector2;
	static public function Minimize( left : Vector2, right : Vector2 ) : Vector2;
	static public function Maximize( left : Vector2, right : Vector2 ) : Vector2;
	static public function Transform( vector : Vector2, transformation : Array<Float> ) : Vector2;
	static public function Distance( value1 : Vector2, value2 : Vector2 ) : Float;
	static public function DistanceSquared( value1 : Vector2, value2 : Vector2 ) : Float;
}


	
	
	
	
	