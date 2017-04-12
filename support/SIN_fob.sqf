/*
	SinFrame FOB Support
	Author: Sinbane
	Description: Creates a FOB where attacks wave will spawn from
*/
if (SINdebug == 1) then {systemChat "Base Creation script begin"};
//-----------------------------------
//-CHECKS

if (player distance SINbasepos < 1000) exitWith {
	HQofficer sideChat "You are too close to HQ to request a FOB!";
	sleep 5;
	_support = [player,"SINfob"] call BIS_fnc_addCommMenuItem;
};

if (SINmoney < 100000) exitWith	{
	HQofficer sideChat "You cannot afford this ($100,000 required)";
	sleep 5;
	_support = [player,"SINfob"] call BIS_fnc_addCommMenuItem;
};

SINmoney = SINmoney - 100000;
publicVariable "SINmoney";
//-----------------------------------
//-FIND POS

_counter = 0;
_found_distance = false;
	
while {!_found_distance} do {
	
	if (_counter >= 10) exitWith {
		HQofficer sideChat "We could not find a suitable location for the FOB, try elsewhere.";
		sleep 5;
		_support = [player,"SINfob"] call BIS_fnc_addCommMenuItem;
	};
	
	_pos_fail = 0;
	_FOBpos = [(getPosWorld player),5,250,10,0,0.4,0] call BIS_fnc_findSafePos;
	_distance = [];
	
	if (0 != _FOBpos select 0 && 0 != _FOBpos select 1) then {
   
		for [{_t=1}, {_t<=count SINenemy_controlledzones}, {_t=_t+1}] do {                                               
			_index = _t-1;
			_distance pushBack ((SINenemy_controlledzones select _index) distance (_FOBpos));
		};
					
		for [{_t=1}, {_t<=count _distance}, {_t=_t+1}] do {                                               
			_index = _t-1;
			_check = (_distance select _index);
			if (_check < 500) then {
				_pos_fail = 1;
			};
		};

		if (_pos_fail == 1) then {
			_found_distance = false;
		} else {
			_found_distance = true;
		};
	};
	_counter = _counter + 1;
};

sleep 1;
//-----------------------------------
//-CREATE FOB STRUCTURES & MARKER

_FOBname = [1] call compile preprocessFile "extra\SIN_getName.sqf";

_FOB = createVehicle ["Land_Cargo_HQ_V1_F", _FOBpos, [], 0, "NONE"];

_marker = createMarker ["HQMarker", _FOBpos];
_marker setMarkerShape "ICON";
_marker setMarkerColor SINsidecolour;
_marker setMarkerType "loc_Transmitter";
_marker setMarkerText format["FOB %1",_FOBname];
_marker setMarkerSize [0.75,0.75];

//-----------------------------------
//-ENEMY PROXIMITY NOTIFICATION

_warning = createTrigger["EmptyDetector",_FOBpos];
_warning setTriggerArea[300,300,0,false];
_warning setTriggerActivation[SINenemy,"PRESENT",true];
_warning setTriggerStatements["this",format ["HQofficer sidechat 'This is HQ, FOB %1 has detected enemies nearby and is requesting support!'",_FOBname], ""];

sleep 1;
//-----------------------------------
//-CREATE THE OFFICER

if (SINside == "WEST") then {
	_group = createGroup WEST;
	_FOBofficer = _group createUnit ["B_officer_F",_FOBpos, [], 0, "FORM"];
	_FOBofficer setpos [_FOBpos select 0, _FOBpos select 1, 0.59]; 
	_FOBofficer disableAI "AUTOTARGET";
	_FOBofficer disableAI "MOVE";
	removeBackpack _FOBofficer;
	_FOBofficer setdir 180;
	removeallweapons _FOBofficer;
	_FOBofficer switchMove "acts_StandingSpeakingUnarmed";
};

if (SINside == "EAST") then {
	_group = createGroup EAST;
	_FOBofficer = _group createUnit ["O_officer_F",_FOBpos, [], 0, "FORM"];
	_FOBofficer setpos [_FOBpos select 0, _FOBpos select 1, 0.59]; 
	_FOBofficer disableAI "AUTOTARGET";
	_FOBofficer disableAI "MOVE";
	removeBackpack _FOBofficer;
	_FOBofficer setdir 180;
	removeallweapons _FOBofficer;
	_FOBofficer switchMove "acts_StandingSpeakingUnarmed";
};

if (SINside == "RESISTANCE") then {
	_group = createGroup resistance;
	_FOBofficer = _group createUnit ["I_officer_F",_FOBpos, [], 0, "FORM"];
	_FOBofficer setpos [_FOBpos select 0, _FOBpos select 1, 0.59]; 
	_FOBofficer disableAI "AUTOTARGET";
	_FOBofficer disableAI "MOVE";
	removeBackpack _FOBofficer;
	_FOBofficer setdir 180;
	removeallweapons _FOBofficer;
	_FOBofficer switchMove "acts_StandingSpeakingUnarmed";
};

sleep 1;
//-----------------------------------
//-ACTIONS

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
[patrolpos,250] call SIN_fnc_createFriendlyPatrol;
[patrolpos,250] call SIN_fnc_createFriendlyPatrol;

sleep 1;
//-----------------------------------
//-CREATE RESPAWN POINT

_markername = format["%1%2",hq_respawn_type,SIN_markerNum];
_marker = createMarker [str(_markername), _FOBpos];
str(_markername) setMarkerPos _FOBpos;
SIN_markerNum = SIN_markerNum + 1;
publicVariable "SIN_markerNum";

sleep 1;
//-----------------------------------
//-ADD TO ATTACK WP

SINside_FOB = SINside_FOB + [_FOBpos];
SINside_FOB = [SINside_FOB,[(SINenemy_controlledzones select 0)],{_input0 distance _x},"ASCEND"] call BIS_fnc_sortBy;
publicVariable "SINside_FOB";

if (SINdebug == 1) then {systemChat "FOB Creation script end"};
//-----------------------------------