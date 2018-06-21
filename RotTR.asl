/*
 * Load Removal by Aphox, Dread, Atorizil and Leemyy.
 * AutoSplitter by Atorizil and Leemyy.
 */

state("ROTTR")
{
	bool LegacyLoading	: 0xF25FB8;
	bool LegacyFMV		: 0xF9A990;
	int  Cutscene		: 0x1A22014;
	bool FMV			: 0x22D83D8;
	bool Loading		: 0xF9A990;
	long Alive			: 0x2CF3578; //counts up at about 1000000 per second
	float Percentage	: 0x1A21EE8, 0xC38;
	uint PlayTime		: 0x22D4690, 0x144;
	int XP				: 0x1092680, 0x0, 0x280, 0x18, 0x38;
	float X				: 0x15F6730;
	float Y				: 0x15F6734;
	float Z				: 0x15F6738;
	int XI				: 0x15F6730;
	int YI				: 0x15F6734;
	int ZI				: 0x15F6738;
}


startup
{
	vars.ticks = 0;
	vars.unitValue = 50f / 451;
	vars.split = -1;
	vars.autoSplit = false;
	vars.expectedSplit = -1;
	vars.collectibles = 1;
	vars.gainedXP = 0;
	vars.timeout = 0;
	vars.crashPos = false;
	vars.crashTime = false;
	vars.crash = false;
	vars.start = false;

	string[] splitNames =
	{
		"crash",
		"mountain",
		"scorpions",
		"syria",
		"camp",
		"wilderness",
		"pistol",
		"caught",
		"escape",
		"coppermill",
		"collapse",
		"mines",
		"ridgeline",
		"statue",
		"archives",
		"nightmare",
		"research",
		"terrible",
		"orrery",
		"midway",
		"deathless",
		"eyball",
		"climb",
		"deathrun",
		"chopper"
	};
	vars.splitNames = splitNames;

	int[][] positions =
	{
		//Crash
		new int[]{-962197842, -1003503816, 1175886473}, 
		//Scorpions
		new int[]{1176577054, -981459521, 1157857655}, 
		//Escape
		new int[]{1191227945, 1169654534, 1184398426}, 
		//Copper Mill
		new int[]{1193006009, -971192708, 1186625091}, 
		//Collapse
		new int[]{1195235988, -959902118, 1185918591}, 
		//Mines
		new int[]{1196022701, -954315099, 1186755061}, 
		//Ridgeline
		new int[]{1198124255, -955189483, 1187744754}, 
		//Trebuchet Skip
		new int[]{1193649042, -961871283, 1169293195}, 
		//End
		new int[]{-1013344957, -1015526939, -1004660831}, 
		//Mines 2
		new int[]{-982394933, -980081238, 1147204534}
	};
	vars.positions = positions;

	float[][] ranges =
	{
		//Pistol
		new float[]{23716.5488f, -3189.26807f, 19415.1777f}, 
		//Before Terrible Fight
		new float[]{14144.0039f, 14813.75f, -610.483032f}, 
		//Final Fight
		new float[]{44770.3242f, -9297.67871f, 17161.8359f}, 
		//Chopper Crash
		new float[]{46325.2031f, -8353.1377f, 15349.1055f},
		//Scorpions
		new float[]{10311.5361f, -4099.71826f, 2104.09155f},
		//Before Terrible Fight 2
		new float[]{49568.2265f, 12094.2529f, 23671.0722f},
		//Before Terrible Fight 3
		new float[]{61252.2539f, 21050.9140f, 23441.1992f}
	};
	vars.ranges = ranges;

	Func<float, float, float, bool> InRange =
		(float a, float b, float range) =>
	{
		return a >= b - range && a <= b + range;
	};
	vars.InRange = InRange;

	Func<dynamic, int[], bool> AtPosition =
		(dynamic state, int[] pos) =>
	{
		return
			state.XI == pos[0] &&
			state.YI == pos[1] &&
			state.ZI == pos[2];
	};
	vars.AtPosition = AtPosition;

	Func<dynamic, float[], float, bool> AtPositionRange =
		(dynamic state, float[] pos, float range) =>
	{
		return
			InRange(state.X, pos[0], range) &&
			InRange(state.Y, pos[1], range) &&
			InRange(state.Z, pos[2], range);
	};
	vars.AtPositionRange = AtPositionRange;

	//Empty initialization to avoid errors
	Action<string> Log = (string line) => {};
	vars.Log = Log;

	EventHandler OnStart =
		(s, e) =>
	{
		vars.Log("--Start--");
		vars.split = -1;
		vars.autoSplit = false;
		vars.expectedSplit = -1;
		vars.step = 0;
		vars.collectibles = 0;
		vars.gainedXP = 0;
		vars.crashPos = false;
		vars.crashTime = false;
		vars.crash = false;
		vars.start = true;
	};
	timer.OnStart += OnStart;
	vars.OnStart = OnStart;

	//settings
	//settings.Add(string id, bool default_value, string description = null, string parent = null)
	//settings.SetToolTip(string id, string tooltip);
	settings.Add("debug", false, "Enable debug logging");
	settings.Add("logStry", true, "Story progress", "debug");
	settings.Add("logColl", true, "Collectibles", "debug");
	settings.Add("logXP", true, "Experience", "debug");

	settings.Add("autopause", true, "Pause timer when game crashes");
	
	settings.Add("Splits");
	settings.CurrentDefaultParent = "Splits";
	settings.Add(splitNames[ 0], false, "Intro OOB");
		settings.SetToolTip(splitNames[0], "Split after successful Intro OOB"); //or once reached the top of the mountain
	settings.Add(splitNames[ 1],  true, "Mountain Peak");
		settings.SetToolTip(splitNames [1], "Split once Mountain Peak is complete");
	settings.Add(splitNames[ 2], false, "Scorpion Tunnel");
		settings.SetToolTip(splitNames[2], "Split after going through the Scorpion Tunnel");
	settings.Add(splitNames[ 3],  true, "Syria");
		settings.SetToolTip(splitNames[3], "Split once Syria is complete");
	settings.Add(splitNames[ 4], false, "Setting up Camp");
		settings.SetToolTip(splitNames[4], "Split at the camp in Siberian Wilderness");
	settings.Add(splitNames[ 5],  true, "Siberian Wilderness");
		settings.SetToolTip(splitNames[5], "Split once Siberian Wilderness is complete");
	settings.Add(splitNames[ 6], false, "Pistol");
		settings.SetToolTip(splitNames[6], "Split once Pistol is obtained");
	settings.Add(splitNames[ 7],  true, "Captured");
		settings.SetToolTip(splitNames[7], "Split once captured at the Gulag"); //or finished soviet installation
	settings.Add(splitNames[ 8],  true, "Escaped");
		settings.SetToolTip(splitNames[8], "Split after being rescued from the ice by Jacob");
	settings.Add(splitNames[ 9], false, "Copper Mill");
		settings.SetToolTip(splitNames[9], "Split at campfire after skywalk"); // or camp on top of the copper mill
	settings.Add(splitNames[10], false, "Collapse");
		settings.SetToolTip(splitNames[10], "Split after the Mines collapse");
	settings.Add(splitNames[11],  true, "Mines");
		settings.SetToolTip(splitNames[11], "Split after 'big door' cutscene"); //idk for that one :/
	settings.Add(splitNames[12], false, "Ridgeline");
		settings.SetToolTip(splitNames[12], "Split at 'Ridgeline' camp"); // or after finishing mines
	settings.Add(splitNames[13],  true, "Statue");
		settings.SetToolTip(splitNames[13], "Split after collapsing the statue in Flooded Archives");
	settings.Add(splitNames[14],  true, "Flooded Archives");
		settings.SetToolTip(splitNames[14], "Split once meeting Jonah at the Ridgeline");
	settings.Add(splitNames[15], false, "Nightmare");
		settings.SetToolTip(splitNames[15], "Split once reaching the Research Base area");
	settings.Add(splitNames[16], false, "Research Base");
		settings.SetToolTip(splitNames[16], "Split before entering Terrible Fight");
	settings.Add(splitNames[17],  true, "Terrible Fight");
		settings.SetToolTip(splitNames[17], "Split after finishing Terrible Fight");
	settings.Add(splitNames[18],  true, "Orrery");
		settings.SetToolTip(splitNames[18], "Split once Orrery is finished");
	settings.Add(splitNames[19], false, "Midway");
		settings.SetToolTip(splitNames[19], "Split after reaching the camp in Path of the Deathless"); // or after skip
	settings.Add(splitNames[20],  true, "Path of the Deathless");
		settings.SetToolTip(splitNames[20], "Split when crashing through the roof");
	settings.Add(splitNames[21],  true, "Trebuchet Skip");
		settings.SetToolTip(splitNames[21], "Split at camp after Kitezh OOB");
	settings.Add(splitNames[22], false, "Climb");
		settings.SetToolTip(splitNames[22], "Split after climbing the Tower");
	settings.Add(splitNames[23],  true, "Deathrun");
		settings.SetToolTip(splitNames[23], "Split once entering the Helicopter fight");
	settings.Add(splitNames[24], false, "Chopper Crash");
		settings.SetToolTip(splitNames[24], "Split once Helicopter crashes");
	settings.CurrentDefaultParent = null;
}

shutdown
{
	timer.OnStart -= vars.OnStart;
}


init
{
	timer.IsGameTimePaused = false;

	Action<string> Log =
		(string line) =>
	{
		if (settings["debug"])
			print(line);
	};
	vars.Log = Log;
}

exit
{
	timer.IsGameTimePaused = true;
	if ((vars.crashTime || vars.crashPos) && settings["autopause"])
	{
		vars.Log("-Crash Detected-");
		vars.crash = true;
	}
}


update
{
	if (settings["autopause"])
	{
		bool prev = vars.crashTime;
		if (current.Alive == old.Alive)
			vars.crashTime = vars.timeout++ > refreshRate / 5 + 1;
		else
		{
			vars.crashTime = false;
			vars.timeout = 0;
		}

		if (prev)
		{
			if (!vars.crashTime)
				vars.Log("-Game Halt Detected-");
		}
		else if (vars.crashTime)
			vars.Log("-Game Resume Detected-");

		vars.crashPos = vars.AtPosition(current, vars.positions[0]);

		if (vars.crash && (current.X != 0 || current.Y != 0 || current.Z != 0))
		{
			vars.Log("-Crash Recovered-");
			vars.crash = false;
		}
	}

	int deltaXP = current.XP - old.XP;
	if (vars.split == -1 && deltaXP > 0 && settings["logXP"])
		vars.Log("XP +"+ deltaXP +" ("+ current.XP +")");
}

start
{
	if (current.PlayTime == 0 && current.FMV && current.Loading
		&& current.Cutscene == 0 && current.Percentage > 0.5f
		&& current.X == 0 && current.Y == 0 && current.Z == 0)
	{
		return true;
	}
	return false;
}

isLoading
{
	return current.Cutscene != 0 || current.LegacyLoading || current.LegacyFMV
	|| current.FMV || current.Loading
	|| current.Percentage < .1f || vars.crash || vars.crashTime;
}

split
{
	//Prevent faulty splits when starting timer manually
	if (vars.start)
	{
		if (current.PlayTime == 0)
			vars.start = false;
		else
			return false;
	}
	//Prevent splits before the new save is fully initialized
	if (current.PlayTime == 0)
		return false;

	float delta = current.Percentage - old.Percentage;
	if (vars.unitValue - 0.0001f <= delta && delta <= vars.unitValue + 0.0001f)
	{
		vars.collectibles++;
		if (settings["logColl"])
		{
			vars.Log("Collectible " + vars.collectibles + "/451");
			if (vars.collectibles == 451)
				vars.Log("-All Collectibles-");
		}
	}
	float storyPercent = current.Percentage - vars.collectibles * vars.unitValue;
	if (delta > vars.unitValue + 0.0001f && settings["logStry"])
	{
		string format = storyPercent.ToString("##0.000000");
		if (format.Length == 8)
			format = "  "+ format;
		else if (format.Length == 9)
			format = " "+ format;
		vars.Log("Story "+ format +"%");
	}

	int deltaXP = current.XP - old.XP;
	if (current.XP > vars.gainedXP)
	{
		if (deltaXP > 0 && settings["logXP"])
			vars.Log("XP +"+ deltaXP +" ("+ current.XP +")");
		vars.gainedXP = current.XP;
	}
	else
		deltaXP = 0;

	while (timer.CurrentSplitIndex > vars.expectedSplit || vars.autoSplit || vars.split == -1)
	{
		if (vars.autoSplit)
			vars.autoSplit = false;
		else if (vars.split != -1)
			vars.Log("-Split "+ vars.expectedSplit +" Skipped Manually-");

		int nextSplit = vars.split + 1;
		while (++vars.split < vars.splitNames.Length)
			if (settings[vars.splitNames[vars.split]])
			{
				if (vars.split != nextSplit)
					vars.Log("-Skipped to " + vars.splitNames[vars.split] + " ("+ vars.split +")");
				break;
			}
		vars.expectedSplit++;
	}
	bool next = false;
	switch ((int)vars.split)
	{
		case 0: //Crash
			next = vars.AtPosition(current, vars.positions[0]);
			break;
		case 1: //Mountain
			next = storyPercent >= 1.19047f;
			break;
		case 2: //Scorpions
			next = vars.AtPositionRange(current, vars.ranges[4], 4);
			break;
		case 3: //Syria
			next = storyPercent >= 4.76190f;
			break;
		case 4: //Camp
			next = storyPercent >= 5.95237;
			break;
		case 5: //Siberian Wilderness
			next = storyPercent >= 8.33333f;
			break;
		case 6: //Pistol
			next = vars.AtPositionRange(current, vars.ranges[0], 10);
			break;
		case 7: //Caught
			next = storyPercent >= 10.71428f;
			break;
		case 8: //Escape
			next = vars.AtPosition(current, vars.positions[2]);
			break;
		case 9: //Copper Mill
			next = vars.AtPosition(current, vars.positions[3]);
			break;
		case 10: //Collapse
			next = vars.AtPosition(current, vars.positions[4]);
			break;
		case 11: //Mines
			next = vars.AtPosition(current, vars.positions[5])
				|| vars.AtPosition(current, vars.positions[9]);
			break;
		case 12: //Ridgeline
			next = vars.AtPosition(current, vars.positions[6]);
			break;
		case 13: //Statue
			next = storyPercent >= 28.57142f;
			break;
		case 14: //Archives
			next = storyPercent >= 30.95237f;
			break;
		case 15: //Jonah
			next = storyPercent >= 32.14284f;
			break;
		case 16: //Research Base
			next = vars.AtPositionRange(current, vars.ranges[1], 150)
				|| vars.AtPositionRange(current, vars.ranges[5], 150)
				|| vars.AtPositionRange(current, vars.ranges[6], 150);
			break;
		case 17: //Terrible Fight
			next = storyPercent >= 35.71428f;
			break;
		case 18: //Orrery
			next = storyPercent >= 38.09523f;
			break;
		case 19: //Midway
			next = storyPercent >= 39.28570f;
			break;
		case 20: //Path of the Deathless
			next = storyPercent >= 41.66665f;
			break;
		case 21: //Eyball
			next = vars.AtPosition(current, vars.positions[7]);
			break;
		case 22: //Climb
			next = storyPercent >= 46.42856f;
			break;
		case 23: //Deathrun
			next = vars.AtPositionRange(current, vars.ranges[2], 10);
			break;
		case 24: //Chopper Crash
			next = vars.AtPositionRange(current, vars.ranges[3], 10);
			break;
		case 25:
			if (!vars.AtPosition(current, vars.positions[8]))
				break;
			vars.split++;
			vars.Log("--End--");
			return true;
	}
	if (next)
	{
		vars.Log(">Split (" + vars.splitNames[vars.split]+")");
		vars.step = 0;
		vars.autoSplit = true;
		return true;
	}

	return false;
}