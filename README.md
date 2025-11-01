# Cosmic Cities Assets

This repository contains all the assets for the Cosmic Cities game project.

## Asset Structure

- **fonts/** - Font files (TTF, OTF, and bitmap fonts)
  - `pixel_operator/` - Pixel Operator font family
  - `seven_fifteen/` - Seven Fifteen font family
  
- **sounds/** - Audio files (music and sound effects)
  - Music tracks (mp3 format)
  - Sound effects (wav format)
  
- **sprites/** - Image files and sprite sheets
  - Character icons
  - UI elements
  - Game objects
  - `earth/` - Earth-related sprites
  - `notes/` - Note sprites
  
- **maps/** - Tiled map files (TMX format)
  - Ship interior maps
  
- **icons/** - Application icons (various sizes)
  - 16x16, 32x32, 48x48, 64x64, 128x128, 256x256
  
- **animsprites/** - Animated sprite source files
  - Aseprite files (.ase)
  
- **locales/** - Localization files
  - Multiple language support (en-US, es-ES, fr-FR, etc.)
  - Dialog and UI translations
  - Font configurations per locale

## Usage

### With project.hxp

The `project.hxp` file contains a custom Haxe project setup that automatically includes all asset directories. The `setupAssets()` function scans all asset folders and adds them to the project with appropriate asset types.

To build with project.hxp:
```bash
lime build windows
lime test windows
```

### With project.xml

The `project.xml` file provides an XML-based configuration that is more commonly used with Lime/OpenFL projects. It includes all asset paths and configurations.

To build with project.xml:
```bash
lime build windows
lime test windows
```

## Asset Access

Assets can be accessed in your Haxe code using the asset paths defined in the configuration:

```haxe
// Load a sprite
var sprite = new FlxSprite();
sprite.loadGraphic(Paths.image("sprites/CC_ship_001"));

// Play a sound
FlxG.sound.play(Paths.sound("sounds/sfx.select.1"));

// Load a map
var map = new FlxTilemap();
map.loadMapFromCSV(Paths.text("maps/ship-main"));
```

## Supported Formats

- **Images**: PNG, JPG, JPEG
- **Audio**: MP3, WAV, OGG
- **Fonts**: TTF, OTF, FNT (bitmap fonts)
- **Maps**: TMX, TSX (Tiled)
- **Data**: XML, CSV, JSON, TXT
- **Other**: ASE (Aseprite)

## Adding New Assets

1. Place your assets in the appropriate directory
2. The build system will automatically detect and include them
3. Rebuild your project to include the new assets

## License

All assets are property of Cosmic Cities. Unauthorized use is prohibited.
