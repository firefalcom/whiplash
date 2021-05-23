package whiplash.factory;

class Poolable {
    public var factory:Factory;

    public function new(factory) {
        this.factory = factory;
    }
}
