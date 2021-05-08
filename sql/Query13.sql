-- Query13.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query13 //

CREATE PROCEDURE Query13()
BEGIN  
  WITH T AS (SELECT playerName, season, pointsPerGame, assistsPerGame, reboundsPerGame
             FROM Statistics
             WHERE pointsPerGame >= 10 AND assistsPerGame >= 10 AND reboundsPerGame >= 10)
  SELECT season, playername, pointsPerGame, assistsPerGame, reboundsPerGame
  FROM T NATURAL JOIN Award
  WHERE playerName != mvp;
END; //

DELIMITER ;