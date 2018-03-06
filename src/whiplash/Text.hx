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
        super(Lib.game, 0, 0, text, cast style);
        Lib.game.add.existing(this);
        kill();
    }
}
