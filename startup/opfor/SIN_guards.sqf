/*
	SinFrame Base Creation :: Guards
	Author: Sinbane
	Description: Creates multiple guards to defend the HQ
*/
if (SINdebug == 1) then {systemChat "Base Creation: Guards script begin"};
//-----------------------------------
//-DEFINE VARIABLES

_soldier = "O_Soldier_F";

//-----------------------------------
//-STATIC GUARDS

_HQguards = createGroup EAST;
_HQguard1 = _HQguards createUnit [_soldier, SINbasepos, [], 0, "FORM"]; 
_HQguard1 setpos [(SINbasepos select 0)-6.5, (SINbasepos select 1)-1.6];
_HQguard1 setdir 270;
[_HQguard1,"STAND","FULL"] call BIS_fnc_ambientAnimCombat;

//-----------------------------------
//-PATROLLING GUARD

_HQPatrol = createGroup EAST;
_HQguard5 = _HQPatrol createUnit [_soldier, SINbasepos, [], 0, "FORM"]; 
_HQguard5 setpos [(SINbasepos select 0)+10, (SINbasepos select 1)+10];

_HQPatrol setCombatMode "YELLOW";
_wp = _HQPatrol addWaypoint [[(SINbasepos select 0)+10, (SINbasepos select 1)+10], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

_wp = _HQPatrol addWaypoint [[(SINbasepos select 0)-10, (SINbasepos select 1)+10], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";	
	
_wp = _HQPatrol addWaypoint [[(SINbasepos select 0)-10, (SINbasepos select 1)-10], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";	

_wp = _HQPatrol addWaypoint [[(SINbasepos select 0)+10, (SINbasepos select 1)-10], 0];
_wp setWaypointType "MOVE";
	
_wp = _HQPatrol addWaypoint [[(SINbasepos select 0)+10, (SINbasepos select 1)+10], 0];
_wp setWaypointType "CYCLE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";

if (SINdebug == 1) then {systemChat "Base Creation: Guards script end"};
	