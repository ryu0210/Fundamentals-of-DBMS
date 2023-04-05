CREATE DATABASE TheDepartmentTrigger;
USE TheDepartmentTrigger;

/* https://docs.google.com/document/d/1i9VJg3pT4Nv9LayvYCFBaVvh8KnTNarAzD4JWERR2A4/edit?usp=sharing */

CREATE TABLE employee (
	id INT,
    name VARCHAR(20),
    superid int,
    salary int,
    bdate DATE,
    dno INT /* or Cnumber but alternative, IMPORTANT for the quiery */
    );

INSERT INTO employee (id, name, superid, salary, bdate, dno)
VALUES
	(1, 'John', 3, 100000, '2003-12-21', 1),
    (2, 'Mary', 3, 50000, '2001-12-01', 3),
    (3, 'Bob', NULL, 80000, '2002-02-07', 3),
    (4, 'Tom', 1, 50000, '2001-01-17', 2),
    (5, 'Bill', NULL, NULL, '2003-01-20', 1);

CREATE TABLE deptsal (
	dnumber int, 
    totalsalary int
    );

INSERT INTO deptsal (dnumber, totalsalary) VALUES
    (1, 100000),
    (2, 50000),
    (3, 130000);

delimiter :
create trigger update_salary
after insert on employee
for each row
begin
      if new.dno is not null then
         update deptsal
         set totalsalary = totalsalary + new.salary
         where dnumber = new.dno;
	  end if;
end:

insert into employee values (6, 'lucy', null, 90000, '1981-01-01', 1); /* Salary changes */

insert into employee values (7, 'george', null, 45000, '1971-11-11', null); /* Salary does not change */

delimiter :
create trigger update_salary2
after update on employee
for each row
begin
   if old.dno is not null then
      update detpsal
      set totalsalary = totalsalary - old.salary
      where dnumber = old.dno;
   end if;
   if new.dno is not null then
      update detpsal
      set totalsalary = totalsalary - new.salary
      where dnumber = new.dno;
   end if;
end :

update employee set salary = 100000 where id = 6;

delimiter :
create trigger update_salary3
before delete on employee
for each row
begin 
   if(old.dno is not null) then
      update deptsal
      set totalsalary = totalsalary - old.salary
      where dnumber = old.dno;
   end if;
end :

delete from employee where id = 6;

delete from employee where id = 7;