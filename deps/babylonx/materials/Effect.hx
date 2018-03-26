//
package babylonx.materials ;
//
import babylonx.materials.textures.Texture;
import babylonx.Scene;
import babylonx.Engine;
import babylonx.tools.math.Color3;
import babylonx.tools.math.Color4;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Vector3;
//
import js.html.webgl.Program;
import js.html.webgl.Shader;
import js.html.webgl.UniformLocation;
//
@:native("BABYLON.Effect") extern class Effect {
	public static var ShadersStore:Map<String, String>;
	//
	public var name : String;
	public var defines : String;
	//
	public function new (baseName : String, attributesNames : Array<String>, uniformsNames : Array<String>, samplers : Array<UniformLocation>, engine : Engine, defines : String );
	//
	public function isReady(  ) : Bool;
	public function getProgram(  ) : Program;
	public function getAttribute( index : Float ) : String;
	public function getAttributesNames(  ) : String;
	public function getAttributesCount(  ) : Float;
	public function getUniformIndex( uniformName : String ) : Float;
	public function getUniform( uniformName : String ) : String;
	public function getSamplers(  ) : Array<UniformLocation>;
	public function getCompilationError(  ) : String;
	public function _prepareEffect( vertexSourceCode : String, fragmentSourceCode : String, attributeNames : Array<String>, defines : String ) : Void;
	public function setTexture( channel : String, texture : Texture ) : Void;
	public function setMatrices( uniformName : String, matrices : Array<Matrix> ) : Void;
	public function setMatrix( uniformName : String, matrix : Matrix ) : Void;
	public function setBool( uniformName : String, val : Bool ) : Void;
	public function setVector3( uniformName : String, val : Vector3 ) : Void;
	public function setFloat2( uniformName : String, x : Float, y : Float ) : Dynamic;
	public function setFloat3( uniformName : String, x : Float, y : Float, z : Float ) : Dynamic;
	public function setFloat4( uniformName : String, x : Float, y : Float, z : Float, w : Float ) : Dynamic;
	public function setColor3( uniformName : String, color : Color3 ) : Void;
	public function setColor4( uniformName : String, color : Color4 ) : Void;	
}