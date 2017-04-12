/*
	SIN Zone Captured
	Author: Sinbane
*/
//-----------------------------------
//-DEFINE VARIABLES

_name   =   _this select 0; 
_income =   _this select 1;
_markername = _this select 2;
_markername2 = _this select 3;
_pos = _this select 4;
_size = _this select 5;

//-----------------------------------
//-REMOVE ZONE FROM FRIENDLY CONTROL

_index = 0;
{
	if ((_x select 0 == _pos select 0) && (_x select 1 == _pos select 1)) exitWith {
		SINside_controlledzones deleteAt _index;
	}; 
_index = _index + 1;
} forEach SINside_controlledzones;

//-----------------------------------
//-UPDATE INCOME

if (isServer) then {
	SIN_income = SIN_income - _income;
	publicVariable "SIN_income";
};

//-----------------------------------
//-ADD TO ENEMY CONTROLLED ZONES

SINenemy_controlledzones pushBack _pos;

//-----------------------------------
//-UPDATE FORCE POWER

SINside_forcepower = SINside_forcepower - (0 + floor (random 25));
SINenemy_forcepower = SINenemy_forcepower + (25 + floor (random 25));
publicVariable "SINside_forcepower";
publicVariable "SINenemy_forcepower";

//-----------------------------------
//-UPDATE MARKERS

str(_markername) setMarkerColor SINenemycolour;
str(_markername2) setMarkerColor SINenemycolour;

sleep 2;
//-----------------------------------
//-SET ZONE AS RECAPTURABLE

private "_trg";
call compile format["_trg = trigger%1%2",round (_pos select 0),round (_pos select 1)];

_trg setTriggerActivation[SIN_capture_side,"PRESENT",true];
_trg setTriggerStatements["this", format["[""%1"",%2,""%3"",""%4"",%5,%6] execvm 'zone\SIN_zonerecap.sqf'",_name,_income,_markername,_markername2,_pos,_size], ""];

SINenemy_controlledzones = [SINenemy_controlledzones,[SINbasepos],{_input0 distance _x},"ASCEND"] call BIS_fnc_sortBy;

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
		[SINenemybasepos,patrolpos,_size] call SIN_fnc_createEnemyPatrol;
		_patrol =  _patrol + _patrol;
	};
	if (_counter == _fireteam && SINBOT_enemytroopCount < SINBOT_enemytroopLimit) then {
		[SINenemybasepos,patrolpos,_size] call SIN_fnc_createEnemyFireteam;
		_fireteam = _fireteam + _fireteam;
	};
	if (_counter == _vehic && SINBOT_vehicCount < SINvehicLimit) then {
		[SINenemybasepos,patrolpos,_size] call SIN_fnc_createEnemyVehic;
		_vehic = _vehic + _vehic;
	};
	if (_counter == _heli && SINattackheli == 1 && SINBOT_heliCount < SINheliLimit) then {
		[SINenemybasepos,patrolpos,_size] call SIN_fnc_createEnemyHeli;
		_heli = _heli + _heli;
	};
	
	_counter = _counter + _check;
};

//-----------------------------------
//-UPDATE FORCE WAYPOINTS

{
	if ((count (waypoints _x)) > 0) then {
		while {(count (waypoints _x)) > 0} do {
			deleteWaypoint ((waypoints _x) select 0);
		};
	};
	[_x] call SIN_fnc_WP;
} forEach SINBOT_attack_force;

{
	if ((count (waypoints _x)) > 0) then {
		while {(count (waypoints _x)) > 0} do {
			deleteWaypoint ((waypoints _x) select 0);
		};
	};
	[_x] call SIN_fnc_WP_cAttack;
} forEach SINBOT_cAttack_force;

//-----------------------------------
//-CONFIRMATION

HQofficer sideChat format["The %1 has been recaptured. We're losing ground!",_name];

//-----------------------------------