//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 


if (!isServer) exitWith {};

execVM "server\functions\setVehicals.sqf";

gameState = "LOBBY";
publicVariable gameState;
sleep 4;
gameState = "STARTRACE";
publicVariable gameState;