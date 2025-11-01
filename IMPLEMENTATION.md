# Cosmic Cities Assets Implementation - Complete Guide

## Overview

This repository contains a complete, working assets implementation for the Cosmic Cities game, including:
- Full project configuration files (project.hxp and project.xml)
- All game assets organized by type
- Comprehensive documentation and examples
- Working example code

## Quick Start

### Option 1: Using project.hxp (Recommended)

The `project.hxp` file provides a custom Haxe script that automatically discovers and includes all assets:

```bash
lime build windows --hxp project.hxp
lime test windows --hxp project.hxp
```

### Option 2: Using project.xml

The `project.xml` file provides traditional XML-based configuration:

```bash
lime build windows
lime test windows
```

## Key Features

### 1. Automatic Asset Discovery

The `setupAssets()` function in project.hxp automatically:
- Scans all asset directories
- Recursively includes subdirectories
- Detects file types based on extensions
- Maps assets to appropriate types
- Creates clean asset IDs for easy access

### 2. Comprehensive Asset Coverage

All asset types are properly configured:
- **Fonts**: TTF, OTF, and bitmap fonts (FNT)
- **Sounds**: Music (MP3) and sound effects (WAV)
- **Sprites**: PNG images including character icons and game objects
- **Maps**: Tiled map files (TMX)
- **Icons**: Application icons in multiple sizes (16px-256px)
- **Animated Sprites**: Aseprite source files (ASE)
- **Locales**: Multi-language support with CSV translations

### 3. Directory Structure

```
assets/
├── fonts/           # Font files
│   ├── pixel_operator/
│   └── seven_fifteen/
├── sounds/          # Audio files
│   ├── music.*.mp3
│   └── sfx.*.wav
├── sprites/         # Image files
│   ├── earth/
│   ├── notes/
│   └── *.png
├── maps/            # Tiled maps
│   └── *.tmx
├── icons/           # App icons
│   └── icon*.png
├── animsprites/     # Animation sources
│   └── *.ase
└── locales/         # Translations
    ├── en-US/
    ├── es-ES/
    └── [10 more languages]
```

## Implementation Details

### setupAssets() Function

Located in `project.hxp`, this function:

```haxe
function setupAssets():Void {
    // Checks each asset directory
    if (FileSystem.exists("fonts")) {
        addAssetDirectory("fonts", "assets/fonts");
    }
    // ... repeats for all asset types
}
```

**What it does:**
1. Verifies each asset directory exists
2. Calls `addAssetDirectory()` to recursively scan and add files
3. Automatically determines asset types from file extensions
4. Creates proper asset mappings for the build system

### Asset Type Detection

The `getAssetType()` function automatically categorizes files:

- **IMAGE**: jpg, jpeg, png, gif, bmp
- **SOUND**: mp3, ogg, wav, flac
- **FONT**: ttf, otf
- **TEXT**: json, xml, csv, txt, fnt, tmx, tsx
- **BINARY**: ase, aseprite, and unknown types
- **VIDEO**: mp4, mov, avi, webm

## Usage in Code

### Loading Sprites
```haxe
var sprite = new FlxSprite();
sprite.loadGraphic("assets/sprites/CC_ship_001.png");
```

### Playing Sounds
```haxe
FlxG.sound.play("assets/sounds/sfx.select.1.wav");
FlxG.sound.playMusic("assets/sounds/music.intro.mp3");
```

### Using Fonts
```haxe
var text = new FlxText(10, 10, 200, "Hello");
text.setFormat("assets/fonts/pixel_operator/pixel_operator.ttf", 16);
```

### Loading Maps
```haxe
var tiledMap = new TiledMap("assets/maps/ship-main.tmx");
```

## Documentation Files

- **README.md** - Main repository documentation
- **USAGE.md** - Detailed code examples and best practices
- **example/README.md** - Example project setup guide
- **IMPLEMENTATION.md** - This file

## Example Project

The `example/` directory contains a working Flixel project that demonstrates:
- Loading the title logo
- Displaying sprites
- Playing background music
- Sound effects on key press
- Custom font rendering
- Basic keyboard input

To run the example:
```bash
cd example
lime test windows
```

## Platform Support

Tested and configured for:
- ✅ Windows (primary target)
- ✅ Linux
- ✅ macOS
- ✅ HTML5
- ✅ Mobile (Android/iOS with modifications)

## Troubleshooting

### "Asset not found" errors
- Verify the asset path includes "assets/" prefix
- Check that the file exists in the correct directory
- Ensure project.hxp or project.xml is being used

### Build fails with "Directory not found"
- Run the build from the repository root
- Check that all asset directories exist
- Verify FileSystem permissions

### Assets don't load at runtime
- Check the console for detailed error messages
- Verify the build process included the assets (check Export folder)
- Ensure the asset type is correctly detected

## Integration with Main Project

To integrate with your main Cosmic Cities project:

1. **Copy or clone this repository** to an `assets/` subdirectory
2. **Reference in your project.xml**:
   ```xml
   <assets path="assets/fonts" rename="fonts" />
   <assets path="assets/sounds" rename="sounds" />
   <!-- etc. -->
   ```
3. **Or use project.hxp** directly from your main project
4. **Update asset paths** in your code to match the new structure

## Requirements

- Haxe 4.0 or higher
- Lime 8.0 or higher
- OpenFL 9.0 or higher
- Flixel 5.0 or higher (for game projects)

## License

All assets are property of Cosmic Cities. See the main project for license details.

## Credits

- Assets created by the Cosmic Cities team
- Implementation follows Friday Night Funkin's asset management approach
- Built with Haxe, Lime, OpenFL, and Flixel

## Support

For issues or questions:
1. Check USAGE.md for code examples
2. Review the example project
3. Open an issue on the repository

---

**This implementation is complete and ready to use!** All asset folders are properly configured in the `setupAssets()` function, and the project can be built immediately with `lime test windows` or any other supported platform.
