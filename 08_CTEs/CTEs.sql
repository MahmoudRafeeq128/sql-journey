# CTEs
# A CTE is like a temporary named result (a mini-table) 
# that you define at the start of your query so you can use it just like a normal table in the next part of the query
# the names in () after CTE name will override the names of the table's columns 

with cte_example (Gender , Avg_sal , Max_sal, Min_sal , Count_sal) as 
(
select gender ,avg(salary) avg_sal , max(salary) max_sal ,min(salary) min_sal ,count(salary) count_sal 
from employee_demographics as dem 
join employee_salary  as sal
   on dem.employee_id = sal.employee_id
   group by gender 
) 
select * from cte_example 
;

# i can make a query or select columns or do calculations based on the cte
with cte_example as 
(
select gender ,avg(salary) avg_sal , max(salary) max_sal ,min(salary) min_sal ,count(salary) count_salary 
from employee_demographics as dem 
join employee_salary  as sal
   on dem.employee_id = sal.employee_id
   group by gender 
) 
select avg(avg_sal) 
from cte_example
;

# i can make it as subquery , but the readability wouldn't be as good as using CTE
select avg(avg_sal) 
from (
select gender ,avg(salary) avg_sal , max(salary) max_sal ,min(salary) min_sal ,count(salary) count_salary 
from employee_demographics as dem 
join employee_salary  as sal
   on dem.employee_id = sal.employee_id
   group by gender 
) example_subquery ; 

 # multiple CTEs
 with CTE_Example1 as 
(
select employee_id ,gender ,birth_date
from employee_demographics  
where birth_date > '1985_01_01'
) ,
CTE_Example2 as
(
select employee_id , salary
from employee_salary
where salary > 50000
)
select avg(salary)
 from CTE_Example2
;

# i can join 2 CTEs 
 with CTE_Example1 as 
(
select employee_id ,gender ,birth_date
from employee_demographics  
where birth_date > '1985_01_01'
) ,
CTE_Example2 as
(
select employee_id , salary
from employee_salary
where salary > 50000
) 
select * 
from CTE_Example1 
join CTE_Example2 
   on CTE_Example1.employee_id = CTE_Example2.employee_id 
   ;