//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 


if (isDedicated) exitWith {};

gp =  createGroup West;
[player] joinSilent gp;

execVM "client/setWaypoints.sqf";

waitUntil {!isNull player};

execVM "racetrack/client/setupCheckPoints.sqf";
 
//	copyToClipboard format ["%1",getMarkerPos "wpMarker3"];