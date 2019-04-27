package whiplash;

class AudioManager {
    static private var soundIsEnabled = true;
    static private var musicIsEnabled = true;
    static public var sounds:Map<String, Dynamic> = new Map();
    static public var music:Dynamic;

    static public function init(game:phaser.Game) {
        if(game != null) {
            for(file in DataManager.soundFiles) {
                var name = new haxe.io.Path(file).file;
                sounds[name] = game.add.audio(name);
            }
        }
    }

    static public function playSound(name) {
        if(!sounds.exists(name)) {
            trace("Unknown sound: " + name);
            return;
        }

        if(soundIsEnabled) {
            sounds[name].play();
        }
    }

    static public function stopSound(name) {
        if(!sounds.exists(name)) {
            trace("Unknown sound: " + name);
            return;
        }

        sounds[name].stop();
    }

    static public function playMusic(name) {
        if(sounds[name] == music) {
            return;
        }

        if(music != null) {
            music.stop();
        }

        if(musicIsEnabled) {
            music = sounds[name];
            music.play('', 0, 1, true);
        }
    }

    static public function stopMusic() {
        if(music != null) {
            music.stop();
            music = null;
        }
    }

    static public function enableSound(enabled) {
        if(enabled) {
            for(sound in sounds) {
                if(sound != music) {
                    sound.stop();
                }
            }
        }

        soundIsEnabled = enabled;
    }

    static public function enableMusic(enabled) {
        if(!enabled) {
            if(music != null) {
                music.stop();
            }
        } else {
            if(music != null) {
                music.play('', 0, 1, true);
            }
        }

        musicIsEnabled = enabled;
    }
}
