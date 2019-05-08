package whiplash;

class AudioManager {
    static private var soundIsEnabled = true;
    static private var musicIsEnabled = true;
    static public var validSounds:Array<String> = [];
    static public var sounds:Map<String, Dynamic> = new Map();
    static public var music:Dynamic;

    static public function init(scene:phaser.Scene) {
        if(scene != null) {
            for(file in DataManager.soundFiles) {
                var name = new haxe.io.Path(file).file;
                scene.load.audio(name, file);
                validSounds.push(name);
            }
        }
    }

    static public function playSound(name) {
        if(validSounds.indexOf(name) == -1) {
            trace("Unknown sound: " + name);
            return;
        }

        if(soundIsEnabled) {
            sounds[name] = Lib.phaserScene.sound.add(name);
            sounds[name].play();
        }
    }

    static public function stopSound(name) {
        if(validSounds.indexOf(name) == -1) {
            trace("Unknown sound: " + name);
            return;
        }

        if(sounds.exists(name)) {
            sounds[name].stop();
            sounds.remove(name);
        }
    }

    static public function playMusic(name) {
        if(music != null && sounds[name] == music) {
            return;
        }

        if(music != null) {
            music.stop();
        }

        if(musicIsEnabled) {
            music = Lib.phaserScene.sound.play(name, {position:0, volume:1, loop:true});
            sounds[name] = music;
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
