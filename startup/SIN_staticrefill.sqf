/*
	SinFrame Base Creation :: Static Defences
	Author: Sinbane
	Description: Refills ammo of static defences
*/
if (SINdebug == 1) then {systemChat "Base Creation: Static Refill script begin"};
//-----------------------------------
//-DEFINE VARIABLES

_aa = _this select 0;
_gl = _this select 1;
_at1 = _this select 2;
_at2 = _this select 3;
_at3 = _this select 4;

_static = [_aa, _gl, _at1, _at2, _at3];

//-----------------------------------
//-OPEN LOOP
while {true} do {
//-----------------------------------

{
	_x setVehicleAmmo 1;
} forEach _static;

sleep 600;

//-----------------------------------
//-CLOSE LOOP
};