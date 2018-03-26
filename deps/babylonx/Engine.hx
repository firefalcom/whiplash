/**
 * Haxe extern of http://www.babylonjs.com/ 
 * by jmd from https://github.com/vujadin/BabylonHx and https://gist.github.com/postite/8972576
 */

package babylonx ;
//
import babylonx.materials.Effect;
import babylonx.materials.textures.DynamicTexture;
import babylonx.materials.textures.Texture;
import babylonx.mesh.VertexBuffer;
import babylonx.Scene;
import babylonx.mesh.Mesh.BabylonGLBuffer;
import babylonx.tools.math.Color3;
import babylonx.tools.math.Matrix;
import babylonx.tools.math.Vector3;
import js.html.CanvasElement ;
import js.html.Element;
import js.html.VideoElement;
import js.html.webgl.Program;
import js.html.webgl.UniformLocation;
//
typedef Capabilities = { 
	public var maxTexturesImageUnits : Float; 
	public var maxTextureSize : Float; 
	public var maxCubemapTextureSize : Float; 
	public var maxRenderTextureSize : Float; 
};
typedef ColorN = { 
	public var r : Float; public var g : Float; public var b : Float; 
};
//
@:native("BABYLON.Engine")
extern class Engine {
	static public var ALPHA_DISABLE (default,null) : Float;
	static public var ALPHA_ADD (default,null) : Float;
	static public var ALPHA_COMBINE (default,null) : Float;
	static public var DELAYLOADSTATE_NONE (default,null) : Float;
	static public var DELAYLOADSTATE_LOADED (default,null) : Float;
	static public var DELAYLOADSTATE_LOADING (default,null) : Float;
	static public var DELAYLOADSTATE_NOTLOADED (default, null) : Float;	
	static public var ShadersRepository (default, null) : String;	
	//
	public var forceWireframe : Bool;
	public var cullBackFaces : Bool;
	public var scenes : Array<Scene>;
	public var isPointerLock : Bool;	
	public var epsilon : Float;
	public var collisionEpsilon : Float;
	//
    public function new(canvas:CanvasElement, ?antialias:Bool):Void ;
	//
	public function getAspectRatio(  ) : Float;
	public function getRenderWidth(  ) : Float;
	public function getRenderHeight(  ) : Float;
	public function getRenderingCanvas(  ) : CanvasElement;	
	public function beginFrame ():Void ;
	public function endFrame ():Void ;
	public function runRenderLoop (?func:Dynamic):Void ;
	public function stopRenderLoop ():Void ;
	public function setHardwareScalingLevel( level : Float ) : Void;
	public function getLoadedTexturesCache(  ) : Array<Texture>;
	public function getCaps(  ) : Capabilities;	
	public function switchFullscreen( element : Element ):Void; 
	public function clear( color : ColorN, backBuffer : Bool, depthStencil : Bool ):Void;
	public function resize(  ) : Void;
	public function bindFramebuffer( texture : Texture ):Void;
	public function unBindFramebuffer( texture : Texture ):Void;
	public function flushFramebuffer(  ) : Void;
	public function restoreDefaultFramebuffer(  ) : Void;
	public function createVertexBuffer( vertices : Array<Float> ) : BabylonGLBuffer ;
	public function createDynamicVertexBuffer( capacity : Float ) : BabylonGLBuffer ;
	public function updateDynamicVertexBuffer( vertexBuffer : BabylonGLBuffer, vertices : Array<Float>, ?length:Int ):Void;
	public function createIndexBuffer( indices : Array<Int>) : BabylonGLBuffer ;
	public function bindBuffers( vb : BabylonGLBuffer, ib : BabylonGLBuffer, vdecl : Array<Float>, strideSize : Float, effect : Effect ):Void;
	public function bindMultiBuffers( vertexBuffers :Map<String,VertexBuffer>, indexBuffer : BabylonGLBuffer, effect : Effect ) : Void; 
	public function _releaseBuffer( vb : BabylonGLBuffer ):Void;
	public function draw( useTriangles : Bool, indexStart : Float, indexCount : Float ) : Dynamic;
	public function createEffect( baseName : String, attributesNames : String, uniformsNames : Array<String>, samplers : Array<UniformLocation>, defines : String ) : Effect;
	public function createShaderProgram( vertexCode : String, fragmentCode : String, defines : String ) : Program;
	public function getUniforms( shaderProgram : Program, uniformsNames : Array<String> ) : Array<UniformLocation>;
	public function getAttributes( shaderProgram : Program, attributesNames : Array<String> ) : Array<Float>;
	public function enableEffect( effect : Effect ) : Void;
	public function setMatrices( uniform : String, matrices : Array<Matrix> ) : Void; 
	public function setMatrix( uniform : String, matrix : Matrix ) : Void;
	public function setVector2( uniform : String, x : Float, y : Float ) : Void;
	public function setVector3( uniform : String, v : Vector3 ) : Void; 
	public function setFloat2( uniform : String, x : Float, y : Float ) : Void;
	public function setFloat3( uniform : String, x : Float, y : Float, z : Float ) : Void;
	public function setBool( uniform : String, val : Bool ) : Void;
	public function setFloat4( uniform : String, x : Float, y : Float, z : Float, w : Float ) : Void;
	public function setColor3( uniform : String, color : Color3 ) : Void; 
	public function setColor4( uniform : String, color : Color3, alpha : Float ) : Void;
	public function setState( cullingMode : Float ) : Void;
	public function setDepthBuffer( enable : Bool ) : Void;
	public function setDepthWrite( enable : Bool ) : Void;
	public function setColorWrite( enable : Bool ) : Void;
	public function setAlphaMode( mode : Float ) : Void;
	public function setAlphaTesting( enable : Bool ) : Void;
	public function getAlphaTesting(  ) : Bool;
	public function wipeCaches(  ) : Void;
	public function getExponantOfTwo( value : Float, max : Float ) : Float;
	public function createTexture( url : String, noMipmap : Bool, invertY : Bool, scene : Scene ) : Texture;
	public function createDynamicTexture( size : Float, noMipmap : Bool ) : Texture;
	public function updateDynamicTexture( texture : Texture, canvas : CanvasElement, invertY : Bool ) : Void;
	public function updateVideoTexture( texture : Texture, video : VideoElement ) : Void;
	public function createRenderTargetTexture( size : Float, generateMipMaps : Bool ) : Texture; 
	public function createCubeTexture( rootUrl : String, scene : Scene ) : Texture;
	public function _releaseTexture( tex : Texture ) : Void;
	public function bindSamplers( effect : Effect ) : Void;
	public function setTexture( channel : Float, texture : Texture ) : Void; 
	public function dispose(  ) : Void;	
	//
	static public function isSupported():Bool;
}


