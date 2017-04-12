/*
	Special Operatives List
	Author: Sinbane
*/
//-----------------------------------
//-USER CONFIG INFO

/*
0: ROLE 			(Anything: Example "Medic")
1: STATUS 			(Don't change)
2: NAME 			(Appears in menu)
3: IDENTITY 		(Don't change unless you have set a new one in identites.hpp)
4: CLASS
5: HAT
6: TIME UNAVAILABLE (don't change)

THESE ARE DYNAMICALLY ADDED TO ASSETS INTERFACE

*/

//-----------------------------------
//-SIDE SPECIFIC OPERATIVES

if (SINside == "WEST") then {

	SIN_specops_list = [
	["Sniper","Ready","Vyper","vyper","B_CTRG_Sharphooter_F","H_MilCap_mcamo",0],
	["Medic","Ready","Fox","fox","B_CTRG_soldier_M_medic_F","H_Cap_blk",0]
	];

};

if (SINside == "EAST") then {

	SIN_specops_list = [
	["Sniper","Ready","Velten","velten","O_ghillie_sard_F","H_Cap_blk",0]
	];

};

if (SINside == "RESISTANCE") then {

	SIN_specops_list = [
	["Autorifleman","Ready","Sovereign","sovereign","I_Soldier_AR_F","H_Beret_blk",0],
	["Grenadier","Ready","Sinbane","sinbane","I_G_Soldier_GL_F","H_Cap_blk_ION",0]
	];

};




