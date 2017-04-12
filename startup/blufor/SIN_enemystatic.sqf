/*
	SinFrame Base Creation :: Static Defences
	Author: Sinbane
	Description: Creates multiple defences to the HQ
*/
if (SINdebug == 1) then {systemChat "Enemy Base Creation: Static Defences script begin"};
//-----------------------------------
//-DEFINE VARIABLES

_soldier = "B_Soldier_F";

//-----------------------------------
//-STATIC DEFENCES

_groupGuard = createGroup WEST;

_aa = createVehicle ["B_static_AA_F", [0,0,0], [], 0, "NONE"];
_aa allowdamage false;
_aa setdamage 0;
_aa setpos [SINenemybasepos select 0, SINenemybasepos select 1,3.109];

_HQguard1 = _groupGuard createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _aa;

_gl = createVehicle ["B_GMG_01_high_F", [0,0,0], [], 0, "NONE"];
_gl allowdamage false;
_gl setdamage 0;
_gl setpos [(SINenemybasepos select 0)-7, (SINenemybasepos select 1)+5.5];

_HQguard1 = _groupGuard createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _gl;

_at1 = createVehicle ["B_static_AT_F", [0,0,0], [], 0, "NONE"];
_at1 setpos [(SINenemybasepos select 0)-7, (SINenemybasepos select 1)-8];
_at1 allowdamage false;
_at1 setdamage 0;
_at1 setdir 215;

_HQguard1 = _groupGuard createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _at1;

_at2 = createVehicle ["B_HMG_01_high_F", [0,0,0], [], 0, "NONE"];
_at2 allowdamage false;
_at2 setdamage 0;
_at2 setpos [(SINenemybasepos select 0)+8, (SINenemybasepos select 1)-7];

_HQguard1 = _groupGuard createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _at2;

_at3 = createVehicle ["B_GMG_01_high_F", [0,0,0], [], 0, "NONE"];
_at3 allowdamage false;
_at3 setdamage 0;
_at3 setpos [(SINenemybasepos select 0)+7, (SINenemybasepos select 1)+8];

_HQguard1 = _groupGuard createUnit [_soldier, SINenemybasepos, [], 0, "FORM"]; 
_HQguard1 moveinGunner _at3;

//-----------------------------------
//-AMMO REFILL

_refill = [_aa, _gl, _at1, _at2, _at3] execVM "startup\SIN_staticrefill.sqf";

//-----------------------------------
//-LIGHTS

_light1 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light1 allowdamage false;
_light1 setdamage 0;
_light1 setpos [SINenemybasepos select 0, SINenemybasepos select 1];

_light2 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light2 allowdamage false;
_light2 setdamage 0;
_light2 setpos [(SINenemybasepos select 0)+5.5, (SINenemybasepos select 1)-5.5];

_light3 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light3 allowdamage false;
_light3 setdamage 0;
_light3 setpos [(SINenemybasepos select 0)-5.5, (SINenemybasepos select 1)+3.5];

_light4 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light4 allowdamage false;
_light4 setdamage 0;
_light4 setpos [(SINenemybasepos select 0)+5.5, (SINenemybasepos select 1)+3.5];

_light5 = createVehicle ["Land_Camping_Light_F", [0,0,0], [], 0, "NONE"];
_light5 allowdamage false;
_light5 setdamage 0;
_light5 setpos [(SINenemybasepos select 0)-5.5, (SINenemybasepos select 1)-5.5];


if (SINdebug == 1) then {systemChat "Enemy Base Creation: Static Defences script end"};
sleep 2;
