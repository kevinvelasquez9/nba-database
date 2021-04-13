-- Question 2
WITH MVP AS (SELECT season, mvp AS 'playerName'
             FROM Award
             WHERE season >= 2013)
SELECT season, playerName, pointsPerGame
FROM MVP NATURAL JOIN Statistics;

-- Question 4
SELECT DISTINCT a1.mvp
FROM Award AS a1 JOIN Award AS a2 ON a1.mvp = a2.rookieOfTheYear;

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