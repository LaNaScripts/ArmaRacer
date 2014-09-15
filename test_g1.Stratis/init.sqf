//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 

if (isServer) then {
	[] execVM "server\init.sqf";
	
};

if (!isServer) then {
	[] execVM "client\init.sqf";
};