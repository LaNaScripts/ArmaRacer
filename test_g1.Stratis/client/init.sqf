//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (isDedicated) exitWith {};

tmpObj=[];

gp =  createGroup West;
[player] joinSilent gp;
deleteWaypoint [gp,0];
waitUntil {!isNull player};

player addAction [ 
	"yourAction", { 
		_tObj = createVehicle ["Sign_Circle_F",position player,[],0,"NONE"];
		_tObj setVectorUp (vectorUp player);
		
		tmpObj pushBack _tObj;
	} 
];

[] execVM "client\functions\setClientPVars.sqf";

waitUntil {!isNil "ServerPVsynced"};
if (!isNil "gameState") then {
	[] execVM "client\functions\manageGameState.sqf";
};
 
//	copyToClipboard format ["%1",getMarkerPos "wpMarker1"];