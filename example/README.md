# Example Project

This directory contains a simple example showing how to use the Cosmic Cities assets in a Haxe/Flixel project.

## Files

- `src/Main.hx` - Main entry point that initializes the Flixel game
- `src/PlayState.hx` - Example game state that loads and displays assets

## Setup

1. Copy the example files to your project's `src/` directory
2. Make sure `project.xml` or `project.hxp` is in your project root
3. Install required libraries:

```bash
haxelib install lime
haxelib install openfl  
haxelib install flixel
```

## Building

To build and run the example:

```bash
# For Windows
lime test windows

# For Linux
lime test linux

# For HTML5
lime test html5
```

## What the Example Does

The example demonstrates:
- Loading the Cosmic Cities title logo
- Displaying a ship sprite
- Using a custom pixel font for text
- Playing background music
- Playing sound effects on key press
- Basic keyboard input handling

Press SPACE to hear a sound effect, ESC to exit.

## Extending the Example

You can extend this example by:
- Adding character sprites and animations
- Loading and displaying Tiled maps
- Implementing localization
- Adding more game states (menu, gameplay, etc.)
- Loading additional sounds and music

See `USAGE.md` in the root directory for more examples of asset usage.
