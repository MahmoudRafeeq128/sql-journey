#stored procedure 
USE parks_and_recreation;
DESC employee_salary;

create procedure example1 ()
select *
from employee_salary
where salary >= 50000 ;

call example1 () ;

 delimiter $$
 create procedure large_salaries()
 begin 
 	select *
 	from employee_salary
 	where salary >= 50000 ;
     select * 
     from employee_salary 
     where salary >= 10000 ;
 end $$
 delimiter ;
 call large_salaries() ;

# using a parameter , i must specify type 

delimiter $$
create procedure high_salary(emp_id int)
begin
  select salary
  from employee_salary
  where employee_id = emp_id;
end $$
delimiter ;



CALL high_salary(3);

