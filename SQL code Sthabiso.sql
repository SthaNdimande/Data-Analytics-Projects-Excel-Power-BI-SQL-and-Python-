/*creating a data base for the big data analytics class */
Create database bda_class

/*switching into the new database */
Use bda_class

/*creating a table in the database */
create table personal_details (
id integer primary key,
firstname varchar (20),
lastname varchar (25),
dob date,
gender varchar (6)
);

/*introducing records/data into the relation */
insert into personal_details values 
(200210,'Sthabiso','Ndimande','2002-10-30','Male'),
(200110,'Mbali','Dladla','2000-02-20','Female'),
(199903,'Mbali','Mbhele','1999-03-13','Female'),
(200109,'Cebolenkosi','Zuma','2001-09-26','Male'),
(200304,'Indibabale','Mbumbulu','2003-04-05','Female')

/*Retrieving all records from a table */
Select * from personal_details 

Select id from personal_details



/*create a table and leave out the number of characters in varchar field*/
create table personal_data (
id integer primary key,
firstname varchar, 
lastname varchar (25),
dob date,
gender varchar 
);

/*Attempting to insert records into the personal_data table SQL will throw an error */
insert into personal_data values
(200109,'John','Murphy','2001-09-25','Male');

/*Correcting the errors the table declaration */
Alter table personal_data alter column firstname varchar(15);
Alter table personal_data alter column gender varchar(6);
Select*
from personal_data;

/*using Alter table to add a new column to an existing table */
Alter table personal_data add postal_address varchar (100)
Alter table personal_data add assessment_score float;

/*Adding records to the table personal_data */
insert into personal_data values
(300401,'John','Murphy','2001-09-25','Male','5 Dulles Morningside Durban', 65.5);

insert into personal_data values
(200401,'Sthabiso','Ndimande','2004-01-28','Female','145 Milner Rd PMB',95.5);

/*Updating the table to change the records - filling in the nulls in the personal_data */
update personal_data set postal_address = '122 K E Masinga Road Durban'
where id = 200109;

update personal_data set assessment_score = '75.5'
where id = 200109;





/*Retrieving all records from a table */
Select id from personal_details
Select* from personal_data 


/*Retrieving specific records from a table */
Select* from personal_details where id = 200210;
Select* from personal_details where gender = 'Male';

/*Retrieving specific attributes from a table */
Select id, firstname, dob from personal_details;
Select id, firstname, dob from personal_details where id = 200210;




Select* from personal_details;

Select* from personal_data;