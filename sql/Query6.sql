-- Query6.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query6 //

CREATE PROCEDURE Query6()
BEGIN
  WITH T AS (SELECT *
             FROM Team
             WHERE championships = 0),
       M AS (SELECT franchiseName, gamesPlayed
             FROM T
             WHERE gamesPlayed = (SELECT MAX(gamesPlayed) FROM T))
  SELECT *
  FROM M;
END; //

DELIMITER ;