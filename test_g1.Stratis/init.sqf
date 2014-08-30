//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

Counter = 2;
PlayerTime = 90;
isTimerOn = false;
isCountDown = true;
raceRoute = [[2051.03,4809.71,0],[1816.01,3911,0]];
onWaypoint = 0;

if (isServer) then {
	[] execVM "server\init.sqf";
	
};


//(!isServer)
if (!isServer) then {
	[] execVM "client\init.sqf";
};