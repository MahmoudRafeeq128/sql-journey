# create temprory table 

create temporary table temp_table(
first_name varchar(50) ,
last_name varchar(50) ,
favorite_movie varchar(50)
) ;
select * from temp_table ;

insert into temp_table values 
('mahmoud' , 'rafeeq' , 'twilight') ;

select * from temp_table ;

# i can make a temp table to store somme values retrieved conditioned from another table
 select * from employee_salary ;
 
create temporary table salary_over_50k 
select *
from employee_salary
where salary >= 50000;

select * from salary_over_50k ;
