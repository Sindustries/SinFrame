/*
	SINTEL - Contract Broker
	Author: Sinbane
	Gives player side missions to complete for extra $$ and/or FP
*/
if (SINdebug == 1) then {systemChat "---SINBOT: Broker Waking Up---"};
//-----------------------------------
//-VARIABLES & CHECKS

_contracts = [];  
_counter = 0;
if (isnil ("contract_available")) then {contract_available = true};

if (!contract_available) exitWith {HQofficer SideChat "We don't have any contracts for you right now"};
if (!isServer) exitWith {hint "Only the host can request contracts"};

startLoadingScreen ["Loading zones..."];
//-----------------------------------
//-FIND POS

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

for [{_t=1}, {_t<=count SIN_missionList}, {_t=_t+1}] do {
	_indexNum = _t-1;
	_mission = SIN_missionList select _indexNum;
	_name = = [1] call compile preprocessFile "extra\SIN_getName.sqf";
	_description = _mission select 1;
	_format = format["%1 (%2)",_name,_description];
	SIN_missionArray pushBack _format;
	
	case _indexNum:
	{
		_radius = 300;
		_missionname = [1] call compile preprocessFile "extra\SIN_getName.sqf";	
		PosOfCase0Mission = _foundSafepos;
		
		_missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
		{_handle = [PosOfCase0Mission] execVM "missions\missions\rescue\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
		MissionNameCase0,
		"A friendly patrol has been ambushed and needs to be rescued in this area",
		"",
		"\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa",
		1,
		[]
		];
		_array_of_missions = _array_of_missions + [_missionArray];
	};
	
}; 

//-----------------------------------
//-MISSION TYPES
	
switch (_counter) do
{

case 0: // mission RESCUE
{
	//add the mission into the strat map
	_radius = 300;
	MissionNameCase0 = [0] call compile preprocessFile "random_name.sqf";
	PosOfCase0Mission = _foundSafepos;
	
	_missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
	{_handle = [PosOfCase0Mission] execVM "missions\missions\rescue\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
	MissionNameCase0,
	"A friendly patrol has been ambushed and needs to be rescued in this area",
	"",
	"\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa",
	1,
	[]
	];
	_array_of_missions = _array_of_missions + [_missionArray];
};

};
_counter = _counter + 1;
_kibot_pos_array_missionPos = _kibot_pos_array_missionPos + [_foundSafePos];
};
	
	
	
 
 
 };



endLoadingScreen;

// -------****- NOW OPEN THE MAP

_isNight = false;
if ((20 < daytime) OR (daytime < 5)) then {_isNight=true};


[(findDisplay 46),                                                                          // 0: DISPLAY - parent display. When empty, mission display is used.
getpos player,                                                                // 1: ARRAY - default view position in format [x,y,y] or [x,y]
_array_of_missions,                                                              // 2: ARRAY - list of missions in format:             
[],                                                                           // 3: ARRAY - list of ORBAT groups in format:
[],                                                                           // 4: ARRAY - list of markers revealed in strategic map (will be hidden when map is closed)
[],                                                                           // 5: ARRAY - list of custom images in format:
1,                                                                            // 6: NUMBER - value in range <0-1> defining weather on strategic map (i.e. density of clouds)
_isNight                                                                         // 7: BOOL - true for night version of strategic map (darker with blue tone)
] call BIS_fnc_strategicMapOpen;

/*
Parameter(s):
		0: DISPLAY - parent display. When empty, mission display is used.
		1: ARRAY - default view position in format [x,y,y] or [x,y]
		2: ARRAY - list of missions in format:
			0: ARRAY - mission position in format [x,y,y] or [x,y]
			1: CODE - expression executed when user clicks on mission icon
			2: STRING - mission name
			3: STRING - short description
			4: STRING - name of mission's player
			5: STRING - path to overview image
			6: NUMBER - size multiplier, 1 means default size
			7: ARRAY - parameters for the -on click- code; referenced from the script as (_this select 9)
		3: ARRAY - list of ORBAT groups in format:
			0: ARRAY - group position in format [x,y,y] or [x,y]
			1: CONFIG - preview CfgORBAT group
			2: CONFIG - topmost displayed CfgORBAT group
			3: ARRAY - list of allowed tags
			4: NUMBER - maximum number of displayed tiers
		4: ARRAY - list of markers revealed in strategic map (will be hidden when map is closed)
		5: ARRAY - list of custom images in format:
			0: STRING - texture path
			1: ARRAY - color in format [R,G,B,A]
			2: ARRAY - image position
			3: NUMBER - image width (in metres)
			4: NUMBER - image height (in metres)
			5: NUMBER - image angle (in degrees)
			6: STRING - text displayed next to the image
			7: BOOL - true to display shadow
		6: NUMBER - value in range <0-1> defining weather on strategic map (i.e. density of clouds)
		7: BOOL - true for night version of strategic map (darker with blue tone)

	Returns:
	DISPLAY - RscDisplayStrategicMap
	*/