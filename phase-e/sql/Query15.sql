-- Query15.sql

DELIMITER //

DROP PROCEDURE IF EXISTS Query15 //

CREATE PROCEDURE Query15()
BEGIN
  WITH T AS (SELECT franchiseName AS winningTeam
             FROM Team
             WHERE championships = (SELECT MAX(championships) FROM Team)),
       Won AS (SELECT winningTeam AS team, COUNT(winningTeam) AS won
               FROM BuzzerBeater NATURAL JOIN T
               GROUP BY winningTeam),
       Lost AS (SELECT opposingTeam AS team, COUNT(opposingTeam) AS lost
                FROM BuzzerBeater NATURAL JOIN T
                GROUP BY opposingTeam)
  SELECT *
  FROM Won NATURAL JOIN Lost;
END; //

DELIMITER ;