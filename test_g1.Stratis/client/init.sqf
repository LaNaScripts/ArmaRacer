//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (isDedicated) exitWith {};

tmpObj=[];
placeMarker = false;

gp =  createGroup West;
[player] joinSilent gp;
deleteWaypoint [gp,0];
waitUntil {!isNull player};




0 = 0 spawn {
waitUntil {!(IsNull (findDisplay 46))};
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 21) then {_tObj = createVehicle ['Sign_Circle_F',position player,[],0,'NONE'];
		_tObj setVectorUp (vectorUp player);
		_tObj setVectorDir (vectorDir player);
		tmpObj pushBack _tObj;}"];
};



player addAction [ 
	"SAVE", { 
		sv = "";
		{
			sv = sv + format["[%1,%2,%3],",(getPosASL _x),(vectorDir _x),(vectorUp _x)];
			
		}forEach tmpObj;
		copyToClipboard (str (sv));
	} 
	
];

[] execVM "client\functions\setClientPVars.sqf";

waitUntil {!isNil "ServerPVsynced"};
if (!isNil "gameState") then {
	[] execVM "client\functions\manageGameState.sqf";
};
 
//	copyToClipboard format ["%1",getMarkerPos "wpMarker1"];