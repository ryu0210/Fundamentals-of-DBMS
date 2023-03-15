CREATE DATABASE NewRegistry;
USE NewRegistry;

/** https://docs.google.com/document/d/12VVb52hoyOF2ejPxxf0lwZNlrscs8G1CoKUexRWwVCo/edit?usp=sharing */

CREATE TABLE Student (
	SID INT,
    Sname VARCHAR(20),
    GPA FLOAT,
    Birth DATE,
    Cno INT /* or Cnumber but alternative, IMPORTANT for the quiery */
    );

CREATE TABLE Course (
	Cnumber INT,
    Cname VARCHAR(20)
    );

INSERT INTO Student (sid, sname, GPA, birth, Cno)
VALUES
	(1, 'John', 4.0, '2003-12-21', 1),
    (2, 'Mary', 3.0, '2001-12-01', 3),
    (3, 'Bob', 3.5, '2002-02-07', 3),
    (4, 'Tom', 3.0, '2001-01-17', 2),
    (5, 'Bill', NULL, '2003-01-20', 1);

INSERT INTO Course (Cnumber, Cname)
VALUES
	(1, "OOP"),
    (2, "DBMS"),
    (3, "DSA");

/** Procedure is good for addition adn substration operations in SQL */

CREATE TABLE CourGPA AS
SELECT Cnumber, 0 AS CGPA FROM Course;


/** Use Delimiter for procedure queries */
Delimiter //
/* Paraml is a type of parameter??? */
CREATE PROCEDURE updateGPA (IN paraml INT)
BEGIN
	UPDATE CourGPA
    SET CGPA = (SELECT sum(GPA) FROM Student WHERE Cno = paraml)
    WHERE Cnumber = paraml;
END; //


/** CALLING EVERY PROCEDURE */

CALL CourGPA(1);
CALL CourGPA(2);
CALL CourGPA(3);