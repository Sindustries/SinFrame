/*
	SinFrame Base Creation Manual Selection
	Author: Sinbane
	Description: Allows host to select location for base placement
*/
//-----------------------------------
//-VARIABLES

cutText ["", "BLACK IN", 1];

chosen_placement = false;
clicked = false;
  
OnMapSingleClick "ClickedPos = _pos; clicked = true;";
openMap [true, true]; 

cutText ["CLICK SOMEWHERE FOR ENEMY HQ LOCATION", "PLAIN", 1];

while {true} do {

    if (clicked) then {
		_findPos = [ClickedPos,0,50,18,0,0.1,0] call BIS_fnc_findSafePos;
		
		if (0 == _findPos select 0 && 0 == _findPos select 1) then {
			clicked = false;
			titleText ["INVALID POSITION", "PLAIN", 1];
		} else 
		{
			cutText ["", "BLACK FADED", 999];
			onMapSingleClick "";
			openMap [false, false]; 
			chosen_placement = true;
			SINenemybasepos = _findPos;
			publicVariable "SINenemybasepos";
			sleep 1;
		};     
    };
  sleep 0.2;
  if (chosen_placement) exitwith {};
};

