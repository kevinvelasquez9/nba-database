-- Query4.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query4 //

CREATE PROCEDURE Query4()
BEGIN
  WITH T1 AS (SELECT AVG(distance) AS 'avgDistanceOf2000s'
              FROM BuzzerBeater
              WHERE date_recorded LIKE '%200%'),
       T2 AS (SELECT AVG(distance) AS 'avgDistanceOf2010s'
              FROM BuzzerBeater
              WHERE date_recorded LIKE '%201%')
  SELECT *
  FROM T1, T2;
END; //

DELIMITER ;