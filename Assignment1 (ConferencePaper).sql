CREATE DATABASE ConferencePaper; 
USE ConferencePaper;

/** Do NOT FORGET MUSIC STORE */

CREATE TABLE Conference_Paper (
	Title VARCHAR(30),
    Abstract VARCHAR(30),
    PDF_File VARCHAR(30),
    Paper_ID INT
    );

CREATE TABLE Program_Requirements (
	Report_ID INT,
    Date_of_edit date,
    Reccomendation BIT,
    Comment VARCHAR(30)
    );

CREATE TABLE Author (
	Name VARCHAR(30) NOT NULL,
    Affiliation VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Significance INT NOT NULL
    );

INSERT INTO Conference_Paper (Title, Abstract, PDF_File, Paper_ID)
VALUES 
	('The Electricity', 'The car', 'Thesis.pdf', 21301),
	('Rogareth and Eek', 'Tale', 'Thesis.pdf', 57421),
	('Using Chlorophyll as Fuel', 'Petrol', 'Thesis.pdf', 24432),
	('Luminous Frog', 'Fiction', 'Thesis.pdf', 12345),
	('Conscious Trancing', 'Fiction', 'Thesis.pdf', 12132),
	('Hicking Protection Maker', 'The car', 'Thesis.pdf', 89422),
	('Microplastic Filter', 'Environment', 'Thesis.pdf', 01287),
	('Lion', 'Tale', 'Thesis.pdf', '75321'),
	('Is Jabberwock justified', 'Opinion', 'Thesis.pdf', '23101'),
	('Ock', 'The car', 'Thesis.pdf', 00881);

INSERT INTO Program_Requirements (Report_ID, Date_of_edit, Comment, Reccomendation)
VALUES
	(001, '2022-12-21', 'Good', 1),
    (002, '2021-11-21', 'Good', 1),
    (003, '2022-08-9', 'Ok', 1),
    (004, '2021-3-21', 'Good', 1),
    (005, '2023-1-10', 'Bad', 0),
    (006, '2012-12-12', 'Excellent', 1),
    (007, '2009-12-3', 'Ok', 1),
    (008, '2021-1-2', 'Ok', 1),
    (009, '2023-1-1', 'Excellent', 1),
    (010, '2023-12-31', 'Bad', 0);

INSERT INTO Author (Name, Affiliation, Email, Significance)
VALUES
	('John Doe', 'Harvard', 'JohnDoe@mail.com', 2),
    ('Johnny Jackson', 'Harvard', 'aaaa@mail.com', 1),
    ('Rexton Grader', 'Squidward', 'some@mail.com', 3);
    
SELECT * FROM Conference_Paper;
SELECT * FROM Program_Requirements;
SELECT * FROM Author ORDER BY Significance;

show tables;

SELECT *
  FROM Author 
  INNER JOIN Conference_Paper
  ON Author.Name = Conference_Paper.Title
  INNER JOIN Program_Requirements
  ON Conference_Paper.Title = Program_Requirements.Date_of_edit
  ORDER BY Significance;

SELECT *
	FROM Author
    JOIN Conference_Paper, Program_Requirements
    ORDER BY Significance;
    