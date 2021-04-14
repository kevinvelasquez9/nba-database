-- Insert a new player!
INSERT INTO Player (season, playerName)
VALUES (2021, 'Marc Helou');

-- Let's make him sign a contract
INSERT INTO Contract (playerName, salary, season)
VALUES ('Marc Helou', 2, 2021);

-- Insert a new team
INSERT INTO Team (franchiseName, gamesPlayed, wins, losses, winLoss, championships)
VALUES ('HOP', 14, 7, 7, 0.500, 1);

-- Marc scored a buzzer beater!!
INSERT INTO BuzzerBeater (gameID, playerName, date_recorded, winningTeam, opposingTeam, assistedPlayerName, distance)
VALUES (20000, 'Marc Helou', 'Apr 13 2021', 'HOP', 'GSW', 'K. Velasquez', 15);

-- Let's delete HOP, this will get rid of the above buzzer beater (foreign key)
DELETE FROM Team WHERE franchiseName='HOP';