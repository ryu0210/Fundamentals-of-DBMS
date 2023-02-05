CREATE DATABASE week2;
USE week2;

#Visit this link: https://docs.google.com/document/d/1ALFOxk1KBPRlBcM_J8dbvmkJLOyZVVuClmSVKJXDA6Q/edit?usp=sharing

/** ========================== Add Records for Table ================================ */


/** FOR STUDENT */
 CREATE TABLE Student(
	SID INT UNSIGNED NOT NULL, # SID = Student_I
    name VARCHAR(20) NOT NULL,
    major VARCHAR(50),
    grade VARCHAR(5)
    );

INSERT INTO student SET SID=101, name='Desmond', major='VCD', grade='A';
INSERT INTO student SET SID=102, name='Snowy', major='Fashion', grade='A';
INSERT INTO student SET SID=103, name='Allister', major='IS', grade='A';
INSERT INTO student SET SID=102, name='Rafie', major='IS', grade='B';

SELECT * FROM student;

/** FOR COURSETAKEN */

CREATE TABLE CourseTaken(
	SID VARCHAR(4),
    CID VARCHAR(4),
    Semester VARCHAR(5),
    Year VARCHAR(4),
    Grade INT
    );

INSERT INTO CourseTaken SET SID=101, CID=321, Semester=2, Year=2022, Grade=95;
INSERT INTO CourseTaken SET SID=102, CID=405, Semester=2, Year=2022, Grade=90;
INSERT INTO CourseTaken SET SID=103, CID=10, Semester=2, Year=2021, Grade=92;
INSERT INTO CourseTaken SET SID=104, CID=123, Semester=4, Year=2020, Grade=95;

SELECT * FROM CourseTaken;

/** FOR COURSE */

CREATE TABLE Course(
	CID VARCHAR(4), 
    Semester VARCHAR(5), 
    Year VARCHAR(4), 
    Name VARCHAR(20), 
    Credit INT, 
    Prereq VARCHAR(4)
    );

INSERT INTO Course SET CID=101, Semester=2, Year=2022, Credit=4, prereq='OOP';
INSERT INTO Course SET CID=102, Semester=3, Year=2021, Credit=3, prereq='DBMS';
INSERT INTO Course SET CID=103, Semester=4, Year=2022, Credit=4, prereq='DSA';
INSERT INTO Course SET CID=104, Semester=5, Year=2021, Credit=4, prereq='OOP';

SELECT * FROM Course;

/** FOR LECTURER */

CREATE TABLE Lecturer(
	LID VARCHAR(4), 
    Name VARCHAR(20), 
    BOD date, # BOD='yyyy-mm-dd'
    Gender VARCHAR(1), 
    Address VARCHAR(20) 
    );

INSERT INTO Lecturer SET LID=21, Name='Teddy', BOD='1968-12-21', Gender='M',Address='South Jakarta';
INSERT INTO Lecturer SET LID=21, Name='Rafie', BOD='1989-7-1', Gender='M',Address='West Jakarta';
INSERT INTO Lecturer SET LID=21, Name='Bambang', BOD='1939-12-9', Gender='M',Address='East Jakarta';
INSERT INTO Lecturer SET LID=21, Name='Elliot', BOD='2001-1-1', Gender='M',Address='North Jakarta';

SELECT * FROM Lecturer;

/** ========================== Browse Each Table ================================ */
SELECT SID, name, grade FROM Student;
SELECT SID, Semester, Year FROM CourseTaken;
SELECT CID, Name, Credit FROM Course;
SELECT LID, name, Gender, BOD FROM Lecturer;

/** ========================== Delete Record on Table ================================ */
DELETE FROM Student WHERE SID=101;
SELECT * FROM Student;

DELETE FROM CourseTaken WHERE Semester=4;
SELECT * FROM CourseTaken;

DELETE FROM Course WHERE Credit=4;
SELECT * FROM Course;

DELETE FROM Lecturer WHERE Name='Bambang';
SELECT * FROM Lecturer;

/** ========================== Alter Table ================================ */
ALTER TABLE Student CHANGE SID student_id int;
SELECT student_id, name, grade FROM Student;

ALTER TABLE CourseTaken CHANGE Semester Sem VARCHAR(30);
SELECT SID, Sem, Year FROM CourseTaken;

 ALTER TABLE Course CHANGE CID Course_ID int;
 SELECT Course_ID, Name, Credit FROM Course;
 
 ALTER TABLE Lecturer CHANGE Gender Sex VARCHAR(4);
 SELECT LID, name, Sex, BOD FROM Lecturer;