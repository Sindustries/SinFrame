_index2 = lbCurSel 1503;

switch (_index2) do
{
    case 0:  
    {
        if (SINmoney >= 50000) then {
            if (!support_hqheli_available) then {
                SINmoney = SINmoney - 50000;
                ctrlSetText [1001, format["$%1",SINmoney]];
                execVM "support\SIN_HQheli.sqf";
                lbSetColor [1503, 0, [0, 1, 0, 1]];
                support_hqheli_available = true;
            } else {
                HQofficer sideChat "This support is already unlocked";
            };    
        } else {
            HQofficer sideChat "You cannot afford this";
        };
    };
	
	case 1:  
    {
        if (SINmoney >= 25000) then {
            if (!support_supplydrop_available) then {
				if (!support_hqheli_available) then {
					HQofficer sideChat "This support requires the HQ helicopter";
				} else {
					SINmoney = SINmoney - 25000;
					ctrlSetText [1001, format["$%1",SINmoney]];
					_supplydrop = [player,"SINsupplydrop"] call BIS_fnc_addCommMenuItem;
					lbSetColor [1503, 1, [0, 1, 0, 1]];
					support_supplydrop_available = true;
				};
            } else {
                HQofficer sideChat "This support is already unlocked, or you haven't unlocked the HQ helicopter";
            };    
        } else {
            HQofficer sideChat "You cannot afford this";
        };
    };
	
	case 2:  
    {
        if (SINmoney >= 120000) then {
            if (!support_artillery_available) then {
                SINmoney = SINmoney - 120000;
                ctrlSetText [1001, format["$%1",SINmoney]];
                _supplydrop = [player,"SINartillery"] call BIS_fnc_addCommMenuItem;
                lbSetColor [1503, 2, [0, 1, 0, 1]];
                support_artillery_available = true;
            } else {
                HQofficer sideChat "This support is already unlocked";
            };    
        } else {
            HQofficer sideChat "You cannot afford this";
        };
    };
	
	case 3:  
    {
        if (SINmoney >= 60000) then {
            if (!support_reinforcements_available) then {
				if (!support_hqheli_available) then {
					HQofficer sideChat "This support requires the HQ helicopter";
				} else {
					SINmoney = SINmoney - 60000;
					ctrlSetText [1001, format["$%1",SINmoney]];
					_support = [player,"SINreinforcements"] call BIS_fnc_addCommMenuItem;
					lbSetColor [1503, 3, [0, 1, 0, 1]];
					support_reinforcements_available = true;
				};
            } else {
                HQofficer sideChat "This support is already unlocked";
            };    
        } else {
            HQofficer sideChat "You cannot afford this";
        };
    };
	
	case 4:  
    {
        if (SINmoney >= 20000) then {
            if (!support_helitransport_available) then {
				if (!support_hqheli_available) then {
					HQofficer sideChat "This support requires the HQ helicopter";
				} else {
					SINmoney = SINmoney - 20000;
					ctrlSetText [1001, format["$%1",SINmoney]];
					_support = [player,"SINhelitransport"] call BIS_fnc_addCommMenuItem;
					lbSetColor [1503, 4, [0, 1, 0, 1]];
					support_helitransport_available = true;
					execVM "support\SIN_heliTransport_action.sqf";
				};
            } else {
                HQofficer sideChat "This support is already unlocked";
            };    
        } else {
            HQofficer sideChat "You cannot afford this";
        };
    };
	
	case 5:  
    {
        if (SINmoney >= 10000) then {
            if (!support_boattransport_available) then {
				if (!support_hqheli_available) then {
					HQofficer sideChat "This support requires the HQ helicopter";
				} else {
					SINmoney = SINmoney - 10000;
					ctrlSetText [1001, format["$%1",SINmoney]];
					_support = [player,"SINboattransport"] call BIS_fnc_addCommMenuItem;
					lbSetColor [1503, 5, [0, 1, 0, 1]];
					support_boattransport_available = true;
				};
            } else {
                HQofficer sideChat "This support is already unlocked";
            };    
        } else {
            HQofficer sideChat "You cannot afford this";
        };
    };
	
	case 6:  
    {
        if (SINmoney >= 15000) then {
            if (!support_cardrop_available) then {
                if (!support_hqheli_available) then {
					HQofficer sideChat "This support requires the HQ helicopter";
				} else {
					SINmoney = SINmoney - 15000;
					ctrlSetText [1001, format["$%1",SINmoney]];
					_support = [player,"SINcardrop"] call BIS_fnc_addCommMenuItem;
					lbSetColor [1503, 6, [0, 1, 0, 1]];
					support_helicardrop_available = true;
				};
            } else {
                HQofficer sideChat "This support is already unlocked";
            };    
        } else {
            HQofficer sideChat "You cannot afford this";
        };
    };
	


};

publicVariable "SINmoney";
publicVariable "support_supplydrop_available";
publicVariable "support_artillery_available";
publicVariable "support_reinforcements_available";
publicVariable "support_helitransport_available";
publicVariable "support_cardrop_available";
publicVariable "support_hqheli_available";


