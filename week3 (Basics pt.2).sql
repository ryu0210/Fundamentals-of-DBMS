CREATE DATABASE MyBank;
USE MyBank;

/* https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/ */

CREATE TABLE Customer(
	Customer_Id VARCHAR(20),
    Customer_Name VARCHAR(20),
    Customer_Street VARCHAR(20),
    Customer_City VARCHAR(20)
    );
    
CREATE TABLE Account(
    Account_Number VARCHAR(20),
    Balance INT
    );
    
CREATE TABLE Depositor(
    Customer_ID VARCHAR(20),
    Account_Number VARCHAR(20)
    );
    

INSERT INTO Customer SET Customer_Id='192-83-7465', Customer_Name='Johnson', Customer_Street='12 Alma St.', Customer_City='Palo Alto';
INSERT INTO Customer SET Customer_Id='019-28-3746', Customer_Name='Smith', Customer_Street='4 North St.', Customer_City='Rye';
INSERT INTO Customer SET Customer_Id='677-89-9011', Customer_Name='Hayes', Customer_Street='3 Main St.', Customer_City='Harrison';
INSERT INTO Customer SET Customer_Id='182-73-6091', Customer_Name='Turner', Customer_Street='123 Putnam St.', Customer_City='Stamford';
INSERT INTO Customer SET Customer_Id='321-12-3123', Customer_Name='Jones', Customer_Street='100 Main St.', Customer_City='Harrison';
INSERT INTO Customer SET Customer_Id='336-66-9999', Customer_Name='Lindsay', Customer_Street='175 Park Ave.', Customer_City='Pittsfield';
INSERT INTO Customer SET Customer_Id='019-28-3746', Customer_Name='Smith', Customer_Street='72 North St.', Customer_City='Rye';

INSERT INTO Account SET Account_Number='A-101', Balance=500;
INSERT INTO Account SET Account_Number='A-215', Balance=700;
INSERT INTO Account SET Account_Number='A-102', Balance=400;
INSERT INTO Account SET Account_Number='A-305', Balance=350;
INSERT INTO Account SET Account_Number='A-201', Balance=900;
INSERT INTO Account SET Account_Number='A-217', Balance=750;
INSERT INTO Account SET Account_Number='A-222', Balance=700;

INSERT INTO Depositor SET Customer_ID='192-83-7465', Account_Number='A-101';
INSERT INTO Depositor SET Customer_ID='192-83-7465', Account_Number='A-201';
INSERT INTO Depositor SET Customer_ID='019-28-3746', Account_Number='A-215';
INSERT INTO Depositor SET Customer_ID='677-89-9011', Account_Number='A-102';
INSERT INTO Depositor SET Customer_ID='182-73-6091', Account_Number='A-305';
INSERT INTO Depositor SET Customer_ID='321-12-3123', Account_Number='A-217';
INSERT INTO Depositor SET Customer_ID='336-66-9999', Account_Number='A-222';
INSERT INTO Depositor SET Customer_ID='019-28-3746', Account_Number='A-201';
INSERT INTO Depositor SET Customer_ID='192-83-7465', Account_Number='A-101';

SELECT * FROM Customer;

SELECT * FROM Account;

SELECT * FROM Depositor;

SELECT Depositor.Customer_ID, Customer.Customer_Name, Customer_City FROM Customer INNER JOIN Depositor ON Depositor.Customer_ID=Customer.Customer_ID;

SHOW VARIABLES LIKE "secure_file_priv";

SELECT Customer_id, Customer_Name, Customer_Street, Customer_City
FROM
Customer
INTO OUTFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Export.csv'
FIELDS ENCLOSED BY '“' 
TERMINATED BY ';' 
ESCAPED BY '“' 
LINES TERMINATED BY '\r\n';