select *
from parks_and_recreation.employee_demographics;

select first_name,
last_name,
age 
from parks_and_recreation.employee_demographics;

#calculations follow PEMDAS order 
select first_name,
last_name,
age ,
age+10
from parks_and_recreation.employee_demographics;

#calculations follow PEMDAS order 

select first_name,
last_name,
age ,
(age+10)*10+10
from parks_and_recreation.employee_demographics;

#distinct
select distinct gender from parks_and_recreation.employee_demographics;