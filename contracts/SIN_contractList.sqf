

	_missionArray = [[(_foundSafepos select 0)+(random _radius)-(random _radius),(_foundSafepos select 1)+(random _radius)-(random _radius)],
	{_handle = [PosOfCase0Mission] execVM "missions\missions\rescue\mission.sqf"; _handle = execVM "missions\missionTimer.sqf"},
	MissionNameCase0,
	"A friendly patrol has been ambushed and needs to be rescued in this area",
	"",
	"\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa",
	1,
	[]
	];
	_array_of_missions pushBack [_missionArray];
	
	SIN_missionList = [
	["Escort","Escort a high-ranking official from this area back to HQ"],
	["",""],
	["",""],
	["",""],
	["",""],
	["",""],
	["",""],
	["",""],
	["",""],
	["",""]
	];
