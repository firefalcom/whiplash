package whiplash;

import haxe.macro.Context;
import haxe.macro.Expr;

class Macro {

    public static macro function getDataFilePath(folder:String, file:String, applyRelative:Bool = true) {
        var dataPath = haxe.macro.Context.definedValue("dataPath") + "/";
#if !webpack
        var dataRelativePath = haxe.macro.Context.definedValue("dataRelativePath") + "/";
        return macro $v {(applyRelative ? dataRelativePath : dataPath) + folder + "/" + file};
#else
        var dataRelativePath = haxe.macro.Context.definedValue("webpackDataRelativePath") + "/";
        return macro Webpack.require($v {"~@" + dataRelativePath + folder + "/" + file});
#end
    }

    public static macro function getDataFilePaths(folder:String, applyRelative:Bool = true) {
        var dataPath = haxe.macro.Context.definedValue("dataPath") + "/";

        if(!sys.FileSystem.exists(dataPath + folder)) {
            return macro $a {[]};
        }

        var files = sys.FileSystem.readDirectory(dataPath + folder);
#if !webpack
        var dataRelativePath = haxe.macro.Context.definedValue("dataRelativePath") + "/";
        var exprs = [for(file in files) macro $v {(applyRelative ? dataRelativePath : dataPath) + folder + "/" + file}];
#else
        var dataRelativePath = haxe.macro.Context.definedValue("webpackDataRelativePath") + "/";
        var exprs = [for(file in files) macro Webpack.require($v {"~@" + dataRelativePath + folder + "/" + file})];
#end
        return macro $a {exprs};
    }

    public static macro function embedData():Array<Field> {
        Sys.println("Embedding data...");
        var textureFiles:Array<String> = getDataFilePaths("textures");
        var jsonFiles:Array<String> = getDataFilePaths("tilemaps", false);
        jsonFiles = jsonFiles.concat(getDataFilePaths("atlases", false));
        var htmlContent:String = sys.io.File.getContent('src/index.html');
        var newHtmlContent:String;
        var generatedContent:String;

        generatedContent = "<body>\n";

        for(file in textureFiles) {
            var name = new haxe.io.Path(file).file;
            generatedContent += "<img class=\"texture\" id=\"" + name + "\" src=\"" + file + "\" style=\"display:none;\"/>\n";
        }

        generatedContent += "<script>\njsons = {};\n";

        for(file in jsonFiles) {
            var path = new haxe.io.Path(file);

            if(path.ext == "json") {
                var name = path.file;
                var fileContent:String = sys.io.File.getContent(file);
                generatedContent += "jsons." + name + " = JSON.parse(`" + fileContent + "`);\n";
            }
        }

        generatedContent += "</script>\n";

        newHtmlContent = StringTools.replace(htmlContent, "<body>", generatedContent);

        sys.io.File.saveContent('src/intermediate.html', newHtmlContent);

        Sys.println(textureFiles.length + " embedded textures.");
        Sys.println(jsonFiles.length + " embedded json files.");

        return Context.getBuildFields();
    }

    public static macro function editable():Array<Field> {
        var fields = Context.getBuildFields();

        var names:Array<String> = [];

        for(field in fields) {
            names.push(field.name);
        }

        var klass = Context.getLocalClass().get().name;

        fields.push({
            name:  "dat_GUI_initializer",
            access:  [Access.APublic, Access.AStatic],
            kind: FieldType.FVar(macro:Int, macro(function() {
                var datGui = new dat.gui.GUI();
                var expose = null;
                expose = function(folder:dat.gui.GUI, owner:Dynamic, fields:Array<String>) {
                    for(field in fields) {
                        var value = Reflect.field(owner, field);

                        if(Reflect.isObject(value)) {
                            var folder = folder.addFolder(field);
                            expose(folder, value, Reflect.fields(value));

                        } else {
                            folder.add(owner, field);
                        }
                    }
                };

                expose(datGui, $i{klass}, $v {names});
                return 0;
            }
                                                 )()),
            pos: Context.currentPos(),
        });

        return fields;
    }
}
