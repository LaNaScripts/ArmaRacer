//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 


if (!isServer) exitWith {};

//Lets the clients make sure all the Pvars are synced.
ServerPVsynced = true;
publicVariable "ServerPVsynced";


//Set game state to LOBBY
gameState = "LOBBY";
publicVariable "gameState";

sleep 5; 
gameState = ["LOADCOURSE",0];
publicVariable "gameState";

sleep 5; 
execVM "server\functions\setVehicals.sqf";
gameState = "STARTRACE";
publicVariable "gameState";


sleep 5; 
gameState = "RESETCOURSE";
publicVariable "gameState";
sleep 2;
execVM "server\functions\removeVehicals.sqf";

sleep 5; 
gameState = ["LOADCOURSE",1];
publicVariable "gameState";

sleep 5; 
execVM "server\functions\setVehicals.sqf";
gameState = "STARTRACE";
publicVariable "gameState";

