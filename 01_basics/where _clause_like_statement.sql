select *
from employee_salary 
where first_name = 'leslie' ;

select *
from employee_salary 
where salary > 50000 ;

select * 
from employee_demographics 
where gender = 'female' ; 

select * 
from employee_demographics
where birth_date > '1985-01-01' ;

select * 
from employee_demographics
where birth_date > '1985-01-01' 
and gender = 'male' ;

#PEMDAS 
select * 
from employee_demographics
where (first_name='leslie' and age =44) or age > 65
;
# like statement
select * 
from employee_demographics 
where first_name like 'jer%' ;

select * 
from employee_demographics 
where first_name like 'a%' ;

select * 
from employee_demographics 
where first_name like 'a__' ;

select * 
from employee_demographics 
where first_name like 'a__%' ;