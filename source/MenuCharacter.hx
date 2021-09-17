package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class CharacterSetting
{
	public var x(default, null):Int;
	public var y(default, null):Int;
	public var scale(default, null):Float;
	public var flipped(default, null):Bool;

	public function new(x:Int = 0, y:Int = 0, scale:Float = 1.0, flipped:Bool = false)
	{
		this.x = x;
		this.y = y;
		this.scale = scale;
		this.flipped = flipped;
	}
}

class MenuCharacter extends FlxSprite
{
	private static var settings:Map<String, CharacterSetting> = [
		'bf' => new CharacterSetting(20, 15, 0.9, true),
		'gf' => new CharacterSetting(0, 160, 2, true),
		'dad' => new CharacterSetting(-15, 150),
		'spooky' => new CharacterSetting(20, 80, 1.2),
		'pico' => new CharacterSetting(0, 90, 1.2, true),
		'mom' => new CharacterSetting(-30, 160, 0.85),
		'parents-christmas' => new CharacterSetting(100, 160, 1.8),
		'senpai' => new CharacterSetting(-40, -25, 1.4),
		'ankha' => new CharacterSetting(-10, 170, 1)
	];

	private var flipped:Bool = false;

	public function new(x:Int, y:Int, scale:Float, flipped:Bool)
	{
		super(x, y);
		this.flipped = flipped;

		antialiasing = true;

		frames = Paths.getSparrowAtlas('campaign_menu_UI_characters');

		animation.addByPrefix('bf', "BF idle dance white", 10);
		animation.addByPrefix('bfConfirm', 'BF HEY!!', 10, false);
		animation.addByPrefix('gf', "GF Dancing Beat WHITE", 24);
		animation.addByPrefix('dad', "Dad idle dance BLACK LINE", 10);
		animation.addByPrefix('spooky', "spooky dance idle BLACK LINES", 10);
		animation.addByPrefix('pico', "Pico Idle Dance", 10);
		animation.addByPrefix('mom', "Mom Idle BLACK LINES", 10);
		animation.addByPrefix('parents-christmas', "Parent Christmas Idle", 10);
		animation.addByPrefix('senpai', "SENPAI idle Black Lines", 10);
		animation.addByPrefix('ankha', "Ankha idle", 10);

		setGraphicSize(Std.int(width * scale));
		updateHitbox();
	}

	public function setCharacter(character:String):Void
	{
		if (character == '')
		{
			visible = false;
			return;
		}
		else
		{
			visible = true;
		}

		animation.play(character);

		var setting:CharacterSetting = settings[character];
		offset.set(setting.x, setting.y);
		setGraphicSize(Std.int(width * setting.scale));
		flipX = setting.flipped != flipped;
	}
}
