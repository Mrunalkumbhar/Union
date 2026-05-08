-- unions

select first_name,last_name from employee_demographics
union 
select first_name,last_name from employee_salary;

-- unions distinct
select first_name,last_name from employee_demographics
union distinct 
select first_name,last_name from employee_salary;

-- unions all

select first_name,last_name from employee_demographics
union all
select first_name,last_name from employee_salary;

select first_name, last_name, 'old Man' as label
from employee_demographics
where age> 50 and gender='male'
union
select first_name, last_name, 'old Man' as label
from employee_demographics
where age> 50 and gender='female'
union
select first_name, last_name, 'high salary as label'
from employee_salary
where salary > 50000
union
select first_name, last_name, 'low salary as label'
from employee_salary
where salary < 50000
order by first_name;
