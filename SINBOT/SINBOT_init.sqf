/*
	SINBOT init
	Author: Sinbane
	Controls all AI
*/
if (SINdebug == 1) then {systemChat "---SINBOT: Please Wait---"};
//-----------------------------------
//-DEFINE VARIABLES

if (isnil ("SINBOT_attack_force")) then {SINBOT_attack_force = []};
if (isnil ("SINBOT_cAttack_force")) then {SINBOT_cAttack_force = []};
if (isnil ("SINBOT_attack_group")) then {SINBOT_attack_group = []};
if (isnil ("SINBOT_attack_vehic")) then {SINBOT_attack_vehic = []};
if (isnil ("SINBOT_attack_heli")) then {SINBOT_attack_heli = []};
if (isnil ("SINBOT_attack_jet")) then {SINBOT_attack_jet = []};
if (isnil ("SINBOT_cAttack_group")) then {SINBOT_cAttack_group = []};
if (isnil ("SINBOT_cAttack_vehic")) then {SINBOT_cAttack_vehic = []};
if (isnil ("SINBOT_sidetroopLimit")) then {SINBOT_sidetroopLimit = SINaiLimit * 0.5};
if (isnil ("SINBOT_sidetroopCount")) then {SINBOT_sidetroopCount = 0};
if (isnil ("SINBOT_enemytroopLimit")) then {SINBOT_enemytroopLimit = SINaiLimit * 0.5};
if (isnil ("SINBOT_enemytroopCount")) then {SINBOT_enemytroopCount = 0};
if (isnil ("SINBOT_troopCount")) then {SINBOT_troopCount = SINBOT_sidetroopCount + SINBOT_enemytroopCount};
if (isnil ("SINBOT_vehicCount")) then {SINBOT_vehicCount = 0};
if (isnil ("SINBOT_heliCount")) then {SINBOT_heliCount = 0};
if (isnil ("SINBOT_jetCount")) then {SINBOT_jetCount = 0};

publicVariable "SINBOT_sidetroopLimit";
publicVariable "SINBOT_sidetroopCount";
publicVariable "SINBOT_enemytroopLimit";
publicVariable "SINBOT_enemytroopCount";
publicVariable "SINBOT_troopCount";
publicVariable "SINBOT_vehicCount";
publicVariable "SINBOT_heliCount";
publicVariable "SINBOT_jetCount";

waitUntil {SINbase_created == "true" && SINenemybase_created == "true" && SINzones_created >= SINmaxZones};
//-----------------------------------
//-BEGIN ATTACK WAVES

execVM "SINBOT\SIN_attackWave.sqf";
execVM "SINBOT\SIN_defendWave.sqf";

//-----------------------------------
if (SINdebug == 1) then {systemChat "---SINBOT: ONLINE---"};