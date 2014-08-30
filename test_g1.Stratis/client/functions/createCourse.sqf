//	@file Version: 1.0
//	@file Name: createCourse.sqf
//	@file Description: client createCourse 
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (isDedicated) exitWith {}; 

raceCourseArray = [ 
				["Track 1",
					[
						["Check Point 1",[2051.19,4780.43,20]],
						["Check Point 2",[1960.46,4305.75,20]],
						["Check Point 3",[2320.57,4054.94,20]]
					]
				],
				["Track 2",
					[
						["Check Point 1",[2051.03,4809.71,0]],
						["Check Point 2",[1816.01,3911,0]]
					]
				]
			];

checkPointArray=[];

raceRoute = (raceCourseArray select 0) select 1;
hint format["%1",count raceRoute];

//hint "GO";
{
	_script = [_x, _forEachIndex] spawn {
		_wp = gp addWaypoint [(_this select 0) select 1, _this select 1];
		_tmpObj = createVehicle ["Sign_Circle_F",(_this select 0) select 1,[],0,"NONE"];
		_tmpObj setPosASL (_this select 0) select 1;
		checkPointArray pushBack _tmpObj
	};
	waitUntil {scriptDone _script};
} forEach raceRoute;


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
        _curTrigger = _circleArray select _currentIndex;        
        hint format ["Checkpoint complete, next checkpoint %2 meters.", _currentIndex, floor (player distance _curTrigger)];
		playerTimer = playerTimer + 30;
    };
};
