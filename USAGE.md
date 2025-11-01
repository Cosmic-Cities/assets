# Asset Usage Examples

This document provides examples of how to use the Cosmic Cities assets in your Haxe/Flixel project.

## Setup

Make sure you have the required libraries installed:

```bash
haxelib install lime
haxelib install openfl
haxelib install flixel
haxelib install flixel-addons
haxelib install flixel-ui
```

## Loading Assets

### Images and Sprites

```haxe
import flixel.FlxSprite;
import flixel.FlxG;

// Load a character icon
var aprilIcon = new FlxSprite();
aprilIcon.loadGraphic("assets/sprites/CC_aprilIcon_001.png");
add(aprilIcon);

// Load ship sprite
var ship = new FlxSprite();
ship.loadGraphic("assets/sprites/CC_ship_001.png");
add(ship);

// Load sprite sheet
var shipSheet = new FlxSprite();
shipSheet.loadGraphic("assets/sprites/CC_shipSheet_001.png", true, 32, 32);
shipSheet.animation.add("fly", [0, 1, 2, 3], 10, true);
shipSheet.animation.play("fly");
add(shipSheet);
```

### Sounds and Music

```haxe
import flixel.FlxG;

// Play a sound effect
FlxG.sound.play("assets/sounds/sfx.select.1.wav");

// Play background music
FlxG.sound.playMusic("assets/sounds/music.intro.mp3", 0.7, true);

// Play sound with volume control
FlxG.sound.play("assets/sounds/sfx.explosion.1.wav", 0.5);

// Load and cache sounds
FlxG.sound.cache("assets/sounds/sfx.blip.1.wav");
FlxG.sound.cache("assets/sounds/sfx.blip.2.wav");
```

### Fonts

```haxe
import flixel.text.FlxText;
import openfl.Assets;

// Load a bitmap font
var text = new FlxText(10, 10, 200, "Hello World");
text.setFormat("assets/fonts/pixel_operator/pixel_operator.fnt", 16);
add(text);

// Load a TTF font
var titleText = new FlxText(0, 50, FlxG.width, "Cosmic Cities");
titleText.setFormat("assets/fonts/seven_fifteen/seven_fifteen.ttf", 32, 0xFFFFFF, "center");
add(titleText);
```

### Tiled Maps

```haxe
import flixel.addons.editors.tiled.TiledMap;
import flixel.tile.FlxTilemap;

// Load a Tiled map
var tiledMap = new TiledMap("assets/maps/ship-main.tmx");
var tilemap = new FlxTilemap();
tilemap.loadMapFromCSV(tiledMap.getLayer("ground").tileArray, 
                       "assets/sprites/tileset.png", 16, 16);
add(tilemap);
```

### Localization

```haxe
import openfl.Assets;
import haxe.Json;

// Load locale data
var localeData = Assets.getText("assets/locales/en-US/ui.csv");

// Parse CSV for UI strings
var lines = localeData.split("\n");
var uiStrings = new Map<String, String>();

for (line in lines) {
    var parts = line.split(",");
    if (parts.length >= 2) {
        uiStrings.set(parts[0], parts[1]);
    }
}

// Use localized strings
var buttonText = uiStrings.get("button.start");
```

### Icons

```haxe
import lime.system.System;
import openfl.display.BitmapData;
import openfl.Assets;

// Set window icon (usually done in Main.hx)
var icon16 = Assets.getBitmapData("assets/icons/icon16.png");
var icon32 = Assets.getBitmapData("assets/icons/icon32.png");
var icon64 = Assets.getBitmapData("assets/icons/icon64.png");

#if desktop
lime.ui.Window.get(0).setIcon(icon32);
#end
```

## Asset Preloading

For better performance, preload assets before using them:

```haxe
import flixel.FlxState;
import openfl.Assets;

class LoadingState extends FlxState {
    override public function create():Void {
        super.create();
        
        // Preload multiple assets
        var assetsToLoad = [
            "assets/sprites/CC_ship_001.png",
            "assets/sounds/music.intro.mp3",
            "assets/sounds/sfx.select.1.wav",
            "assets/fonts/pixel_operator/pixel_operator.fnt"
        ];
        
        for (asset in assetsToLoad) {
            Assets.loadBitmapData(asset);
        }
        
        // Switch to main menu after loading
        FlxG.switchState(new MenuState());
    }
}
```

## Best Practices

1. **Cache frequently used assets** - Use `FlxG.sound.cache()` for sounds that are played often
2. **Use asset paths consistently** - Always use the full "assets/" prefix for clarity
3. **Preload assets** - Load assets during a loading state to avoid stuttering during gameplay
4. **Dispose unused assets** - Call `Assets.cache.clear()` when switching between major game states
5. **Use appropriate formats**:
   - PNG for sprites (supports transparency)
   - MP3 for music (smaller file size)
   - WAV for sound effects (better quality, instant playback)
   - TTF for scalable text
   - FNT for pixel-perfect bitmap fonts

## Platform-Specific Considerations

### Windows
- All asset formats are supported
- Use MP3 for music to reduce file size

### HTML5
- Prefer MP3 and OGG for broader browser support
- Keep assets sizes small for faster loading
- Consider lazy loading for large assets

### Mobile
- Compress images to reduce app size
- Use lower quality music files
- Implement asset streaming for large games

## Troubleshooting

### Asset Not Found
- Verify the asset path is correct
- Check that the asset is included in project.xml or project.hxp
- Ensure the file exists in the correct directory

### Asset Not Loading
- Check the console for error messages
- Verify the file format is supported
- Try using the full path with "assets/" prefix

### Performance Issues
- Preload assets before using them
- Use appropriate image sizes (don't load huge images for small sprites)
- Consider using texture atlases for multiple small sprites
- Enable hardware rendering in project.xml
