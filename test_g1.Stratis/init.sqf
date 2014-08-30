Counter = 2;
PlayerTime = 90;
isTimerOn = false;
isCountDown = true;


startRace = {
	titleText ["GO", "plain"]; titleFadeOut 1;
   //_helo = "B_Heli_Transport_01_F" createVehicle (getMarkerPos "marker1");
  
  // _helo engineOn true;
   //_helo flyInHeight 10;
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
			if (Counter == 3) then {[] call getReady;};
			if (Counter == 0) then{
				isCountDown = false;
				hint "";
				i=0;
				while {i<6} do {
					i=i+1;
					_helo = createVehicle ["B_Heli_Light_01_armed_F",getMarkerPos "marker1",[],i,"FORM"];
					_helo engineOn true;
					//_helo flyInHeight 1;
				 };
				[] call startRace;				
			};

			sleep 1;
		};
	}
	
};

if (isServer) then {

	_gp =  createGroup West;
	[player] joinSilent _gp;
	deleteWaypoint [_gp, 0];
	_wp = _gp addWaypoint [position player, 0];
	_wp = _gp addWaypoint [[2051.03,4809.71,0], 1];
	_wp = _gp addWaypoint [[1816.01,3911,0], 2];
	_wp = _gp addWaypoint [getMarkerPos "wpMarker3", 3];
	_wp = _gp addWaypoint [getMarkerPos "wpMarker4", 4];
	_wp = _gp addWaypoint [getMarkerPos "wpMarker5", 5];
	_wp = _gp addWaypoint [getMarkerPos "wpMarker6", 6];
	[_gp,0] setWaypointCompletionRadius 30;
	[_gp,1] setWaypointCompletionRadius 30;
	[_gp,2] setWaypointCompletionRadius 30;
	[_gp,3] setWaypointCompletionRadius 30;
	[_gp,4] setWaypointCompletionRadius 30;
	[_gp,5] setWaypointCompletionRadius 30;
	[_gp,6] setWaypointCompletionRadius 30;
	
	copyToClipboard format ["%1",getMarkerPos "wpMarker3"];
	
	//_wp  setWaypointType "HOLD";
	hint "hi";
};