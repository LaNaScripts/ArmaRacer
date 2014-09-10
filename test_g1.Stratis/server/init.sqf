//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: RaminNoodle
//	@file Created: 9/10/2014 


if (!isServer) exitWith {};


if (isCountDown) then{
		
		while {isCountDown} do {
			Counter=Counter-1;	
			if (Counter == 0) then{
				isCountDown = false;
				hint "";
				i=0;
				while {i<6} do {
					execVM "server/setTriggers.sqf";
					i=i+1;
					_helo = createVehicle ["B_Heli_Light_01_armed_F",getMarkerPos "marker1",[],i,"FORM"];
					_helo engineOn true;
				};
			};
			hint format ["%1",Counter];
			sleep 1;
		};
	}