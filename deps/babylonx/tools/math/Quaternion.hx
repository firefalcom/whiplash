package babylonx.tools.math ;
//
@:native("BABYLON.Quaternion")
extern class Quaternion {
	public var x:Float;
    public var y:Float;
    public var z:Float;
    public var w:Float;
    //
    public function new(x:Float, y:Float, z:Float, w:Float);
	//
	public function toString() : String;
	public function equals( otherQuaternion : Quaternion ) : Bool;
	public function clone(  ) : Quaternion;
	public function copyFrom( other : Quaternion ) : Void;
	public function add( other : Quaternion ) : Quaternion;
	public function scale( factor : Float ) : Quaternion;
	public function multiply( q1 : Quaternion ) : Quaternion;
	public function multiplyToRef( q1 : Quaternion, result : Quaternion ) : Void;
	public function length(  ) : Float;
	public function normalize(  ) : Void;
	public function toEulerAngles(  ) : Vector3;
	public function toRotationMatrix( result : Quaternion ) : Void;
	//
	static public function FromArray( array : Array<Float>, offset : Float ) : Quaternion;
	static public function RotationYawPitchRoll( yaw : Float, pitch : Float, roll : Float ) : Quaternion;
	static public function RotationYawPitchRollToRef( yaw : Float, pitch : Float, roll : Float, result : Quaternion ) : Void;
	static public function Slerp( left : Quaternion, right : Quaternion, amount : Float ) : Quaternion;
}


	