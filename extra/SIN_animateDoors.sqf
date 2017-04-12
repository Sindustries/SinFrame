/*
	animateDoors
	Author: Sinbane
	Animates helicopter doors
	You can call this with _animate = [SIN_HQheli] execVM "extra\SIN_animateDoors.sqf";
*/
SIN_door_phase = 1;
//-----------------------------------
//--DEFINE HELI

_ghosthawk = ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]; // "Door_L", "Door_R";

_huron = ["B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_black_F","B_Heli_Transport_03_unarmed_green_F"]; // "Door_rear_source";

_kajman = ["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F"]; // "Door_L", "Door_R";

_tarutrans = ["O_Heli_Transport_04_covered_F","O_Heli_Transport_04_covered_black_F"]; // "Door_4_source"; "Door_5_source"; "Door_6_source";

_tarumedic = ["O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_medevac_black_F"]; // "Door_4_source"; "Door_6_source";

_mohawk = ["I_Heli_Transport_02_F"]; // "CargoRamp_Open";

//-----------------------------------
//--OPEN LOOP
while {true} do {
//-----------------------------------
//--PLAY ANIMATION

if ((getDammage SIN_HQheli) > 0.7 || !alive SIN_HQpilot) then {
	waitUntil {alive SIN_HQheli || alive SIN_HQpilot};
};

if (hq_heli in _ghosthawk) then {
	SIN_HQheli animateDoor ["Door_L", SIN_door_phase, false];
	SIN_HQheli animateDoor ["Door_R", SIN_door_phase, false];
};

if (hq_heli in _huron) then {
	SIN_HQheli animateDoor ["Door_rear_source", SIN_door_phase, false];
};

if (hq_heli in _kajman) then {
	SIN_HQheli animateDoor ["Door_L", SIN_door_phase, false];
	SIN_HQheli animateDoor ["Door_R", SIN_door_phase, false];
};

if (hq_heli in _tarutrans) then {
	SIN_HQheli animateDoor ["Door_4_source", SIN_door_phase, false];
	SIN_HQheli animateDoor ["Door_5_source", SIN_door_phase, false];
	SIN_HQheli animateDoor ["Door_6_source", SIN_door_phase, false];	
};

if (hq_heli in _tarumedic) then {
	SIN_HQheli animateDoor ["Door_4_source", SIN_door_phase, false];
	SIN_HQheli animateDoor ["Door_5_source", SIN_door_phase, false];
};

if (hq_heli in _mohawk) then {
	SIN_HQheli animateDoor ["CargoRamp_Open", SIN_door_phase, false];
};

if ((getPos SIN_HQheli select 2) > 1) then {
	waitUntil {(getPos SIN_HQheli select 2) < 1 || (getDammage SIN_HQheli) > 0.7 || !alive SIN_HQpilot};
	sleep 0.2;
	SIN_door_phase = 1;
} else {
	waitUntil {(getPos SIN_HQheli select 2) > 1 || (getDammage SIN_HQheli) > 0.7 || !alive SIN_HQpilot};
	sleep 0.2;
	SIN_door_phase = 0;
};

//-----------------------------------
//--CLOSE LOOP
};