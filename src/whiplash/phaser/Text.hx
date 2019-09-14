package whiplash.phaser;

class Text extends phaser.gameobjects.Text {
    public function new(?text, ?style) {
        if(style == null) {
            style = {
                align: 'center',
                boundsAlignH: 'left',
                boundsAlignV: 'top'
            };
        }

        super( Lib.phaserScene, 0, 0, text , style);
        Lib.phaserScene.add.existing(this);
        setActive( false );
        setVisible( false );
    }
}
