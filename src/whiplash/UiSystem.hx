package whiplash;

import js.jquery.JQuery;
import ash.core.Engine;

typedef Item = {
    var element:JQuery;
    var event:String;
    var handler:Dynamic;
}

class UiSystem extends ash.core.System {
    private var items:Array<Item> = [];

    public function new() {
        super();
    }

    public override function addToEngine(engine:Engine) {
        super.addToEngine(engine);
        for(item in items) {
            item.element.on(item.event, item.handler);
        }
    }

    public override function removeFromEngine(engine:Engine) {
        super.removeFromEngine(engine);
        for(item in items) {
            item.element.off();
        }
    }

    public function set(selector:String, event:String, handler) {
        items.push({element:new JQuery(selector), event:event, handler:handler});
    }

    public function apply(func:String, ?a:Dynamic, ?b:Dynamic, ?c:Dynamic, ?d:Dynamic) {
        var js_args =untyped __js__("arguments");
        var args = [for(a in 1...js_args.length) untyped js_args[a]];
        for(item in items) {
            var element = item.element;
            untyped element[func].apply(element, args);
        }
    }
}

