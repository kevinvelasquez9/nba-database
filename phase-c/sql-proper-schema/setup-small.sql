CREATE TABLE Player (
  season VARCHAR(255),
  playerName VARCHAR(255),
  PRIMARY KEY(playerName, season)
);

LOAD DATA LOCAL INFILE 'C:/Users/marce/OneDrive - Johns Hopkins/Documents/4 - Spring 2021/Databases/nba-database/results/player-short.txt' INTO TABLE Player IGNORE 1 LINES;

CREATE TABLE Team (
  franchiseName VARCHAR(255),
  gamesPlayed INT(255),
  wins INT(255),
  losses INT(255),
  winLoss DEC(3, 3),
  championships INT(255),
  PRIMARY KEY(franchiseName)
);

LOAD DATA LOCAL INFILE 'C:/Users/marce/OneDrive - Johns Hopkins/Documents/4 - Spring 2021/Databases/nba-database/results/team-short.txt' INTO TABLE Team IGNORE 1 LINES;

CREATE TABLE Contract (
  playerName VARCHAR(255),
  franchiseName VARCHAR(255),
  salary VARCHAR(255),
  contractID int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(contractID),
  FOREIGN KEY(playerName) REFERENCES Player(playerName),
  FOREIGN KEY(franchiseName) REFERENCES Team(franchiseName)
);

LOAD DATA LOCAL INFILE 'C:/Users/marce/OneDrive - Johns Hopkins/Documents/4 - Spring 2021/Databases/nba-database/results/contract-short.txt' INTO TABLE Contract IGNORE 1 LINES;

CREATE TABLE Statistics (
  season VARCHAR(255),
  playerName VARCHAR(255),
  gamesPlayed VARCHAR(255),
  minutesPerGame DEC(2, 2),
  fieldGoalPercentage DEC(3, 3),
  reboundsPerGame DEC(2, 2),
  assistsPerGame DEC(2, 2),
  pointsPerGame DEC(2, 2),
  PRIMARY KEY(season, playerName),
  FOREIGN KEY(playerName) REFERENCES Player(playerName)
);

LOAD DATA LOCAL INFILE 'C:/Users/marce/OneDrive - Johns Hopkins/Documents/4 - Spring 2021/Databases/nba-database/results/statistics-short.txt' INTO TABLE Statistics IGNORE 1 LINES;

CREATE TABLE BuzzerBeater (
  gameID int NOT NULL AUTO_INCREMENT,
  playerName VARCHAR(255),
  date_recorded VARCHAR(255),
  winningTeam VARCHAR(255),
  opposingTeam VARCHAR(255),
  assistedPlayerName VARCHAR(255),
  distance VARCHAR(255),
  PRIMARY KEY(gameID),
  FOREIGN KEY(playerName) REFERENCES Player(playerName),
  FOREIGN KEY(assistedPlayerName) REFERENCES Player(playerName),
  FOREIGN KEY(winningTeam) REFERENCES Team(franchiseName),
  FOREIGN KEY(opposingTeam) REFERENCES Team(franchiseName)
);

LOAD DATA LOCAL INFILE 'C:/Users/marce/OneDrive - Johns Hopkins/Documents/4 - Spring 2021/Databases/nba-database/results/buzzerbeater-short.txt' INTO TABLE BuzzerBeater IGNORE 1 LINES;

CREATE TABLE Award (
  season VARCHAR(255),
  champion VARCHAR(255),
  mvp VARCHAR(255),
  rookieOfTheYear VARCHAR(255),
  mostPoints VARCHAR(255),
  mostRebounds VARCHAR(255),
  mostAssists VARCHAR(255),
  PRIMARY KEY(season),
  FOREIGN KEY(champion) REFERENCES Team(franchiseName),
  FOREIGN KEY(mvp) REFERENCES Player(playerName),
  FOREIGN KEY(rookieOfTheYear) REFERENCES Player(playerName),
  FOREIGN KEY(mostPoints) REFERENCES Player(playerName),
  FOREIGN KEY(mostRebounds) REFERENCES Player(playerName),
  FOREIGN KEY(mostAssists) REFERENCES Player(playerName)
);

LOAD DATA LOCAL INFILE 'C:/Users/marce/OneDrive - Johns Hopkins/Documents/4 - Spring 2021/Databases/nba-database/results/award-short.txt' INTO TABLE Award IGNORE 1 LINES;

CREATE TABLE Injury (
  injuryID int NOT NULL AUTO_INCREMENT,
  dateInjured VARCHAR(255),
  playerName VARCHAR(255),
  description VARCHAR(255),
  PRIMARY KEY(injuryID),
  FOREIGN KEY(playerName) REFERENCES Player(playerName)
);

LOAD DATA LOCAL INFILE 'C:/Users/marce/OneDrive - Johns Hopkins/Documents/4 - Spring 2021/Databases/nba-database/results/injury-short.txt' INTO TABLE Injury IGNORE 1 LINES;