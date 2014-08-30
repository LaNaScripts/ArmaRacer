//	@file Version: 1.0
//	@file Name: setWaypoints.sqf
//	@file Description: client setWaypoints 
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (isDedicated) exitWith {}; 

private ["_wp","_smoke"];

deleteWaypoint [gp, 0];

0 = raceRoute spawn {
	{
		_script = [_x, _forEachIndex] spawn {
			_wp = gp addWaypoint [_this select 0, _this select 1];
			_smoketheEngine = "test_EmptyObjectForSmoke" createVehicle (_this select 0);  
		};
		waitUntil {scriptDone _script};
	} forEach _this;
};


_triggersSet = 0 spawn {
        waitUntil {!isNil "triggersMade"};
        {
            _trID = _x getVariable ["trID", -1];
            if (_trID >= 0) then {
				_x triggerAttachVehicle [player];
                _x setTriggerArea [0,0,0,false];
				_x setTriggerActivation ["ANY", "PRESENT", true];
			    _x setTriggerStatements ["this", "hint 'BOOOOMMM'",""];
            };
        } forEach allMissionObjects "EmptyDetector";
    };
