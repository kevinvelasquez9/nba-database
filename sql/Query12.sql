-- Query12.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query12 //

CREATE PROCEDURE Query12()
BEGIN  
  WITH S AS (SELECT DISTINCT playerName
           FROM Contract
           WHERE salary >= 30000000
           ORDER BY season
           LIMIT 2)
  SELECT S1.playerName AS secondPlayer, S2.playerName AS firstPlayer
  FROM S AS S1, S AS S2
  WHERE S1.playerName != S2.playerName
  LIMIT 1;
END; //

DELIMITER ;