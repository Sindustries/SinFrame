/*
	Helicopter Destination
	Author: Sinbane
	Description: Allows player to select heli transport location
*/
//-----------------------------------
//-VARIABLES

chosen_placement = false;
clicked = false;
  
OnMapSingleClick "ClickedPos = _pos; clicked = true;";
openMap [true, true]; 

titleText ["CLICK SOMEWHERE FOR TRANSPORT LOCATION", "PLAIN", 1];

while {true} do {

    if (clicked) then {
		_findPos = [ClickedPos,0,75,8,0,0.4,0] call BIS_fnc_findSafePos;
		
		if (0 == _findPos select 0 && 0 == _findPos select 1) then {
			clicked = false;
			titleText ["INVALID POSITION", "PLAIN", 1];
		} else 
		{
			onMapSingleClick "";
			openMap [false, false]; 
			chosen_placement = true;
			SIN_heliTransport_location = _findPos;
			sleep 1;
		};     
    };
  sleep 0.2;
  if (chosen_placement) exitwith {};
};

