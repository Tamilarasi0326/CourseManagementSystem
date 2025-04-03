USE [CmsDB]
 
create table UserRegister(
   UserId int primary key identity(1,1),
   UserName varchar(50),
   Email varchar(50),
   Password varchar(50))

create table AdminRegister(
   AdminId int primary key identity(1,1),
   AdminName varchar(50),
   Email varchar(50),
   Password varchar(50))

   INSERT INTO  AdminRegister(AdminName,Email,Password)
VALUES ('Admin','admin@gmail.com','admin');

create table UserInfo(
   UsersId int primary key identity(1,1),
   FirstName nvarchar(50),
   LastName nvarchar(50),
   Gender nvarchar(10),
   DateOfBirth date, 
   Email nvarchar(100),
   PhoneNumber nvarchar(20),
   Address nvarchar(255))
 
ALTER TABLE UserInfo
ADD Password varchar(50),
UserName varchar(50);
 
 

create table Course(
CourseId int primary key identity(1,1),
CourseName nvarchar(255)not null,
Description nvarchar(255),
CourseAuthor nvarchar(50),
CoursePrice decimal(10, 2),
CoursePic varchar(50) null)
 
 
Create table Orders(
   OrderId int primary key identity(1,1),
   OrderDate datetime,
   OrderNumber varchar(50))
 
Create table OrderDetails(
	OrderDetailsId int primary key identity(1,1),
	orderid int ,
	courseid int,
	coursename nvarchar(255) not null,
	TotalAmount decimal(18,2),
	foreign key(orderid) references Orders (OrderId),
	foreign key(courseid) references Course (CourseId))
 
ALTER TABLE OrderDetails
DROP COLUMN TotalAmount;
 
create table Pay(
EnrollId int primary key identity (1,1),
CourseId int,
UserName varchar(50),
UserId int,
CourseName nvarchar(255)not null,
CoursePrice decimal(10, 2),
EnrollDate Datetime default current_timestamp,
  foreign key (CourseId) references Course (CourseId),
  foreign key (UserId) references UserInfo (UsersId)
);
   select * from UserRegister
   select * from AdminRegister
   select * from UserInfo
   select * from Course
   select * from Orders
   select * from OrderDetails
   select * from Pay