-- creating schema assignment
CREATE DATABASE Assignment;
USE assignment;

-- Moving Average table of Bajaj Auto
CREATE TABLE `bajaj_auto1` (
  `date` text,
  `Close Price` double,
  `20 Days MA` double,
  `50 Days MA` double
);
-- END OF THE CREATE TABLE QUERY


-- Moving Average table of Eicher Motors
CREATE TABLE `eicher_motors1` (
  `date` text,
  `Close Price` double,
  `20 Days MA` double,
  `50 Days MA` double
);
-- END OF THE CREATE TABLE QUERY


-- Moving Average table of Hero MotorCorp
CREATE TABLE `hero_motocorp1` (
  `date` text,
  `Close Price` double,
  `20 Days MA` double,
  `50 Days MA` double
);
-- END OF THE CREATE TABLE QUERY


-- Moving Average table of Infosys
CREATE TABLE `Infosys1` (
  `date` text,
  `Close Price` double,
  `20 Days MA` double,
  `50 Days MA` double
);
-- END OF THE CREATE TABLE QUERY


-- Moving Average table of TCS
CREATE TABLE `tcs1` (
  `date` text,
  `Close Price` double,
  `20 Days MA` double,
  `50 Days MA` double
);
-- END OF THE CREATE TABLE QUERY


-- Moving Average table of TVS Motors
CREATE TABLE `tvs_motors1` (
  `date` text,
  `Close Price` double,
  `20 Days MA` double,
  `50 Days MA` double
);
-- END OF THE CREATE TABLE QUERY


-- Inserting the Dates, Close Prices, 20 and 50 days moving averages in BAJAJ1 TABLE from the TABLE BAJAJ_AUTO  
insert into bajaj_auto1(
	`date`,
    `close price`, 
    `20 days MA`, 
    `50 Days MA`
)
select `date`,
	`close price`, 
    avg(`close price`) over(rows between 0 preceding and 19 following), 
    avg(`close price`) over(rows between 0 preceding and 49 following)
from bajaj_auto;
-- END OF THE INSERT QUERY


-- Inserting the Dates, Close Prices, 20 and 50 days moving averages in EICHER_MOTORS1 TABLE from the TABLE EICHER_MOTORS  
insert into eicher_motors1(
	`date`, 
    `close price`, 
    `20 days MA`, 
    `50 Days MA`
)
select `date`,
	`close price`, 
	avg(`close price`) over(rows between 0 preceding and 19 following), 
    avg(`close price`) over(rows between 0 preceding and 49 following)
from eicher_motors;
-- END OF THE INSERT QUERY


-- Inserting the Dates, Close Prices, 20 and 50 days moving averages in HERO_MOTORCORP1 TABLE from the TABLE HERO_MOTORCORP
insert into hero_motocorp1(
	`date`, 
    `close price`, 
    `20 days MA`, 
    `50 Days MA`
)
select `date`,
	`close price`, 
    avg(`close price`) over(rows between 0 preceding and 19 following), 
    avg(`close price`) over(rows between 0 preceding and 49 following)
from hero_motocorp;
-- END OF THE INSERT QUERY


-- Inserting the Dates, Close Prices, 20 and 50 days moving averages in INFOSYS1 TABLE from the TABLE INFOSYS
insert into infosys1(
	`date`, 
    `close price`, 
    `20 days MA`, 
    `50 Days MA`
)
select `date`,
	`close price`, 
	avg(`close price`) over(rows between 0 preceding and 19 following), 
	avg(`close price`) over(rows between 0 preceding and 49 following)
from infosys;
-- END OF THE INSERT QUERY


-- Inserting the Dates, Close Prices, 20 and 50 days moving averages in TCS1 TABLE from the TCS
insert into tcs1(
	`date`, 
    `close price`, 
    `20 days MA`, 
    `50 Days MA`
)
select `date`,
	`close price`, 
    avg(`close price`) over(rows between 0 preceding and 19 following), 
    avg(`close price`) over(rows between 0 preceding and 49 following)
from tcs;
-- END OF THE INSERT QUERY


-- Inserting the Dates, Close Prices, 20 and 50 days moving averages in TVS_MOTORS1 TABLE from the TABLE TVS_MOTORS
insert into tvs_motors1(
	`date`, 
    `close price`, 
	`20 days MA`, 
    `50 Days MA`
)
 select `date`,
	`close price`, 
    avg(`close price`) over(rows between 0 preceding and 19 following), 
    avg(`close price`) over(rows between 0 preceding and 49 following)
from tvs_motors;
-- END OF THE INSERT QUERY


-- Creating Master table MASTER_TBL contaning closing price of all the companies.
CREATE TABLE `master_tbl` (
  `Date` text,
  `BAJAJ` double,
  `EICHER` double,
  `HERO` double,
  `INFOSYS` double,
  `TCS` double,
  `TVS` double
);
-- END OF THE TABLE


-- Insert Closing price of all the companies in the master_tbl Table
INSERT INTO master_tbl(
	`Date`,
	`BAJAJ`,
	`EICHER`,
	`HERO`,
	`INFOSYS`,
	`TCS`,
	`TVS`
)
select b.`date`,
	b.`close price`,
    e.`close price`,
    h.`close price`,
    i.`close price`,
    tcs.`close price`,
    tvs.`close price`
from bajaj_auto b
inner join eicher_motors e
using(`date`)
inner join hero_motocorp h
using(`date`)
inner join infosys i
using(`date`)
inner join tcs
using(`date`)
inner join tvs_motors tvs
using(`date`);
-- END OF THE TABLE


SELECT `date`,
    `BAJAJ`,
    `Eicher`,
    `Hero`,
    `Infosys`,
    `TCS`,
    `TVS`
FROM master_tbl;


-- Moving Average difference table for BAJAJ
create view bajaj_diff as(
	select *,
		`20 days ma`-`50 days ma` as diff,
        row_number() over() as `No.`
	from bajaj_Auto1);


-- Moving Average difference table for EICHER
create view eicher_diff as(
	select *,
		`20 days ma`-`50 days ma` as diff,
        row_number() over() as `No.`
	from eicher_motors1);



-- Moving Average difference table for HERO
create view hero_diff as(
	select *,
		`20 days ma`-`50 days ma` as diff,
        row_number() over() as `No.`
	from hero_motocorp1);



-- Moving Average difference table for INFOSYS
create view infosys_diff as(
	select *,
		`20 days ma`-`50 days ma` as diff,
        row_number() over() as `No.`
	from infosys1);



-- Moving Average difference table for TCS
create view tcs_diff as(
	select *,
		`20 days ma`-`50 days ma` as diff,
        row_number() over() as `No.`
	from tcs1);



-- Moving Average difference table for TVS
create view tvs_diff as(
	select *,
		`20 days ma`-`50 days ma` as diff,
        row_number() over() as `No.`
	from tvs_motors1);


-- Create Signal table for BAJAJ AUTO as BAJAJ2
create view BAJAJ2(
	`Date`,
    `Close Price`,
    `Signal`
) as
SELECT a.`Date`,
	a.`Close Price`,
	(case
		when a.`diff` > 0 and  b.`diff`< 0 then 'BUY'
        when a.`diff` <0 and b.`diff` > 0 then 'SELL'
        else 'HOLD'
	end) as `Signal`
FROM bajaj_diff a left outer join bajaj_diff b
on(a.`no.`=b.`no.`-1);
-- END OF THE TABLE


-- Create Signal table for EICHER MOTORS as EICHER2
create view EICHER2(
	`Date`,
    `Close Price`,
    `Signal`
) as
SELECT a.`Date`,
    a.`Close Price`,
    (case
		when a.`diff` > 0 and  b.`diff`< 0 then 'BUY'
        when a.`diff` <0 and b.`diff` > 0 then 'SELL'
        else 'HOLD'
	end) as `Signal`
FROM eicher_diff a left outer join eicher_diff b
on(a.`no.`=b.`no.`-1);
-- END OF THE TABLE


-- Create Signal table for HERO MOTORCORP as HERO2
create view HERO2(
	`Date`,
    `Close Price`,
    `Signal`
) as
SELECT a.`Date`,
    a.`Close Price`,
    (case
		when a.`diff` > 0 and  b.`diff`< 0 then 'BUY'
        when a.`diff` <0 and b.`diff` > 0 then 'SELL'
        else 'HOLD'
	end) as `Signal`
FROM hero_diff a left outer join hero_diff b
on(a.`no.`=b.`no.`-1);
-- END OF THE TABLE


-- Create Signal table for INFOSYS as INFOSYS2
create view INFOSYS2(
	`Date`,
    `Close Price`,
    `Signal`
) as
SELECT a.`Date`,
    a.`Close Price`,
    (case
		when a.`diff` > 0 and  b.`diff`< 0 then 'BUY'
        when a.`diff` <0 and b.`diff` > 0 then 'SELL'
        else 'HOLD'
	end) as `Signal`
FROM infosys_diff a left outer join infosys_diff b
on(a.`no.`=b.`no.`-1);
-- END OF THE TABLE


-- Create Signal table for TCS as TCS2
create view tcs2(
	`Date`,
    `Close Price`,
    `Signal`
) as
SELECT a.`Date`,
    a.`Close Price`,
    (case
		when a.`diff` > 0 and  b.`diff`< 0 then 'BUY'
        when a.`diff` <0 and b.`diff` > 0 then 'SELL'
        else 'HOLD'
	end) as `Signal`
FROM tcs_diff a left outer join tcs_diff b
on(a.`no.`=b.`no.`-1);
-- END OF THE TABLE


-- Create Signal table for TVS_MOTORS as TVS_MOTORS2
create view tvs2(
	`Date`,
    `Close Price`,
    `Signal`
) as
SELECT a.`Date`,
    a.`Close Price`,
    (case
		when a.`diff` > 0 and  b.`diff`< 0 then 'BUY'
        when a.`diff` <0 and b.`diff` > 0 then 'SELL'
        else 'HOLD'
	end) as `Signal`
FROM tvs_diff a left outer join tvs_diff b
on(a.`no.`=b.`no.`-1);
-- END OF THE TABLE 




-- CREATING A USER DEFINED FUNCTION WHICH TAKE DATE AS INPUT AND RETURN SIGNAL 
delimiter $$

create function show_signal(dates text)
returns varchar(5) deterministic
begin
	declare sign varchar(5);
    select `signal` from bajaj2 where `date` = dates into sign;
return sign;
end $$

delimiter ;
-- END OF THE FUNCTION


select Show_signal('1-july-2015') as `Signal`;
select `date`, 
	show_signal(`date`) as `Signal`
    from bajaj_auto;

SELECT `bajaj_diff`.`date`,
    `bajaj_diff`.`Close Price`,
    `bajaj_diff`.`20 Days MA`,
    `bajaj_diff`.`50 Days MA`,
    `bajaj_diff`.`diff`,
    `bajaj_diff`.`No.`
FROM `assignment`.`bajaj_diff`
where `diff` not in(0)
limit 10;

SELECT `bajaj2`.`Date`,
    `bajaj2`.`Close Price`,
    `bajaj2`.`Signal`
FROM `assignment`.`bajaj2`;

SELECT `bajaj2`.`Date`,
    `bajaj2`.`Close Price`,
    `bajaj2`.`Signal`
FROM `assignment`.`bajaj2`
where `signal`in('buy','sell')
limit 10;

SELECT `bajaj_auto1`.`date`,
    `bajaj_auto1`.`Close Price`,
    `bajaj_auto1`.`20 Days MA`,
    `bajaj_auto1`.`50 Days MA`
FROM `assignment`.`bajaj_auto1`;

