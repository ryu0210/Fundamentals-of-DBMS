CREATE DATABASE TheDepartment;

/* https://docs.google.com/document/d/1RuCp7OG7Je_nnrVCmVnDDHgKePhCT9ZAsuT_BCIAEZQ/edit?usp=sharing */

USE TheDepartment;

CREATE TABLE employee (
	id INT,
    name VARCHAR(20),
    superid int,
    salary int,
    bdate DATE,
    dno INT /* or Cnumber but alternative, IMPORTANT for the quiery */
    );

CREATE TABLE department (
	dnumber INT,
    dname VARCHAR(20)
    );

INSERT INTO employee (id, name, superid, salary, bdate, dno)
VALUES
	(1, 'John', 3, 100000, '2003-12-21', 1),
    (2, 'Mary', 3, 50000, '2001-12-01', 3),
    (3, 'Bob', NULL, 80000, '2002-02-07', 3),
    (4, 'Tom', 1, 50000, '2001-01-17', 2),
    (5, 'Bill', NULL, NULL, '2003-01-20', 1);

INSERT INTO department (dnumber, dname)
VALUES
	(1, "Payroll"),
    (2, "TechSupport"),
    (3, "Research");

/** Use Delimiter for procedure queries */
delimiter $$
drop procedure if exists updateSalary$$ /* To drop old procedure should they exist */

create procedure updateSalary()
begin
      declare done int default 0;
      declare current_dnum int;
      declare dnumcur cursor for select dnumber from deptsal; /* dnumcur is cursor */
      declare continue handler for not found set done = 1;
      
      open dnumcur;
      
      repeat
         fetch dnumcur into current_dnum;
         update deptsal
         set totalsalary = (select sum(salary) from employee where dno = current_dnum)
         where dnumber = current_dnum;
	  until done
      end repeat;
      
      close dnumcur;
end$$

/* Add two more values for part 2 */

INSERT INTO employee (id, name, superid, salary, bdate, dno)
VALUES
    (6, 'Lucy', NULL, 90000, '2003-01-01', 1),
    (7, 'George', NULL, 45000, '2001-11-01', NULL);
    

delimiter |

create procedure giveRaise (in amount double)
begin 
   declare done int default 0;
   declare eid int;
   declare sal int;
   declare emprec cursor for select id, salary from employee;
   declare continue handler for not found set done = 1;
   
   open emprec;
   repeat 
      fetch emprec into eid, sal;
      update employee
      set salary = sal + round(sal * amount)
      where id = eid;
   until done
   end repeat;

end |