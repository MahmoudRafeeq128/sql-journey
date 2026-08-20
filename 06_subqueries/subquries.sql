select *
from employee_demographics
where employee_id in 
					(select employee_id
                    from employee_salary 
                    where dept_id =1
                    );

select  gender ,age			
from employee_demographics
where age >	
(select avg(age) 
from employee_demographics ) ;

select avg(age) from employee_demographics ;

select* 
from 
(select gender ,
 avg(age) as avg_age,
 max(age) as max_age,
 min(age) as min_age,
 count(age) as count 
 from employee_demographics
 group by gender 
 ) as agg_table ;
 
-- i use agg on an agg from the table
 select gender , avg(max_age)
from 
(select gender ,
 avg(age) as avg_age,
 max(age) as max_age,
 min(age) as min_age,
 count(age) as count 
 from employee_demographics
 group by gender 
 ) as agg_table
group by gender
 ;