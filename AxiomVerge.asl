state("AxiomVerge") {}

state("RandomAV") {}

startup {
    settings.Add("DIALOGUE_Ending", true, "End");
    //BOSSES
    settings.Add("bosses", true, "Bosses");
    settings.Add("DIALOGUE_SecurityWormMeet", false, "Xedur (start)", "bosses");
    settings.Add("Xedur", true, "Xedur (end)", "bosses");
    settings.Add("DIALOGUE_SoldierBossMeet", false, "Telal (start)", "bosses");
    settings.Add("Telal", true, "Telal (end)", "bosses");
    settings.Add("DIALOGUE_SlugBossMeet", false, "Uruku (start)", "bosses");
    settings.Add("Uruku", true, "Uruku (end)", "bosses");
    settings.Add("DIALOGUE_ScorpionBossMeet", false, "Gir-Tab (start)", "bosses");
    settings.Add("Gir-Tab", false, "Gir-Tab (end)", "bosses");
    settings.Add("DIALOGUE_MantaBossMeet", false, "Vision (start)", "bosses");
    settings.Add("Vision", true, "Vision (end)", "bosses");
    settings.Add("DIALOGUE_DeformedTraceReveal", false, "Clone (start)", "bosses");
    settings.Add("Clone", false, "Clone (end)", "bosses");
    settings.Add("DIALOGUE_SpitBugBossMeet", false, "Ukhu (start)", "bosses");
    settings.Add("Ukhu", true, "Ukhu (end)", "bosses");
    settings.Add("Sentinel", true, "Sentinel (end)", "bosses");
    settings.Add("DIALOGUE_SecurityWormAdvancedMeet", false, "Xedur Hul (start)", "bosses");
    settings.Add("Xedur Hul", false, "Xedur Hul (end)", "bosses");
    settings.Add("DIALOGUE_AthetosMeet", false, "Athetos (start)", "bosses");
    settings.Add("Athetos", true, "Athetos (end)", "bosses");
    //WEAPONS
    settings.Add("weapons", true, "Weapons");
    settings.Add("DataDisruptor", true, "Axiom Disruptor", "weapons");
    settings.Add("DataGrenade", false, "Data Bomb", "weapons");
    settings.Add("DistortionField", false, "Distortion Field", "weapons");
    settings.Add("FatBeam", false, "Fat Beam", "weapons");
    settings.Add("FireWall", false, "Fire Wall", "weapons");
    settings.Add("FlameThrower", false, "Flame Thrower", "weapons");
    settings.Add("HeatSeeker", false, "Heat Seeker", "weapons");
    settings.Add("VerticalSpread", false, "Hypo-Atomizer", "weapons");
    settings.Add("InertialPulse", false, "Inertial Pulse", "weapons");
    settings.Add("IonBeam", false, "Ion Beam", "weapons");
    settings.Add("Kilver", true, "Kilver", "weapons");
    settings.Add("LightningGun", false, "Lightning Gun", "weapons");
    settings.Add("MultiDisruptor", false, "Multi Disruptor", "weapons");
    settings.Add("Nova", true, "Nova", "weapons");
    settings.Add("WallTrace", false, "Orbital Discharge", "weapons");
    settings.Add("Swim", false, "Quantum Variegator", "weapons");
    settings.Add("Reflect", false, "Reflector", "weapons");
    settings.Add("Scythe", false, "Reverse Slicer", "weapons");
    settings.Add("WebSlicer", false, "Scissor Beam", "weapons");
    settings.Add("Shards", false, "Shards", "weapons");
    settings.Add("TetheredCharge", false, "Tethered Charge", "weapons");
    settings.Add("TriCone", false, "Turbine Pulse", "weapons");
    settings.Add("Voranj", false, "Voranj", "weapons");
    //TOOLS
    settings.Add("tools", true, "Tools");
    settings.Add("GlitchBomb", false, "Address Bomb", "tools");
    settings.Add("AddressDisruptor1", true, "Address Disruptor", "tools");
    settings.Add("AddressDisruptor2", true, "Address Disruptor 2", "tools");
    settings.Add("TendrilsTop", false, "Bioflux Accelerator 1", "tools");
    settings.Add("TendrilsBottom", false, "Bioflux Accelerator 2", "tools");
    settings.Add("DroneTeleport", true, "Drone Teleport", "tools");
    settings.Add("EnhancedLaunch", true, "Extended Drone Launch", "tools");
    settings.Add("HighJump", true, "Field Disruptor", "tools");
    settings.Add("Grapple", false, "Grapple", "tools");
    settings.Add("Drill", true, "Laser Drill", "tools");
    settings.Add("GlitchTeleport", true, "Modified Lab Coat", "tools");
    settings.Add("PasswordTool", false, "Password Tool", "tools");
    settings.Add("RedCoat", true, "Red Coat", "tools");
    settings.Add("DroneGun", true, "Remote Drone", "tools");
    settings.Add("BreachSuppressor", true, "Sudran Key", "tools");
    settings.Add("BlackCoat", true, "Trenchcoat", "tools");
    //HEALTH NODES
    settings.Add("healthnodes", true, "Health Nodes");
    settings.Add("HealthNode1", true, "Health Node 1", "healthnodes");
    settings.SetToolTip("HealthNode1", "Area: Eribu, Location: Entering Absu");
    settings.Add("HealthNode2", true, "Health Node 2", "healthnodes");
    settings.SetToolTip("HealthNode2", "Area: Absu, Location: Middle of Lower Shaft");
    settings.Add("HealthNode3", false, "Health Node 3", "healthnodes");
    settings.SetToolTip("HealthNode3", "Area: Zi, Location: Boss Room");
    settings.Add("HealthNode4", false, "Health Node 4", "healthnodes");
    settings.SetToolTip("HealthNode4", "Area: Kur, Location: Lair Secret");
    settings.Add("HealthNode5", false, "Health Node 5", "healthnodes");
    settings.SetToolTip("HealthNode5", "Area: Ukkin-Na, Location: Right of Ophelia");
    settings.Add("HealthNode6", false, "Health Node 6", "healthnodes");
    settings.SetToolTip("HealthNode6", "Area: Edin, Location: Hangar Attic Second");
    settings.Add("HealthNode7", false, "Health Node 7", "healthnodes");
    settings.SetToolTip("HealthNode7", "Area: Edin, Location: West Tower West Secret");
    settings.Add("HealthNode8", false, "Health Node 8", "healthnodes");
    settings.SetToolTip("HealthNode8", "Area: Mar-Uru, Location: After Sentinel");
    settings.Add("HealthNode9", false, "Health Node 9", "healthnodes");
    settings.SetToolTip("HealthNode9", "Area: Eribu, Location: Reflector Room");
    //POWER NODES
    settings.Add("powernodes", true, "Power Nodes");
    settings.Add("PowerNode1", true, "Power Node 1", "powernodes");
    settings.SetToolTip("PowerNode1", "Area: Eribu, Location: Drilled Under Xedur");
    settings.Add("PowerNode2", true, "Power Node 2", "powernodes");
    settings.SetToolTip("PowerNode2", "Area: Absu, Location: Exit to Zi");
    settings.Add("PowerNode3", true, "Power Node 3", "powernodes");
    settings.SetToolTip("PowerNode3", "Area: Kur, Location: Near Indi Exit");
    settings.Add("PowerNode4", false, "Power Node 4", "powernodes");
    settings.SetToolTip("PowerNode4", "Area: Kur, Location: Crumbling Blocks");
    settings.Add("PowerNode5", false, "Power Node 5", "powernodes");
    settings.SetToolTip("PowerNode5", "Area: Edin, Location: Hangar Attic");
    settings.Add("PowerNode6", true, "Power Node 6", "powernodes");
    settings.SetToolTip("PowerNode6", "Area: E-Kur-Mah, Location: Behind Seal");
    //SIZE NODES
    settings.Add("sizenodes", true, "Size Nodes");
    settings.Add("SizeNode1", true, "Size Node 1", "sizenodes");
    settings.SetToolTip("SizeNode1", "Area: Eribu, Location: Red Stalagmites");
    settings.Add("SizeNode2", true, "Size Node 2", "sizenodes");
    settings.SetToolTip("SizeNode2", "Area: Absu, Location: Purple Corrupted Diatom");
    settings.Add("SizeNode3", true, "Size Node 3", "sizenodes");
    settings.SetToolTip("SizeNode3", "Area: Zi, Location: High Jump Access");
    settings.Add("SizeNode4", true, "Size Node 4", "sizenodes");
    settings.SetToolTip("SizeNode4", "Area: Mar-Uru, Location: Hybrid Room");
    //RANGE NODES
    settings.Add("rangenodes", true, "Range Nodes");
    settings.Add("RangeNode1", true, "Range Node 1", "rangenodes");
    settings.SetToolTip("RangeNode1", "Area: Absu, Location: Green Fungus Secret");
    settings.Add("RangeNode2", true, "Range Node 2", "rangenodes");
    settings.SetToolTip("RangeNode2", "Area: Zi, Location: Center Steam Room");
    settings.Add("RangeNode3", true, "Range Node 3", "rangenodes");
    settings.SetToolTip("RangeNode3", "Area: Edin, Location: Hidden Tunnel West");
    settings.Add("RangeNode4", true, "Range Node 4", "rangenodes");
    settings.SetToolTip("RangeNode4", "Area: Absu, Location: Below Corruption");
    //NOTES
    settings.Add("notes", true, "Notes");
    settings.Add("Note1", false, "Note 1", "notes");
    settings.Add("Note2", false, "Note 2", "notes");
    settings.Add("Note3", false, "Note 3", "notes");
    settings.Add("Note4", false, "Note 4", "notes");
    settings.Add("Note5", false, "Note 5", "notes");
    settings.Add("Note6", false, "Note 6", "notes");
    settings.Add("Note7", false, "Note 7", "notes");
    settings.Add("Note8", false, "Note 8", "notes");
    settings.Add("Note9", false, "Note 9", "notes");
    settings.Add("Note10", false, "Note 10", "notes");
    settings.Add("Note11", false, "Note 11", "notes");
    settings.Add("Note12", false, "Note 12", "notes");
    settings.Add("Note13", false, "Note 13", "notes");
    settings.Add("Note14", false, "Note 14", "notes");
    settings.Add("Note15", false, "Note 15", "notes");
    settings.Add("Note16", false, "Note 16", "notes");
    settings.Add("Note17", false, "Note 17", "notes");
    settings.Add("Note18", false, "Note 18", "notes");
    settings.Add("Note19", false, "Note 19", "notes");
    settings.Add("Note20", false, "Note 20", "notes");
    settings.Add("Note21", false, "Note 21", "notes");
    settings.Add("Note22", false, "Note 22", "notes");
    settings.Add("Note23", false, "Note 23", "notes");
    settings.Add("Note24", false, "Note 24", "notes");
    settings.Add("Note25", false, "Note 25", "notes");
    settings.Add("Note26", false, "Note 26", "notes");
    settings.Add("Note27", false, "Note 27", "notes");
    settings.Add("Note28", false, "Note 28", "notes");
    //CUTSCENES
    //settings.Add("cutscenes", true, "Cutscenes");
    //settings.Add("TraceHallucination1", false, "Note 1", "cutscenes");
    //settings.Add("DIALOGUE_FinalAreaPepTalk", false, "Note 1", "cutscenes");

    vars.gameOffset = 0;
    Func<Process, int, string> ReadCheckpoint =
        (Process proc, int index) =>
    {
        index *= 4;
        index += 0x8;
        var stringLen = new DeepPointer(vars.gameOffset, 0xE0, 0x48, 0x4, index, 0xC, 0x4);
        var len = stringLen.Deref<int>(proc);
        var stringArr = new DeepPointer(vars.gameOffset, 0xE0, 0x48, 0x4, index, 0xC, 0x8);
        var bytes = stringArr.DerefBytes(proc, len * 2);
        if (bytes == null)
            return null;
        return System.Text.Encoding.Unicode.GetString(bytes);
    };
    vars.ReadCheckpoint = ReadCheckpoint;
    vars.lastCheckpoint = 0;

    Func<Process, int, string> ReadItem =
        (Process proc, int index) =>
    {
        index *= 4;
        index += 0x8;
        var stringLen = new DeepPointer(vars.gameOffset, 0xE0, 0x30, 0x4, index, 0x4, 0x4);
        var len = stringLen.Deref<int>(proc);
        var stringArr = new DeepPointer(vars.gameOffset, 0xE0, 0x30, 0x4, index, 0x4, 0x8);
        var bytes = stringArr.DerefBytes(proc, len * 2);
        if (bytes == null)
            return null;
        return System.Text.Encoding.Unicode.GetString(bytes);
    };
    vars.ReadItem = ReadItem;
    vars.lastItem = 0;

    Func<Process, int, string> ReadKeyPoint =
        (Process proc, int index) =>
    {
        index *= 4;
        index += 0x8;
        var stringLen = new DeepPointer(vars.gameOffset, 0xE0, 0x34, 0x4, index, 0x4);
        int len;
        if (!stringLen.Deref<int>(proc, out len) || len < 4 || len > 50)
        {
            return null;
        }
        var stringArr = new DeepPointer(vars.gameOffset, 0xE0, 0x34, 0x4, index, 0x8);
        byte[] bytes;
        if (!stringArr.DerefBytes(proc, len * 2, out bytes))
        {
            return null;
        }
        return System.Text.Encoding.Unicode.GetString(bytes);
    };
    vars.ReadKeyPoint = ReadKeyPoint;
    vars.lastKeyPoint = 0;

    EventHandler OnStart =
        (s, e) =>
    {
        print("--Start--");
        vars.lastCheckpoint = 0;
        vars.lastItem = 0;
        vars.lastKeyPoint = 0;
    };
    timer.OnStart += OnStart;

    EventHandler OnSplit =
        (s, e) =>
    {
        print("->Split<");
    };
    timer.OnSplit += OnSplit;
}

init {
    print("v 0.2");
    bool steam = modules.Any(m => m.ModuleName == "steam_api.dll");
    print(game.ProcessName + " (" + (steam ? "Steam" : "Epic") + " version)");

    int axiomClass = 0;
    var pattern = new SigScanTarget(0,
        "?? ?? ?? ?? 04 00 00 00 00 00 00 00 00 00 00 00 ?? ?? ?? ?? F8 07 00 00"
    );
    int retriesLeft = 10;
    while (retriesLeft-- > 0)
    {
        foreach (var page in memory.MemoryPages())
        {
            var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);

            var ptr = scanner.Scan(pattern, 0x10);
            if (ptr != IntPtr.Zero)
            {
                axiomClass = (int)ptr;
                print("Found static Game members at " + axiomClass.ToString("X8"));
                retriesLeft = 0;
                break;
            }
        }
        if (retriesLeft > 0)
        {
            print("Could not find pattern, retrying " + retriesLeft.ToString() + " more times.");
            System.Threading.Thread.Sleep(500);
        }
    }
    if (axiomClass == 0)
    {
        print("Could not find pattern, Game version is likely unsupported.");
    }

    bool vanilla = game.ProcessName == "AxiomVerge";
    int offset = vanilla ? (steam ? 0x144 : 0xB0) : (steam ? 0x50 : 0x24);
    var moduleOffset = (int)game.MainModuleWow64Safe().BaseAddress.ToInt64();
    offset += axiomClass - moduleOffset;
    vars.gameOffset = offset;

    DeepPointer dp;
    dp = new DeepPointer(offset, 0xE0, 0xB4);
    vars.maxHealth = new MemoryWatcher<int>(dp);
    dp = new DeepPointer(offset, 0xE0, 0xC);
    vars.ticks = new MemoryWatcher<double>(dp);
    dp = new DeepPointer(vars.gameOffset, 0xE0, 0x48, 0xC);
    vars.checkpointCount = new MemoryWatcher<int>(dp);
    dp = new DeepPointer(vars.gameOffset, 0xE0, 0x30, 0xC);
    vars.itemCount = new MemoryWatcher<int>(dp);
    dp = new DeepPointer(vars.gameOffset, 0xE0, 0x34, 0xC);
    vars.keyPointCount = new MemoryWatcher<int>(dp);
}

update {
    vars.maxHealth.Update(game);
    vars.ticks.Update(game);
    vars.checkpointCount.Update(game);
    vars.itemCount.Update(game);
    vars.keyPointCount.Update(game);
}

gameTime {
    long tenthsOfMicros = (long)(vars.ticks.Current * (10000000 / 60));
    return new TimeSpan(tenthsOfMicros);
}

start {
    return vars.ticks.Current < 60 && vars.ticks.Current > 1 &&
    vars.itemCount.Current == 0;
}

reset { 

}

split {
    if (vars.checkpointCount.Current > vars.lastCheckpoint)
    {
        //print("Test Checkpoint: "+ vars.checkpointCount.Current.ToString() +" > "+ vars.lastCheckpoint.ToString());
        string checkpoint = vars.ReadCheckpoint(game, vars.lastCheckpoint);
        if (!string.IsNullOrEmpty(checkpoint) && settings.ContainsKey(checkpoint))
        {
            print("Checkpoint: " + checkpoint +" @"+ timer.CurrentTime.GameTime.ToString());
            vars.lastCheckpoint++;
            return settings[checkpoint];
        }
    }

    if (vars.itemCount.Current > vars.lastItem)
    {
        //print("Test Item "+ vars.itemCount.Current.ToString() +" > "+ vars.lastItem.ToString());
        string item = vars.ReadItem(game, vars.lastItem);
        if (!string.IsNullOrEmpty(item) && settings.ContainsKey(item))
        {
            print("Item: " + item +" @"+ timer.CurrentTime.GameTime.ToString());
            vars.lastItem++;
            return settings[item];
        }
    }

    if (vars.keyPointCount.Current > vars.lastKeyPoint)
    {
        //print("Test KeyPoint: "+ vars.keyPointCount.Current.ToString() +" > "+ vars.lastKeyPoint.ToString());
        string keyPoint = vars.ReadKeyPoint(game, vars.lastKeyPoint);
        if (!string.IsNullOrEmpty(keyPoint))
        {
            print("KeyPoint: " + keyPoint +" @"+ timer.CurrentTime.GameTime.ToString());
            vars.lastKeyPoint++;
            if (settings.ContainsKey(keyPoint))
            {
                return settings[keyPoint];
            }
        }
    }
}
