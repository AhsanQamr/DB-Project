CREATE DATABASE DBProject;
USE DBProject;


CREATE TABLE STUDENT -- changed to studnt
(
	RollNo VARCHAR(30) PRIMARY KEY,
	FName VARCHAR(255) NOT NULL,
	Paswrd VARCHAR(30) NOT NULL,
	Cgpa DECIMAL(3,2) NOT NULL,
	Batch INT not null,
	Section CHAR(1) NOT NULL
);

CREATE TABLE 
(
	St_roll VARCHAR(30) FOREIGN KEY REFERENCES STUDENT(RollNo), 
	ID INT PRIMARY KEY,
	Req_stat VARCHAR(50) NOT NULL
);
ALTER TABLE REQUEST ADD StartDate DATE;
ALTER TABLE REQUEST ADD EndDate DATE;
ALTER TABLE REQUEST ADD CONSTRAINT df_REQUEST DEFAULT 'Pending' FOR Req_stat;
--ALTER TABLE REQUEST ALTER COLUMN St_roll St_roll VARCHAR(35) FOREIGN KEY REFERENCES STUDENT(RollNo) on delete cascade on update cascade;

--sp_help REQUEST;

--ALTER TABLE REQUEST
--drop CONSTRAINT FK__REQUEST__St_roll__3B75D760;

--ALTER TABLE REQUEST ADD
--   FOREIGN KEY (St_roll)
--    REFERENCES STUDENT 
--    ON DELETE CASCADE ON UPDATE NO ACTION;

CREATE TABLE UNIADMIN
(
	EmplNo INT PRIMARY KEY,
	Req_id INT FOREIGN KEY REFERENCES REQUEST(ID),
	FName VARCHAR(255) NOT NULL,
	Cnic int NOT NULL,
	Email VARCHAR(255),
	Pswd VARCHAR(30) NOT NULL
);

CREATE TABLE FYPDEPT
(
	EmplNo INT PRIMARY KEY,
	Req_id INT FOREIGN KEY REFERENCES REQUEST(ID),
	FName VARCHAR(255) NOT NULL,
	Cnic int NOT NULL,
	Email VARCHAR(255),
	Pswd VARCHAR(30) NOT NULL
);

CREATE TABLE FINCDEPT
(
	EmplNo INT PRIMARY KEY,
	Req_id INT FOREIGN KEY REFERENCES REQUEST(ID),
	FName VARCHAR(255) NOT NULL,
	Cnic int NOT NULL,
	Email VARCHAR(255),
	Pswd VARCHAR(30) NOT NULL
);

CREATE TABLE DIRECTOR
(
	EmplNo INT PRIMARY KEY,
	Req_id INT FOREIGN KEY REFERENCES REQUEST(ID),
	FName VARCHAR(255) NOT NULL,
	Cnic int NOT NULL,
	Email VARCHAR(255),
	Pswd VARCHAR(30) NOT NULL
);

CREATE TABLE Finance
(
	Rollno VARCHAR(30) FOREIGN KEY REFERENCES STUDENT(RollNo),
	Feestatus VARCHAR(50) NOT NULL
);


CREATE TABLE Fyp
(
	Rollno VARCHAR(30) FOREIGN KEY REFERENCES STUDENT(RollNo),
	Fypstatus VARCHAR(50) NOT NULL
);

CREATE TABLE REMARKS
(
	Rollnum VARCHAR(30) FOREIGN KEY REFERENCES STUDENT(RollNo),
	Fypremarks VARCHAR(255),
	Financeremarks VARCHAR(255),
	Adminremarks VARCHAR(255)

);




--INSERT INTO REQUEST VALUES
--( 'i172048',1,'Pending',CONVERT(date,'1-Jan-2022'),CONVERT(date,'17-Jan-2022') );


INSERT INTO UNIADMIN VALUES
( 62246,142,'Amir Rehman',61101,'amir@nu.edu.pk','amir@123');

INSERT INTO FINCDEPT VALUES
( 61101,142,'Irshad Aslam',34105,'irshad.aslam@nu.edu.pk','irshad123');

INSERT INTO FYPDEPT VALUES
( 54321,142,'Adnan Tariq',54312,'adnan.tariq@nu.edu.pk','adnan123' );

INSERT INTO DIRECTOR VALUES
( 90909,142,'Zohaib Iqbal',78906,'zohaib.iqbal@nu.edu.pk','zohaib123' );



------ SELECT STATEMENTS-----------------
SELECT * FROM REQUEST;
SELECT * FROM Finance;
SELECT * FROM Fyp;
select * from UNIADMIN;
SELECT * FROM STUDENT;
SELECT * FROM DIRECTOR;
SELECT * FROM FINCDEPT;
SELECT * FROM FYPDEPT;
SELECT * FROM REMARKS;
------------------------------------------

-------- DELETIONS-------------
DELETE FROM STUDENT;
DELETE FROM REQUEST;
DELETE FROM Finance;
DELETE FROM Fyp;
DELETE FROM UNIADMIN;
DELETE FROM FINCDEPT;
DELETE FROM DIRECTOR;
DELETE FROM FYPDEPT;
DELETE FROM REMARKS;
-------------------------------

-------------	QUERIES -------------------

SELECT * FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo= REQUEST.St_roll;

------------------------------------------------------


------------**************--------------------
-- admin section
SELECT STUDENT.RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status,StartDate,FeeStatus,FypStatus FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Finance ON Finance.Rollno=STUDENT.RollNo INNER JOIN Fyp ON Fyp.RollNo=STUDENT.RollNo;
SELECT COUNT(STUDENT.RollNo) AS RequestsCount FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Finance ON Finance.Rollno=STUDENT.RollNo;
UPDATE REQUEST SET Req_stat = CASE WHEN Req_stat='Finances+Fyp Clear' THEN 'Accepted' ELSE 'Rejected' END from STUDENT INNER JOIN REQUEST ON REQUEST.St_roll=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno + "';
SELECT * FROM REMARKS WHERE Rollnum = '" + rollno + "';

--fyp
SELECT STUDENT.RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status,StartDate,Fypstatus FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Fyp ON Fyp.Rollno=STUDENT.RollNo WHERE Req_stat = 'Pending' OR Req_stat='Finances Clear' OR Req_stat='Finances not clear';
SELECT COUNT(STUDENT.RollNo) AS RequestsCount FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Fyp ON Fyp.Rollno=STUDENT.RollNo WHERE Req_stat = 'Pending' OR Req_stat='Finances Clear' OR Req_stat='Finances not clear';
UPDATE REQUEST SET Req_stat = CASE WHEN Req_stat='Finances Clear' THEN 'Finances+Fyp Clear' WHEN Req_stat='Finances not clear' THEN 'Finances not clear, Fyp clear' ELSE 'Fyp Clear' END from STUDENT INNER JOIN REQUEST ON REQUEST.St_roll=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno + "'
UPDATE REQUEST SET Req_stat = CASE WHEN Req_stat='Finances Clear' THEN 'Fyp not clear , Finances Clear' WHEN Req_stat='Finances not clear' OR Req_stat='Fyp not clear' THEN 'Fyp and Finances not clear' WHEN Req_stat='Fyp Clear' THEN 'Finance not clear, Fyp clear' END from STUDENT INNER JOIN REQUEST ON REQUEST.St_roll=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno + "'  
INSERT INTO REMARKS VALUES ('" + rollno + "','" + fypresp + "','" + financeresp + "','" + adminresp + "');

-- finance

SELECT STUDENT.RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status,StartDate,FeeStatus FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Finance ON Finance.Rollno=STUDENT.RollNo WHERE Req_stat = 'Pending' OR Req_stat='Fyp Clear';
SELECT COUNT(STUDENT.RollNo) AS RequestsCount FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Finance ON Finance.Rollno=STUDENT.RollNo WHERE Req_stat = 'Pending' OR Req_stat='Fyp Clear';
UPDATE REQUEST SET Req_stat = CASE WHEN Req_stat='Fyp Clear' THEN 'Finances+Fyp Clear' ELSE 'Finances Clear' END from STUDENT INNER JOIN REQUEST ON REQUEST.St_roll=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno + "';
UPDATE REQUEST SET Req_stat = CASE WHEN Req_stat='Fyp Clear' THEN 'Finances Not clear , Fyp Clear' WHEN Req_stat='Fyp not clear' OR Req_stat='Finances not clear' THEN 'Fyp and Finances not clear' WHEN Req_stat='Fyp Clear' THEN 'Finances not clear, Fyp clear' ELSE 'Finances not clear' END from STUDENT INNER JOIN REQUEST ON REQUEST.St_roll=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno + "';
  -- director

SELECT RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status ,StartDate FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll WHERE Req_stat='Pending' ;
SELECT RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status ,StartDate FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll WHERE Req_stat ='Finances+Fyp Clear' OR Req_stat ='Finances Clear' OR Req_stat ='Fyp Clear' ;
SELECT RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status ,StartDate FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll WHERE Req_stat ='Accepted';
SELECT RollNo,FName AS FullName,ID AS RequestID,Req_stat AS Status ,StartDate,Adminremarks FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN REMARKS ON REMARKS.Rollnum = STUDENT.RollNo WHERE Req_stat ='Rejected'; 
  
-- student view

SELECT STUDENT.RollNo,FName AS FullName,StartDate,Req_stat AS Status FROM STUDENT INNER JOIN REQUEST ON STUDENT.RollNo=REQUEST.St_roll INNER JOIN Finance ON Finance.Rollno=STUDENT.RollNo INNER JOIN Fyp ON Fyp.RollNo=STUDENT.RollNo WHERE STUDENT.RollNo = '" + rollno +"'
SELECT * from REMARKS WHERE Rollnum = '" + value + "'
SELECT * from STUDENT WHERE RollNo = '"+value+"'

-- fyp
/*Select * from FYPDEPT where EmplNo= @employee and Pswd = @password 
Select * from STUDENT where RollNo= @rollno and Paswrd = @password
Select * from FINCDEPT where EmplNo= @employee and Pswd = @password
*/

-- 
INSERT INTO REQUEST VALUES ('" + rollno + "','" + random_number + "','" + req_status + "','" + start_date + "','"+ end_date+"')
INSERT INTO Finance VALUES('" + rollno + "','" + feestatus + "')
INSERT INTO Fyp VALUES('" + rollno + "','" + fypstatus + "')
