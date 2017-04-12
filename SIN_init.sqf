/*
	Mission: SinFrame
	Author: Sinbane
	GAME INIT
	DO NOT EDIT VARIABLES
*/
//-----------------------------------
//-DEFINE VARIABLES

if (isnil ("SINbase_created")) then {SINbase_created = "false"};
if (isnil ("SINenemybase_created")) then {SINenemybase_created = "false"};
if (isnil ("SINbasepos")) then {SINbasepos = []};
if (isnil ("SINenemybasepos")) then {SINenemybasepos = []};
if (isnil ("SINsquad_num")) then {SINsquad_num = 0};

//-----------------------------------
//-BUILD HELI ARRAY

SIN_2heliguns = ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_Heli_Transport_03_black_F"];

SIN_1heliguns = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Transport_04_black_F","O_Heli_Transport_04_ammo_black_F","O_Heli_Transport_04_bench_black_F","O_Heli_Transport_04_box_black_F","O_Heli_Transport_04_covered_black_F","O_Heli_Transport_04_fuel_black_F","O_Heli_Transport_04_medevac_black_F","O_Heli_Transport_04_repair_black_F"];

//-----------------------------------
//-PLAYER SIDE CHECK - Checks if player is on same side as defined in parameters

if (SINdebug == 0) then {
	if (SINsideParam == 1 && side player != WEST) exitWith {
		["sameside",false] call BIS_fnc_endMission;
	};
	if (SINsideParam == 2 && side player != EAST) exitWith {
		["sameside",false] call BIS_fnc_endMission;
	};
	if (SINsideParam == 3 && side player != RESISTANCE)	exitWith {
		["sameside",false] call BIS_fnc_endMission;
	};
};

//-----------------------------------
//-ENEMY CHECK - Checks that enemy isn't the same as player side

if (isServer) then {
	if (SINdebug == 0) then {
		if (SINsideParam == 1 && SINenemyParam == 1) then {
			SINenemy = "EAST";
			systemChat "You can't play against the same faction!";
			sleep 0.5;
			systemChat "Enemy side changed to CSAT";
			publicVariable "SINenemy";
		};

		if (SINsideParam == 2 && SINenemyParam == 2) then {
			SINenemy = "WEST";
			systemChat "You can't play against the same faction!";
			sleep 0.5;
			systemChat "Enemy side changed to NATO";
			publicVariable "SINenemy";
		};

		if (SINsideParam == 3 && SINenemyParam == 3) then {
			SINenemy = "EAST";
			systemChat "You can't play against the same faction!";
			sleep 0.5;
			systemChat "Enemy side changed to CSAT";
			publicVariable "SINenemy";
		};
	};
};

//-----------------------------------
//-SINBOT INIT

if (isServer) then {
	execVM "SINBOT\SINBOT_init.sqf";
};

//-----------------------------------
//-BUILD HQ

if (isServer) then {
	if (SINbaseManual == 0) then {		
		
		SINbasepos = [[0,0,0],0,99999,0,0,0.1,0] call BIS_fnc_findSafePos;
		sleep 1;
		SINbasepos = [SINbasepos,0,10000,18,0,0.1,0] call BIS_fnc_findSafePos;
		
		if (SINdebug == 1) then {
			systemChat format["Base Pos set to: %1",SINbasepos];
		};
		publicVariable "SINbasepos";		
		sleep 1;
		_base = execVM "startup\SIN_baseCreate.sqf";
		cutText ["CREATING BASE", "BLACK FADED", 999];
		waitUntil {scriptDone _base};
	} else {
		_base = execVM "startup\SIN_baseManual.sqf";
		waitUntil {scriptDone _base};
		cutText ["CREATING BASE", "BLACK FADED", 999];
		_base = execVM "startup\SIN_baseCreate.sqf";
		waitUntil {scriptDone _base};
	};
};

if (SINbase_created == "false") then {
	cutText ["CREATING BASE", "BLACK FADED", 999];
	waitUntil {SINbase_created == "true"};
};

["AmmoboxInit",[HQofficer,true,{true}]] spawn BIS_fnc_arsenal;

//-----------------------------------
//-DEFEAT IF OFFICER DIES

[HQofficer] spawn {
  HQofficer = _this select 0;
  waitUntil {sleep 1; !alive HQofficer};
  ["TaskFailed",["","Your officer has been killed..."]] call bis_fnc_showNotification;
  sleep 6;
  ["officerDead",false] call BIS_fnc_endMission;
};

sleep 0.2;
//-----------------------------------
//-BUILD ENEMY HQ

if (isServer) then {
	if (SINbaseManual == 0) then {
		
		SINenemybasepos = [[0,0,0],0,99999,0,0,0.1,0] call BIS_fnc_findSafePos;
		sleep 1;
		SINenemybasepos = [SINbasepos,SINzoneMaxDist,(SINzoneMaxDist * 1.25),18,0,0.1,0] call BIS_fnc_findSafePos;			
		
		if (SINdebug == 1) then {
			systemChat format["Enemy Base Pos set to: %1",SINbasepos];
		};
		publicVariable "SINenemybasepos";		
		sleep 1;
		_base = execVM "startup\SIN_enemybaseCreate.sqf";
		cutText ["CREATING ENEMY BASE", "BLACK FADED", 999];
		waitUntil {scriptDone _base};
	} else {
		_base = execVM "startup\SIN_enemybaseManual.sqf";
		waitUntil {scriptDone _base};
		cutText ["CREATING ENEMY BASE", "BLACK FADED", 999];
		_base = execVM "startup\SIN_enemybaseCreate.sqf";
		waitUntil {scriptDone _base};
	};
};

if (SINenemybase_created == "false") then {
	cutText ["CREATING ENEMY BASE", "BLACK FADED", 999];
	waitUntil {SINenemybase_created == "true"};
};



sleep 0.2;
//-----------------------------------
//-CAPTURE ZONE PLACEMENT

if (SINzones_created < SINmaxzones) then {
	_zoneCheck = true;
	while {_zoneCheck} do {
		if (SINzones_created >= SINmaxZones) then {
			_zoneCheck = false;
		} else {
			if (isServer) then {
				_zone = execVM "zone\SIN_findzone.sqf";
				_msg = format["CREATING ZONE %1/%2",SINzonenum,SINmaxZones];
				cutText [_msg, "BLACK FADED", 999];
				waitUntil {scriptDone _zone};
				sleep 2;
			};
			_msg = format["CREATING ZONE %1/%2",SINzonenum,SINmaxZones];
			cutText [_msg, "BLACK FADED", 999];
			sleep 1;
		};
	};
};

SINenemy_controlledzones = [SINenemy_controlledzones,[SINbasepos],{_input0 distance _x},"ASCEND"] call BIS_fnc_sortBy;

//-----------------------------------
//-PLAYER SPAWN

cutText ["PREPARING TO SPAWN PLAYER", "BLACK FADED", 999];

player allowDamage false;
player enableSimulation true;
sleep 0.5;
player setPos (getPos HQofficer);
player setDir 270;
sleep 0.5;
player enableSimulation false;
player allowDamage true;
player enableSimulation true;
sleep 3;
enableEnvironment true;
cutText ["", "BLACK IN", 5];

if (SINdebug == 0 && isServer) then {
	enableSaving [false, true];
};

//-----------------------------------