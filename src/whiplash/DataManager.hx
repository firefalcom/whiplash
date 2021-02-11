package whiplash;

import js.Browser.document;

#if embed
@:build(whiplash.Macro.embedData())
#end
class DataManager {
    public static var textureFiles:Array<String> = Macro.getDataFilePaths("textures");
    public static var normalmapFiles:Array<String> = Macro.getDataFilePaths("normalmaps");
    public static var soundFiles:Array<String> = Macro.getDataFilePaths("sounds");
    public static var tilemapFiles:Array<String> = Macro.getDataFilePaths("tilemaps");
    public static var atlasFiles:Array<String> = Macro.getDataFilePaths("atlases");
    public static var dragonBonesFiles:Array<String> = Macro.getDataFilePaths("dragonbones");

    public static function getNameFromFile(file:String) {
        var name = new haxe.io.Path(file).file;
        var dot = name.indexOf('.');

        if(dot != -1) {
            name = name.substring(0, dot);
        }

        return name;
    }

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
                var name = getNameFromFile(file);
#if !embed
                var loaded = false;

                for(normalFile in normalmapFiles) {
                    var normalName = getNameFromFile(file);

                    if(name == normalName) {
                        scene.load.image(name, [file, normalFile]);
                        loaded = true;
                        break;
                    }
                }

                if(!loaded) {
                    scene.load.image(name, file);
                }

#end
            }

            for(file in soundFiles) {
                var name = getNameFromFile(file);
                trace(name);
#if !embed
                scene.load.audio(name, file);
#end
            }

            for(file in tilemapFiles) {
                var name = getNameFromFile(file);
#if embed
                throw ":TODO:";
#else
                scene.load.tilemapTiledJSON(name, file);
#end
            }

            for(file in atlasFiles) {
                var path = new haxe.io.Path(file);

                if(path.ext == "json") {
                    var name = getNameFromFile(file);
#if embed
                    throw ":TODO:";
#else
                    scene.load.atlas(name, haxe.io.Path.withExtension(file, "png"), file);
#end
                }
            }

            for(file in dragonBonesFiles) {
                if(StringTools.endsWith(file, ".ske.json")) {
                    var partialPath = file.substr(0, file.length - 9);
                    var path = new haxe.io.Path(partialPath);
                    var name = path.file;
#if embed
                    throw ":TODO:";
#else
                    // untyped scene.load.dragonbone(
                    //     name,
                    //     partialPath + ".tex.png",
                    //     partialPath + ".tex.json",
                    //     partialPath + ".ske.json"
                    // );
#end
                }
            }
            var pattyPath = "data/SpinePlugin/pattySkeleton";
            untyped scene.load.spine("patty", pattyPath + ".json", pattyPath + ".atlas");
        }

#end
    }

    static public function preloadFont(fontFamily) {
        var font = untyped __js__("new FontFaceObserver(fontFamily)");
        font.load(null, 10000).then(function() {
            trace('Font-family loaded: ' + fontFamily);
        });
    }
}
