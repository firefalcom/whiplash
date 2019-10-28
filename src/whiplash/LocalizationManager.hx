package whiplash;

import js.Browser.document;

class LocalizationManager {
    static private var localization:Dynamic;
    static private var lang:String;

    static public function load(loca:Dynamic, _lang:String) {
        localization = loca;
        lang = _lang;
        apply();
    }

    static public function generateJsonFromDocument() {
        var elements = document.querySelectorAll("[data-loca]");
        var content:Dynamic = {};

        for(e in elements) {
            var key = untyped e.getAttribute("data-loca");
            content[key] = untyped e.innerHTML;
        }

        trace(haxe.Json.stringify(content, null, "    "));
    }

    static public function apply() {
        var elements = document.querySelectorAll("[data-loca]");

        for(e in elements) {
            var key = untyped e.getAttribute("data-loca");
            untyped e.innerHTML = localization[key];
        }
    }

    static public function get(key:String) {
        var value:String = untyped localization[key];

        if(value == null) {
            trace("Missing translation for '" + key + "'");
            value = key + "_" + lang;
        }

        return value;
    }
}

