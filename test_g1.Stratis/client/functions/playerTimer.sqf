while {playerTimer > -1} do {
	playerTimer = playerTimer - 1;
	1001 cutText [format ["%1 seconds ",playerTimer] ,"PLAIN DOWN"];
	sleep 1;
};