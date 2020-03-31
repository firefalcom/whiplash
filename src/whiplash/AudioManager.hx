package whiplash;

class Sound {
    public var index:Int = 0;
    public var instances:Array<Dynamic> = [];

    public function new(scene:phaser.Scene, name, count) {
        for(i in 0...count) {
            instances.push(scene.sound.add(name));
        }
    }

    public function play() {
        instances[index].play();
        ++index;
        index %= instances.length;
    }

    public function stop() {
        for(instance in instances) {
            instance.stop();
        }
    }
}

class AudioManager {
    static public var instancesPerSound = 6;
    static private var soundIsEnabled = true;
    static private var musicIsEnabled = true;
    static public var sounds:Map<String, Sound> = new Map();
    static public var music:Dynamic;

    static public function init(scene:phaser.Scene) {
        if(scene != null) {
            for(file in DataManager.soundFiles) {
                var name = DataManager.getNameFromFile(file);
                sounds[name] = new Sound(scene, name, instancesPerSound);
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

        if(sounds.exists(name)) {
            sounds[name].stop();
        }
    }

    static public function playMusic(name) {
        if(!sounds.exists(name)) {
            trace("Unknown sound: " + name);
            return;
        }

        if(sounds[name] == music) {
            return;
        }

        if(music != null) {
            music.stop();
        }

        if(musicIsEnabled) {
            music = sounds[name];
            music.play({loop:true});
        }
    }

    static public function stopMusic() {
        if(music != null) {
            music.stop();
            music = null;
        }
    }

    static public function enableSound(enabled) {
        if(!enabled) {
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
                music.play({loop:true});
            }
        }

        musicIsEnabled = enabled;
    }
}
