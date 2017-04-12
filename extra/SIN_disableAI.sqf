/*
	DisableAI save/load workaround
	Author; Sinbane
*/
if (SINdebug == 1) then {systemChat "SIN_disableAI active"};
_disableAi = _this select 0; 
//-----------------------------------
//-OPEN LOOP
while {true} do {
//-----------------------------------
	
	if (alive _disableAi) then {
		_disableAi disableAI "TARGET";
		_disableAi disableAI "AUTOTARGET";
		_disableAi disableAI "AUTOCOMBAT";
		sleep 120;
	};
	if (!alive _disableAi) exitWith {};
	
//-----------------------------------
//-CLOSE LOOP
};	