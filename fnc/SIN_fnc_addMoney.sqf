	
	_add = _this select 0;
	
	SINmoney = SINmoney + _add;
	
	if (SINmoney >= 1000000) then {
		SINmoney = 999999;
	};
	
	publicVariable "SINmoney";
	