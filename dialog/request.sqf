/*
	REQUESTS MENU
	Author: Sinbane
*/
//-----------------------------------
//-DEFINE VARIABLES

_handle = createDialog "SINGUImain";  
waitUntil {dialog};
ctrlSetText [1001, format["$%1",SINmoney]];
ctrlSetText [1002, format["%1/%2",SINzonescontrolled,SINmaxZones]];
ctrlSetText [1003, format["%1",SINside_forcepower]];
ctrlSetText [1004, format["%1/%2",SINBOT_sidetroopCount,SINBOT_sidetroopLimit]];
ctrlSetText [1006, format["%1/%2",SINBOT_vehicCount,SINvehicLimit]];
ctrlSetText [1007, format["%1/%2",SINBOT_heliCount,SINheliLimit]];
ctrlSetText [1008, format["%1/%2",SINBOT_jetCount,SINjetLimit]];
ctrlSetText [1009, format["%1/%2",SINBOT_troopCount,SINaiLimit]];
	
//-----------------------------------
//-UNITS

if (SINside == "WEST") then {
		
	// UNITS  
	_index = lbAdd [2100, "Rifleman ($5,000)"];
	_index = lbAdd [2100, "Grenadier ($8,000)"];
	_index = lbAdd [2100, "Medic ($10,000)"];
	_index = lbAdd [2100, "Autorifleman ($9,000)"];
	_index = lbAdd [2100, "Sniper ($12,000)"];
	_index = lbAdd [2100, "Spotter ($6,000)"];
	_index = lbAdd [2100, "Marksman ($7,500)"];
	_index = lbAdd [2100, "Repair Specialist ($6,500)"];
	_index = lbAdd [2100, "Explosives Specialist ($7,500)"];
	_index = lbAdd [2100, "Ammo Bearer ($10,000)"];
	_index = lbAdd [2100, "Missile Specialist (AT) ($9,000)"];
	_index = lbAdd [2100, "Missile Specialist (AA) ($8,500)"];
	_index = lbAdd [2100, "Assault Diver ($6,000)"];
	_index = lbAdd [2100, "Explosive Specialist (Diver) ($8,000)"];
	_index = lbAdd [2100, "Helicopter Pilot ($2,000)"];
	
};
			
if (SINside == "EAST") then {

	// UNITS  
    _index = lbAdd [2100, "Rifleman ($5,000)"];
	_index = lbAdd [2100, "Grenadier ($8,000)"];
	_index = lbAdd [2100, "Medic ($10,000)"];
	_index = lbAdd [2100, "Autorifleman ($9,000)"];
	_index = lbAdd [2100, "Sniper ($12,000)"];
	_index = lbAdd [2100, "Spotter ($6,000)"];
	_index = lbAdd [2100, "Marksman ($7,500)"];
	_index = lbAdd [2100, "Repair Specialist ($6,500)"];
	_index = lbAdd [2100, "Explosives Specialist ($7,500)"];
	_index = lbAdd [2100, "Ammo Bearer ($10,000)"];
	_index = lbAdd [2100, "Missile Specialist (AT) ($9,000)"];
	_index = lbAdd [2100, "Missile Specialist (AA) ($8,500)"];
	_index = lbAdd [2100, "Assault Diver ($6,000)"];
	_index = lbAdd [2100, "Explosive Specialist (Diver) ($8,000)"];
	_index = lbAdd [2100, "Helicopter Pilot ($2,000)"];
	
};
if (SINside == "RESISTANCE") then {

	// UNITS  
    _index = lbAdd [2100, "Rifleman ($5,000)"];
	_index = lbAdd [2100, "Grenadier ($8,000)"];
	_index = lbAdd [2100, "Medic ($10,000)"];
	_index = lbAdd [2100, "Autorifleman ($9,000)"];
	_index = lbAdd [2100, "Sniper ($12,000)"];
	_index = lbAdd [2100, "Spotter ($6,000)"];
	_index = lbAdd [2100, "Marksman ($7,500)"];
	_index = lbAdd [2100, "Repair Specialist ($6,500)"];
	_index = lbAdd [2100, "Explosives Specialist ($7,500)"];
	_index = lbAdd [2100, "Ammo Bearer ($10,000)"];
	_index = lbAdd [2100, "Missile Specialist (AT) ($9,000)"];
	_index = lbAdd [2100, "Missile Specialist (AA) ($8,500)"];
	_index = lbAdd [2100, "Assault Diver ($6,000)"];
	_index = lbAdd [2100, "Explosive Specialist (Diver) ($8,000)"];
	_index = lbAdd [2100, "Helicopter Pilot ($2,000)"];

};
			
lbSetCurSel [2100, 0];

//-----------------------------------
//-SPECOPS 
/* TO ADD MORE SEE: specops\specOps_list.sqf */

for [{_t=1}, {_t<=count SIN_specOps_list}, {_t=_t+1}] do {
	_indexNum = _t-1;
	_soldier = SIN_specOps_list select _indexNum;
	_name = _soldier select 2;
	_class = _soldier select 0;
	_specop = format["%1 (%2)",_name,_class];
	_index0 = lbAdd [2102, _specop];
};
		
lbSetCurSel [2102, 0];

//-----------------------------------
//-VEHICLES  

if (SINside == "WEST") then {

	_index1 = lbAdd [2101, "Offroad ($2,000)"];
	_index1 = lbAdd [2101, "Hunter ($18,000)"];
	_index1 = lbAdd [2101, "HEMMT ($10,000)"];
	_index1 = lbAdd [2101, "HEMMT Covered ($10,000)"];
	_index1 = lbAdd [2101, "Armed Offroad ($15,000)"];
	_index1 = lbAdd [2101, "Hunter (HMG) ($20,000)"];
	_index1 = lbAdd [2101, "Hunter (GMG) ($22,000)"];
	_index1 = lbAdd [2101, "Hummingbird ($30,000)"];
	_index1 = lbAdd [2101, "AH-9 Pawnee ($70,000)"];
	_index1 = lbAdd [2101, "AH-99 Blackfoot ($200,000)"];
	_index1 = lbAdd [2101, "UH-80 Ghosthawk ($80,000)"];
	_index1 = lbAdd [2101, "CH-67 Huron ($90,000)"];
	_index1 = lbAdd [2101, "Sandstorm MLRS ($100,000)"];
	_index1 = lbAdd [2101, "M4 Scorcher ($90,000)"];
	_index1 = lbAdd [2101, "M2A1 Slammer ($120,000)"];
	_index1 = lbAdd [2101, "IFV-6a Cheetah AA ($80,000)"];	

};

if (SINside == "EAST") then {

	_index1 = lbAdd [2101, "Offroad ($2,000)"];
	_index1 = lbAdd [2101, "Ifrit ($18,000)"];
	_index1 = lbAdd [2101, "Tempest ($10,000)"];
	_index1 = lbAdd [2101, "Tempest Covered ($10,000)"];
	_index1 = lbAdd [2101, "Armed Offroad ($15,000)"];
	_index1 = lbAdd [2101, "Ifrit (HMG) ($20,000)"];
	_index1 = lbAdd [2101, "Ifrit (GMG) ($22,000)"];
	_index1 = lbAdd [2101, "PO-30 Orca (Unarmed) ($30,000)"];
	_index1 = lbAdd [2101, "PO-30 Orca ($70,000)"];
	_index1 = lbAdd [2101, "Mi-48 Kajman ($200,000)"];
	_index1 = lbAdd [2101, "Mi-290 Taru (Bench) ($80,000)"];
	_index1 = lbAdd [2101, "Mi-290 Taru (Transport) ($90,000)"];
	_index1 = lbAdd [2101, "2S9 Sochor ($90,000)"];
	_index1 = lbAdd [2101, "BTR-K Kamysh ($90,000)"];
	_index1 = lbAdd [2101, "T-100 Varsuk ($120,000)"];
	_index1 = lbAdd [2101, "ZSU-39 Tigris ($80,000)"];

};

if (SINside == "RESISTANCE") then {

	_index1 = lbAdd [2101, "Offroad ($2,000)"];
	_index1 = lbAdd [2101, "Strider ($18,000)"];
	_index1 = lbAdd [2101, "Zamak ($10,000)"];
	_index1 = lbAdd [2101, "Zamak Covered ($10,000)"];
	_index1 = lbAdd [2101, "Armed Offroad ($15,000)"];
	_index1 = lbAdd [2101, "Strider (HMG) ($20,000)"];
	_index1 = lbAdd [2101, "Strider (GMG) ($22,000)"];
	_index1 = lbAdd [2101, "WY-55 Hellcat (Unarmed) ($50,000)"];
	_index1 = lbAdd [2101, "WY-55 Hellcat ($80,000)"];
	_index1 = lbAdd [2101, "CH-49 Mohawk ($80,000)"];
	_index1 = lbAdd [2101, "FV-720 Mora ($90,000)"];
	_index1 = lbAdd [2101, "MBT-52 Kuma ($120,000)"];
	_index1 = lbAdd [2101, "AFV-4 Gorgon ($100,000)"];

};

lbSetCurSel [2101, 0];
 
//-----------------------------------
//-SUPPORTS

	index_support_hqheli = lbAdd [1503, "HQ Helicopter ($50,000)"];
	index_support_supply = lbAdd [1503, "Supply Drop ($25,000)"];
	index_support_arty = lbAdd [1503, "Artillery Strike ($120,000)"];
	index_support_reinforcements = lbAdd [1503, "Reinforcements ($60,000)"];
	index_support_helitransport = lbAdd [1503, "Helicopter Transport ($20,000)"];
	index_support_boattransport = lbAdd [1503, "Boat Transport ($10,000)"];
	index_support_supplycar = lbAdd [1503, "Offroad Drop ($15,000)"];	
			

	if (support_hqheli_available) then {
		lbSetColor [1503, 0, [0, 1, 0, 1]];
	};
	if (support_supplydrop_available) then {
		lbSetColor [1503, 1, [0, 1, 0, 1]];
	}; 
	if (support_artillery_available) then {
		lbSetColor [1503, 2, [0, 1, 0, 1]];
	}; 
	if (support_reinforcements_available) then {
		lbSetColor [1503, 3, [0, 1, 0, 1]];
	}; 
	if (support_helitransport_available) then {
		lbSetColor [1503, 4, [0, 1, 0, 1]];
	};
	if (support_boattransport_available) then {
		lbSetColor [1503, 5, [0, 1, 0, 1]];
	};
	if (support_cardrop_available) then {
		lbSetColor [1503, 6, [0, 1, 0, 1]];
	};
	
		

                       
    
    
     
       