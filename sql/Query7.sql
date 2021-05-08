-- Query7.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query7 //

CREATE PROCEDURE Query7()
BEGIN
  WITH I AS (SELECT DISTINCT playerName, dateInjured
             FROM Injury
             HAVING dateInjured LIKE '%/19'),
       P AS (SELECT DISTINCT playerName
             FROM Player
             WHERE season = 2019)
  SELECT DISTINCT playerName, minutesPerGame
  FROM (I NATURAL JOIN P) NATURAL JOIN Statistics
  WHERE season = 2019;
END; //

DELIMITER ;