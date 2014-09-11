//	@file Version: 1.0
//	@file Name: setClientPVars.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014

0 = 0 spawn {
	hint "Watching Game State";
	"gameState" addPublicVariableEventHandler {
		hint format["%1",_this select 0];
		
		switch (_this select 0) do {
			case "LOBBY": { 
					hint "LOBBY";
				};
			case "STARTRACE": { 
					hint "STARTRACE"; 
					[] execVM "client\functions\setCourse.sqf"; 
				};
		};
	};
};