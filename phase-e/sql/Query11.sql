-- Query11.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query11 //

CREATE PROCEDURE Query11()
BEGIN  
  WITH P AS (SELECT *
             FROM Contract
             WHERE salary > 20000000)
  SELECT playerName, season, pointsPerGame, salary
  FROM P NATURAL JOIN Statistics
  WHERE pointsPerGame < 10;
END; //

DELIMITER ;