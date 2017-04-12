/*
	SIN zone finder
	Author: Sinbane
	Finds a location for zone
		
	TO MANUALLY PLACE IN EDITOR:
	Place a GAME LOGIC with editor with this as it's init field: _zone = ["Outpost",SIN_income,400,(getPos _this)] execVM "zone\SIN_createzone.sqf";
	"Outpost" is the name of the Zone
	SIN_income is the income gained. This will use whatever you have set in parameters, can be changed to any number
	400 is the radius of the zone. REMEMBER the actual zone size will be double this
	Leave (getPos _this) as it is
	
	Editor placed zones will be ignored by settings set in parameters
*/
if (SINdebug == 1) then {systemChat "SINBOT: Finding Zone Pos"};
//-----------------------------------
//-VARIABLES

_names = [
"Outpost",					//Land_Cargo_HQ_V1_F Land_Cargo_Patrol_V1_F
"Power Relay",				//Land_dp_transformer_F
"Bunker",					//Land_Bunker_F
"Water Supply",				//Land_ReservoirTank_V1_F
"Solar Power Generator",	//Land_spp_Panel_F
"Comm Relay",				//Land_Communication_F
"Medical Center",			//Land_Medevac_HQ_V1_F
"Resource Heavy Area"
];

zoneSize = floor (random SINzoneMaxSize);
sleep 0.1;
if (zoneSize < 250) then {
	zoneSize = zoneSize + 250;
};

//-----------------------------------
//-FIND POS

if (SINzones_created < 1 && SINzonePlacement == 0) then {
	zone_pos = [SINbasepos,SINzoneMinDist,SINzoneMaxDist,5,0,0.4,0] call BIS_fnc_findSafePos;
	sinzonesarray = [];
	sleep 0.2;
};

if (SINzones_created > 0 && SINzonePlacement == 0) then {

	_found_distance = false;
	
	while {!_found_distance} do {
	
		_pos_fail = 0;
		zone_pos = [SINbasepos,SINzoneMinDist,SINzoneMaxDist,5,0,0.4,0] call BIS_fnc_findSafePos;
		SIN_distance = [];
		
		if (0 != zone_pos select 0 && 0 != zone_pos select 1) then {
	   
			for [{_t=1}, {_t<=count sinzonesarray}, {_t=_t+1}] do {                                               
				_index = _t-1;
				SIN_distance pushBack ((sinzonesarray select _index) distance (zone_pos));
			};
						
			for [{_t=1}, {_t<=count SIN_distance}, {_t=_t+1}] do {                                               
				_index = _t-1;
				_check = (SIN_distance select _index);
				if (_check < SINzoneMinDist || _check > SINzoneMaxDist) then {
					_pos_fail = 1;
				};
			};

			if (_pos_fail == 1) then {
				_found_distance = false;
			} else {
				_found_distance = true;
			};
		};
		
	};
};

if (SINzonePlacement == 1) then {
	
	_find = execVM "zone\SIN_zoneManual.sqf";
	waitUntil {scriptDone _find};
	
};

zone_pos = [round (zone_pos select 0),round (zone_pos select 1)];
sinzonesarray pushBack zone_pos;
		   
if (SINdebug == 1) then {systemChat format ["SINBOT: Zone Pos: %1",zone_pos]};
if (SINdebug == 1) then {systemChat format ["SINBOT: Zone Size: %1",(zoneSize * 2)]};
//-----------------------------------
//-DECIDE WHAT KIND OF ZONE

_name = selectRandom _names;

sleep 0.2;
if (SINdebug == 1) then {systemChat format ["SINBOT: Zone Type: %1",_name];};
//-----------------------------------
//-CREATE THE ZONE

_zone = [_name,SIN_income,zoneSize,zone_pos] execVM "zone\SIN_createzone.sqf";
waitUntil {scriptDone _zone};

//-----------------------------------