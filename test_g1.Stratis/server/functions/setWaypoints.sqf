//	@file Version: 1.0
//	@file Name: setWaypoints.sqf
//	@file Description: server setWaypoints 
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (!isServer) exitWith {};

 0 = raceRoute spawn {
        waitUntil {time > 0};
            {
            _script = [_x, _forEachIndex] spawn {
                _tr = createTrigger ["EmptyDetector", _this select 0];
                _tr setVariable ["trID", _this select 1, true];
            };
            waitUntil {scriptDone _script};
        } forEach _this;
		triggersMade = true;
        publicVariable "triggersMade";
    };