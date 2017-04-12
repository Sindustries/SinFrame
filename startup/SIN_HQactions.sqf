/*
	SinFrame Officer Actions
	Author: Sinbane
	Description: Adds actions to HQ officer
*/
//-----------------------------------
//-VARIABLES


//-----------------------------------
//-ACTIONS

HQofficer addaction ["<t color='#99ff00'>Assets Menu</t>","dialog\request.sqf", "", 0, true, true, "", "_this == player"];

HQofficer addaction ["<t color='#F57169'>Save Game</t>","startup\savegame.sqf", "", 0, true, true, "", "_this == player"];

