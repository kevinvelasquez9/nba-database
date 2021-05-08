-- Query9.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query9 //

CREATE PROCEDURE Query9()
BEGIN  
  WITH R AS (SELECT DISTINCT rookieOfTheYear AS playerName
             FROM Award)
  SELECT DISTINCT playerName
  FROM R NATURAL JOIN Statistics
  WHERE gamesPlayed >= 40 AND pointsPerGame >= 25 AND reboundsPerGame >= 5 AND assistsPerGame >= 5;
END; //

DELIMITER ;