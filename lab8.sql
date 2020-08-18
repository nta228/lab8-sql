CREATE DATABASE QuanliLOPHOC
--
CREATE TABLE CLASS
(
	ClassCode VARCHAR(10)
	CONSTRAINT PK_CLASS_ClassCode PRIMARY KEY,
	HeadTeacher	VARCHAR(30),
	Room VARCHAR(30) ,
	TimeSlot	CHAR,
	CloseDatae	DATETIME
)
CREATE TABLE STUDENT
(
	RollNo	VARCHAR(10)
	CONSTRAINT PK_STUDENT_RollNo PRIMARY KEY,
	ClassCode	VARCHAR(10) ,
	FullName	VARCHAR(30),
	Male	BIT,
	BirthDay DATETIME,
	Address	VARCHAR(30),
	Provice	CHAR(2) ,
	Email	VARCHAR(30)
	CONSTRAINT FK_CLASS_STUDENT FOREIGN KEY (ClassCode) REFERENCES CLASS(ClassCode)
)
CREATE TABLE SUBJECT
(
	SubjectCode	VARCHAR(10)
	CONSTRAINT PK_SUBJECT_SubjectCode PRIMARY KEY,
	SubjectName VARCHAR(40),
	WMark	BIT,
	PMark	BIT,
	Wtest_per	INT,
	Ptest_per	INT,
)
CREATE TABLE Mark
(
	RollNo	VARCHAR(10),
	SubjectCode	VARCHAR(10),
	PRIMARY KEY(RollNo,SubjectCode),
	WMark	FLOAT,
	PMark	FLOAT,
	MARK	FLOAT
	CONSTRAINT FK_STUDENT_Mark FOREIGN KEY (RollNo) REFERENCES STUDENT(RollNo),
	CONSTRAINT	FK_SUBJECT_MARK FOREIGN KEY(SubjectCode) REFERENCES SUBJECT(SubjectCode)
)
	--Tao Bang
	--Bang Class
	INSERT INTO CLASS VALUES('T2004M','Joson','Class1','G','2019-9-8')
	INSERT INTO CLASS VALUES('T2005M','Maxan','Class2','I','2019-7-8')
	INSERT INTO CLASS VALUES('T2006M','Mathur','Class3','L','2019-9-5')
	INSERT INTO CLASS VALUES('T2007M','Mixan','Class4','K','2019-3-8')
	INSERT INTO CLASS VALUES('T2008M','Hexid','Class5','U','2014-9-8')

	--Bang student
	INSERT INTO STUDENT VALUES('A00264','T2004M','Mai Van Phan','1','2000-10-2','Giao Thuy','ND','phanvanmai9898@gmail.com')
	INSERT INTO STUDENT VALUES('A00265','T2005M','Hoang Minh Thanh','1','2000-5-2','Hai Hau','ND','thanhminhhaong4564@gmail.com')
	INSERT INTO STUDENT VALUES('A00266','T2006M','Le Can Duong','1','2001-10-6','Nghia Hung','ND','duonglecan978@gmail.com')
	INSERT INTO STUDENT VALUES('A00267','T2007M','Vu Tuan Duong','1','2001-5-2','Giao Thuy','ND','duongtuanvu9898@gmail.com')
	INSERT INTO STUDENT VALUES('A00268','T2008M','Nguyen Thi Hoai','2','2000-6-2','Giao Thuy','ND','nguyenhoai2618@gmail.com')


	--bang Subject
	INSERT INTO SUBJECT VALUES('EPC','ELementary Programing with C','1','1',2,3)
	INSERT INTO SUBJECT VALUES('JV','Java','1','1',2,3)
	INSERT INTO SUBJECT VALUES('SQL',' Structured Query Language','1','1',2,3)
	INSERT INTO SUBJECT VALUES('PTS','Photoshop','1','1',2,3)
	INSERT INTO SUBJECT VALUES('QTM','QTM May Tinh','1','1',2,3)
	--Bang Mark
	INSERT INTO Mark VALUES('A00264','EPC',9,8,8.5)
	INSERT INTO Mark VALUES('A00265','JV',4,8,8.5)
	INSERT INTO Mark VALUES('A00266','EPC',6,7,8.5)
	INSERT INTO Mark VALUES('A00267','EPC',9,8,8.5)
	INSERT INTO Mark VALUES('A00268','SQl',9,8,8.5)
	--
	SELECT * FROM CLASS
	SELECT * FROM STUDENT
	SELECT * FROM SUBJECT
	SELECT * FROM Mark
	--2
	CREATE VIEW VIEW_SlotMonHoc AS
	select STUDENT.RollNo, FullName
	from STUDENT, SUBJECT mh, Mark kq
	where STUDENT.RollNo = kq.RollNo and mh.SubjectCode = kq.SubjectCode and SubjectName in ('Java', 'SQL', '')
	SELECT * FROM VIEW_SlotMonHoc
	--3
	CREATE VIEW VIEW_TruotMon AS
	select STUDENT.RollNo, FullName
	from STUDENT, SUBJECT mh, Mark kq
	where STUDENT.RollNo = kq.RollNo and Mark < 5  
	group by STUDENT.RollNo, FullName
	SELECT * FROm VIEW_TruotMon
	--4
	CREATE VIEW VIEW1_TimeSlot AS
	SELECT TimeSlot,RollNo,FullName
	FROM CLASS,STUDENT
	WHERE TimeSlot='G';
	SELECT *FROM VIEW1_TimeSlot
	--5
	CREATE VIEW VIEW_Teacher AS
	SELECT HeadTeacher
	FROM CLASS,SUBJECT mh, Mark kq
	SELECT * FROM VIEW_Teacher
	--6
	
