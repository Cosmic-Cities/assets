package;

import flixel.FlxGame;
import openfl.display.Sprite;

/**
 * Main entry point for the Cosmic Cities game.
 * This class initializes the Flixel game with the PlayState.
 */
class Main extends Sprite {
	public function new() {
		super();
		
		// Initialize the game
		// Parameters: width, height, initialState, framerate, framerate, skipSplash, startFullscreen
		addChild(new FlxGame(1280, 720, PlayState, 60, 60, true, false));
	}
}
