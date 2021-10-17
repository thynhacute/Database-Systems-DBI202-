

create table Books (
	isbn int primary key,
	title varchar(50),
	price float,
	qty int not null,
)

insert into Books values ('1001','Java for Dummies','11.11','11')
insert into Books values ('1002','Only Java','22.22','22')
insert into Books values ('1003','Java ABC','33.33','33')
insert into Books values ('1004','Java 123','44.44','44')

create table Authors (
	authorID int primary key,
	name varchar(30),
	email varchar(30) unique,
)

insert into Authors values ('1','Tan Ah Teck','teck@nowhere.com')
insert into Authors values ('2','Mohamed Ali','ali@somewhere.com')
insert into Authors values ('3','Kumar','kumar@abc.com')
insert into Authors values ('4','Kelvin Jones','kelvin@xyz.com')

create table Book_Authors (
	authorID int,
	foreign key (authorID) references Authors(authorID),
	isbn int,
	foreign key (isbn) references Books(isbn),
)

insert into Book_Authors values ('1','1001')
insert into Book_Authors values ('2','1001')
insert into Book_Authors values ('3','1001')
insert into Book_Authors values ('1','1002')
insert into Book_Authors values ('3','1002')
insert into Book_Authors values ('2','1003')
insert into Book_Authors values ('2','1004')

select * from Books
select * from Authors
select * from Book_Authors

--1. Add unique constraint to title in books table.
alter table Books
	add constraint Unique_Books unique (title)

--2. Add not null constraint to price in books table.
alter table Books
	alter column price float not null;

--3. Alter not null constraint in price attribute in bookstable 
--and set the check constraint so that value isgreater than 0.0.
alter table Books 
	alter column price float;
alter table Books
	add constraint Checking_Books check (price > 0.0)

--4. Drop not null constraint for qty in books table.
alter table Books
	alter column qty int;

--5. Set a default value of qty in books table as 0.
alter table Books
	add constraint Default_qty
	default '0' for qty;

--6. Drop unique constraint for email attribute in authorstable.
alter table Authors
	drop constraint email;

--7. Drop any one foreign key constraint.
--I will drop authorID foreign key constraint.
alter table Book_Authors
	drop constraint authorID;

--8. Drop a primary key [after referenced foreign key isdropped].
--Because I drop the foreign key constraint authorID of Book_Authors table.
--So I will drop primary key authorID of Authors table.
alter table Authors
	drop constraint authorID;

--9. Add an attribute for authors table and set a constraintfor it.
--I will a new attribute PK_Authors to Authors table.
--Then adding primary key constraint to PK_Authors in Authors table.
alter table Authors
	add PK_Authors int primary key;

alter table Authors
	add primary key (PK_Authors);


-- IA1601 - Hoang Nha Thy - SE151101.