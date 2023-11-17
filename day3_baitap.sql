-- BT1:
select name from city
where  population > 120000
and    countrycode = 'USA';
-- BT2:
select * from city
where  countrycode = 'JPN';
-- BT3:
select city, state from station;
-- BT4:
select distinct city from station
where           city like 'A%'
or              city like 'E%'
or              city like 'I%'
or              city like 'O%'
or              city like 'U%';
-- BT5:
select distinct city from station
where           city like '%A'
or              city like '%E'
or              city like '%I'
or              city like '%O'
or              city like '%U';
-- BT6:
select distinct city from station
where not      (city like 'A%'
or              city like 'E%'
or              city like 'I%'
or              city like 'O%'
or              city like 'U%');
-- BT7:
select   name from employee
order by name asc;
-- BT8: 
select   name from employee
where    salary > 2000
and      months < 10
order by employee_id asc;
-- BT9:
select product_id from products
where  low_fats   = 'Y'
and    recyclable = 'y';
-- BT10:
select    name from customer
where not referee_id = 2
or        referee_id is null;
-- BT11:
select name, population, area from world
where  area >= 3000000
or     population >= 25000000;
-- BT12: 
select distinct author_id as id from views
where           viewer_id in (3, 4, 7)
order by        author_id asc;
-- BT13:
select part, assembly_step from parts_assembly
where  finish_date         is null;
-- BT14:
