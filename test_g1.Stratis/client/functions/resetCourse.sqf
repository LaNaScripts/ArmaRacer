
//Delete all checkpoints
_script = checkPointArray spawn {
    _circleArray = _this;
    waitUntil {player == player};
	{
		deleteVehicle _x;
	} forEach _circleArray;
};

waitUntil {scriptDone _script};
	
//Empty the array
checkPointArray = [];

//Reset position
player setPOS (getMarkerPos "marker1");
