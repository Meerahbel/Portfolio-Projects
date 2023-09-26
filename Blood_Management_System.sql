create table blood_donor(
Donor_id int primary key,
Name varchar(50),
Age tinyint,
Blood_group varchar(4),
Date_donated datetime
);

select*
from blood_donor;


create table blood_recipient(
Name varchar(50) primary key,
Age tinyint,
Blood_group varchar(4), 
Date_received datetime); 

select*
from blood_recipient
order by Date_received;

create table other_hospitals(
Name varchar(50),
Blood_group_needed varchar(4), 
Date_requested datetime);

select*
from other_hospitals
order by Date_requested;

create table blood_bank(
Blood_id int primary key,
Blood_group varchar(4),
Quality_of_the_blood varchar(20),
Donor_id int,
foreign key (Donor_id) references blood_donor(Donor_id) 
);

select*
from blood_bank;

-- Insert rows into tables created
-- For blood_donor table

insert into blood_donor values(
1, 'Oyeneye Khalid', 23, 'O-', '2023-02-13 14:30:03');
insert into blood_donor values(
2, 'Ugoji Mirabel', 22, 'AB+', '2023-02-15 12:33:02');
insert into blood_donor values(
3, 'Shuaib Rodiat', 23, 'O+', '2023-02-19 11:20:00');
insert into blood_donor values(
4, 'Okokon Josephine', 21, 'A-', '2023-02-23 09:05:03');
insert into blood_donor values(
5, 'Ejeye Boluwatife', 20, 'O-', '2023-02-27 10:10:01');
insert into blood_donor values(
6, 'Ekwem Gabriella', 22, 'B+', '2023-03-11 15:30:03');
insert into blood_donor values(
7, 'Sumareh Aisha', 24, 'B-', '2023-03-20 08:50:30');
insert into blood_donor values(
8, 'Adebayo Aisha', 30, 'O+', '2023-03-24 11:30:03');
insert into blood_donor values(
9, 'Oyeneye Khalid', 23, 'O-', '2023-03-27 14:30:03');
insert into blood_donor values(
10, 'Okokon Josephine', 21, 'A-', '2023-03-30 10:55:03');

-- For the blood_recipient table

insert into blood_recipient values(
'Nwafor Princess', 23, 'AB+', '2023-02-23 09:05:03');
insert into blood_recipient values(
'Onyekachi Chinenye', 24, 'O-', '2023-03-11 15:30:03');
insert into blood_recipient values(
'Eliminhele Augusta', 22, 'B-', '2023-03-24 11:30:02');
insert into blood_recipient values(
'Ogbormeh Blessing', 20, 'B+', '2023-03-27 10:55:30');
insert into blood_recipient values(
'Ogbonna Olachi', 21, 'O+', '2023-03-30 08:14:33');

-- For other_hospitals table

insert into other_hospitals values(
'St Charles Hospital', 'O-', '2023-02-23 09:05:03');
insert into other_hospitals values(
'Ave Maria Hospital', 'O-', '2023-03-11 15:30:03');
insert into other_hospitals values(
'John Thomas Hospital', 'AB+', '2023-03-27 10:55:30');
insert into other_hospitals values(
'Blessed Hearts Hospital', 'B-', '2023-03-30 08:14:33'); 

-- For blood_bank table

insert into blood_bank values(
1, 'O-', 'CONTAMINATED', 5);
insert into blood_bank values(
2, 'O-', 'NOT CONTAMINATED', 9);
insert into blood_bank values(
3, 'O+', 'NOT CONTAMINATED', 8);
insert into blood_bank values(
4, 'A-', 'CONTAMINATED', 4);
insert into blood_bank values(
5, 'A-', 'NOT CONTAMINATED', 10);

-- List the first and last name of all donors whose blood type is A+.

SELECT SUBSTR(Name,1,(LOCATE(' ',Name)))  AS LASTTNAME,
SUBSTR(Name,(LOCATE(' ',Name)))  AS FIRSTNAME from blood_donor
WHERE Blood_group= 'A+';

-- List the first and last name of all donors whose blood type is O+.

SELECT SUBSTR(Name,1,(LOCATE(' ',Name)))  AS LASTTNAME,
SUBSTR(Name,(LOCATE(' ',Name)))  AS FIRSTNAME from blood_donor
WHERE Blood_group= 'O+';

-- List hospitals in need of AB+ blood

SELECT*
FROM other_hospitals
WHERE Blood_group_needed= 'AB+';

-- Find the names of donors whose age is above 21 years and have donated since 2023/01/01

SELECT blood_donor.Name, blood_donor.Blood_group
from blood_donor
where Age>21 and date(Date_donated)>='2023-01-01' ;

-- Find the blood groups that are not contaminated in the blood bank

select blood_bank.Blood_group, blood_bank.Quality_of_the_blood
from blood_bank
where Quality_of_the_blood='Not contaminated';

-- Find the total number of donors

select count(Name) as Total_number_of_donors
from blood_donor;

-- Find the total number of recipient

select count(Name) as Total_number_of_recipient
from blood_recipient;

-- Find the total number of blood in blood bank

select count(Blood_id) as Total_number_of_blood
from blood_bank;

-- Number of O- negative blood available in blood bank

select count(blood_bank.Blood_group) as 'Total_number_of_O negative'
from blood_bank
where Blood_group= 'O-';