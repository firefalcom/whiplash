//
package babylonx.materials.textures ;
//
import babylonx.Scene;
import js.html.CanvasElement ;
import js.html.CanvasRenderingContext2D;
//
@:native("BABYLON.DynamicTexture") extern class DynamicTexture extends Texture {
	public var _canvas : CanvasElement;
	public var _context : CanvasRenderingContext2D;
	public function new (name : String, size : Size2D, scene : Scene, generateMipMaps : Bool ) ;
	public function getContext(  ) : CanvasRenderingContext2D;
	public function drawText( text : String, x : Float, y : Float, font : String, color : String, clearColor : String, invertY : Bool ) : Void;
	public function update(  ) : Void;
}

	
	
	

	
	