package whiplash.factory;

import ash.core.Entity;
import haxe.Constraints;

class Factory {

    private var createFunc:Void->Entity;
    private var pool:Array<Entity>;

    public function new(createFunc:Void->Entity) {
        this.createFunc = createFunc;
        pool = [];
    }

    public function get() {
        if(pool.length == 0) {
            pool.push(createEntity());
        }

        var entity = pool.pop();
        return entity;
    }

    public function put(entity:Entity) {
        pool.push(entity);
    }

    public function init(initCount:Int) {
        for(i in 0...initCount) {
            pool.push(createEntity());
        }
    }

    private function createEntity():Entity {
        var entity = createFunc();
        entity.add(new Poolable(this));
        return entity;
    }
}

