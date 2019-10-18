package whiplash.phaser;

class Container extends phaser.gameobjects.Container {
    public var children: Array<ash.core.Entity> = [];

    public function new() {
        super(Lib.phaserScene);
        Lib.phaserScene.add.existing(this);
        setActive(false);
        setVisible(false);
    }

    public function addChild(entity:ash.core.Entity) {
        children.push(entity);
        tryAddComponent(entity, Sprite);
        tryAddComponent(entity, TileSprite);
        tryAddComponent(entity, Text);
        tryAddComponent(entity, Container);
        tryAddComponent(entity, Graphics);
        tryAddComponent(entity, Light);
        tryAddComponent(entity, BitmapText);
        tryAddComponent(entity, Emitter);

        if(active) {
            Lib.ashEngine.addEntity(entity);
        }
    }

    private function tryAddComponent<T>(entity:ash.core.Entity, componentType:Class<T>) {
        var component = entity.get(componentType);

        if(component != null) {
            add(component);
        }
    }
}
