/**
* math package
*/
package babylonx.tools.math ;
import babylonx.Scene.Size2D;
//
@:native("BABYLON.Matrix")
extern class Matrix {	
    static public function RotationYawPitchRollToRef(yaw:Float, pitch:Float, roll:Float, result:Matrix):Void ;
	static public function Zero ():Matrix ;
	//
	public var m : Array<Float>;
	//
	public function new ( ) ;
	//	
	public function isIdentity(  ) : Bool;
	public function determinant(  ) : Float;
	public function toArray(  ) : Array<Float>;
	public function invert(  ) : Void;
	public function invertToRef( other : Matrix ) : Void;
	public function setTranslations( vector3 : Vector3 ) : Void;
	public function multiply( other : Matrix ) : Matrix;
	public function copyFrom( other : Matrix ) : Void;
	public function multiplyToRef( other : Matrix, result : Matrix ) : Void;
	public function multiplyToArray( other : Matrix, result : Array<Float>, offset : Float ) : Void;
	public function equals( other : Matrix ) : Bool;
	public function clone(  ) : Matrix;
	//
	static public function FromArray( array : Array<Float>, offset : Float ) : Matrix;
	static public function FromArrayToRef( array : Array<Float>, offset : Float, result : Matrix ) : Void;
	static public function FromValues( m11 : Float, m12 : Float, m13 : Float, m14 : Float, m21 : Float, m22 : Float, m23 : Float, m24 : Float, m31 : Float, m32 : Float, m33 : Float, m34 : Float, m41 : Float, m42 : Float, m43 : Float, m44 : Float ) : Matrix;
	static public function FromValuesToRef( m11 : Float, m12 : Float, m13 : Float, m14 : Float, m21 : Float, m22 : Float, m23 : Float, m24 : Float, m31 : Float, m32 : Float, m33 : Float, m34 : Float, m41 : Float, m42 : Float, m43 : Float, m44 : Float, result : Matrix ) : Void;
	static public function Identity(  ) : Matrix;
	static public function IdentityToRef( result : Matrix ) : Void;
	static public function RotationX( angle : Float ) : Matrix;
	static public function RotationXToRef( angle : Float, result : Matrix ) : Void;
	static public function RotationY( angle : Float ) : Matrix;
	static public function RotationYToRef( angle : Float, result : Matrix ) : Void;
	static public function RotationZ( angle : Float ) : Matrix;
	static public function RotationZToRef( angle : Float, result : Matrix ) : Void;
	static public function RotationAxis( axis : Vector3, angle : Float ) : Matrix;
	static public function RotationYawPitchRoll( yaw : Float, pitch : Float, roll : Float ) : Matrix;
	static public function Scaling( scaleX : Float, scaleY : Float, scaleZ : Float ) : Matrix;
	static public function ScalingToRef( scaleX : Float, scaleY : Float, scaleZ : Float, result : Matrix ) : Void;
	static public function Translation( x : Float, y : Float, z : Float ) : Matrix;
	static public function TranslationToRef( x : Float, y : Float, z : Float, result : Matrix ) : Void;
	static public function LookAtLH( eye : Vector3, target : Vector3, up : Vector3 ) : Matrix;
	static public function LookAtLHToRef( eye : Vector3, target : Vector3, up : Vector3, result : Matrix ) : Void;
	static public function OrthoLH( width : Float, height : Float, znear : Float, zfar : Float ) : Matrix;
	static public function OrthoOffCenterLH( left : Float, right : Float, bottom : Float, top : Float, znear : Float, zfar : Float ) : Matrix;
	static public function OrthoOffCenterLHToRef( left : Float, right : Float, bottom : Float, top : Float, znear : Float, zfar : Float, result : Matrix ) : Void;
	static public function PerspectiveLH( width : Float, height : Float, znear : Float, zfar : Float ) : Matrix;
	static public function PerspectiveFovLH( fov : Float, aspect : Float, znear : Float, zfar : Float ) : Matrix;
	static public function PerspectiveFovLHToRef( fov : Float, aspect : Float, znear : Float, zfar : Float, result : Matrix ) : Void;
	static public function AffineTransformation( scaling : Float, rotationCenter : Vector3, rotation : Quaternion, translation : Vector3 ) : Matrix;
	static public function GetFinalMatrix( viewport : Size2D, world : Matrix, view : Matrix, projection : Matrix ) : Matrix;
	static public function Transpose( matrix : Matrix ) : Matrix;
	static public function Reflection( plane : Plane ) : Matrix;
	static public function ReflectionToRef( plane : Plane, result : Matrix ) : Void;
}



