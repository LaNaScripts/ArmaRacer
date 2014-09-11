//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 


if (isDedicated) exitWith {};

gp =  createGroup West;
[player] joinSilent gp;

waitUntil {!isNull player};
hint "A";
//[] execVM "client\functions\setClientPVars.sqf";

waitUntil {!isNil "ServerPVsynced"};
hint "B";
if (!isNil "gameState") then {
	hint "here";
	//[] execVM "client\functions\manageGameState.sqf";
};
 
//	copyToClipboard format ["%1",getMarkerPos "wpMarker3"];