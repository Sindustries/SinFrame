/*
	SIN zone creation
	Author: Sinbane
	TO MANUALLY PLACE:
	Place a GAME LOGIC in editor with this in the init field: _zone = ["Outpost",5000,50,getpos this] execvm "startup\zone\createzone.sqf";
	Where "Outpost" is the name of the Zone, 5000 is the max +income, 50 is the radius.
*/
waitUntil {SINbase_created == "true" && SINenemybase_created == "true"};
if (SINdebug == 1) then {systemChat "SINBOT: Creating Warzone";};
//-----------------------------------
//-DEFINE VARIABLES

_name = _this select 0; 
_income = _this select 1;
_size = _this select 2;
_pos = _this select 3;

if (SINsideParam == 1) then {
	SIN_capture_side = "WEST SEIZED";
};
if (SINsideParam == 2) then {
	SIN_capture_side = "EAST SEIZED";
};
if (SINsideParam == 3) then {
	SIN_capture_side = "GUER SEIZED";
};

if (SINenemyParam == 1) then {
	SINenemy_capture_side = "WEST SEIZED";
};
if (SINenemyParam == 2) then {
	SINenemy_capture_side = "EAST SEIZED";
};
if (SINenemyParam == 3) then {
	SINenemy_capture_side = "GUER SEIZED";
};

sleep 0.5;
//-----------------------------------
//-ADD ZONE TO ENEMY CONTROL

SINenemy_controlledzones pushBack _pos;

//-----------------------------------
//-CREATE ZONE MARKER & TRIGGER

sleep 0.5;

_markername = format["%1%2",round(_pos select 0),round(_pos select 1)];
_markerstr = createMarker [str(_markername),_pos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "hd_objective";
str(_markername) setMarkerColor SINenemyColour;
str(_markername) setMarkerText _name;
str(_markername) setMarkerSize [0, 0];
str(_markername) setMarkerAlpha 0.8;

sleep 0.5;

_markername2 = format["%1%2ellipse",round(_pos select 0),round(_pos select 1)];
_markerstr2 = createMarker [str(_markername2),_pos];
_markerstr2 setMarkerShape "ELLIPSE";
str(_markername2) setMarkerBrush "SolidBorder";
str(_markername2) setMarkerColor SINenemyColour;
str(_markername2) setMarkerSize [_size, _size];
str(_markername2) setMarkerAlpha 0.4; 

sleep 0.5;

_trg = format["trigger%1%2",round (_pos select 0),round (_pos select 1)];
_trg = createTrigger["EmptyDetector",_pos];
_trg setTriggerArea[_size,_size,0,false];
_trg setTriggerActivation[SIN_capture_side,"PRESENT",false];
_trg setTriggerStatements["this", format["[""%1"",%2,""%3"",""%4"",%5,%6] execvm 'zone\SIN_zonecaptured.sqf'",_name,_income,_markername,_markername2,_pos,_size], ""];
_trg setTriggerTimeout [30, 60, 300, true];

_triggerName = format["trigger%1%2",round (_pos select 0),round (_pos select 1)];
call compile format["%1 = _trg",_triggerName];

sleep 0.5;
//-----------------------------------
//-CREATE STRUCTURES

if (_name == "Outpost") then {
	_building = createVehicle ["Land_Cargo_HQ_V1_F", _pos, [], 0, "NONE"];
	_buildingPos = [_pos,0,SINzoneMaxDist,5,0,0.4,0] call BIS_fnc_findSafePos;
	sleep 0.5;
	_building = createVehicle ["Land_Cargo_Patrol_V1_F", _buildingPos, [], 0, "NONE"];
	_buildingPos = [_pos,0,SINzoneMaxDist,5,0,0.4,0] call BIS_fnc_findSafePos;
	sleep 0.5;
	_building = createVehicle ["Land_Cargo_Patrol_V1_F", _buildingPos, [], 0, "NONE"];
};

if (_name == "Power Relay") then {
	_building = createVehicle ["Land_dp_transformer_F", _pos, [], 0, "NONE"];
};

if (_name == "Bunker") then {
	_building = createVehicle ["Land_Bunker_F", _pos, [], 0, "NONE"];
};

if (_name == "Water Supply") then {
	_building = createVehicle ["Land_ReservoirTank_V1_F", _pos, [], 0, "NONE"];
};

if (_name == "Solar Power Generator") then {
	_building = createVehicle ["Land_spp_Panel_F", _pos, [], 0, "NONE"];
	_buildingPos = [_pos,0,SINzoneMaxDist,1,0,0.4,0] call BIS_fnc_findSafePos;
	sleep 0.5;
	_building = createVehicle ["Land_spp_Panel_F", _buildingPos, [], 0, "NONE"];
	_buildingPos = [_pos,0,SINzoneMaxDist,1,0,0.4,0] call BIS_fnc_findSafePos;
	sleep 0.5;
	_building = createVehicle ["Land_spp_Panel_F", _buildingPos, [], 0, "NONE"];
};

if (_name == "Comm Relay") then {
	_building = createVehicle ["Land_Communication_F", _pos, [], 0, "NONE"];
};

if (_name == "Medical Center") then {
	_building = createVehicle ["Land_Medevac_HQ_V1_F", _pos, [], 0, "NONE"];
};

sleep 0.5;
//-----------------------------------
//-CREATE ENEMIES

_zoneSize = _size * 2;
_counter = 0;
_check = 50;
_patrol = 250;
_fireteam = 500;
_vehic = 750;
_heli = 1000;

patrolpos = [(_pos select 0)-40,_pos select 1];

while {_counter < _zoneSize} do {
	if (_counter == _patrol && SINBOT_enemytroopCount < SINBOT_enemytroopLimit) then {
		[patrolpos,patrolpos,_size] call SIN_fnc_createEnemyPatrol;
		_patrol = _patrol + _patrol;
	};
	if (_counter == _fireteam && SINBOT_enemytroopCount < SINBOT_enemytroopLimit) then {
		[patrolpos,patrolpos,_size] call SIN_fnc_createEnemyFireteam;
		_fireteam = _fireteam + _fireteam;
	};
	if (_counter == _vehic && SINBOT_vehicCount < SINvehicLimit) then {
		[patrolpos,patrolpos,_size] call SIN_fnc_createEnemyVehic;
		_vehic = _vehic + _vehic;
	};
	if (_counter == _heli && SINattackheli == 1 && SINBOT_heliCount < SINheliLimit) then {
		[patrolpos,patrolpos,_size] call SIN_fnc_createEnemyHeli;
		_heli = _heli + _heli;
	};
	
	_counter = _counter + _check;
};

//-----------------------------------
//-FINISH

SINzonenum = SINzonenum + 1;
SINzones_created = SINzones_created + 1;
publicVariable "SINzonenum";
publicVariable "SINzones_created";

if (SINdebug == 1) then {systemChat "SINBOT: Zone Created";};
//-----------------------------------