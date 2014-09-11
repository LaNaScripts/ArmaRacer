switch (gameState) do {
			case "LOBBY": { 
					hint "Waiting in Lobby";
				};
			case "COUNTDOWN": { 
					hint "Count Down";
				};
			case "STARTRACE": { 
					hint "Start Race";
					[] execVM "client\functions\createCourse.sqf"
				};
		};