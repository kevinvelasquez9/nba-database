-- Question 2
WITH MVP AS (SELECT season, mvp AS 'playerName'
             FROM Award
             WHERE season >= 2013)
SELECT season, playerName, pointsPerGame
FROM MVP NATURAL JOIN Statistics;

-- Question 3
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

-- Question 4
SELECT DISTINCT A1.mvp
FROM Award AS A1 JOIN Award AS A2 ON A1.mvp = A2.rookieOfTheYear;

-- Question 5
WITH T1 AS (SELECT AVG(distance) AS 'avgDistanceOf2000s'
            FROM BuzzerBeater
            WHERE date_recorded LIKE '%200%'),
     T2 AS (SELECT AVG(distance) AS 'avgDistanceOf2010s'
            FROM BuzzerBeater
            WHERE date_recorded LIKE '%201%')
SELECT *
FROM T1, T2;

-- Question 15
WITH MVP AS (SELECT playerName, COUNT(playerName) AS 'numBuzzerbeaters'
             FROM (SELECT DISTINCT mvp AS 'playerName'
                   FROM Award) AS t1 NATURAL JOIN BuzzerBeater
             GROUP BY playerName),
     MostBuzzer AS (SELECT playerName, numBuzzerbeaters
                    FROM MVP
                    WHERE numBuzzerbeaters = (SELECT MAX(numBuzzerbeaters) FROM MVP))
SELECT playerName, opposingTeam
FROM MostBuzzer NATURAL JOIN BuzzerBeater;
