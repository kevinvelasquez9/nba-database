-- Query10.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query10 //

CREATE PROCEDURE Query10()
BEGIN  
  WITH B AS (SELECT date_recorded, winningTeam
             FROM BuzzerBeater
           HAVING date_recorded LIKE '%201%'  OR date_recorded LIKE '%2020%'),
       T AS (SELECT winningTeam, COUNT(winningTeam) AS num
             FROM B
             GROUP BY winningTeam),
       W AS (SELECT winningTeam AS franchiseName
             FROM T
             WHERE num = (SELECT MAX(num) FROM T))        
  SELECT franchiseName, COUNT(champion) AS numChampionships
  FROM W LEFT JOIN Award ON W.franchiseName = Award.champion;
END; //

DELIMITER ;