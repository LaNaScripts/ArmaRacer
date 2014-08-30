switch (gameState) do {
			case "LOBBY": { 
					hint "Waiting in Lobby";
				};
			case "COUNTDOWN": { 
					hint "Count Down";
				};
			case "STARTRACE": { 
					hint "Start Race";
					playerTimer = 60;
					[] execVM "client\functions\createCourse.sqf";
					[] execVM "client\functions\playerTimer.sqf";
				};
		};