package whiplash;

typedef SoundVolume = {
    var sound : Dynamic;
    var originalVolume : Float;
}

class Sound {
    public var index:Int = 0;
    public var instances:Array<SoundVolume> = [];

    public function new(scene:phaser.Scene, name, count) {
        for(i in 0...count) {
            instances.push({sound:scene.sound.add(name), originalVolume:1});
        }
    }

    public function play(volume:Float, loop, volumeFactor:Float) {
        var current = instances[index].sound;
        current.setVolume(volume * volumeFactor);
        instances[index].originalVolume = volume;
        current.setLoop(loop);
        current.play();
        ++index;
        index %= instances.length;
        return current;
    }

    public function stop() {
        for(instance in instances) {
            instance.sound.stop();
        }
    }
}

class AudioManager {
    static public var instancesPerSound = 6;
    static private var soundIsEnabled = true;
    static private var musicIsEnabled = true;
    static public var sounds:Map<String, Sound> = new Map();
    static public var music:Dynamic;
    static public var volumeFactor:Float = 1;

    static public function init(scene:phaser.Scene) {
        if(scene != null) {
            for(file in DataManager.soundFiles) {
                var name = DataManager.getNameFromFile(file);
                sounds[name] = new Sound(scene, name, instancesPerSound);
            }
        }
    }

    static public function playSound(name, volume = 1.0, loop = false) {
        if(!sounds.exists(name)) {
            trace("Unknown sound: " + name);
            return null;
        }

        return sounds[name].play(soundIsEnabled ? volume : 0, loop, volumeFactor);
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

    static public function playMusic(name, volume = 1.0) {
        if(!sounds.exists(name)) {
            trace("Unknown sound: " + name);
            return null;
        }

        if(sounds[name] == music) {
            return music.instances[0];
        }

        if(music != null) {
            music.stop();
        }

        music = sounds[name];
        return music.play(musicIsEnabled ? volume : 0, true, volumeFactor);
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

    static public function setVolume(volume:Float) {
        volumeFactor = volume;
        for (sound in sounds) {
            for (instance in sound.instances) {
                instance.sound.setVolume(instance.originalVolume * volumeFactor);
            }
        }
    }
}
