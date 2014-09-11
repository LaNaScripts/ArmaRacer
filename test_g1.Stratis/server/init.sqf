//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 


if (!isServer) exitWith {};

//Lets the clients make sure all the Pvars are synced.
ServerPVsynced = true;
publicVariable "ServerPVsynced";

execVM "server\functions\setVehicals.sqf";

//Set game state to LOBBY
gameState = "LOBBY";
publicVariable gameState;
sleep 4;
gameState = "STARTRACE";
publicVariable gameState;