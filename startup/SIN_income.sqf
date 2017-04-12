/*
	Income
	Author: Sinbane
	Gives income every x minutes
*/
//-----------------------------------
//-DEFINE VARIABLES

_incomeDelay = 600;

//-----------------------------------
//-OPEN LOOP
while {true} do {
//-----------------------------------

	sleep _incomeDelay;
	_income = floor (random SIN_income);
	[_income] call SIN_fnc_addMoney;
	HQofficer sideChat format["We have just recieved $%1 in income",_income];

//-----------------------------------
//-CLOSE LOOP
};