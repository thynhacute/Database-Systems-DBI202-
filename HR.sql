--1. Create HR database.
create database HR_IA1601_ThyHN
use HR_IA1601_ThyHN

--2. Create all table of HR Database.
--create Table Regions
create table Regions(
	Region_ID int not null,
	Region_Name varchar(25),
	constraint Region_ID_PK primary key (Region_ID)
)

--create Table Countries
create table Countries(
	Country_ID char(2) not null,
	Country_Name varchar(40), 
	Region_ID int,
	constraint Country_CID_PK primary key (Country_ID), 
	constraint Country_Region_FK foreign key (Region_ID) references Regions (Region_ID)  
)

--create Table Locations
create table Locations(
	Location_ID int not null,
	Street_Address varchar(40),  
    Postal_Code varchar(12),  
    City varchar(30) not null,  
    State_Province varchar(25),
    Country_ID char(2),
	constraint Location_ID_PK primary key(Location_ID), 
    constraint Location_CID_FK foreign key (Country_ID) references Countries(Country_ID),
)

--create Table Departments
create table Departments(
	Department_ID int,
	Department_Name varchar(30) not null,   
	Manager_ID int,
	Location_ID int,
	constraint Department_ID_PK primary key (Department_ID),
    constraint Department_LCT_FK foreign key (Location_ID) references Locations (Location_ID)  
)

--create Table Jobs
create table Jobs(
	Job_ID varchar(10),
	Job_Title varchar(35) not null, 
	Min_Salary int, 
    Max_Salary int
	constraint Job_ID_PK primary key (Job_ID),
)

--create Table Employees
create table Employees(
	Employee_ID int,
    First_Name varchar(20),
    Last_Name varchar(25) not null,
    email varchar(25) not null,
    Phone_Number varchar(20),  
    hire_date date not null,
    job_id varchar(10) not null,
    salary int,
    Commission_Pct int,
    Manager_ID int,
    Department_ID  int,
	constraint Emp_EID_PK primary key (Employee_ID),
	constraint Emp_Email_Un unique (email),
	constraint emp_salary_min  
		check (salary > 0),
	constraint Emp_Manager_FK foreign key (Manager_ID) references Employees,
    constraint Emp_Dept_FK foreign key (Department_ID) references Departments 
)

--create Table Job_History
create table Job_History(
	Employee_ID int not null, 
    Start_Date date not null, 
    End_Date date not null,
    Job_ID varchar(10) not null,
    Department_ID int, 
	constraint JHist_Emp_FK foreign key (Employee_ID) references Employees, 
	constraint JHist_Job_FK foreign key (Job_ID) references Jobs,
    constraint JHist_Dept_FK foreign key (department_id) references Departments,
    constraint JHist_Emp_ID_Start_Date_PK primary key (Employee_ID, Start_Date),
    constraint JHist_Date_Interval  
		check (End_Date > Start_Date)  
) 

--Insert Values
insert into Regions values('1','Europe')
insert into Regions values('2','America')
insert into Regions values('3','Asia')

insert into Countries values('IT','Italy','1')
insert into Countries values('VN','Vietnam','3')
insert into Countries values('KR','Korea','3')
insert into Countries values('JP','Japan','3')
insert into Countries values('MX','Mexico','2')

insert into Locations values('1200','2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP')
insert into Locations values('1100','93091 Calle della Testa','10934','Venice','','IT')
insert into Locations values('3200','Mariano Escobedo 9991','11932','Mexico City','Distrito Federal','MX')

insert into Departments values('60','IT','103','1200')
insert into Departments values('70','Public Relations','204','1100')
insert into Departments values('20','Marketing','201','3200')

insert into Jobs values('SA_MAN','Sales Manager','10000','20080')
insert into Jobs values('MK_REP','Marketing Representative','4000','9000')
insert into Jobs values('IT_PROG','Programmer','4000','10000')

insert into Employees values('200','Alexander','Hunold','AHUNOLD','590.423.4567','2006-01-03','IT_PROG','9000','0','200','60')
insert into Employees values('101','Hermann','Baer','HBAER','515.123.8888','2002-06-07','PR_REP','10000','0','101','70')
insert into Employees values('102','Pat','Fay','PFAY','603.123.6666','2005-08-17','MK_REP','6000','0','102','20')
insert into Employees values('100','Thy','Thy', 'AHUNOLL','590.423.4444','2006-07-02','IT_PROG','9000','0','100','60')
insert into Employees values('104','Naa','Ty', 'AMUMU','590.423.4555','2006-02-08','IT_PROG','9000','0','104','60')
insert into Employees values('105','Min','Nhat', 'HAPPY','590.423.4533','2006-07-19','IT_PROG','9000','0','105','60')
insert into Employees values('106','Julia','Cam', 'OOPS','590.423.4333','2006-05-05','IT_PROG','9000','0','106','60')

insert into Job_History values('200','2018-01-13','2018-07-24','IT_PROG','60')
insert into Job_History values('102','2018-02-17','2021-12-19','MK_REP','20')
insert into Job_History values('101','2018-03-24','2021-12-31','SA_MAN','70')

--3. Create a query to display the employee number, first name, last name, phone number and department number.
select e.Employee_ID, e.First_Name, e.Last_Name, e.Phone_Number, e.Department_ID from Employees e
	join Departments d on e.Department_ID = d.Department_ID;

--4. Create a query in SQL to display the first name, last name, department number and department name, 
	--for all employees for departments 10 or 20.
select e.First_Name, e.Last_Name, d.Department_ID, d.Department_Name from Employees e
	inner join Departments d on e.Department_ID = d.Department_ID
		and d.Department_ID in (10,20)
	order by e.Last_Name;

--5. Create a query in SQL to display those employees who contain a letter d to their first name and 
	--also display their last name, department, city, and state province.
select e.First_Name, e.Last_Name, d.Department_Name, l.City, l.State_Province from Employees e
	inner join Departments d on e.Department_ID = d.Department_ID
	inner join Locations l on d.Location_ID = l.Location_ID 
		where e.First_Name LIKE '%d%';

--6. Create a query in SQL to display the first and last name and salary for those employees who earn 
	--greate than the employee earn whose number is 200.
select e1.First_Name, e1.Last_Name, e1.Salary from Employees e1
	inner join Employees e2 on e1.Salary > e2.Salary
							AND e2.Employee_ID = 200;

--7. Create a query in SQL to display the first name of all employees including the first name of their manager.
select e1.First_Name as "Employee_Name", e2.First_Name as "Manager_Name" from Employees e1
	inner join Employees e2 on e1.Manager_ID = e2.Employee_ID;

--8. Create a query in SQL to display the job title, department name, full name (first and last name ) of employee, 
	--and starting date for all the jobs which started on or after 1st January, 2018 and ending with on or before 31 August, 2021.
select j.Job_Title, d.Department_Name,
	concat(e.First_Name, ' ', e.Last_Name) as Full_Name,
			jh.Start_Date
	from Employees e
	inner join Job_History jh on e.Employee_ID = jh.Employee_ID
		and jh.Start_Date between '2018-01-01' and '2021-08-31'
	inner join Jobs j on jh.Job_ID = j.Job_ID
	inner join Departments d on jh.Department_ID = d.Department_ID;

--9. Create a query in SQL to display the name of the department, average salary and number of employees 
	--working in that department who got commission.
select d.Department_Name, AVG(e.Salary) as Avg, COUNT(Commission_Pct) as Count from Employees e
	join Departments d on e.Department_ID = d.Department_ID
	group by d.Department_Name;

--10. Create a query in SQL to display the country name, city, and number of those departments where at least 5 employees are working.
select c.Country_Name, l.City, COUNT(d.Department_ID) as Count from Countries c
	inner join Locations l on c.Country_ID = l.Country_ID
	inner join Departments d on l.Location_ID = d.Location_ID
		where d.Department_ID in (select e.Department_ID from Employees e
										group by e.Department_ID 
										having COUNT(e.Department_ID) >= 5)
	group by c.Country_Name, l.City;


--11. Create a query in SQL to display full name(first and last name), job title, starting and ending date of last jobs for 
	--those employees with worked without a commission percentage.
select CONCAT(e.First_Name, ' ', e.last_name) as Full_Name, j.Job_Title, jh.* from Employees e
	inner join (select MAX(Start_Date) as Starting_Date, MAX(End_Date) as Ending_Date, Employee_ID
					from Job_History
					group by Employee_ID) jh on e.Employee_ID = jh.Employee_ID
	inner join Jobs j on e.Job_ID = j.Job_ID
		where e.Commission_Pct = 0;