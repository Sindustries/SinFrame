	
	if (SINmoney < 10000) exitWith {HQofficer sideChat "We don't have enough money to fund this (Minimum $10,000 required)"};
	if (SIN_recruit_active) exitWith {HQofficer sideChat "We can only have one recruitment drive active at once"};

	SIN_recruit_active = true;
	
	_cost = floor (random 10000);
	_gain = floor (random 20);
	
	SINmoney = SINmoney - _cost;
	publicVariable "SINmoney";
	ctrlSetText [1000, format["%1",SINmoney]];
	
	HQofficer sideChat "Roger that, we will attempt to recruit some locals to our side. This will take some time.";

	sleep 300 + (random 300) - (random 300);	
	
	SINside_forcepower = SINside_forcepower + _gain;
	publicVariable "SINside_forcepower";
	ctrlSetText [1002, format["%1",SINside_forcepower]];
	
	HQofficer sideChat format["We have successfully recruited locals to our ranks. The operation has cost us $%1",_cost,];
	
	SIN_recruit_active = false;