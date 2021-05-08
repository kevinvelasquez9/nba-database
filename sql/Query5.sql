-- Query5.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query5 //

CREATE PROCEDURE Query5()
BEGIN
  WITH R AS (SELECT mostRebounds AS playerName, season
             FROM Award)
  SELECT playerName, season, reboundsPerGame
  FROM R NATURAL JOIN Statistics;
END; //

DELIMITER ;