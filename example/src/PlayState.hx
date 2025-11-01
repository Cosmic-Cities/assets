package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;

/**
 * Example PlayState demonstrating how to use Cosmic Cities assets.
 */
class PlayState extends FlxState {
	override public function create():Void {
		super.create();
		
		// Set background color
		bgColor = 0xFF1a1a2e;
		
		// Add title logo
		var logo = new FlxSprite();
		logo.loadGraphic("assets/sprites/CC_titleLogo_001.png");
		logo.screenCenter();
		logo.y = 50;
		add(logo);
		
		// Add a ship sprite
		var ship = new FlxSprite();
		ship.loadGraphic("assets/sprites/CC_ship_001.png");
		ship.screenCenter();
		ship.y = FlxG.height - 200;
		add(ship);
		
		// Add text with custom font
		var text = new FlxText(0, FlxG.height - 100, FlxG.width);
		text.text = "Welcome to Cosmic Cities!\n\nPress SPACE to play a sound";
		text.setFormat("assets/fonts/pixel_operator/pixel_operator.ttf", 16, 0xFFFFFF, "center");
		add(text);
		
		// Play background music
		FlxG.sound.playMusic("assets/sounds/music.intro.mp3", 0.5, true);
		
		trace("PlayState created successfully!");
		trace("Assets loaded from the assets repository");
	}
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		// Play sound effect when space is pressed
		if (FlxG.keys.justPressed.SPACE) {
			FlxG.sound.play("assets/sounds/sfx.select.1.wav", 0.7);
		}
		
		// Exit on ESC
		if (FlxG.keys.justPressed.ESCAPE) {
			#if sys
			Sys.exit(0);
			#end
		}
	}
}
