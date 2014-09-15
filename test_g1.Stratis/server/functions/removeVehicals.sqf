//	@file Version: 1.0
//	@file Name: setVehicals.sqf
//	@file Description: server create vehicals for round.
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (!isServer) exitWith {};

{
	deleteVehicle _x;
}forEach heloArray;
