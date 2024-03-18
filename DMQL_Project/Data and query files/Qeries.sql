--Insert a row
INSERT INTO public.crew_basic_info(
nconst, primaryname, birthyear, deathyear, 
primaryprofession, knownfortitles)
VALUES ('nm00999999', 'test', 1023, 
2013, 'actor', 'tt053137');

--Update row
UPDATE public.crew_basic_info
SET primaryname='asdfgh'
WHERE nconst = 'nm0000008';
select * from public.crew_basic_info WHERE 
nconst = 'nm0000008';

--Delete row
DELETE FROM public.crew_basic_info
WHERE nconst='nm00999999';

--How many different types of titles arethere in the database?
SELECT B.titletype,
COUNT(*)FROM Title_Basics
AS B GROUP BY B.titletype
ORDER BY B.titletype ASC;

--How many different types of genres are there and number of movies in each genre?
SELECT G.genres, COUNT(G.genres)
ASCount FROM Title_Basic_Info AS G,
Title_Basic_Info AS B
WHERE B.tconst = G.tconstAND B.titleType = 'movie' GROUP BY 
G.genres 

--What are the different types of professions in the database and the count of each type of profession?
SELECT P.category, COUNT(*)
FROM Title_Principal_Crew AS P
GROUP BY P.category
ORDER BY P.category ASC;

--What is the count of movies made in each year from 1990 to 2019 in ascending order?
SELECT B.startYear, COUNT(*) AS
Total_Num_Of_Movies
FROM Title_Basics AS B
WHERE B.titleType IN ('movie','video')
GROUP BY B.startYear
HAVING B.startYear BETWEEN 1990
AND 2019 ORDER BY B.startYear ASC;

--What is the count of movies made in each year from 1990 to 2019 in ascending order?
SELECT runtimeMinutes, titleType, primaryTitle
FROM Title_Basics WHERE runtimeMinutes
>(10*60) ORDER BY
runtimeMinutes DESC, titleType ASC;

--What is the count of movies made in each year from 1990 to 2019 in ascending order?
SELECT B.primaryTitle, R.averageRating
FROM Title_Basics AS B, Title_Ratings AS
R
WHERE B.tconst = R.tconst
AND B.titleType = 'movie' AND
B.primaryTitle like 'James Bond';

--Total number of actors present in the entire database ?
CREATE OR REPLACE VIEW
Num(Number_of_actors)
AS SELECT COUNT(DISTINCT N.nconst)
AS Number_of_actors
FROM Crew_Basic_Info AS N
WHERE N.primaryprofession IN
('actor','actress');
select * from Num;

--Top 100 movies based on ratings with votes more than 100,000 ?
CREATE OR REPLACE VIEW
Top_movies(tconst
,primaryTitle,averageRating)
AS SELECT T.tconst, T.primaryTitle,
R.averageRating
FROM Title_Basics AS T,
Title_Ratings AS R
WHERE T.tconst = R.tconst
AND T.titleType = 'movie'
AND R.numVotes > 100000
ORDER BY R.averageRating DESC
LIMIT 100;
SELECT * FROM Top_movies LIMIT 15;

