/*
	Artillery Support
	By Sinbane
*/
//-----------------------------------
//-CHECK IF ENOUGH MONEY

if (SINmoney < 30000) exitWith {
	["info",["You cannot afford this","$30000 required)"]] call bis_fnc_showNotification;
	sleep 5;
	_support = [player,"SINartillery"] call BIS_fnc_addCommMenuItem;
};

SINmoney = SINmoney - 30000;
publicVariable "SINmoney";

//-----------------------------------
//-GET STRIKE LOCATION

chosen_placement = false;
clicked = false;
  
OnMapSingleClick "ClickedPos = _pos; clicked = true;";
openMap [true, true]; 

PAPABEAR sideChat "Designate artillery co-ordinates";

while {true} do {

    if (clicked) then {
		_findPos = [ClickedPos,0,0,0,0,1,0] call BIS_fnc_findSafePos;
		
		if (_findPos distance SINbasepos < 1000) then {
			clicked = false;
			PAPABEAR sideChat "Strike location is too close to HQ!";
		};
		
		if (0 == _findPos select 0 && 0 == _findPos select 1) then {
			clicked = false;
			titleText ["INVALID POSITION", "PLAIN", 1];
		} else 
		{
			onMapSingleClick "";
			openMap [false, false]; 
			chosen_placement = true;
			SIN_artillery_pos = _findPos;
			sleep 1;
			//cutText ["", "BLACK FADED", 999];
		};     
    };
  sleep 0.2;
  if (chosen_placement) exitwith {};
};

PAPABEAR sideChat "Co-ordinates received, artillery is a go";
_fire = execVM "support\SIN_artillery_fire.sqf";
waitUntil {scriptDone _fire};

//-----------------------------------
//-READD SUPPORT

PAPABEAR sideChat "Artillery Rearming";

sleep 300 + (random 300);
PAPABEAR sideChat "Artillery is on-line";
_support = [player,"SINartillery"] call BIS_fnc_addCommMenuItem;

//-----------------------------------