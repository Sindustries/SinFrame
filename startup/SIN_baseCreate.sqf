/*
	SinFrame Base Creation
	Author: Sinbane
	Description: Creates a FOB to serve as the main base
*/
if (SINdebug == 1) then {systemChat "Base Creation script begin"};
//-----------------------------------
//-VARIABLES

if (SINside == "WEST") then {
	hq_marker_type = "flag_NATO";
	hq_respawn_type = "respawn_west";
	hq_heli = "B_Heli_Transport_01_F";
};
if (SINside == "EAST") then {
	hq_marker_type = "flag_CSAT";
	hq_respawn_type = "respawn_east";
	hq_heli = "O_Heli_Transport_04_covered_F";
};
if (SINside == "RESISTANCE") then {
	hq_marker_type = "flag_AAF";
	hq_respawn_type = "respawn_guerrila";
	hq_heli = "I_Heli_Transport_02_F";
};

if (SINdebug == 1) then {
	systemChat format ["HQ Marker Type set to: %1",hq_marker_type];
	systemChat format ["Respawn Type set to: %1",hq_respawn_type];
};

sleep 1;
//-----------------------------------
//-CREATE BASE STRUCTURES & MARKER

_base = createVehicle ["Land_Cargo_HQ_V1_F", SINbasepos, [], 0, "NONE"];
sleep 1;
SIN_HQhelipadPos = [SINbasepos,0,20,8,0,0.1,0] call BIS_fnc_findSafePos;
sleep 1;
SIN_HQhelipad = createVehicle ["Land_HelipadCircle_F", SIN_HQhelipadPos, [], 0, "NONE"];

_marker = createMarker ["HQMarker", SINbasepos];
_marker setMarkerShape "ICON";
_marker setMarkerColor SINsidecolour;
_marker setMarkerType hq_marker_type;
_marker setMarkerText "HQ";
_marker setMarkerSize [0.75,0.75];

//-----------------------------------
//-ENEMY PROXIMITY NOTIFICATION

_warning = createTrigger["EmptyDetector",SINbasepos];
_warning setTriggerArea[300,300,0,false];

_warning setTriggerActivation[SINenemy,"PRESENT",true];

_warning setTriggerStatements["this","HQofficer sidechat 'This is HQ, we have detected enemies in the vicinity, requesting support!'", ""];

sleep 1;
//-----------------------------------
//-CREATE THE OFFICER

if (SINside == "WEST") then {
	_group = createGroup WEST;
	HQofficer = _group createUnit ["B_officer_F",SINbasepos, [], 0, "FORM"];
	HQofficer setpos [SINbasepos select 0, SINbasepos select 1, 0.59]; 
	HQofficer disableAI "AUTOTARGET";
	HQofficer disableAI "MOVE";
	removeBackpack HQofficer;
	HQofficer setdir 180;
	removeallweapons HQofficer;
	HQofficer switchMove "acts_StandingSpeakingUnarmed";
	_group setGroupId ["HQ"];
};

if (SINside == "EAST") then {
	_group = createGroup EAST;
	HQofficer = _group createUnit ["O_officer_F",SINbasepos, [], 0, "FORM"];
	HQofficer setpos [SINbasepos select 0, SINbasepos select 1, 0.59]; 
	HQofficer disableAI "AUTOTARGET";
	HQofficer disableAI "MOVE";
	removeBackpack HQofficer;
	HQofficer setdir 180;
	removeallweapons HQofficer;
	HQofficer switchMove "acts_StandingSpeakingUnarmed";
	_group setGroupId ["HQ"];
};

if (SINside == "RESISTANCE") then {
	_group = createGroup resistance;
	HQofficer = _group createUnit ["I_officer_F",SINbasepos, [], 0, "FORM"];
	HQofficer setpos [SINbasepos select 0, SINbasepos select 1, 0.59]; 
	HQofficer disableAI "AUTOTARGET";
	HQofficer disableAI "MOVE";
	removeBackpack HQofficer;
	HQofficer setdir 180;
	removeallweapons HQofficer;
	HQofficer switchMove "acts_StandingSpeakingUnarmed";
	_group setGroupId ["HQ"];
};

publicVariable "HQofficer";

if (SINdebug == 1) then {
	systemChat format ["Officer Type set to: %1",HQofficer];
};

sleep 1;
//-----------------------------------
//-CREATE DEFENCES

if (SINside == "WEST") then {
	execVM "startup\blufor\SIN_guards.sqf";
	execVM "startup\blufor\SIN_static.sqf";
};

if (SINside == "EAST") then {
	execVM "startup\opfor\SIN_guards.sqf";
	execVM "startup\opfor\SIN_static.sqf";
};

if (SINside == "RESISTANCE") then {
	execVM "startup\resistance\SIN_guards.sqf";
	execVM "startup\resistance\SIN_static.sqf";
};

patrolpos = [(SINbasepos select 0)-40,SINbasepos select 1];
[SINbasepos,patrolpos,250] call SIN_fnc_createFriendlyPatrol;
[SINbasepos,patrolpos,250] call SIN_fnc_createFriendlyPatrol;

sleep 1;
//-----------------------------------
//-CREATE RESPAWN POINT

_marker = createMarker [hq_respawn_type, SINbasepos];
hq_respawn_type setMarkerPos SINbasepos;
sleep 0.1;

SINbase_created = "true";
publicVariable "SINbase_created";

sleep 1;
if (SINdebug == 1) then {systemChat "Base Creation script end"};