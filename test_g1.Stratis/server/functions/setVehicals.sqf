//	@file Version: 1.0
//	@file Name: setVehicals.sqf
//	@file Description: server create vehicals for round.
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (!isServer) exitWith {};

_i=0;
while {_i<1} do {
	_i=_i+1;
	_helo = createVehicle ["B_Heli_Light_01_armed_F",getMarkerPos "marker1",[],_i,"FORM"];
	_helo engineOn true;
};
