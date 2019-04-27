package whiplash;

import haxe.macro.Context;
import haxe.macro.Expr;

class Macro {
    public static macro function getDataFilePaths(folder:String, applyRelative:Bool = true) {
        var dataPath = haxe.macro.Context.definedValue("dataPath") + "/";
        var dataRelativePath = haxe.macro.Context.definedValue("dataRelativePath") + "/";

        if(!sys.FileSystem.exists(dataPath + folder)) {
            return macro $a {[]};
        }

        var files = sys.FileSystem.readDirectory(dataPath + folder);
        var exprs = [for(file in files) macro $v {(applyRelative ? dataRelativePath : dataPath) + folder + "/" + file}];
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
}
