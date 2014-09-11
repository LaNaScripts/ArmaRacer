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
			//_tmpObj = createVehicle ["Sign_Circle_F",_this select 0,[],_i,"NONE"];
			//checkPointArray = checkPointArray + _tmpObj
		};
		waitUntil {scriptDone _script};
	} forEach _this;
};


