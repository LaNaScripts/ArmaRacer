Counter = 6;
PlayerTime = 90;
isTimerOn = false;
isCountDown = true;


startRace = {
	titleText ["GO", "plain"]; titleFadeOut 1;
   //_helo = "B_Heli_Transport_01_F" createVehicle (getMarkerPos "marker1");
   _helo = createVehicle ["B_Heli_Light_01_armed_F",getMarkerPos "marker1",[],0,"FLY"];
   _helo engineOn true;
   _helo flyInHeight 10;
   player moveInDriver _helo;
    execVM "timer.sqf";
};

getReady = {
	titleText ["GET READY!", "BLACK", 1];
     
};

publicVariable "startRace";


if (isServer) then {
	if (isCountDown) then{
		
		while {isCountDown} do {
			Counter=Counter-1;	
			hint format ["%1",Counter];
			if (Counter == 2) then {[] call getReady;};
			if (Counter == 0) then{
				isCountDown = false;
				hint "";
				[] call startRace;				
			};

			sleep 1;
		};
	}
	
} else {


};