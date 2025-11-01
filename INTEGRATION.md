# Integration Guide

This document explains how to integrate the Cosmic Cities assets into your main Haxe/Lime project.

## Method 1: Git Submodule

Add this repository as a submodule to your main project:

```bash
git submodule add https://github.com/Cosmic-Cities/assets.git assets
git submodule update --init --recursive
```

## Method 2: Direct Clone

Clone the assets repository into your project:

```bash
git clone https://github.com/Cosmic-Cities/assets.git assets
```

## Using the Assets in Your Project

### Option A: Reference in project.xml

In your main `project.xml`, add:

```xml
<include path="assets/project.hxp" />
```

### Option B: Reference in project.hxp

If your main project uses an HXP file, you can include the assets project:

```haxe
// In your main project.hxp constructor
new assets.Project(); // This will configure all asset paths
```

### Option C: Manual Asset Configuration

Add the asset paths directly in your project configuration:

```xml
<assets path="assets/animsprites" rename="assets/animsprites" />
<assets path="assets/fonts" rename="assets/fonts" />
<assets path="assets/icons" rename="assets/icons" />
<assets path="assets/locales" rename="assets/locales" />
<assets path="assets/maps" rename="assets/maps" />
<assets path="assets/sounds" rename="assets/sounds" />
<assets path="assets/sprites" rename="assets/sprites" />
```

## Accessing Assets in Code

Once integrated, you can access assets using the OpenFL/Lime asset system:

```haxe
// Load an image
var sprite = new Sprite();
sprite.graphics.beginBitmapFill(Assets.getBitmapData("assets/sprites/CC_ship_001.png"));

// Load a sound
var sound = Assets.getSound("assets/sounds/sfx.select.1.wav");

// Load a font
var font = Assets.getFont("assets/fonts/pixel_operator/PixelOperator.ttf");

// Load locale data
var localeXml = Assets.getText("assets/locales/index.xml");
```

## Asset Structure

The assets are organized as follows:

- `animsprites/` - Animation source files (Aseprite)
- `fonts/` - Font files for UI and text rendering
- `icons/` - Application icons for various platforms
- `locales/` - Internationalization and localization files
- `maps/` - Tilemap files for game levels
- `sounds/` - Music and sound effects
- `sprites/` - Game sprite images

## Build Considerations

### Exclusions

The following files are automatically excluded from builds:
- Hidden files (starting with `.`)
- System files (`thumbs.db`, `desktop.ini`)
- Source files (`*.ase`, `*.md`)
- Git files

### Platform-Specific Assets

If you need platform-specific asset handling, you can extend the `project.hxp` file to add conditional logic based on the target platform.

## Troubleshooting

### Assets Not Found

Make sure the asset path in your code matches the rename path configured in the project. By default, all assets are available under `assets/{folder}/` paths.

### Missing Dependencies

Ensure you have the following installed:
- Haxe (latest stable version recommended)
- Lime (`haxelib install lime`)
- OpenFL (`haxelib install openfl`)
- HXP (`haxelib install hxp`)

Run `lime setup` after installing dependencies.

### Build Errors

If you encounter build errors, verify:
1. The assets directory is properly linked/cloned
2. Your project correctly includes the asset configuration
3. All paths in your code match the configured asset paths
