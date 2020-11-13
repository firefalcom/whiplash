# whiplash

![CI](https://github.com/firefalcom/whiplash/workflows/CI/badge.svg)

Whiplash is a HTML5 framework combining the [haxe implementation](https://github.com/firefalcom/Ash-Haxe) of the [Ash framework](http://www.ashframework.org/), the [haxe externs](https://github.com/Blank101/haxe-phaser) for [Phaser](https://github.com/photonstorm/phaser) and the [haxe externs](https://github.com/firefalcom/haxe-babylon) for [Babylon.js](https://babylonjs.com).

## Features
 * Entities-Components-Systems provided by the Ash famework
 * Input, 2D Graphics, Audio, Physics, etc. provided by Phaser
 * Input, 3D Graphics, Audio, Physics, etc. provided by Babylon.js
 * Haxe classes operators for a better usability
 * Math helpers

## Usage

### Dependencies

This project has the following dependencies as submodules:

 * [Ash-Haxe](https://github.com/firefalcom/Ash-Haxe) for [ECS](https://en.wikipedia.org/wiki/Entity_component_system) support
 * [haxe-babylon](https://github.com/firefalcom/haxe-babylon) for 3D support
 * [haxe-phaser3](https://github.com/sebbernery/haxe-phaser3.git) for 2D support

They have to be included in your .hxml file, g.e:

```
...
-cp deps/haxe-babylon/src
-cp deps/haxe-phaser3/src
-cp deps/Ash-Haxe/src
...
```


### Sample

See `test` directory
