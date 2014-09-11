//	@file Version: 1.0
//	@file Name: createCourse.sqf
//	@file Description: client createCourse 
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (isDedicated) exitWith {}; 

private ["_wp","_smoke",];

deleteWaypoint [gp, 0];

0 = raceRoute spawn {
	{
		_script = [_x, _forEachIndex] spawn {
			_wp = gp addWaypoint [_this select 0, _this select 1];
			_tmpObj = "Sign_Circle_F" createVehicle (_this select 0);  
			checkPointArray = checkPointArray + _tmpObj
		};
		waitUntil {scriptDone _script};
	} forEach _this;
};

0 = checkPointArray spawn {
    private ["_circleArray","_currentIndex","_startTime","_curTrigger"];
    _circleArray = _this;
    _currentIndex = 0;
    _startTime = -1;
    waitUntil {player == player};
    while {true} do {
        {
            _x setObjectTexture [0, "#(argb,8,8,3)color(0,1,1,1)"];
        } forEach _circleArray;
        _curTrigger = _circleArray select _currentIndex;
        _curTrigger setObjectTexture [0, "#(argb,8,8,3)color(1,0,0,1)"];
        waitUntil {(player distanceSqr _curTrigger) < 220};
        if (_currentIndex == 0) then {_startTime = time;};
        _currentIndex = (_currentIndex + 1) % (count _circleArray);
        if (_currentIndex == 0) then {systemChat format ["You took %1 seconds to make the loop", floor (time - _startTime)]};
        _curTrigger = _circleArray select _currentIndex;        
        hint format ["Waypoint Acheived\nWaypoint %1 is Next\nDistance %2 meters", _currentIndex, floor (player distance _curTrigger)];
    };
};

