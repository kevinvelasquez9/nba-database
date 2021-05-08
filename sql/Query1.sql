-- Query1.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query1 //

CREATE PROCEDURE Query1()
BEGIN
  WITH MVP AS (SELECT season, mvp AS 'playerName'
               FROM Award
               WHERE season >= 2013)
  SELECT season, playerName, pointsPerGame
  FROM MVP NATURAL JOIN Statistics;
END; //

DELIMITER ;