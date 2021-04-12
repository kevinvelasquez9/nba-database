CREATE TABLE Player (
  season VARCHAR(255),
  playerName VARCHAR(255),
  PRIMARY KEY(playerName, season)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/player-small.csv'
INTO TABLE Player
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Team (
  franchiseName VARCHAR(255),
  gamesPlayed INT,
  wins INT,
  losses INT,
  winLoss DOUBLE,
  championships INT,
  PRIMARY KEY(franchiseName)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/team-small.csv'
INTO TABLE Team
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Contract (
  contractID int NOT NULL,
  playerName VARCHAR(255),
  franchiseName VARCHAR(255),
  salary VARCHAR(255),
  PRIMARY KEY(contractID)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/contract-small.csv'
INTO TABLE Contract
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Statistics (
  season VARCHAR(255),
  playerName VARCHAR(255),
  gamesPlayed VARCHAR(255),
  minutesPerGame DOUBLE,
  fieldGoalPercentage DOUBLE,
  reboundsPerGame DOUBLE,
  assistsPerGame DOUBLE,
  pointsPerGame DOUBLE,
  PRIMARY KEY(season, playerName)
);

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/statistics-small.csv'
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

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/buzzerbeater-small.csv'
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

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/award-small.csv'
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

LOAD DATA LOCAL INFILE '/Users/kevinvelasquez/tmp/nba-database/csv/injury-small.csv'
INTO TABLE Injury
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;