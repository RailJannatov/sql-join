----create database
--CREATE DATABASE AMAZON
----switch database
--USE AMAZON
----create table
--CREATE TABLE Employees(
--EmployeeName  nvarchar(100),
--EmployeeSurname  nvarchar(100),
--EmployeePosition  nvarchar(100),
--EmployeeSalary  int
--)

----insert table to database
--INSERT INTO Employees
--VALUES ('Andy','Troutman','Director',8000),
--       ('Jeff','Bezos','CEO',1000000),
--	   ('Sethuraman','Subbiah','Senior Software Engineer',24000),
--	   ('Chris','Haggard','Director',14500),
--	   ('Olivia','Igbokwe','Public Policy Manager',48500),
--	   ('Yashar','Ahmadli','Business Analyst',74500),
--	   ('Sushil', 'Kapoor','Senior Manager',124500)
----average salaries 
--SELECT AVG(EmployeeSalary)'AverageSalary'
--FROM Employees
----over average salary
--SELECT EmployeeName,EmployeeSurname,EmployeeSalary FROM Employees
--WHERE EmployeeSalary > (SELECT AVG(EmployeeSalary)'AverageSalary'
--FROM Employees)
----max average salary
--SELECT MAX(EmployeeSalary) FROM Employees
----min average salary
--SELECT MIN(EmployeeSalary) FROM Employees
--create database
CREATE DATABASE UNIVERSITY

USE UNIVERSITY

--create students table

CREATE TABLE STUDENTS(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50),
Phone INT UNIQUE,
Score INT DEFAULT 50,
Comment NVARCHAR(200),
isGraduted BIT DEFAULT 'false'
)


SELECT * FROM STUDENTS
--add students to table
INSERT INTO STUDENTS(Name,Surname,Phone,Comment)
VALUES ('Nigar','Seyidova',4000200,'good')

INSERT INTO STUDENTS(Name,Surname,Phone,Score,isGraduted)
VALUES ('Rail','Jannatov',710200,90,1)


INSERT INTO STUDENTS(Name,Surname,Phone,Score,Comment)
VALUES('Fegan','Eyvazov',948004332,80,'not bad')

INSERT INTO STUDENTS(Name,Surname,Phone,Score,isGraduted)
VALUES('Jamil','Alisgandarov',0555676767,100,1)

INSERT INTO STUDENTS(Name,Surname,Phone,Score,isGraduted)
VALUES('Leyla','Huseynli',0507664333,30,1)

INSERT INTO STUDENTS(Name,Phone,Score,isGraduted)
VALUES('Elnur',0774443322,10,1)

INSERT INTO STUDENTS(Name,Surname,Phone,Score,isGraduted)
VALUES('Sunal','Jabili',0502111111,95,1)


SELECT AVG(Score) FROM STUDENTS

--update students
UPDATE STUDENTS
SET Comment='Congratulations'
WHERE Score > (SELECT AVG(Score) FROM STUDENTS)


UPDATE STUDENTS
SET Comment='So bad'
WHERE Score < (SELECT AVG(Score) FROM STUDENTS)


SELECT * INTO GraduatedStudents
FROM STUDENTS
WHERE isGraduted = 1

SELECT * FROM GraduatedStudents
--delete students which is graduated
DELETE  FROM  STUDENTS
WHERE isGraduted = 1


--relation qurmagha chalishiram(tam deyil onun uzerinde ishleyirem:D)))
CREATE TABLE CLASSES(
Id INT PRIMARY KEY IDENTITY,
ClassName NVARCHAR(100) NOT NULL,
Capacity INT DEFAULT 30,
)



SELECT * FROM CLASSES


INSERT INTO CLASSES(ClassName)
VALUES('Programming')

INSERT INTO CLASSES(ClassName,Capacity)
VALUES('UI/UX Designer',60)


INSERT INTO CLASSES(ClassName,Capacity)
VALUES('Marketing',40)

INSERT INTO CLASSES(ClassName)
VALUES('System Administration')


SELECT  Name,Phone,Score,ClassName FROM CLASSES,STUDENTS

SELECT Name,Phone,Score,ClassName FROM CLASSES,GraduatedStudents

SELECT Name,Phone,Score,ClassName FROM CLASSES,GraduatedStudents

WHERE CLASSES.Id = GraduatedStudents.Id


CREATE TABLE TEACHERS(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50),
Profession NVARCHAR(50) NOT NULL
)

SELECT * FROM TEACHERS

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Samir','Karimov','Programming')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Knyaz','Yaqubov','UI/UX Designer')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Kamran','Jabiyev','Programming')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Saleh','Haciyev','System Administration')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Rashad','Nazarov','Marketing')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Yolchu','Nasib','Programming')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Vusal','Azizov','UI/UX Designer')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Namaz','Bayramov','System Administration')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Shahriyar','Mammadli','Digital Literacy')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Xudayar','Aghayarov','Graphic and Web Design')

INSERT INTO TEACHERS(Name,Surname,Profession)
VALUES('Rizvan','Baghirli','Graphic and Web Design')



SELECT Name FROM CLASSES c1,TEACHERS t1
WHERE c1.ClassName=t1.Profession


SELECT Name FROM CLASSES c1 INNER JOIN TEACHERS t1
ON c1.ClassName=t1.Profession


CREATE DATABASE PHARMACY

USE PHARMACY

CREATE TABLE PHARMACIES(
Id INT PRIMARY KEY IDENTITY,
Name nvarchar(100) NOT NULL
)

SELECT * FROM PHARMACIES

CREATE TABLE DRUGS(
Id INT PRIMARY KEY IDENTITY,
Name nvarchar(100) NOT NULL,
DrugType nvarchar(100) NOT NULL
)

ALTER TABLE DRUGS
DROP COLUMN DrugType

SELECT * FROM DRUGS

ALTER TABLE DRUGS
ADD PharmacyId int FOREIGN KEY REFERENCES PHARMACIES(Id)

CREATE TABLE DrugTypes(
Id INT PRIMARY KEY IDENTITY,
Name nvarchar(100) NOT NULL
)

ALTER TABLE DrugTypes
ADD DrugId int FOREIGN KEY REFERENCES DRUGS(Id)
SELECT * FROM DrugTypes
INSERT INTO DrugTypes(Name)
VALUES ('Agrikesici')


SELECT * FROM DRUGS

INSERT INTO PHARMACIES(Name)
VALUES('Zeferan'),
      ('Medilux'),
	  ('Avanqard'),
	  ('Dermanchi')


  SELECT * FROM PHARMACIES


INSERT INTO DRUGS(Name,DrugType)
VALUES('Nimesil','Agrhikesici'),
      ('Analgin','Agrhikesici'),
	  ('Vazelin','Cream')

SELECT * FROM PHARMACIES INNER JOIN DRUGS ON DRUGS.Id = PHARMACIES.Id 

DROP DATABASE PHARMACY

