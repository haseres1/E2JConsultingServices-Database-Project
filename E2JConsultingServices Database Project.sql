
-- first creating the database name, [E2JConsultingServices]
create database [E2JConsultingServices]
go
use [E2JConsultingServices]
go
--- First table
create table [location] (location_id int 
primary key, city varchar(50))

  ---- second table
create table department(department_id int constraint
pk_department_department_id primary key,
name varchar(50), location_id int foreign key 
references location(location_id));

-----third table
create table job(job_id int primary key,
Designation varchar(50));

---Fourt table
create table employee(employee_id int primary key,
last_name varchar(50), first_name varchar(50),
middle_name char(1), job_id int foreign key
references job(job_id), manager_id int foreign key
references employee(employee_id), hiredate date,
salary money,comm money null, department_id int foreign key
references department(department_id));
  
   
   --insert values into location table

insert into location values(122, 'new york')
insert into location values(123, 'dallas')
insert into location values(124, 'chicago')
insert into location values(167, 'boston');
--insert values into department table
insert into department values(10, 'accounting', 122)
insert into department values(20, 'sales', 124)
insert into department values(30, 'research', 123)
insert into department values(40, 'operations', 167);

--insert values into job table

insert into job values(667, 'clerk')
insert into job values(668, 'staff')
insert into job values(669, 'analyst')
insert into job values(670, 'salesperson')
insert into job values(671, 'manager')
insert into job values(667, 'president')



--insert values into employee table

insert into employee(employee_id, last_name, first_name,
middle_name, job_id, manager_id, hiredate, salary, department_id
) values(7369, 'smith', 'john', 'q', 667, 7369, '17-dec-84', 800, 20)
insert into employee(employee_id, last_name, first_name,
middle_name, job_id, manager_id, hiredate, salary, comm, department_id
) values(7499, 'allen', 'kevin', 'j', 670, 7499, '20-feb-85', 1600,300, 20)
insert into employee(employee_id, last_name, first_name,
middle_name, job_id, manager_id, hiredate, salary, department_id
) values(7505, 'doyle', 'jean', 'k', 671, 7505, '04-apr-85', 2850, 20)
insert into employee(employee_id, last_name, first_name,
middle_name, job_id, manager_id, hiredate, salary, department_id
) values(7506, 'dennis', 'lynn', 's', 671, 7506, '15-may-85', 2750, 30)
insert into employee(employee_id, last_name, first_name,
middle_name, job_id, manager_id, hiredate, salary, department_id
) values(7507, 'baker', 'leslie', 'D', 671, 7499, '10-jun-85', 2200, 40)
insert into employee(employee_id, last_name, first_name,
middle_name, job_id, manager_id, hiredate, salary, department_id
) values(7521, 'wark', 'cynthia', 'D', 670, 7507, '22-feb-85', 1250, 30)


--SIMPLE QUERIES:
--1. LIST ALL THE EMPLOYEE DETAILS. 
select * from employee
--2. LIST ALL THE DEPARTMENT DETAILS 
select * from department
--3. LIST ALL JOB DETAILS. 
select * from job
--4. LIST ALL THE LOCATIONS. 
select * from location
--5.LIST OUT THE FIRSTNAME,LASTNAME,SALARY,COMMISSION FOR ALL EMPLOYEES. 
select first_name, last_name, salary, comm from employee

--6. LIST OUT EMPLOYEEID,LASTNAME,DEPARTMENTID FOR ALL EMPLOYEES AND 
-- ALIAS EMPLOYEEID AS "ID OF THE EMPLOYEE",LAST NAME AS "NAME OF THE EMPLOYEE", 
--DEPARTMENTID AS "DEP_ID". 

select employee_id as "ID OF THE EMPLOYEE", last_name as "NAME OF THE EMPLOYEE", 
department_id as "DEP_ID" from employee

--7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.

select concat(first_name , ' ' ,isnull (last_name, 'not provided')) as [employee's full name] ,
salary from employee 


--WHERE CONDITION:

--1. LIST THE DETAILS ABOUT "SMITH" 

select * from employee
where last_name = 'smith'

--2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20. 

select * from employee where department_id = 20

--3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500. 

select * from employee where salary between 3000 and 4500

--4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20. 

select * from employee where department_id in (10, 20)

--5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30. 

select * from employee where department_id not in (10, 30)

--6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'. 

select * from employee where last_name like 's%'

--7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'. 

select * from employee where last_name like 's%h'

--8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'. 

select * from employee where len(last_name) = 4 and last_name like 's%'

select * from employee where len(last_name) = 5 and last_name like 's%'

--9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE SALARIES 
--MORE THAN 3500. 

select * from employee where department_id = 10 and salary >3500


--10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION. 

select * from employee where comm is null

--ORDER BY CLAUSE:

--1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID. 

select employee_id, last_name from employee
order by employee_id asc

--2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY. 

select employee_id , first_name, last_name 
from employee order by salary desc

--3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND 
--SALARIES IN DESCENDING ORDER. 

select * from employee order by last_name asc, salary desc

--4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND 
--THEN ON DEPARTMENT_ID IN DESCENDING ORDER. 
--GROUP BY & HAVING CLAUSE

select * from employee order by last_name asc, DEPARTMENT_ID desc


--1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION. 

select department_id, count(*) as [Total number of employee] from employee
group by department_id

 select count(e.employee_id) as [number of employee],
d.name from employee e
join department d on e.department_id = d.department_id
group by d.name
--2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF 
--THE EMPLOYEES. 

select department_id, count(*) as 'total number of employee', max(salary) 
as 'maximum salary', min(salary) as
'minimun salary', avg(salary) as 'average salary' from employee
group by department_id


--3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE
--EMPLOYEES. 

select job_id, count(*) as [total job], max(salary) as
[maxmium salary], min(salary) 
as [minmum salary], avg(salary)
as [average salary] from employee
group by job_id

--4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER. 

--method 1

select month(hiredate) as [month], count(*) as [number of employee]
from employee 
group by month(hiredate)
order by [month]

--method 2

select datename(mm, hiredate) as [month], count(*) as [number of employee]
from employee 
group by datename(mm, hiredate)
order by [month]

--5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING 
--ORDER BASED ON THE YEAR, MONTH. 

select datepart(yy, hiredate) as year, datename(mm, hiredate)
as month , count(*) as [total employee] from employee group by
datepart(yy, hiredate), datename(mm, hiredate)

--6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES. 

select department_id, count(*) as
[total employee] from employee
group by department_id
having count(*) > 4


--7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH. 

select datename(mm, hiredate), count(*) from employee
where datename(mm, hiredate) = 'january'
group by datename(mm, hiredate)

--8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH. 

select datename(mm, hiredate) as [month], count(*) as totalemployee
from employee 
where datename(mm, hiredate) in ('september', 'january')
group by datename(mm, hiredate)


--9. HOW MANY EMPLOYEES WERE JOINED IN 1985. 

select datepart(year, hiredate) as [year],count(*)as [total employee]
from employee
where datepart(year, hiredate) = '1985'
group by datepart(year, hiredate)

--10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985. 

select datename(year, hiredate) as [year], datename(month, hiredate) as [month],
count(*) as [total employee] from employee
where datename(year, hiredate) = '1985'
group by datename(year, hiredate), datename(month, hiredate)

--11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985. 

select datename(yy, hiredate) as [year], datename(mm, hiredate)
as [month], count(*) as [total employee]
from employee
where datename(yy, hiredate) = '1985' and datename(mm, hiredate) = 'march'
group by datename(yy, hiredate), datename(mm, hiredate)

--12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN 
--APRIL 1985.

select department_id, count(*) as 'total employee' from employee
where datename(yy, hiredate) = '1985' and
datename(mm, hiredate) = 'april'
group by department_id
having count(*) >=3

-- JOINS
--1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES. 

select E.*, D.name as [department name]
from employee E
join department D
on E.department_id = D.department_id

--2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS. 
select E.*, Ds.designation
from employee E
join job Ds
on e.job_id=ds.job_id

--3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS. 

select e.*, l.city as [reginal group],d.name as [department name]
from employee e
join department d
on e.department_id = d.department_id
join location l
on d.location_id = l.location_id

--4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH 
--DEPARTMENT NAMES. 

select d.name as [Department name],
count(*) as [total employee] from department d
join employee e
on d.department_id=e.department_id
group by name

--5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT. 

select employee_id, d.name as [Department Name],
count(*) as [total employee] from employee e
join department d
on e.department_id = d.department_id
where d.name = 'sales'
group by employee_id, d.name

--6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 
--EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.

select d.name, count(*) as [total employee]
from department d
join employee e
on d.department_id = e.department_id
group by d.name
having count(*) > 5

--7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS. 

select j.job_id, j.Designation
, count(*) as [total job]
from job j
join employee e
on j.job_id = e.job_id
group by j.job_id, j.Designation

--8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK". 


select l.city as city, count(*) as [total employee] from location l
join department d
on l.location_id = d.location_id
join employee e
on e.department_id = d.department_id
where city = 'new york'
group by l.city

--9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES. 
select *, case when salary >=3500 then ' top'
               when salary >= 2500 then 'maximum'
			   when salary >= 2000 then 'medium'
			   else 'low'
			end as [salary grade]
from employee

--10.LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE. 

select salary, count(*) as totalemployee,
case when salary >= 3500 then 'high'
     when salary >= 2500 then 'medium'
	 when salary >= 1500 then 'low'
	 else 'very low'
end as [salary gradewise]
from employee
group by salary

--11.DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 
--RANGE OF SALARY. 
select salary, count(*) as [total employee],
case when salary >=3500 then ' high grade salary'
	 when salary >= 2500 then 'medium grade salary'
	 when salary >= 2000 then 'low grade salary'
	 else 'no grade'
end as [salary grade]
from employee
group by salary


--12.DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES. 

select e.*, concat(m.first_name, ' ' , m.last_name) 
as [Manager full name]
from employee E
join employee M
on e.manager_id = m.employee_id


--13.DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES. 

select e.*, concat(m.first_name, ' ' , m.last_name) as [Manager full name]
from employee e
join employee m
on e.manager_id = m.employee_id
where e.salary > m.salary


--14.SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.

select concat(m.first_name, ' ' , m.last_name) as [Manager full name], 
count(*) as [total employee] from employee m
join employee e
on  m.employee_id = e.manager_id
group by concat(m.first_name, ' ' , m.last_name)

--15.DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES. 
select e.*, concat(m.first_name, ' ' , m.last_name) as [Manager full name]
from employee E
join employee M
on e.manager_id = m.employee_id

--16.DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.

select e.*, d.name
from employee e
join department d
on e.department_id = d.department_id
where d.name ='sales' or
 d.name ='OPERATION'


 --SET OPERATORS
--1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.

select distinct Designation from job where job_id in(select job_id from employee where 
department_id in (select department_id from department where name in ('sales', 'ACCOUNTING')))

--or 
select distinct Designation from job where job_id in(select job_id from employee where 
department_id in (select department_id from department where name = 'sales'))
union 
select distinct Designation from job where job_id in(select job_id from employee where 
department_id in (select department_id from department where name = 'accounting'))


--2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select Designation from job where job_id in(select job_id from employee where 
department_id in (select department_id from department where name in ('sales', 'ACCOUNTING')))

select distinct Designation from job where job_id in(select job_id from employee where 
department_id = (select department_id from department where name = 'sales'))
union  all
select distinct Designation from job where job_id in(select job_id from employee where 
department_id = (select department_id from department where name = 'accounting'))

--3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN 
--ASCENDING ORDER. 
select distinct Designation from job where job_id in(select job_id from employee where 
department_id in (select department_id from department where name = 'research'))
intersect 
select distinct Designation from job where job_id in(select job_id from employee where 
department_id in (select department_id from department where name = 'accounting'))

--SUB QUERIES

--1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY. 

select * from employee where salary in (select max(salary) from employee)

--2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT. 

select * from employee where department_id in
(select department_id from department where name = 'sales')


--3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'. 
select * from employee where  job_id in (select job_id from job where Designation = 'clerk')


--4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK". 

select * from employee where department_id in
(select department_id from department where location_id in 
(select location_id from location where city = 'new york'))

--5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT. 

select department_id, count(*) as [Total employee]
from employee where department_id in 
(select department_id from department where name = 'sales')
group by department_id

--6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%. 

update employee
set salary = (salary + salary * 1/10) where job_id =
(select job_id from job where Designation = 'clerk')

--7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT. 

--delete employee where department_id =
(select department_id from department where name = 'ACCOUNTING')

--8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS. 

--1 --with subquaries
select max(salary) from employee where salary < (select max(salary) from employee);

--2--with CTE
with CTE_salaryrank as
(select salary, DENSE_RANK() over (order by salary desc) as [salary rank] from employee)
select salary from CTE_salaryrank
where [salary rank] = 2;

--3 with top
select top 1 salary from
(select distinct top 2 salary from employee
order by salary desc) result
order by  salary;

--9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS. 

select salary, DENSE_RANK() over (order by salary desc) as [salary rank] from employee;

select a.salary from employee a
where (select count(distinct(b.salary)) from employee b
where a.salary < b.salary) in (1,2,3,4,5,6)

--10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30. 

select * from employee where salary > 
(select max(salary) from employee where department_id = 30)

--11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30. 
select * from employee where salary > 
(select min(salary) from employee where department_id = 30)

--12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES. 

select department_id, name from department where department_id not in 
(select department_id from employee)

--13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES. 

select department_id, name from department where department_id not in 
(select department_id from employee)


--14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR 
--DEPARTMENT.
select * from employee e where salary >
(select avg(salary) from employee where department_id = e.department_id
group by department_id)

