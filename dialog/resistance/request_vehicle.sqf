_index = lbCurSel 2101;

_spawnpos = [(getPos player),5,25,10,0,0.4,0] call BIS_fnc_findSafePos;

switch (_index) do
{
    case 0:  
    {
		if (SINmoney >= 2000) then {
			SINmoney = SINmoney - 2000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_G_Offroad_01_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 1:  
    {
		if (SINmoney >= 18000) then {
			SINmoney = SINmoney - 18000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_MRAP_03_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 2:  
    {
		if (SINmoney >= 10000) then {
			SINmoney = SINmoney - 10000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_Truck_02_transport_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 3:  
    {
		if (SINmoney >= 10000) then {
			SINmoney = SINmoney - 10000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_Truck_02_covered_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 4:  
    {
		if (SINmoney >= 15000) then {
			SINmoney = SINmoney - 15000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_G_Offroad_01_armed_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 5:  
    {
		if (SINmoney >= 20000) then {
			SINmoney = SINmoney - 20000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_MRAP_03_hmg_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 6:  
    {
		if (SINmoney >= 22000) then {
			SINmoney = SINmoney - 22000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_MRAP_03_gmg_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 7:  
    {
		if (SINmoney >= 50000) then {
			SINmoney = SINmoney - 50000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_Heli_light_03_unarmed_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 8:  
    {
		if (SINmoney >= 80000) then {
			SINmoney = SINmoney - 80000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_Heli_light_03_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 9:  
    {
		if (SINmoney >= 80000) then {
			SINmoney = SINmoney - 80000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_Heli_Transport_02_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 10:  
    {
		if (SINmoney >= 90000) then {
			SINmoney = SINmoney - 90000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_APC_tracked_03_cannon_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	case 11:  
    {
		if (SINmoney >= 120000) then {
			SINmoney = SINmoney - 120000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_MBT_03_cannon_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
	
	case 12:  
    {
		if (SINmoney >= 100000) then {
			SINmoney = SINmoney - 100000;
			ctrlSetText [1001, format["$%1",SINmoney]];
			_vehic = "I_APC_Wheeled_03_cannon_F" createVehicle _spawnPos;
		} else {
			HQofficer sideChat "You cannot afford this";
		};
    };
		
};

publicVariable "SINmoney";