create database netflix;
use netflix;

-- Display the all records of netflix originals table
select *
from netflix_originals;

-- Display the all records of genre details table
select *
from genre_details;

-- Display the title whoes runtime is more than 100.

select Title, Runtime
from netflix_originals
where Runtime > 100;

-- Which genres id have an average IMDb score higher than 7.5?

select GenreID, avg(IMDBScore)
from netflix_originals
group by GenreID
having avg(IMDBScore) > 7.5;

-- Write a second minimum IMDBScore title.

select Title, IMDBScore
from netflix_originals
where IMDBScore = 
(select min(IMDBScore) from netflix_originals
where IMDBScore > (select min(IMDBScore) from netflix_originals));

-- List Netflix Original titles in descending order of their IMDb scores.

select Title,IMDBScore
from netflix_originals
order by IMDBScore desc;

-- Retrieve the top 10 longest Netflix Originals by runtime.

select Title, runtime
from netflix_originals
order by runtime desc
limit 10;

-- How many titles are thre in each language.

select Language, count(Title) as Total_Titles
from netflix_originals
group by language;

-- Write a third max IMDBScore Title. 

select Title, IMDBScore
from netflix_originals
where IMDBScore = 
(select max(IMDBScore) from netflix_originals
where IMDBScore < (select max(IMDBScore) from netflix_originals
where IMDBScore < (select max(IMDBScore) from netflix_originals)));

-- Retrieve the titles of Netflix Originals along with their respective genres.

select title, genre
from netflix_originals
inner join genre_details
on netflix_originals.GenreID = genre_details.GenreID;

-- How many Netflix Originals are there in each genre?

select Genre, Count(Title)
from netflix_originals
inner join genre_details
on netflix_originals.GenreID = genre_details.GenreID
group by Genre;

-- What are the average IMDb scores for each genre of Netflix Originals?

select Genre, avg(IMDBScore)
from netflix_originals
inner join genre_details
on netflix_originals.GenreID = genre_details.GenreID
group by Genre;

-- Insert the 5 netflix any movies in 2024?

Insert into netflix_originals 
(Title,GenreID,Runtime,IMDBScore,Language,Premiere_Date)
values 
('Mr & Mrs Mahi','G7',138,6.0,'Hindi','2024-06-12'),
('Srikanth','G7',134,7.4,'Hindi','2024-06-05'),
('Society of the Snow','G7',145,7.8,'Spanish','2024-01-06'),
('Good Grief','G6',100,6.4,'English','2024-01-05'),
('Lift','G2',106,5.5,'English','2024-01-12');

-- Update Srikanth movie IMDBScore from 7.4 to 7.5

update netflix_originals
set IMDBScore = 7.5
where Title = 'Srikanth';

-- Delete the Society of the Snow movie from the table.

Delete from netflix_originals
where Title = 'Society of the Snow';

-- Delete the all records from the table.

Truncate table netflix_originals;

/* Delete the Netflix_Originals table from tha netflix
database */

Drop table netflix_originals;