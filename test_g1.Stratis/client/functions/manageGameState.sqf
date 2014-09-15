switch (gameState select 0) do {
			case "LOBBY": { 
					hint "Waiting in Lobby";
				};
			case "COUNTDOWN": { 
					hint "Count Down";
				};
			case "RESETCOURSE": { 
					hint "Reset";
					[] execVM "client\functions\resetCourse.sqf";
				};
			case "LOADCOURSE": { 
					hint "Loading Race";
					[gameState select 1] execVM "client\functions\loadCourse.sqf";
				};
			case "STARTRACE": { 
					hint "Start Race";
					playerTimer = 60;
					[] execVM "client\functions\playerTimer.sqf";
				};
		};