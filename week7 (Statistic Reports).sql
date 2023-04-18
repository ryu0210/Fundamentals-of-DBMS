CREATE DATABASE StudentRegistrySystem;
USE StudentRegistrySystem;

/** https://docs.google.com/document/d/185sy347FWNNjELJwlNqdjScvOwNSbLg3BjrrRWumFC4/edit?usp=sharing */

CREATE TABLE Student (
	SID INT, 
    Name VARCHAR (20),
	BOD DATE, 
    Gender CHAR, 
    Address VARCHAR (20));

CREATE TABLE Course (
	CID INT, 
    Semester VARCHAR(10), 
    Year INT, 
    Name VARCHAR (50), 
    Credit INT, 
    Prereq VARCHAR (50) );

CREATE TABLE Lecturer (
	LID INT, 
    Name VARCHAR (30), 
    BOD date, 
    Gender CHAR, 
    Address VARCHAR (50) );

CREATE TABLE CourseTaken (
	SID INT,
    CID INT, 
    Semester VARCHAR(50), 
    Year INT, 
    Grd INT );

INSERT INTO Student (SID, Name, BOD, Gender, Address)
VALUES
(1, 'John Smith', '2000-01-01', 'M', '123 Main Street'),
(2, 'Jane Doe', '2001-02-02', 'F', '456 Second Street'),
(3, 'Bob Johnson', '2002-03-03', 'M', '789 Third Street');

INSERT INTO Course (CID, Semester, Year, Name, Credit, Prereq)
VALUES
(1, 'Fall', 2022, 'Introduction to Computer Science', 3, NULL),
(2, 'Spring', 2023, 'Data Structures and Algorithms', 4, 'Introduction to Computer Science'),
(3, 'Fall', 2023, 'Database Systems', 4, 'Data Structures and Algorithms'),
(4, 'Spring', 2024, 'Operating Systems', 4, 'Data Structures and Algorithms');

INSERT INTO Lecturer (LID, Name, BOD, Gender, Address)
VALUES
(1, 'Dr. James Brown', '1970-01-01', 'M', '101 College Avenue'),
(2, 'Dr. Sarah Lee', '1980-02-02', 'F', '202 University Street'),
(3, 'Dr. David Kim', '1975-03-03', 'M', '303 School Road');

INSERT INTO CourseTaken (SID, CID, Semester, Year, Grd)
VALUES
(1, 1, 'Fall', 2022, 4),
(1, 2, 'Spring', 2023, 3),
(2, 1, 'Fall', 2022, 3),
(2, 2, 'Spring', 2023, 4),
(2, 3, 'Fall', 2023, NULL),
(3, 2, 'Spring', 2023, 2),
(3, 3, 'Fall', 2023, NULL),
(3, 4, 'Spring', 2024, NULL);


/** SQL-1 Exercise */
select count(*) from student;

Select count(*) from student where gender=“m”;

Select count(*) from student where gender=“f”;
 
Select sum(1) as count from student where gender=“m”;

Select gender, count(*) from student group by gender; 

Select gender, count(*) from student group by 1; 

Select gender, count(*) from student group by gender order by gender DESC; 

Select gender, count(*) from student group by 1 order by 1;

/** SQL-2 Exercise */
select min(grd) from coursetaken; 

select max(grd) as max from coursetaken; 

select avg(grd) as avg from coursetaken; 

select max(grd)-min(grd)+1 as range1 from coursetaken; 

select min(grd) as min, max(grd) as max, avg(grd) as avg, count(*) as count, max(grd)-min(grd)+1 as range1 from coursetaken;

select Semester, year, min(grd) as min, max(grd) as max, avg(grd) as avg, count(*) as count, max(grd)-min(grd)+1 as range1 from coursetaken group by Semester; 

select Semester, year, min(grd) as min, max(grd) as max, avg(grd) as avg, count(*) as count, max(grd)-min(grd)+1 as range1 from coursetaken group by Semester, year order by 1 desc;


/* Statistic Report */

# Query 1 & 2
CREATE TABLE Student2 (
	SID INT, 
    Name VARCHAR (20),
	BOD DATE, 
    Gender CHAR, 
    Address VARCHAR (20),
    Batch VARCHAR (10) );

CREATE TABLE sq_batch (
	Gender CHAR,
    Batch VARCHAR (10),
    Count BigINT(12)
    );

INSERT INTO Student2 (SID, Name, BOD, Gender, Address, Batch)
VALUES
(1, 'John Smith', '2000-01-01', 'M', '123 Main Street', 'C2018'),
(2, 'Jane Doe', '2001-02-02', 'F', '456 Second Street', 'C2018'),
(3, 'Bob Johnson', '2002-03-03', 'M', '789 Third Street', 'C2019');

#Query 3
CREATE TABLE gpa (
    sid int,
    grade decimal(2,1),
    year varchar (10),
    Batch varchar(10) )
    ENGINE = innoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE StudentGPA as
select distinct s.sid, ct.Semester, ct.year as GPA
from Student S, CourseTaken CT
where CT.sid = S.sid;

INSERT INTO gpa (sid, grade, year, Batch)
VALUES 
(1001, 3.5, '2020', 'C2018'),
(1001, 3.2, '2022', 'C2019'),
(1002, 3.8, '2021', 'C2018'),
(1002, 4.0, '2022', 'C2019'),
(1003, 3.7, '2020', 'C2018'),
(1003, 3.9, '2021', 'C2019');

delimiter //
CREATE PROCEDURE calc_GPA()
    begin
    declare done int default 0;
    declare current_sid char(12);
    declare current_sem varchar(5);
    declare current_year varchar(4);
    declare gpa_cursor cursor for select sid, Semester, year from StudentGPA;
    declare continue handler for not found set done = 1;
    open gpa_cursor;
    repeat
    fetch gpa_cursor into current_sid, current_sem, current_year;
    update StudentGPA
    set GPA = (SELECT SUM(CT.grd * C.Credit)/SUM(C.Credit)
    FROM Course C, CourseTaken CT
    WHERE CT.cid = C.cid AND CT.sid = current_sid AND
    CT.Semester = current_sem AND CT.year = current_year)
    WHERE StudentGPA.sid = current_sid AND
    StudentGPA.Semester = current_sem AND StudentGPA.year = current_year;
    until done
    end repeat;
    close gpa_cursor;
    end //

delimiter ;
call calc_GPA;
