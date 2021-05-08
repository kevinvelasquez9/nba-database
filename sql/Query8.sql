-- Query8.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query8 //

CREATE PROCEDURE Query8()
BEGIN
  WITH P AS (SELECT DISTINCT playerName, date_recorded
             FROM BuzzerBeater
             WHERE assistedPlayerName = 'unassisted'
             HAVING date_recorded LIKE '%2017%')
  SELECT DISTINCT playerName, assistsPerGame
  FROM P NATURAL JOIN Statistics
  WHERE season = 2017;
END; //

DELIMITER ;