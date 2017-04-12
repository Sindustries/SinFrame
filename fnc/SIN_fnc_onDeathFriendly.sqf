
	SINenemy_forcepower = SINenemy_forcepower + 1;
	SINside_forcepower = SINside_forcepower - 1;	
	publicVariable "SINside_forcepower";
	publicVariable "SINenemy_forcepower";
	
	_group = group (_this select 0);
	_count = count units _group;
	if (_count < 1) then {
		_index = 0;
		{
			if (_x == _group) then {
				SINBOT_attack_force deleteAt _index;
			}; 
			_index = _index + 1;
		} forEach SINBOT_attack_force;
	};