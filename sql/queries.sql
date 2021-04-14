-- Question 2
-- Starting from the 2013 season, what is the average points scored per game for an MVP?
-- Tell us the season, player name, and points per game.
WITH MVP AS (SELECT season, mvp AS 'playerName'
             FROM Award
             WHERE season >= 2013)
SELECT season, playerName, pointsPerGame
FROM MVP NATURAL JOIN Statistics;

-- Question 3
-- Is it more common for an MVP to be the top performer in rebounds, points, or assists?
-- Tell us the number of players who were MVP with either most points, most rebounds, or most assists.
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
-- How many MVPs were once a Rookie of the Year? List all MVPs that satisfy the requirement.
SELECT DISTINCT A1.mvp
FROM Award AS A1 JOIN Award AS A2 ON A1.mvp = A2.rookieOfTheYear;

-- Question 5
-- Calculate the average buzzer-beater distance from 2000 to 2009
-- and the average buzzer-beater distance from 2010-2019. 
-- Return the average distance from the 2000s and the average distance from the 2010s.
WITH T1 AS (SELECT AVG(distance) AS 'avgDistanceOf2000s'
            FROM BuzzerBeater
            WHERE date_recorded LIKE '%200%'),
     T2 AS (SELECT AVG(distance) AS 'avgDistanceOf2010s'
            FROM BuzzerBeater
            WHERE date_recorded LIKE '%201%')
SELECT *
FROM T1, T2;

-- Question 6
-- List the winners of the rebounding title every year since it was recorded.
-- What were their average rebounds per game?
-- Tell us the player name, season, and rebounds per game.
WITH R AS (SELECT mostRebounds AS playerName, season
           FROM Award)
SELECT playerName, season, reboundsPerGame
FROM R NATURAL JOIN Statistics;

-- Question 7
-- List the team with the most games played throughout its history that is still yet to
-- win an NBA Championship.
-- Tell us the franchise namd and games played.
WITH T AS (SELECT *
           FROM Team
           WHERE championships = 0),
     M AS (SELECT franchiseName, gamesPlayed
           FROM T
           WHERE gamesPlayed = (SELECT MAX(gamesPlayed) FROM T))
SELECT *
FROM M;

-- Question 8
-- Is there a correlation between injuries and minutes played per game?
-- List all the players injured in 2019 along with the average minutes per game played
-- by each injured player.
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
-- Carrying the squad: list the players with an unassisted buzzer beater in 2017. 
-- How many assists per game did they have that year? List the player name and assists per game.
WITH P AS (SELECT DISTINCT playerName, date_recorded
           FROM BuzzerBeater
           WHERE assistedPlayerName = 'unassisted'
           HAVING date_recorded LIKE '%2017%')
SELECT DISTINCT playerName, assistsPerGame
FROM P NATURAL JOIN Statistics
WHERE season = 2017;

-- Question 10
-- List every Rookie of The Year who has averaged at least 25 points per game,
-- 5 rebounds per game, and 5 assists per game in a season (minimum 40 games played).
WITH R AS (SELECT DISTINCT rookieOfTheYear AS playerName
           FROM Award)
SELECT DISTINCT playerName
FROM R NATURAL JOIN Statistics
WHERE gamesPlayed >= 40 AND pointsPerGame >= 25 AND reboundsPerGame >= 5 AND assistsPerGame >= 5;

-- Question 11
-- Which team had the most game-winning shots from 2010-2020?
-- Did that team win any championships?
-- List the franchise name and number of championships won.
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

-- Question 12
-- Overpaid: find the players with contracts worth more than $20 million
-- in one season that did not score more than 10 points per game.
-- Tell us the player name, season, PPG, and salary.
WITH P AS (SELECT *
           FROM Contract
           WHERE salary > 20000000)
SELECT playerName, season, pointsPerGame, salary
FROM P NATURAL JOIN Statistics
WHERE pointsPerGame < 10;

-- Question 13
-- List the first season a player earned $30 million or more in one year,
-- then list the next time another player besides the first one got paid $30 million or more.
-- Make sure to list both player’s names. Hint: being the GOAT gets you paid quite well..
WITH S AS (SELECT DISTINCT playerName
           FROM Contract
           WHERE salary >= 30000000
           ORDER BY season
           LIMIT 2)
SELECT *
FROM S AS S1, S AS S2
WHERE S1.playerName != S2.playerName
LIMIT 1;

-- Question 14
-- List the players who have averaged a triple-double in a season but did NOT win MVP that season.
-- Hint: a triple double is when a player averages 10 or more points in 3 positive statistic categories.
-- You may use PPG, APG, and RPG for this. Return the season, player name, PPG, APG, and RPG.
WITH T AS (SELECT playerName, season, pointsPerGame, assistsPerGame, reboundsPerGame
           FROM Statistics
           WHERE pointsPerGame >= 10 AND assistsPerGame >= 10 AND reboundsPerGame >= 10)
SELECT season, playername, pointsPerGame, assistsPerGame, reboundsPerGame
FROM T NATURAL JOIN Award
WHERE playerName != mvp;

-- Question 15
-- Of all the MVPs, find who had the most buzzer-beaters.
-- List the player and all the teams they had a buzzer-beater against.	
WITH MVP AS (SELECT playerName, COUNT(playerName) AS 'numBuzzerbeaters'
             FROM (SELECT DISTINCT mvp AS 'playerName'
                   FROM Award) AS t1 NATURAL JOIN BuzzerBeater
             GROUP BY playerName),
     MostBuzzer AS (SELECT playerName, numBuzzerbeaters
                    FROM MVP
                    WHERE numBuzzerbeaters = (SELECT MAX(numBuzzerbeaters) FROM MVP))
SELECT playerName, opposingTeam
FROM MostBuzzer NATURAL JOIN BuzzerBeater;

-- Question 20
-- Find the team with the most championship wins.
-- List the amount of buzzer-beaters they have scored and
-- how many buzzer-beaters have been scored against them.
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