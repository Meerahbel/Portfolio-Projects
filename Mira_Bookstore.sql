CREATE TABLE library(
Book_id SMALLINT PRIMARY KEY,
Book_name VARCHAR(50),
Publisher VARCHAR(50),
ISBN CHAR(50),
Edition VARCHAR(50),
No_of_pages SMALLINT,
Price DECIMAL(6,2),
City VARCHAR(50),
Sales MEDIUMINT
);

-- To view the data in your table
select* 
from library;

-- To insert values in the columns of your table
INSERT INTO library VALUES(
1, 'Mistress of the game', 'William Morrow', '0061728381', 'First Edition', 336, 15.97, 'U.S.A', 65);
INSERT INTO library VALUES(
2, 'Flicker in the dark', 'Minotaur Books', '1250803829', 'January Edition', 368, 12.99, 'New york', 72);
INSERT INTO library VALUES(
3, "Chef's kiss", 'Blackstone Pub', '1620109042', 'May Edition', 300, 17.00, 'New york', 55);
INSERT INTO library VALUES(
4, 'The secret history', 'Ballantine Books', '0140167773', 'September Edition', 544, 18.00, 'Nashville', 80);
INSERT INTO library VALUES(
5, 'Someday, Maybe', 'Graydon House', '1525899805', 'November Edition', 352, 14.99, 'Los Angeles', 50);
INSERT INTO library VALUES(
6, 'You deserve each other', 'G.P. Putham \'s Sons', '0593085426', 'April Edition', 384, 17.00, 'Los Angeles', 90);
INSERT INTO library VALUES(
7, 'The last flight', 'Sourcebooks Landmark', '1728215722', 'June Edition', 320, 14.35, 'Nashville', 100);
INSERT INTO library VALUES(
8, 'The downstairs neighbor', 'G.P. Putham \'s Sons', '0593190386', 'February Edition', 384, 10.29, 'U.S.A', 40);


-- Decided to change the datatype for one of the column
alter table library
modify column ISBN varchar(50);

-- Made an error in the values for the row 
delete from library
where Book_id= 2;

-- Most expensive book
select library.Book_name
from library
where library.Price in ( 
select max(Price) 
from library);

-- Most bought book
select library.Book_name
from library
where library.Sales in ( 
select max(Sales) 
from library);

-- Least preferred book by readers 
-- judging from sales
select library.Book_name
from library
where library.Sales in ( 
select min(Sales) 
from library);

-- Most popular books in each city 
-- judging from sales
-- First determine the max number of sales from each city 
select max(Sales)
from library
group by city;

-- Then nest the query to get the names of those books with the maximum number of sales for each city
select library.Book_name, library.City
from library
where library.Sales in ( 
select max(Sales)
from library
group by city);


