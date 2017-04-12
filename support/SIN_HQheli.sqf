/*
	SinFrame HQ Heli Support
	Author: Sinbane
	Description: Creates a heli to serve as required
*/
if (SINdebug == 1) then {systemChat "HQheli online"};
//-----------------------------------
//-VARIABLES

if (SINside == "WEST") then {
	hq_heli = "B_Heli_Transport_01_F";
	hq_helipilot = "B_Helipilot_F";
	hq_helicrew = "B_helicrew_F";
};
if (SINside == "EAST") then {
	hq_heli = "O_Heli_Light_02_F";
	hq_helipilot = "O_Helipilot_F";
	hq_helicrew = "O_helicrew_F";
};
if (SINside == "RESISTANCE") then {
	hq_heli = "I_Heli_light_03_F";
	hq_helipilot = "I_Helipilot_F";
	hq_helicrew = "I_helicrew_F";
};

//-----------------------------------
//-CREATE HELI

_pos = [SINbasepos,2000,6000,0,1,100,0] call BIS_fnc_findSafePos;

SIN_HQheli = createVehicle [hq_heli, _pos, [], 0, "FLY"];
SIN_HQheligroup = createGroup (side player);
SIN_HQheligroup setGroupId ["MENACE 2-5"];
SIN_HQpilot = SIN_HQheligroup createUnit [hq_helipilot, [5,5,5], [], 0, "NONE"];
SIN_HQcopilot = SIN_HQheligroup createUnit [hq_helipilot, [5,5,5], [], 0, "NONE"];
SIN_HQpilot moveindriver SIN_HQheli;
SIN_HQcopilot moveInTurret [SIN_HQheli, [0]];
SIN_HQheligroup allowFleeing 0;
SIN_HQheligroup setCombatMode "BLUE";

if (hq_heli in SIN_2heliguns) then {
	SIN_HQheligunnergroup = createGroup (side player);
	SIN_HQgunner1 = SIN_HQheligunnergroup createUnit [hq_helicrew, [5,5,5], [], 0, "NONE"];
	SIN_HQgunner2 = SIN_HQheligunnergroup createUnit [hq_helicrew, [5,5,5], [], 0, "NONE"];
	SIN_HQgunner1 moveInTurret [SIN_HQheli, [1]];
	SIN_HQgunner2 moveInTurret [SIN_HQheli, [2]];
	SIN_HQheligunnergroup setCombatMode "YELLOW";
	SIN_HQheligunnergroup allowFleeing 0;
};
if (hq_heli in SIN_1heliguns) then {
	SIN_HQheligunnergroup = createGroup (side player);
	SIN_HQgunner1 = SIN_HQheligunnergroup createUnit [hq_helicrew, [5,5,5], [], 0, "NONE"];
	SIN_HQgunner1 moveInTurret [SIN_HQheli, [1]];
	SIN_HQheligunnergroup setCombatMode "YELLOW";
	SIN_HQheligunnergroup allowFleeing 0;
};
_ai = [SIN_HQpilot] execVM "extra\SIN_disableAI.sqf";
_ai = [SIN_HQcopilot] execVM "extra\SIN_disableAI.sqf";
SIN_HQheli lock true;
SIN_HQheli_onMission = "true";

publicVariable "SIN_HQheli";
publicVariable "SIN_HQheligroup";
publicVariable "SIN_HQpilot";
publicVariable "SIN_HQheli_onMission";

_calls = [] spawn {
	call SIN_fnc_RTB;
	[SIN_HQheligroup,"Menace 2-5"] call SIN_fnc_pinmarker;
};

//-----------------------------------
//-EXTRAS

execVM "support\SIN_HQheliMaint.sqf";
execVM "extra\SIN_animateDoors.sqf";

//-----------------------------------