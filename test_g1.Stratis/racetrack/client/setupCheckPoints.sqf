
private ["_wp","_smoke"];

deleteWaypoint [gp, 0];
0 = raceRoute spawn {
	{
		_script = [_x, _forEachIndex] spawn {
			_wp = gp addWaypoint [_this select 0, _this select 1];
			_smoke = createVehicle ["SmokeShellGreen",_this select 0,[],0,"NONE"];
		};
		waitUntil {scriptDone _script};
	} forEach _this;
};

_triggersSet = 0 spawn {
	waitUntil {!isNil "triggersMade"};
	{
		_trID = _x getVariable ["trID", -1];
		if (_trID >= 0) then {
			_x setTriggerArea [50,50,0,false];
			_x setTriggerStatments ["this","hint 'TRIGGERD'","hint 'OUT OF TRIGGER'"];
		};
	} forEach allMissionObjects "EmptyDetector";
};
