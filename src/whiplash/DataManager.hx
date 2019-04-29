package whiplash;

import js.Browser.document;

#if embed
@:build(whiplash.Macro.embedData())
#end
class DataManager {
    public static var textureFiles:Array<String> = Macro.getDataFilePaths("textures");
    public static var soundFiles:Array<String> = Macro.getDataFilePaths("sounds");
    public static var tilemapFiles:Array<String> = Macro.getDataFilePaths("tilemaps");
    public static var atlasFiles:Array<String> = Macro.getDataFilePaths("atlases");

    static public function preload(scene:phaser.Scene) {
#if phaser
#if embed
        var nodes = document.querySelectorAll(".texture");

        for(node in nodes) {
            var el:js.html.Element = cast node;
            scene.cache.addImage(el.id, null, node);
        }

#end

        if(scene != null) {
            for(file in textureFiles) {
                var name = new haxe.io.Path(file).file;
#if !embed
                scene.load.image(name, file);
#end
            }

            for(file in soundFiles) {
                var name = new haxe.io.Path(file).file;
#if !embed
                scene.load.audio(name, file);
#end
            }

            for(file in tilemapFiles) {
                var name = new haxe.io.Path(file).file;
#if embed
                throw "";//scene.load.tilemapWeltmeister(name, cast null, untyped $global.jsons[name],);
#else
                throw "";//scene.load.tilemapWeltmeister(name, cast file, cast null);
#end
            }

            for(file in atlasFiles) {
                var path = new haxe.io.Path(file);

                if(path.ext == "json") {
                    var name = path.file;
#if embed
                    throw ":TODO:";
#else
                    scene.load.atlas(name, haxe.io.Path.withExtension(file, "png"), file);
#end
                }
            }
        }

#end
    }

    static public function preloadFont(fontFamily) {
        var font = untyped __js__("new FontFaceObserver(fontFamily)");
        font.load().then(function() {
            trace('Font-family loaded: ' + fontFamily);
        });
    }
}
