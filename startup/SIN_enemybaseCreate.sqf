/*
	SinFrame Base Creation
	Author: Sinbane
	Description: Creates a FOB to serve as the main base
*/
if (SINdebug == 1) then {systemChat "Enemy Base Creation script begin"};
//-----------------------------------
//-VARIABLES


//-----------------------------------
//-CREATE BASE STRUCTURES & MARKER

_base = createVehicle ["Land_Cargo_HQ_V1_F", SINenemybasepos, [], 0, "NONE"];
sleep 1;
_helipadPos = [SINenemybasepos,0,20,8,0,0.1,0] call BIS_fnc_findSafePos;
sleep 1;
_helipad = createVehicle ["Land_HelipadCircle_F", _helipadPos, [], 0, "NONE"];

sleep 1;
//-----------------------------------
//-CREATE THE OFFICER

if (SINenemy == "WEST") then {
	_group = createGroup WEST;
	enemyOfficer = _group createUnit ["B_Officer_F",SINenemybasepos, [], 0, "FORM"];
	enemyOfficer setpos [SINenemybasepos select 0, SINenemybasepos select 1, 0.59]; 
	enemyOfficer disableAI "AUTOTARGET";
	enemyOfficer disableAI "MOVE";
	removeBackpack enemyOfficer;
	enemyOfficer setdir 180;
	removeallweapons enemyOfficer;
	enemyOfficer switchMove "acts_StandingSpeakingUnarmed";
};

if (SINenemy == "EAST") then {
	_group = createGroup EAST;
	enemyOfficer = _group createUnit ["O_Officer_F",SINenemybasepos, [], 0, "FORM"];
	enemyOfficer setpos [SINenemybasepos select 0, SINenemybasepos select 1, 0.59]; 
	enemyOfficer disableAI "AUTOTARGET";
	enemyOfficer disableAI "MOVE";
	removeBackpack enemyOfficer;
	enemyOfficer setdir 180;
	removeallweapons enemyOfficer;
	enemyOfficer switchMove "acts_StandingSpeakingUnarmed";
};

if (SINenemy == "RESISTANCE") then {
	_group = createGroup resistance;
	enemyOfficer = _group createUnit ["I_Officer_F",SINenemybasepos, [], 0, "FORM"];
	enemyOfficer setpos [SINenemybasepos select 0, SINenemybasepos select 1, 0.59]; 
	enemyOfficer disableAI "AUTOTARGET";
	enemyOfficer disableAI "MOVE";
	removeBackpack enemyOfficer;
	enemyOfficer setdir 180;
	removeallweapons enemyOfficer;
	enemyOfficer switchMove "acts_StandingSpeakingUnarmed";
};

publicVariable "enemyOfficer";

if (SINdebug == 1) then {
	systemChat format ["Enemy Officer Type set to: %1",enemyOfficer];
};

sleep 1;
//-----------------------------------
//-CREATE DEFENCES

if (SINenemy == "WEST") then {
	execVM "startup\blufor\SIN_enemyguards.sqf";
	execVM "startup\blufor\SIN_enemystatic.sqf";
};

if (SINenemy == "EAST") then {
	execVM "startup\opfor\SIN_enemyguards.sqf";
	execVM "startup\opfor\SIN_enemystatic.sqf";
};

if (SINenemy == "RESISTANCE") then {
	execVM "startup\resistance\SIN_enemyguards.sqf";
	execVM "startup\resistance\SIN_enemystatic.sqf";
};

patrolpos = [(SINenemybasepos select 0)-40,SINenemybasepos select 1];
[SINenemybasepos,patrolpos,250] call SIN_fnc_createEnemyPatrol;
[SINenemybasepos,patrolpos,250] call SIN_fnc_createEnemyPatrol;

sleep 1;
//-----------------------------------
//-

SINenemybase_created = "true";
publicVariable "SINenemybase_created";

if (SINdebug == 1) then {systemChat "Base Creation script end"};
//-----------------------------------