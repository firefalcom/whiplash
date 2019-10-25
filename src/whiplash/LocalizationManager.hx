package whiplash;

import js.Browser.document;

class LocalizationManager {
    static private var localization:Dynamic;

    static public function load(loca:Dynamic) {
        localization = loca;

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
}

