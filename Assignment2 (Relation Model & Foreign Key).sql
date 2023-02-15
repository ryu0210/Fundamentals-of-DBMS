CREATE DATABASE BankRelations;
USE BankRelations;


/** https://docs.google.com/document/d/1lrecjL_RQPUSaodrrswvU9e2eRZr1KVzzjdeZZE0gMA/edit?usp=sharing */


/** Question 1 */
CREATE TABLE Customer ( 
	Name varchar(32), 
    Gender varchar(6), 
    Address varchar(32), 
    Account_ID INT, 
    PRIMARY KEY (Account_ID) 
    );

INSERT INTO Customer (Name, Gender, Address, Account_ID) 
VALUES 
	('Miguel', 'Male', 'Resetta', 3244),  
    ('Eli', 'Male', 'Jamestown', 9102), 
    ('Tory', 'Female', 'South Bohan', 1310), 
    ('Robby', 'Male', 'Los Angeles', 3781);

CREATE TABLE Account ( 
Account_ID INT, 
Balance INT, 
Password varchar(32), 
PRIMARY KEY (Account_ID), 
FOREIGN KEY (Account_ID) REFERENCES Customer(Account_ID) 
);

INSERT INTO Account (Account_ID, Balance, Password) 
VALUES 
	(3244,  400, 'Password'), 
    (9102,  4000, 'Sampoerna'), 
    (1310,  1000, 'Shield'), 
    (3781,  500, 'Rexton');

SELECT C.Name, A.Balance FROM Customer C, Account A WHERE A.Balance>500 AND C.Account_ID = A.Account_ID; /** To return balance more than $500 */

UPDATE Account A , Customer C SET A.balance = A.balance - 300 WHERE  C.name = 'Frodo' AND A.Account_ID = C.Account_ID; /** Withdraw Account */


/** Question 2 */
CREATE TABLE Student ( 
Name varchar(32), 
Gender varchar(6), 
Student_ID INT, PRIMARY KEY (Student_ID) 
);

INSERT INTO Student (Name, Gender, Student_ID) 
VALUES 
	('Sam', 'Female', 6201),  
    ('Demeitri', 'Male', 4702), 
    ('Kyler', 'Male', 2809), 
    ('Moon', 'Femle', 4564);

CREATE TABLE Course ( 
	Student_ID INT, 
	Course_ID INT, 
    Course_name varchar(32), 
    Grade INT, 
    PRIMARY KEY (Student_ID), 
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) );

INSERT INTO Course (Student_ID, Course_ID, Course_name, Grade) 
VALUES 
	(6201,  101, 'Ecology', 3.2), 
    (4702,  102, 'Object Oriented Programming', 2.8), 
    (2809,  103, 'Technical Writing', 3.1), 
    (4564,  104, 'Database Management Systems', 2.9);

SELECT S.Name FROM Student S, Course C WHERE C.Course_Name ='Database Management Systems' AND S.Student_ID = C. Student_ID; /** To show student grade greater than 3.0 */

DELETE FROM Student S, Course C  WHERE C.Course_name=  'Database Management Systems'; /** Ignore the red errors here */
