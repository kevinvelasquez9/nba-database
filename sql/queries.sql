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

-- Question 6
WITH R AS (SELECT mostRebounds AS playerName, season
           FROM Award)
SELECT playerName, season, reboundsPerGame
FROM R NATURAL JOIN Statistics;

-- Question 7
WITH I AS (SELECT *
           FROM Injury
           HAVING dateInjured LIKE '%/16')
SELECT *
FROM I;

-- Question 8
WITH I AS (SELECT DISTINCT playerName, dateInjured
           FROM Injury
           HAVING dateInjured LIKE '%/19'),
     P AS (SELECT DISTINCT playerName
           FROM Player
           WHERE season = 2019)
SELECT DISTINCT playerName, minutesPerGame
FROM (I NATURAL JOIN P) NATURAL JOIN Statistics
WHERE season = 2019;

-- Question 9
WITH P AS (SELECT DISTINCT playerName, date_recorded
           FROM BuzzerBeater
           WHERE assistedPlayerName = 'unassisted'
           HAVING date_recorded LIKE '%2017%')
SELECT DISTINCT playerName, assistsPerGame
FROM P NATURAL JOIN Statistics
WHERE season = 2017;

-- Question 10
WITH R AS (SELECT DISTINCT rookieOfTheYear AS playerName
           FROM Award)
SELECT DISTINCT playerName
FROM R NATURAL JOIN Statistics
WHERE gamesPlayed >= 40 AND pointsPerGame >= 25 AND reboundsPerGame >= 5 AND assistsPerGame >= 5;

-- Question 11
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

-- Question 14
WITH T AS (SELECT playerName, season, pointsPerGame, assistsPerGame, reboundsPerGame
           FROM Statistics
           WHERE pointsPerGame >= 10 AND assistsPerGame >= 10 AND reboundsPerGame >= 10)
SELECT season, playername, pointsPerGame, assistsPerGame, reboundsPerGame
FROM T NATURAL JOIN Award
WHERE playerName != mvp;

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
