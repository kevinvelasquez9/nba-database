DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Players;

CREATE TABLE Players (
  id VARCHAR(255),
  playerName VARCHAR(255)
);

LOAD DATA LOCAL INFILE 'C:/Users/marce/Downloads/players.csv'
INTO TABLE Players
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE Salaries (
  id VARCHAR(255),
  season VARCHAR(255),
  franchiseName VARCHAR(255),
  salary INT(20)
 );
 
LOAD DATA LOCAL INFILE 'C:/Users/marce/Downloads/salaries.csv'
INTO TABLE Salaries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT playerName, franchiseName, salary, season
FROM Players JOIN Salaries
ON Players.id = Salaries.id
ORDER BY season DESC, season DESC;