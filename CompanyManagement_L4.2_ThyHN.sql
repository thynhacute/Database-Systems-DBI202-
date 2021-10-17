
create database CompanyManagement_Lab04_HoangNhaThy_SE151101
use CompanyManagement_Lab04_HoangNhaThy_SE151101
--Exercise 1: Write SQL script to create database and tables for Company.
create table DEPARTMENT(
	Dname nvarchar(15),
	Dnumber int primary key,
	Mgr_ssn char(15),
	Mgr_startssn char(15)
);
 
create table DEPT_LOCATIONS(
	Dnumber int foreign key references DEPARTMENT,
	Dlocation nvarchar(20), 
	primary key(Dnumber,Dlocation)
);
 
create table PROJECT(
	Pname nvarchar(15),
	Pnumber int primary key,
	Plocation nvarchar(15),
	Dnum int foreign key references DEPARTMENT
);
 
create table EMPLOYEE(
	Fname nvarchar(15),
	Minit char(5),
	Lname nvarchar(15),
	Ssn char(15) primary key,
	Bdate char(12),
	Address nvarchar(50),
	Sex nvarchar(5),
	Salary int, 
	Super_ssn char(20),
	Dno int foreign key references DEPARTMENT(Dnumber)
);
 
create table WORKS_ON(
	Essn char(15) foreign key references EMPLOYEE(Ssn),
	Pno int foreign key references PROJECT(Pnumber), 
	Hours float(1),
	primary key(Essn,Pno)
);
 
create table DEPENDENT(
	Essn char(15) foreign key references EMPLOYEE(Ssn),
	Dependent_name nvarchar(10),
	Sex char(5), 	Bdate char(15),	Relationship nvarchar(20), 	primary key(Essn,Dependent_name));
insert into DEPARTMENT values
(N'Nghiên cứu',5,'333445555','1997-05-22'),
(N'Quản lý',3,'987654321','1995-01-01'),
(N'HR',1,'888665555','1999-06-19'),
(N'Sản xuất',2,'876543210','1998-02-02');
 
insert into DEPT_LOCATIONS values
(1,N'Sharjah'),
(3,N'Hồ Chí Minh'),
(5,N'Hà Nội'),
(5,N'Đà Nẵng'),
(5,N'Vũng Tàu');
 
insert into PROJECT values
(N'ProductX',1,N'Bellaire',5),
(N'Trà đào',2,N'Đà Nẵng',5),
(N'Milo dầm',3,N'Vũng Tàu',5),
(N'Cà phê',10,N'Hồ Chí Minh',3),
(N'Trà dâu',20,N'Sharjah',1),
(N'Trà vải',30,N'Hồ Chí Minh',3);

insert into EMPLOYEE values
(N'Ty','b',N'Hoàng Naa','123456789','2001-10-07',N'Bà Rịa Vũng Tàu','F',30000,'333445555',5),
(N'Franklin','t','Wong','333445555','1955-12-08','638 Voss, Houston, Tx','M',40000,'888665555',5),
(N'Tân','t',N'Nguyễn Hoàng','333445556','2001-12-08',N'Bà Rịa Vũng Tàu','M',40000,'888665555',5),
(N'Thái','j','Hoàng Đình','999887777','2001-07-19',N'Bình Tân, Hồ Chí Minh','M',25000,'987654321',3),
(N'Thiệp','s',N'Ngô Xuân','987654321','2001-06-20',N'Thủ Đức, Hồ Chí Minh','M',43000,'888665555',3),
(N'Thịnh','k','Đào Xuân','666884444','2001-09-15',N'Vĩnh Cửu, Đồng Nai','M',38000,'453453453',5),
(N'Mín','a',N'Trần Hồng Min','453453453','2001-07-31',N'Ba Đình, Hà Nội','F',25000,'333445555',5),
(N'Cheng','v',N'Châu Yoz','987987987','2001-03-29',N'Thủ Đức, Hồ Chí Minh','F',25000,'987654321',3),
(N'Shang','e',N'Tống Tài','888665555','2001-11-10',N'Bellaire Harris','F',55000,'123456789',1);
 
insert into WORKS_ON values
('987654321',1,32.5),
('123456789',2,7.5),
('666884444',3,40.0),
('453453453',1,20.0),
('987654321',2,20.0),
('333445555',2,10.0),
('333445555',3,10.0),
('333445555',10,10.0),
('999887777',30,30.0),
('999887777',10,10.0),
('987987987',10,35.0),
('987987987',30,5.0),
('987654321',30,20.0),
('987654321',20,15.0),
('888665555',20,null),
('123456789',20,20.0);

insert into DEPENDENT values
('333445555',N'Meo','F','1980-04-05',N'Vợ'),
('333445555',N'Thỏ','M','1998-10-25',N'Con gái'),
('333445555',N'Chuppi','F','1999-05-03',N'Con trai'),
('987654321',N'Misa','F','1982-02-28',N'Em trai'),
('123456789',N'Orie','M','1985-01-04',N'Em gái'),
('123456789',N'Hana','F','1988-12-30',N'Em vợ'),
('888665555',N'Nini','F','1979-05-05',N'Chị gái'),
('123456789',N'Ty','F','2000-05-05',N'Em gái');

select * from EMPLOYEE
select * from DEPARTMENT
select * from DEPT_LOCATIONS
select * from PROJECT
select * from WORKS_ON
select * from DEPENDENT

--Exercise 2: Write SQL script as requirement below
--I will add some information to tables to allow performing editing actions.
--EMPLOYEE TABLE

--a. Insert <'Robert', 'F', 'Scott', '943775543', '1972-06-21', '2365 Newcastle Rd,
	--Bellaire, TX', M, 58000, '888665555', 1> into EMPLOYEE.
insert into EMPLOYEE
	values ('Robert', 'F', 'Scott', '943775543', '21-JUN-42', '2365 Newcastle Rd, Bellaire, TX',
				'M', 58000, '888665555', 1);
select * from EMPLOYEE

--b. Insert <'ProductA', 4, 'Bellaire', 2> into PROJECT.
insert into PROJECT
	values ('ProductA', 4, 'Bellaire', 2);
select * from PROJECT

--c. Insert <'Production', 4, '943775543', '2007-10-01'> into DEPARTMENT.
insert into DEPARTMENT
	values ('Production', 4, '943775543', '01-OCT-88');
select * from DEPARTMENT

--d. Insert <'677678989', NULL, '40.0'> into WORKS_ON.
insert into WORKS_ON
	values ('677678989', NULL, '40.0');
--This insertion violates the entity integrity constraint (null for the primary key Pno).
--It also violates referential integrity specified on SSN because no EMPLOYEE tuple exists 
	--where SSN = '677678989'
--A way to enforce this constraint is to change the null value to valid Pno, also insert 
	--an employee tuple with SSN = ‘677678989’ and then perform the above insert operation.

--e. Insert <'453453453', 'John', 'M', '1990-12-12', 'spouse'> into DEPENDENT.
insert into DEPENDENT
	values ('453453453', 'John', 'M', '12-DEC-60', 'SPOUSE');
select * from DEPENDENT

--f. Delete the WORKS_ON tuples with Essn = '333445555'.
delete from WORKS_ON
	where Essn = '333445555';
select * from WORKS_ON

--g. Delete the EMPLOYEE tuple with Ssn = '987654321'.
delete from EMPLOYEE
	where Ssn = '987654321';
select * from EMPLOYEE
--This deletion is not acceptable because tuples in EMPLOYEE, DEPARTMENT, WORKS_ON and DEPENDENT 
	--refer this tuple. Hence, if the tuple is deleted, referential integrity violations will result.

--h. Delete the PROJECT tuple with Pname = 'ProductX'.
delete from PROJECT
	where Pname = 'ProductX';
select * from PROJECT
--This deletion is not acceptable because tuples in WORKS_ON refer to this tuple. 
	--Hence referential integrity violations will result.

--i. Modify the Mgr_ssn and Mgr_start_date of the DEPARTMENT tuple with Dnumber = 5 to '123456789' and '2007-10-01', respectively.
update DEPARTMENT
	set Mgr_ssn = '123456789', Mgr_startssn = '01-OCT-88'
	where Dnumber = 5;
select * from DEPARTMENT

--j. Modify the Super_ssn attribute of the EMPLOYEE tuple with Ssn = '999887777' to '943775543'.
update EMPLOYEE
	set Super_ssn = '943775543'
	where Ssn = '999887777';
select * from EMPLOYEE

--k. Modify the Hours attribute of the WORKS_ON tuple with Essn = '999887777' and Pno = 10 to '5.0'.
update WORKS_ON
	set Hours = '5.0'
	where Essn = '999887777' and Pno = 10;
select * from WORKS_ON

--Exercise 3: Write the following queries in SQL for the COMPANY datebase:
--a. Retrieve the minimum and maximum Salary and the number of employees in each department.
select MIN(Salary) as "Minimum Salary", MAX(Salary) as "Maximum Salary",COUNT(*) as "Number of Employees"
	from EMPLOYEE
	group by Dno;

--b. Retrieve the number of projects located in Sharjah that are owned by each department.
select Dnum,COUNT(*) as "Number of Projects "
	from PROJECT
	where Plocation = N'Sharjah'
	group by Dnum;

--c. Retrieve the Ssn and Address of employees who works for the HR department and have female dependent.
select Ssn,Address
	from EMPLOYEE
	where Dno in (select Dnumber from DEPARTMENT where Dname = N'HR') and Ssn in (select Essn from DEPENDENT where Sex ='F');

--d. Retrieve the first name and last name of all employees who work for all departments except the HR department.
select Fname,Lname
	from EMPLOYEE
	where Dno in (select Dnumber from DEPARTMENT where NOT Dname = N'HR');

--e. Retrieve the last name and Ssn of employees who work on more than three projects.
select Lname,Ssn
	from EMPLOYEE
	where Ssn in (select Essn from WORKS_ON group by Essn having COUNT(*) > 3);

--f. Make a list of the distinct names of all employees who in the HR department and work on projects that are located in Sharjah.
select distinct(CONCAT(Fname,' ',Lname)) as "Full Name"
	from EMPLOYEE
	where Dno in (select Dnumber from DEPARTMENT where Dname=N'HR') and Dno in (select Dnum from PROJECT where Plocation =N'Sharjah');

--Exercise 4: Write SQL script as requirement below
--a. Retrieve the names of all employees who work in the department that has the employee with the highest salary among all employees.
select LName + ' ' + FName as FullName from EMPLOYEE
	where Dno = (select Dno from EMPLOYEE 
					where Salary = (select MAX(Salary) from EMPLOYEE));

--b. Retrieve the names of all employees whose supervisor's supervisor has '888665555' for Ssn.
select LName + ' ' + FName as FullName from EMPLOYEE 
	where Super_ssn in (select Ssn from EMPLOYEE 
							where Super_ssn = '888665555');

--c. Retrieve the names of employees who make at least $10,000 more than the employee who is paid the least in the company.
select LName + ' ' + FName as FullName from EMPLOYEE 
	where Salary >= 10000 + (select MIN(Salary) from EMPLOYEE);

--d. Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project.
select Lname, Fname from EMPLOYEE
	where Dno = 5 and Ssn in (select Essn from WORKS_ON
								where Hours > 10 and Pno in (select Pnumber from PROJECT
																where Pname='ProductX'));

--e. List the names of all employees who have a dependent with the same first name as themselves.
select Lname, Fname from EMPLOYEE
	where exists (select * from DEPENDENT
					where Fname = Dependent_name and Ssn = Essn);

--f. Find the names of all employees who are directly supervised by 'Franklin Wong'.
select Lname, Fname from EMPLOYEE
	where Super_ssn in (select Ssn from EMPLOYEE
							where Fname = 'Franklin' and Lname = 'Wong');