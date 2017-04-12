/*
	SinFrame Name Generator
	Author: Sinbane
	Description: Gets a random name
	_name = [length] call compile preprocessFile "extra\SIN_getName.sqf";
*/
if (SINdebug == 1) then {systemChat "Generating name.."};
//-----------------------------------
//-VARIABLES

_length = _this select 0;

//-----------------------------------
//-FIRST WORD
	
	_first = [
	"Mighty",
	"Drunk",
	"Fire",
	"Demon",
	"Devil",
	"Silent",
	"Metal",
	"Iron",
	"Smoking",
	"Dark",
	"Infernal",
	"Blazing",
	"Last",
	"Lone",
	"Overwhelming",
	"Burning",
	"Striking",
	"Master",
	"Black",
	"White",
	"Red",
	"Green",
	"Blue",
	"Violent",
	"Swift",
	"Gold",
	"Silver",
	"Bronze",
	"Copper",
	"Diamond",
	"Unchained",
	"Condemned",
	"Solid",
	"Broken",
	"Grand",
	"Hot",
	"Shadow",
	"Altis",
	"Chernarus",
	"5th",
	"52nd",
	"United",
	"Sticky",
	"Slimey",
	"DAFT",
	"UNMC",
	"BRC",
	"Darth"
	];
	
//-----------------------------------
//-SECOND WORD

	_second = [
	"Dynasty",
	"Serenity",
	"Rex",
	"Ray",
	"X",
	"Creed",
	"Flag",
	"Space",
	"Shield",
	"Sword",
	"Arrow",
	"Storm",
	"Lightning",
	"Torrent",
	"Fallout",
	"Strike",
	"Firefly",
	"Tarantula",
	"Freedom",
	"America",
	"Europe",
	"Africa",
	"Flux",
	"Gear",
	"Assassin",
	"Mass",
	"Reaper",
	"Titan",
	"Strider",
	"Thirty",
	"Loathing",
	"Fear",
	"Hate",
	"Velten",
	"Vyper",
	"Sovereign",
	"Foz",
	"Psycho",
	"Blaze",
	"Jayline",
	"Hands",
	"Potato",
	"Axis",
	"Anarchy",
	"Codex",
	"Avenger",
	"Shadow",
	"Broker",
	"Minx",
	"Odin",
	"Thor",
	"Zeus",
	"Poseidon",
	"Lion",
	"Pride",
	"Shiva",
	"Yoda",
	"Vader",
	"Maul",
	"Empire",
	"Steed",
	"Broadsword",
	"Dagger",
	"Lynx",
	"Hammer",
	"Tantalus"
	];

//-----------------------------------
//-GENERATE NAME

_word1 = selectRandom _first;
_word2 = selectRandom _second;
_phrase = format["%1 %2",_word1,_word2];

if (_length == 1) exitWith {
	_word2
};

if (_length == 2) exitWith {
	_phrase
};

//-----------------------------------