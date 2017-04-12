
_selected_soldier_index = _this select 0;
_soldier = _this select 1;
_name = _this select 2;
_indexNum = _this select 3;

waitUntil {sleep 2; !alive _soldier}; 

lbSetColor [2102, _indexNum, [1, 0, 0, 1]];

_soldier_timeheal = 600 + (random 600);
SIN_specOps_list select _selected_soldier_index set [6,_soldier_timeheal];
SIN_specOps_list select _selected_soldier_index set [1,"Injured"];

for [{_timer=_soldier_timeheal}, {_timer>0}, {_timer=_timer-1}] do {
    SIN_specOps_list select _selected_soldier_index set [12,_timer];
	sleep 1;
};
// soldier is healed
SIN_specOps_list select _selected_soldier_index set [6,0];
SIN_specOps_list select _selected_soldier_index set [1,"Ready"];
lbSetColor [2102, _indexNum, [1, 1, 1, 1]];

HQofficer sideChat format["Operative %1 is ready for duty",_name];