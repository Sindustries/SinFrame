/*
	Mission: SinFrame
	Author: Sinbane
	Description: Completely rewritten Dynamic Warfare mode for Arma 3 which was heavily inspired by DUWS in terms of gameplay and coding, all credit goes to kibot for DUWS, without which, this would not have been possible.
	
	DO NOT EDIT ANYTHING IN THIS INIT EXCEPT:	
	- SINdebug = 0 to 1 to turn on debug messages
*/
enableSaving [false, false];
SINdebug = 1;
if (SINdebug == 1) then {systemChat "---DEBUG MODE ON---";};
//-----------------------------------
//-GET PARAMETER VARIABLES

//-TIME
SINtime = (paramsArray select 1);
SINtimemult = (paramsArray select 2);
//-GAME
SINenemyParam = (paramsArray select 4);
SINaiSkill = (paramsArray select 5);
//-BASE & ZONE
SINbaseManual = (paramsArray select 7);
SINmaxZones = (paramsArray select 8);
SINzonePlacement = (paramsArray select 9);
SINzoneMinDist = (paramsArray select 10);
SINzoneMaxDist = (paramsArray select 11);
SINzoneMaxSize = (paramsArray select 12);
SINattackheli = (paramsArray select 13);
SINattackjet = (paramsArray select 14);
SINwaveDelay = (paramsArray select 15);
//-MISC
SINmoney = (paramsArray select 17);
SIN_income = (paramsArray select 18);
SINside_forcepower = (paramsArray select 19);
SINenemy_forcepower = (paramsArray select 20);
//-AI SETTINGS
SINaiLimit = (paramsArray select 22);
SINinfcache = (paramsArray select 23);
SINvehicLimit = (paramsArray select 24);
SINcarcache = (paramsArray select 25);
SINheliLimit = (paramsArray select 26);
SINjetLimit = (paramsArray select 27);
SINaircache = (paramsArray select 28);
SINboatcache = (paramsArray select 29);
SINdebugcacheParam = (paramsArray select 30);

//-----------------------------------
//-SIDE

if (side player == WEST) then {
	SINsideParam = 1;
	SINside = "WEST";
	SINsidecolour = "colorWEST";
	SINsmoketype = "SmokeShellBlue";
	execVM "SINBOT\blufor\SIN_unitList.sqf";
};
if (side player == EAST) then {
	SINsideParam = 2;
	SINside = "EAST";
	SINsidecolour = "colorEAST";
	SINsmoketype = "SmokeShellRed";
	execVM "SINBOT\opfor\SIN_unitList.sqf";		
};
if (side player == RESISTANCE) then {
	SINsideParam = 3;
	SINside = "RESISTANCE";
	SINsidecolour = "ColorIndependent";
	SINsmoketype = "SmokeShellGreen";
	execVM "SINBOT\resistance\SIN_unitList.sqf";
};

if (SINenemyParam == 1) then {
	SINenemy = "WEST";
	SINenemyColour = "colorWEST";
	execVM "SINBOT\blufor\SIN_enemyList.sqf";
};
if (SINenemyParam == 2) then {
	SINenemy = "EAST";
	SINenemyColour = "colorEAST";
	execVM "SINBOT\opfor\SIN_enemyList.sqf";
};
if (SINenemyParam == 3) then {
	SINenemy = "RESISTANCE";
	SINenemyColour = "ColorIndependent";
	execVM "SINBOT\resistance\SIN_enemyList.sqf";
};

//-----------------------------------
//-ZONE 

if (isnil ("SINzones_created")) then {SINzones_created = 0};
if (isnil ("SINzonenum")) then {SINzonenum = 1};
if (isnil ("SINzonesarray")) then {SINzonesarray = []};
if (isnil ("SINzonescontrolled")) then {SINzonescontrolled = 0};
if (isnil ("SINside_controlledzones")) then {SINside_controlledzones = []};
if (isnil ("SINenemy_controlledzones")) then {SINenemy_controlledzones = []};
if (isnil ("SINside_forcepower")) then {SINside_forcepower = SINside_forcepower};
if (isnil ("SINenemy_forcepower")) then {SINenemy_forcepower = SINenemy_forcepower};
if (isnil ("SINside_FOB")) then {SINside_FOB = []};

//-----------------------------------
//-SUPPORT 

if (isnil ("support_hqheli_available")) then {support_hqheli_available = false};
if (isnil ("support_supplydrop_available")) then {support_supplydrop_available = false};
if (isnil ("support_artillery_available")) then {support_artillery_available = false};
if (isnil ("support_reinforcements_available")) then {support_reinforcements_available = false};
if (isnil ("support_helitransport_available")) then {support_helitransport_available = false};
if (isnil ("support_boattransport_available")) then {support_boattransport_available = false};
if (isnil ("support_cardrop_available")) then {support_cardrop_available = false};
if (isnil ("support_fob_available")) then {support_fob_available = false};
if (isnil ("SIN_recruiting_active")) then {SIN_recruiting_active = false};

//-----------------------------------
//-MISC

if (isnil ("SIN_markerNum")) then {SIN_markerNum = 0};

//-----------------------------------
//-SET TIME OF DAY

setDate [2015, 1, 21, SINtime, 1];
setTimeMultiplier SINtimemult;

//-----------------------------------
//-PREPARE PLAYER

waitUntil {time > 0 && isPlayer player};
player enableSimulation false;
enableEnvironment false;
showChat true;
cutText ["GETTING GAME SETTINGS", "BLACK FADED", 999];

//-----------------------------------
//-PRE MAIN INIT
if (SINdebug == 1) then {systemChat "---COMPILING FUNCTIONS---"};

["Preload"] call BIS_fnc_arsenal; 

if (isServer) then {
	SIN_fnc_RTB = compile preprocessFile "fnc\SIN_fnc_RTB.sqf";
	SIN_fnc_setSpec = compile preprocessFile "fnc\SIN_fnc_setSpec.sqf";
	SIN_fnc_setSkill = compile preprocessFile "fnc\SIN_fnc_setSkill.sqf";
	SIN_fnc_onDeathEnemy = compile preprocessFile "fnc\SIN_fnc_onDeathEnemy.sqf";
	SIN_fnc_onDeathFriendly = compile preprocessFile "fnc\SIN_fnc_onDeathFriendly.sqf";
	SIN_fnc_addMoney = compile preprocessFile "fnc\SIN_fnc_addMoney.sqf";	
	
	SIN_fnc_pinmarker = compile preprocessFile "SINBOT\fnc\SIN_fnc_pinmarker.sqf";
	SIN_fnc_WP = compile preprocessFile "SINBOT\fnc\SIN_fnc_WP.sqf";
	SIN_fnc_WP_cAttack = compile preprocessFile "SINBOT\fnc\SIN_fnc_WP_cAttack.sqf";
	SIN_fnc_createFriendlyPatrol = compile preprocessFile "SINBOT\fnc\SIN_fnc_createFriendlyPatrol.sqf";
	SIN_fnc_createFriendlyFireteam = compile preprocessFile "SINBOT\fnc\SIN_fnc_createFriendlyFireteam.sqf";
	SIN_fnc_createFriendlyVehic = compile preprocessFile "SINBOT\fnc\SIN_fnc_createFriendlyVehic.sqf";
	SIN_fnc_createFriendlyHeli = compile preprocessFile "SINBOT\fnc\SIN_fnc_createFriendlyHeli.sqf";	
	SIN_fnc_createEnemyPatrol = compile preprocessFile "SINBOT\fnc\SIN_fnc_createEnemyPatrol.sqf";
	SIN_fnc_createEnemyFireteam = compile preprocessFile "SINBOT\fnc\SIN_fnc_createEnemyFireteam.sqf";
	SIN_fnc_createEnemyVehic = compile preprocessFile "SINBOT\fnc\SIN_fnc_createEnemyVehic.sqf";
	SIN_fnc_createEnemyHeli = compile preprocessFile "SINBOT\fnc\SIN_fnc_createEnemyHeli.sqf";	

};

if (isServer) then {
	if (SINdebugcacheParam == 0) then {SINdebugcache = false};
	if (SINdebugcacheParam == 1) then {SINdebugcache = true};
	
	[SINinfcache,-1,SINdebugcache,SINcarcache,SINaircache,SINboatcache] execVM "zbe_cache\main.sqf";
};


if (SINaiSkill == 1) then {SINaiSkill = 0.2};
if (SINaiSkill == 2) then {SINaiSkill = 0.4};
if (SINaiSkill == 3) then {SINaiSkill = 0.6};
if (SINaiSkill == 4) then {SINaiSkill = 0.8};
if (SINaiSkill == 5) then {SINaiSkill = 1};

sleep 1;
//-----------------------------------
//-LAUNCH MAIN INIT

_init = execVM "SIN_init.sqf";
waitUntil {scriptDone _init};

//-----------------------------------
//-POST MAIN INIT

_actions = [HQofficer] execVM "startup\SIN_HQactions.sqf";
execVM "startup\SIN_income.sqf";
execVM "dialog\specops\specOps_list.sqf";


player addMPEventHandler ["MPRespawn",{
	 HQofficer sideChat "Be more careful ya fanny!";
}];

//execVM "debug.sqf";

//-----------------------------------