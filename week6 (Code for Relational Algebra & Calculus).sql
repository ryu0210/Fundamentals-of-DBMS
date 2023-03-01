create database BoatReservation;
use BoatReservation;

/** https://docs.google.com/document/d/1lXwIcjCeeMwe5mQGHwkNwYy6Yk73dZDChb9GquYakT0/edit?usp=sharing */

create table Sailors (
    sid int,
    sname varchar(20),
    rating int,
    age float
    );

create table Reservation (
    sid int,
    bid int,
    day date
    );

create table Boats (
    bid int,
    bname varchar(20),
	color varchar(10)
    );

create table Sailors2 (
   sid int,
    sname varchar(20),
    rating int,
	age float
    );

insert into Reservation (sid, bid, day)
    values
    (22, 101, '1996-10-10'),
    (58, 103, '1996-11-12'),
    (31, 104, '1996-10-21'),
    (19, 105, '1996-11-14');

insert into Sailors (sid, sname, rating, age)
    values
    (22, 'dustin', 7, 45.0),
    (31, 'lubber', 8, 55.5),
    (19, 'bane', 6, 32.5),
    (58, 'rusty', 10, 35.0);

insert into Sailors2 (sid, sname, rating, age)
    values
    (28, 'yuppy', 9, 35.0),
    (31, 'lubber', 8, 55.5),
    (44, 'guppy', 5, 35.0),
    (58, 'rusty', 10, 35.0);

insert into Boats (bid, bname, color)
    values
    (101, 'Seashark', 'black'),
    (102, 'Yacht', 'white'),
    (103, 'Squalo', 'grey'),
    (104, 'Marquis', 'red'),
    (105, 'Jetsam', 'green'),
    (106, 'Tuk-tuk', 'blue'),
    (107, 'Bumblebee', 'yellow');

SELECT A.sname, R.bid FROM Sailors A, Reservation R WHERE R.bid = 103 AND A.sid = R.sid;
/* The AND is to prevent two same values to be printed on different values [p.s remember the excel overload incident ;-) */

SELECT A.color, C.sname FROM Boats A, Reservation B, Sailors C WHERE A.color = 'red' AND A.bid = B.bid AND B.sid = C.sid AND C.sname = C.sname;
/* Sometimes the reason why varchar don't print is because you use (‘), not (') */

SELECT A.color, C.sname FROM Boats A, Reservation B, Sailors C WHERE (A.color = 'red' OR A.color = 'green')  AND A.bid = B.bid AND B.sid = C.sid AND C.sname = C.sname;

SELECT A.color, C.sname FROM Boats A, Reservation B, Sailors C WHERE A.color = 'red' AND A.color = 'green' AND A.bid = B.bid AND B.sid = C.sid AND C.sname = C.sname;

SELECT S.sname, B.bname, R.bid, R.day FROM Sailors S, Boats B, Reservation R WHERE S.sid = R.sid AND R.bid = B.bid;
/* OR */ 
SELECT S.sname, B.bname, R.bid, R.day FROM Sailors S, Boats B, Reservation R WHERE S.sid = R.sid / R.bid = B.bid;
