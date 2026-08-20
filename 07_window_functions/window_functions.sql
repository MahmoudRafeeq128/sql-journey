-- the avarge salary per person

select dem.first_name ,dem.last_name ,gender ,avg(salary) as avg_salary 
from employee_demographics as  dem 
join employee_salary as sal 
 on dem.employee_id = sal.employee_id 
 group by gender , first_name ,last_name ;
 
 #Here, all males have the same average, and all females have the same — because the PARTITION BY gender re-calculates average salary within each gender group.
 #This query calculates the average salary for each gender.
#But unlike GROUP BY, it does not reduce the rows.
#It returns one row per employee, with their name, gender, and the average salary of their gender group.


 select dem.first_name ,dem.last_name ,gender ,avg(salary) over(partition by gender)
from employee_demographics as  dem 
join employee_salary as sal 
 on dem.employee_id = sal.employee_id 
;

# sum salary for all males and females then show each employee with the sum slary for his gender group.
 select dem.first_name ,dem.last_name ,gender ,salary ,
 sum(salary) over(partition by gender)
from employee_demographics as  dem 
join employee_salary as sal 
 on dem.employee_id = sal.employee_id 
;

# sum every salary of the employee with the emplyee before
 select dem.first_name ,dem.last_name ,gender ,salary ,
 sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as  dem 
join employee_salary as sal 
 on dem.employee_id = sal.employee_id 
;

 # row_number , it gives a row number based on the partition i make
 # count from the start for each group
 
  select dem.first_name ,dem.last_name ,gender ,salary ,
 row_number() over(partition by gender)
from employee_demographics as  dem 
join employee_salary as sal 
 on dem.employee_id = sal.employee_id 
;

#no partition so it goes from 1 : n
  select dem.first_name ,dem.last_name ,gender ,salary ,
 row_number() over()
from employee_demographics as  dem 
join employee_salary as sal 
 on dem.employee_id = sal.employee_id 
;

# ordering by salary from the highest
  select dem.first_name ,dem.last_name ,gender ,salary ,
 row_number() over(partition by gender order by salary desc)
from employee_demographics as  dem 
join employee_salary as sal 
 on dem.employee_id = sal.employee_id 
;

#RANK() skips numbers when there are ties (e.g., 1, 2, 2, 4).
#DENSE_RANK() does not skip numbers in ties (e.g., 1, 2, 2, 3).
#Both assign the same rank to tied rows, but RANK() leaves a gap in the sequence, while DENSE_RANK() keeps it continuous.

  select dem.first_name ,dem.last_name ,gender ,salary ,
 row_number() over(partition by gender order by salary desc) as row_num,
 rank() over(partition by gender order by salary desc) as row_rank ,
 dense_rank() over(partition by gender order by salary desc) as dense_row_rank 
from employee_demographics as  dem 
join employee_salary as sal 
 on dem.employee_id = sal.employee_id 
;