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



-- practice Union 

-- Q1 Display all first names from both tables.
select first_name from employee_demographics
union 
select first_name from employee_salary;
-- Q2 Display all first names and last names from both tables.
select first_name,last_name from employee_demographics
union 
select first_name,last_name from employee_salary;
-- Q3 Display all first names using UNION ALL.
select first_name from employee_demographics
union all
select first_name from employee_salary;
-- Q4 Display all first names using UNION and compare the result with Q3.
select first_name from employee_demographics
union 
select first_name from employee_salary;
-- in union all give duplecate values as well 
-- but in union it gives unique values
-- Q5 Display employee names from employee_demographics and employee_salary 
-- with a new column called source_table.
SELECT first_name,
'Demographics' AS source_table
FROM employee_demographics
UNION
SELECT first_name,
'Salary' AS source_table
FROM employee_salary;
-- Q6 Display all employees older than 40 (label: 'Age > 40') 
-- and all employees earning more than 60,000 (label: 'Salary > 60000') 
-- in one result set.
select first_name,  'Age > 40' as label
from employee_demographics
where age>40
union
select first_name,  'Salary > 60000' as label
from employee_salary
where Salary > 60000;

-- Q7 Display Male and Female employees with a 'category' column 
-- (e.g., 'Male' or 'Female') combined using UNION.
select first_name,  'Male' as label
from employee_demographics
where gender='Male'
union
select first_name,'Female' as label
from employee_demographics
where gender='Female';
-- Q8 Display employees with Salary > 70,000 labeled as 'High Salary' 
-- and Salary < 40,000 labeled as 'Low Salary' in one result set.
select first_name,salary ,'High Salary' as label
from employee_salary
where salary>70000
union 
select first_name,salary ,'Low Salary' as label
from employee_salary
where salary<40000;
-- Q9 Display employees younger than 30 (status: 'Young') 
-- and older than 50 (status: 'Senior') in one result set.
select first_name,  'Young' as status
from employee_demographics
where age<30
union
select first_name,'Senior' as status
from employee_demographics
where age>50;
-- Q10 Display all department IDs from employee_salary 
-- and parks_departments using UNION.
select dept_id from employee_salary 
union 
select department_id from parks_departments;
-- Q11 Display all unique names appearing in either table (Interview Style).
select first_name from employee_demographics
union distinct 
select first_name from employee_salary;
-- Q12 Display all names from both tables including duplicates (Interview Style).
select first_name from employee_demographics
union all
select first_name from employee_salary;
-- Q13 Create a report combining employees with Age < 30 ('Young Employee') 
-- and Salary > 70,000 ('High Earner') using UNION ALL.
select first_name,age ,'Young Employee' as label
from employee_demographics
where age<30
union all
select first_name,salary ,'High Salary' as label
from employee_salary
where salary>70000;
-- Q14 Display employees from the Finance department and 
-- Healthcare department in one result set with a department category column.
select sal.first_name,  'Finance' AS department_category
from employee_salary sal
join parks_departments as dep
on sal.dept_id=dep.department_id
WHERE dep.department_name = 'Finance'
union
SELECT sal.first_name,'Healthcare' AS department_category
FROM employee_salary sal
JOIN parks_departments dep
ON sal.dept_id = dep.department_id
WHERE dep.department_name = 'Healthcare';
-- Q15 Create a retirement and high earner report for employees with age > 60 or 
-- salary > 80,000, including a label column explaining why they appear.
select first_name ,'retirement' as reason
from employee_demographics
where age>60
union
select first_name,'High Earner' AS reason  
from employee_salary
where salary>80000;
