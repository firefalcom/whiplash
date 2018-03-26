package babylonx.mesh ;

//
@:native("BABYLON.VertexBuffer")
extern class VertexBuffer {
	/**
	 * ??  enum ??
	 */
	static public var  PositionKind (default,null) : String      	  ; // = "position";
    static public var  NormalKind (default,null) : String             ; // = "normal";
    static public var  UVKind (default,null) : String                 ; // = "uv";
    static public var  UV2Kind (default,null) : String                ; // = "uv2";
    static public var  ColorKind (default,null) : String              ; // = "color";
    static public var  MatricesIndicesKind (default,null) : String    ; // = "matricesIndices";
    static public var  MatricesWeightsKind (default, null) : String    ; // = "matricesWeights";	
	//
	public var _mesh:Mesh;
	public var _buffer:Dynamic;	// or todo BabylonGLBuffer
	public var _strideSize:Int;
	//	
	public function new (mesh:Mesh, data:Array<Float>,kind:String,?updatable:Bool) ;
	//
	public function getData () : Array<Float> ;
	public function getStrideSize(  ) : Int;
	public function isUpdatable(  ) : Bool;	
	public function update( data : Array<Dynamic> ) : Void;
	public function dispose(  ) : Void;
	
}

	