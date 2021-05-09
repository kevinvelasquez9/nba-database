-- Query2.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query2 //

CREATE PROCEDURE Query2()
BEGIN
  WITH MVP AS (SELECT DISTINCT mvp
               FROM Award),
       P AS (SELECT COUNT(MVP.mvp) AS hadMostPoints
             FROM MVP JOIN Award ON MVP.mvp = Award.mostPoints),
       R AS (SELECT COUNT(MVP.mvp) AS hadMostRebounds
             FROM MVP JOIN Award ON MVP.mvp = Award.mostRebounds),
       A AS (SELECT COUNT(MVP.mvp) AS hadMostAssists
             FROM MVP JOIN Award ON MVP.mvp = Award.mostAssists)
  SELECT *
  FROM P, R, A;
END; //

DELIMITER ;