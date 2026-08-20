select first_name ,length(first_name)
from employee_demographics
order by 2
;
select first_name ,upper(first_name)
from employee_demographics
order by 2
;

select trim('       sky       ');
#left -right - substring
select first_name ,
left(first_name ,4), 
right(first_name,3),
substring(first_name,2,3) ,
birth_date,
substring(birth_date,6,2) as birth_month
from employee_demographics ;

# replace 
select first_name, replace(first_name,'a','z') 
from employee_demographics ;

#locate
select locate('x','Alexnder');

select first_name, locate('an',first_name)
from employee_demographics;

#concat
select first_name , last_name ,
concat(first_name,' ' , last_name) as full_name
from employee_demographics;