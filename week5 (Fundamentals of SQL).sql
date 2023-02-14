CREATE DATABASE Registry;
USE Registry;

/** https://docs.google.com/document/d/1BoovDBhwUSZHvkT4Xyq7uVbMt4JsURittcCmVTuYk2U/edit?usp=sharing */

CREATE TABLE Students(
	sid CHAR(20),
	name CHAR(20),
	login CHAR(10),
	age INTEGER,
	gpa REAL 										/* an approximate number with floating point numeric data */
    );

CREATE TABLE Enrolled(
	sid CHAR(20),
    cid CHAR(20),
    grade CHAR(2)
    );

INSERT INTO Students (sid, name, login, age, gpa)
VALUES
	(53666, 'Jones', 'jones@cs', 18, 3.4),
    (53688, 'Smith', 'smith@eecs', 18, 3.2),
    (53650 , 'Smith', 'smith@math', 19, 3.8);

INSERT INTO Enrolled (sid, cid, grade)
VALUES
	(53666, 'COP4', 'A'),
    (53688, 'COP4',  'B-'),
    (53650, 'CDA3', 'A');

ALTER TABLE Students ADD COLUMN firstYear integer; 			/*The schema of Students is altered by adding a new field*/

DROP TABLE Students;

INSERT INTO Students (sid, name, login, age, gpa) VALUES (53688, 'Smith', 'smith@ee', 18, 3.2);

DELETE 
FROM Students S 
WHERE S.name = 'Smith'; /** It works on Command Line, so ignore the crosses */

UPDATE Students S
SET S.age = S.age + 1, S.gpa = S.gpa -1
WHERE S.sid = 53688;

UPDATE Students S
SET S.gpa = S.gpa -0.1
WHERE S.gpa >= 3.3;

/** Drop Table Enrolled first before doing this */

CREATE TABLE Enrolled(
	sid CHAR(20),
	cid CHAR(20),
	grade CHAR(2),
	PRIMARY KEY (sid,cid) );		/** Primary Key makes a value unique, so if teh corresponding table value is not similar, it wom't print */

CREATE TABLE Enrolled(
	sid CHAR(20),
	cid CHAR(20),
	grade CHAR(2),
	PRIMARY KEY (sid),
	UNIQUE (cid, grade) );


CREATE TABLE Enrolled
(sid CHAR(20), cid CHAR(20), grade CHAR(2),
PRIMARY KEY (sid,cid),
FOREIGN KEY (sid) REFERENCES Students );

/** SEPERATE RUNNING CODES, FOR FOREIGN KEY */

CREATE TABLE Students (
	sid VARCHAR(20),
	name VARCHAR(20),
    login VARCHAR(10),
    age INT,
    gpa REAL,
    PRIMARY KEY (sid)
    );
    
CREATE TABLE Enrolled (
    sid VARCHAR(20),
    cid VARCHAR(20),
    grade VARCHAR(2),
    PRIMARY KEY (sid, cid),
    FOREIGN KEY (sid) REFERENCES Students(sid)
    );

INSERT INTO Enrolled (sid, cid, grade) VALUES (53777, 'Topology201', 'B'); /* Will cause error due to foreign key */

INSERT INTO Enrolled (sid, cid, grade) VALUES (53688, 'History101', 'A');

/** ========================================= */

SET FOREIGN_KEY_CHECKS=0;

DELETE FROM Students WHERE sid=53688;

SET FOREIGN_KEY_CHECKS=1;
