/*
	SinFrame Base Creation :: Guards
	Author: Sinbane
	Description: Creates multiple guards to defend the HQ
*/
if (SINdebug == 1) then {systemChat "Enemy Base Creation: Guards script begin"};
//-----------------------------------
//-DEFINE VARIABLES

_soldier = "I_Soldier_F";

//-----------------------------------
//-STATIC GUARDS

_HQguards = createGroup RESISTANCE;
_HQguard1 = _HQguards createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard1 setpos [(SINenemybasepos select 0)-6.5, (SINenemybasepos select 1)-1.6];
_HQguard1 setdir 270;
[_HQguard1,"STAND","FULL"] call BIS_fnc_ambientAnimCombat;

_HQguard2 = _HQguards createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard2 setpos [(SINenemybasepos select 0)-6.5, (SINenemybasepos select 1)-4.7];
_HQguard2 setdir 270;
[_HQguard2,"GUARD","FULL"] call BIS_fnc_ambientAnimCombat;

_HQguard3 = _HQguards createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard3 setpos [(SINenemybasepos select 0), (SINenemybasepos select 1)-7.58];
_HQguard3 setdir 180;
[_HQguard3,"LEAN","FULL"] call BIS_fnc_ambientAnimCombat;

_HQguard4 = _HQguards createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard4 setpos [(SINenemybasepos select 0), (SINenemybasepos select 1)-9];
_HQguard4 setdir 0;
[_HQguard4,"STAND","FULL"] call BIS_fnc_ambientAnimCombat;

//-----------------------------------
//-PATROLLING GUARD

_HQPatrol = createGroup RESISTANCE;
_HQguard5 = _HQPatrol createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard5 setpos [(SINenemybasepos select 0)+10, (SINenemybasepos select 1)+10];

_HQPatrol setCombatMode "YELLOW";
_wp = _HQPatrol addWaypoint [[(SINenemybasepos select 0)+10, (SINenemybasepos select 1)+10], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

_wp = _HQPatrol addWaypoint [[(SINenemybasepos select 0)-10, (SINenemybasepos select 1)+10], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";	
	
_wp = _HQPatrol addWaypoint [[(SINenemybasepos select 0)-10, (SINenemybasepos select 1)-10], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";	

_wp = _HQPatrol addWaypoint [[(SINenemybasepos select 0)+10, (SINenemybasepos select 1)-10], 0];
_wp setWaypointType "MOVE";
	
_wp = _HQPatrol addWaypoint [[(SINenemybasepos select 0)+10, (SINenemybasepos select 1)+10], 0];
_wp setWaypointType "CYCLE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

if (SINdebug == 1) then {systemChat "Enemy Base Creation: Guards script end"};
	