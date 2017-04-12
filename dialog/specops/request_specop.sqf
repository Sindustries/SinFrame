
_index = lbCurSel 2102;

_spawnpos = [(getPos player),5,25,1,0,1,0] call BIS_fnc_findSafePos;

_selected_soldier = SIN_specOps_list select lbCurSel 2102;
_selected_soldier_index = lbCurSel 2102;

_selected_soldier_status = _selected_soldier select 1;
_selected_soldier_name = _selected_soldier select 2;
_selected_soldier_identity = _selected_soldier select 3;
_selected_soldier_class = _selected_soldier select 4;
_selected_soldier_headgear = _selected_soldier select 5;

switch (_index) do
{

for [{_t=1}, {_t<=count SIN_specOps_list}, {_t=_t+1}] do {

	spindexNum = _t-1;

	case spindexNum:  
	{

		if (SINmoney < 10000) exitWith {HQofficer sideChat "You can't afford this ($10,000 required)"};
		if (_selected_soldier_status == "Injured" || _selected_soldier_status == "Operating") then {
			if (_selected_soldier_status == "Injured") exitWith {HQofficer sideChat "Operative is injured"};
			if (_selected_soldier_status == "Operating") exitWith {HQofficer sideChat "Operative is already in the field"};
		} else {
			switch (_selected_soldier_status) do {
				case "Ready": {			
					SINmoney = SINmoney - 10000;
					
					_group = group player;

					_soldier = group player createUnit [_selected_soldier_class, _spawnpos, [], 0, "FORM"];
					removeGoggles _soldier;
					_soldier setidentity _selected_soldier_identity;
					_soldier addHeadgear _selected_soldier_headgear;
					
					[_soldier] call SIN_fnc_setSpec;
					
					lbSetColor [2102, spindexNum, [0, 1, 0, 1]];
					SIN_specOps_list select lbCurSel 2102 set [1,"Operating"];
					_inj = [_selected_soldier_index,_soldier,_selected_soldier_name,spindexNum] execVM "dialog\specOps\SIN_specops_injured.sqf";
				};
			};		
		};
	};

};
};
  
ctrlSetText [1001, format["$%1",SINmoney]];  
publicVariable "SINmoney";