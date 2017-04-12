/*
	Artillery Strike Support: Fire
	By Sinbane
*/


sleep 0.1;

_artilleryMarker = createMarker ["artyMarker", SIN_artillery_pos];
_artilleryMarker setMarkerShape "ELLIPSE";
_artilleryMarker setMarkerBrush "Grid";
_artilleryMarker setMarkerColor "ColorOpfor";
_artilleryMarker setMarkerSize [160,160];
_artilleryMarker setMarkerAlpha 1;

_artilleryMarker2 = createMarker ["artyMarker2", SIN_artillery_pos];
_artilleryMarker2 setMarkerShape "ICON";
_artilleryMarker2 setMarkerType "o_art";
_artilleryMarker2 setMarkerColor "ColorOpfor";
_artilleryMarker2 setMarkerSize [0.75,0.75];
_artilleryMarker2 setMarkerAlpha 1;

	_MLRS1pos = [SINbasepos,30,250,5,0,0.4,0] call BIS_fnc_findSafePos;
	_MLRS2pos = [SINbasepos,30,250,5,0,0.4,0] call BIS_fnc_findSafePos;
	
	_MLRSgroupab = createGroup west; 
	
	_MLRS1 = "B_MBT_01_mlrs_F" createVehicle (_MLRS1pos);
	_MLRS1gunner = _MLRSgroupab createUnit ["b_g_survivor_F", [5,5,5], [], 0, "NONE"];
	_MLRS1gunner moveingunner _MLRS1;
	_MLRS1gunner allowfleeing 0;
	
	_MLRS2 = "B_MBT_01_mlrs_F" createVehicle (_MLRS2pos);
	_MLRS2gunner = _MLRSgroupab createUnit ["b_g_survivor_F", [5,5,5], [], 0, "NONE"];
	_MLRS2gunner moveingunner _MLRS2;
	_MLRS2gunner allowfleeing 0;
	
	PAPABEAR sideChat "Artillery commencing";
	
	for [{_i=0}, {_i<12}, {_i=_i+1}] do {	
		if ("12Rnd_230mm_rockets" in getArtilleryAmmo [_MLRS1,_MLRS2]) then {
	
			_MLRS1 commandArtilleryFire [[(SIN_artillery_pos select 0)+(random 150)-(random 150), (SIN_artillery_pos select 1)+(random 150)-(random 150), 0], "12Rnd_230mm_rockets", 1];
			_MLRS2 commandArtilleryFire [[(SIN_artillery_pos select 0)+(random 150)-(random 150), (SIN_artillery_pos select 1)+(random 150)-(random 150), 0], "12Rnd_230mm_rockets", 1];
			
			sleep 6;
		};
	};
	
	PAPABEAR sideChat "Artillery salvo complete";	
	
	deleteVehicle _MLRS1;
	deleteVehicle _MLRS1gunner;
	deleteVehicle _MLRS2;
	deleteVehicle _MLRS2gunner;
		
	sleep 60;		
		
	deleteMarker "artyMarker";
	deleteMarker "artyMarker2";
	SIN_artillery_pos = [];