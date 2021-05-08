-- Query14.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query14 //

CREATE PROCEDURE Query14()
BEGIN   
  WITH MVP AS (SELECT playerName, COUNT(playerName) AS 'numBuzzerbeaters'
               FROM (SELECT DISTINCT mvp AS 'playerName'
                     FROM Award) AS t1 NATURAL JOIN BuzzerBeater
               GROUP BY playerName),
       MostBuzzer AS (SELECT playerName, numBuzzerbeaters
                      FROM MVP
                      WHERE numBuzzerbeaters = (SELECT MAX(numBuzzerbeaters) FROM MVP))
  SELECT playerName, opposingTeam
  FROM MostBuzzer NATURAL JOIN BuzzerBeater;
END; //

DELIMITER ;