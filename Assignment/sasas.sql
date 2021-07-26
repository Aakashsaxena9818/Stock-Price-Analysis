use indian_cricket;

select * from employee;

with alls as(
	with this as(
		select ssn,
			convert(substring_index(
				address,' ',1
                ), signed integer) as house_no,
                row_number() over(order by convert(substring_index(
				address,' ',1
                ), signed integer) desc)as row_no
		from employee
    )
    select ssn, house_no
    from this
    where ssn != '123456789'
)
select 
from alls
;

SELECT FORMAT(SUM(ABS(oth - emp)) / COUNT(oth), 2) AS average
FROM (
      SELECT CAST(address AS SIGNED) AS oth
      FROM employee
      WHERE ssn != '123456789'
     ) t
CROSS JOIN (
      SELECT CAST(address AS SIGNED) AS emp
      FROM employee
      WHERE ssn = '123456789'
     ) t2;
     
select format(avg(abs(all_house_no-house_no)),2) as avg_distance
from (
		select convert(substring_index(address,' ',1), signed integer) as all_house_no
		from employee
        where ssn != '123456789'
	)e1
 inner join(
		select ssn,convert(substring_index(address,' ',1), signed integer) as house_no
		from employee
		where ssn='123456789'
	)e2;
/* 
AlterNate

select format (avg(abs(substring_index(address, ' ', 1)-(select substring_index(address, ' ', 1)
from employee
where ssn = '123456789'
))), 2)
from employee
where ssn != '123456789';*/
    
create table home(
	opponent varchar(30),
    Goals_scored int,
    Goals_conceded int
);

insert into home values
	('Everton',2,1),
	('Aston Villa',2,0),
	('Portsmouth',1,1),
	('Newcastle United',3,2),
	('Chelsea',2,1),
	('Tottenham Hotspur',2,1),
	('Fulham',0,0),
	('Blackburn Rovers',1,0),
	('Wolverhampton Wonderers',3,0),
	('Middlesbrough',4,1),
	('Manchester City',2,1),
	('Southampton',2,0),
	('Charlton Athletic',2,1),
	('Bolton Wanderers',2,1),
	('Manchester United',1,1),
	('Liverpool',4,2),
	('Leeds United',5,0),
	('Birmingham City',0,0),
	('Leicester City',2,1);

create table away (
	opponent varchar(30),
	Goals_scored int,
    Goals_conceded int
);
insert into away values
	('Everton',1,1),
	('Aston Villa',2,0),
	('Portsmouth',1,1),
	('Newcastle United',0,0),
	('Chelsea',2,1),
	('Tottenham Hotspur',2,2),
	('Fulham',1,0),
	('Blackburn Rovers',2,0),
	('Wolverhampton Wonderers',3,1),
	('Middlesbrough',4,0),
	('Manchester City',2,1),
	('Southampton',1,0),
	('Charlton Athletic',1,1),
	('Bolton Wanderers',1,1),
	('Manchester United',0,0),
	('Liverpool',2,1),
	('Leeds United',4,1),
	('Birmingham City',3,0),
	('Leicester City',1,1);

with this as(    
		select  opponent, sum(points) as result
		from (
			select opponent, (
				case
					when Goals_scored > Goals_conceded then 3
					when Goals_scored < Goals_conceded then 0
					else 1
				end
			) as points
			from home
			union all
			select opponent, (
				case
					when Goals_scored > Goals_conceded then 3
					when Goals_scored < Goals_conceded then 0
					else 1
				end
			) as points
			from away
			)as A
	group by opponent
)
select count(result) as No_Of_Teams
from this 
where result=6;

/* ALTERNATE
select count(*)
from home inner join away on home.opponent = away.opponent
where home.goals_scored > home.goals_conceded and away.goals_scored > away.goals_conceded;*/

create table father(
	son_id int,
	father_id int
    );
insert into father values
	(18,12),(20,12),(33,22),(69,22),(98,31),(105,67),(111,33),(118,69),(119,77),(130,98),(145,18),(167,68),(170,20);
    
select count(f1.son_id), f2.father_id as grandfather
from father f1 inner join father f2
on f1.father_id = f2.son_id;

select * from father;

create table marks (std_id smallint(6), marks varchar(30));

insert into marks values
(7,'69,71,99,66,71'),(12,'87,88,87,98,99'),(18,'77,78,67,90,79'),(22,'76,86,80,88,92'),(29,'89,68,98,60,56'),
(32,'98,90,50,79,60'),(57,'95,92,76,76,67'),(59,'90,99,89,99,54'),(78,'75,83,90,85,76'),(83,'67,97,77,70,74'),
(88,'57,78,55,83,78'),(98,'59,76,67,80,88');

select std_id,
	(convert(substring_index(marks,',',1), signed integer)+ 
	convert(substring_index(substring_index(marks,',',2),',',-1), signed integer)+
    convert(substring_index(substring_index(marks,',',3),',',-1), signed integer)
    )/3 as avg_marks
from marks
order by avg_marks desc;

select std_id
from marks
order by ((convert(substring_index(marks,',',1), signed integer)+ 
	convert(substring_index(substring_index(marks,',',2),',',-1), signed integer)+
    convert(substring_index(substring_index(marks,',',3),',',-1), signed integer)
    )/3) desc;