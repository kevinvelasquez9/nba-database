CREATE TABLE Player (
  season VARCHAR(255),
  playerName VARCHAR(255),
  PRIMARY KEY(playerName, season)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/player.csv'
INTO TABLE Player
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Team (
  franchiseName VARCHAR(255),
  gamesPlayed INT(255),
  wins INT(255),
  losses INT(255),
  winLoss DOUBLE,
  championships INT(255),
  PRIMARY KEY(franchiseName)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/team.csv'
INTO TABLE Team
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Contract (
  contractID int NOT NULL,
  playerName VARCHAR(255),
  franchiseName VARCHAR(255),
  salary VARCHAR(255),
  PRIMARY KEY(contractID),
  FOREIGN KEY(franchiseName) REFERENCES Team(franchiseName) ON DELETE CASCADE ON UPDATE CASCADE
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/contract.csv'
INTO TABLE Contract
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Statistics (
  season VARCHAR(255),
  playerName VARCHAR(255),
  gamesPlayed VARCHAR(255),
  minutesPerGame DEC(2, 2),
  fieldGoalPercentage DEC(3, 3),
  reboundsPerGame DEC(2, 2),
  assistsPerGame DEC(2, 2),
  pointsPerGame DEC(2, 2),
  PRIMARY KEY(season, playerName)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/statistics.csv'
INTO TABLE Statistics
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE BuzzerBeater (
  gameID int NOT NULL,
  playerName VARCHAR(255),
  date_recorded VARCHAR(255),
  winningTeam VARCHAR(255),
  opposingTeam VARCHAR(255),
  assistedPlayerName VARCHAR(255),
  distance VARCHAR(255),
  PRIMARY KEY(gameID)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/buzzerbeater.csv'
INTO TABLE BuzzerBeater
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Award (
  season VARCHAR(255),
  champion VARCHAR(255),
  mvp VARCHAR(255),
  rookieOfTheYear VARCHAR(255),
  mostPoints VARCHAR(255),
  mostRebounds VARCHAR(255),
  mostAssists VARCHAR(255),
  PRIMARY KEY(season)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/award.csv'
INTO TABLE Award
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Injury (
  injuryID int NOT NULL,
  dateInjured VARCHAR(255),
  playerName VARCHAR(255),
  description VARCHAR(255),
  PRIMARY KEY(injuryID)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/injury.csv'
INTO TABLE Injury
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;