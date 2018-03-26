package babylonx.animations;
//
typedef BabylonFrame = {
	frame: Int,
	value: Dynamic			// Vector3 or Quaternion or Matrix or Float
}
//
@:native("BABYLON.Animation") 
extern class Animation {	
	public static var ANIMATIONTYPE_FLOAT(default,null) : Int ; // = 0;
	public static var ANIMATIONTYPE_VECTOR3(default,null) : Int ; // = 1;
	public static var ANIMATIONTYPE_QUATERNION(default,null) : Int ; // = 2;
	public static var ANIMATIONTYPE_MATRIX(default,null) : Int ; // = 3;
	public static var ANIMATIONLOOPMODE_RELATIVE(default,null) : Int ; // = 0;
	public static var ANIMATIONLOOPMODE_CYCLE(default,null) : Int ; // = 1;
	public static var ANIMATIONLOOPMODE_CONSTANT(default,null) : Int ; // = 2;
	//	
	public var name:String;
	public var targetProperty:String;
	public var targetPropertyPath:Array<String>;
	public var framePerSecond:Int;
	public var dataType:Int;
	public var loopMode:Int;
	public var currentFrame:Float;
	//
	public function new(name:String, targetProperty:String, framePerSecond:Int, dataType:Int, ?loopMode:Int) ;
	//	
	public function clone():Animation ;
	public function setKeys(values:Array<BabylonFrame>) :Void;
	public function _interpolate(currentFrame:Float, repeatCount:Int, loopMode:Int, offsetValue:Dynamic , highLimitValue:Dynamic ):Dynamic ;
	public function animate(target:Dynamic, delay:Float, from:Float, to:Float, loop:Bool, speedRatio:Float):Bool;	
}
//
//
@:native("BABYLON._Animatable") 
extern class Animatable {
	public var target : Dynamic;
	public var fromFrame : Float;
	public var toFrame : Float;
	public var loopAnimation : Bool;
	public var speedRatio : Float;
	public var onAnimationEnd : Void->Void;
	public var animationStarted : Bool;
	//
	public function new (?target : Dynamic, ?from : Float, ?to : Float, ?loop : Bool, ?speedRatio : Float, ?onAnimationEnd :Void->Void ) : Void;
	//
	public function _animate( delay : Float ) : Bool;
}





