//	@file Version: 1.0
//	@file Name: setClientPVars.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014

0 = 0 spawn {
	"gameState" addPublicVariableEventHandler {
		hint format["gameState Event Handler %1",_this select 0];
		[] execVM "client\functions\manageGameState.sqf";		
	};
};