package whiplash;

class Text extends phaser.Text {
    public function new(?text, ?style) {
        if(style == null) {
            style = {
                align: 'center',
                boundsAlignH: 'left',
                boundsAlignV: 'top'
            };
        }
        super(Lib.phaserGame, 0, 0, text, cast style);
        Lib.phaserGame.add.existing(this);
        kill();
    }
}
