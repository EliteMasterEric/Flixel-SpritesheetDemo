package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFramesCollection;
import openfl.Assets;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	public override function create()
	{
		super.create();

		// Initialize a sprite.
		sprite = new FlxSprite(0, 0);

		// Here, we provide an image, and the string data from an XML file,
		// and receive an FlxFramesCollection containing the named frames from the XML.
		// Note this is specifically using the Sparrow format.
		// SpriteSheetPacker, LibGDX, TexturePacker, and TexturePackerXML are also supported,
		// and you can't distinguish the format being used by file extension alone,
		// the user will have to specify it.
		var frames:FlxFramesCollection = FlxAtlasFrames.fromSparrow("assets/images/BOYFRIEND.png", Assets.getText("assets/images/BOYFRIEND.xml"));

		// Now we can assign the frames to the sprite.
		// This is done in lieu of the usual FlxSprite.loadGraphic() method.
		sprite.frames = frames;

		// Now that this is done, sprite.animation.add() can be used to add animations that we can play.
		// Other functions exist which make add() easier to use, such as addByPrefix() and addByIndices().

		// Here, we add an animation which will be referred to as 'idle',
		// which plays the frames starting with 'BF idle dance', playing them in order.
		// We also specify 24 frames per second and auto-looping enabled.
		sprite.animation.addByPrefix('idle', 'BF idle dance', 24, true);

		// Add another animation.
		sprite.animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);

		// Play the default animation.
		sprite.animation.play('idle');

		// Add the sprite to the state.
		add(sprite);
	}

	public override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.UP)
		{
			sprite.animation.play('singUP');
		}
		else if (sprite.animation.curAnim.finished)
		{
			sprite.animation.play('idle');
		}
	}
}
