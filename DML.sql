USE daycaredb
GO
--INSERT DATA INTO THE BRANCHES TABLE--
INSERT INTO Branches
VALUES	(70001, 'Dhaka', 'Lalmatia, Mohammadpur'),
		(70002, 'Gazipur', 'Salna, Jaydebpur'),
		(70003, 'Chittagong', 'Sadar, Chittagong '),
		(70004, 'Brahmanbaria', 'Sadar, Brahmanbaria'),
		(70005, 'Chandpur', 'Sadar, Chandpur'),
		(70006, 'Joypurhat', 'Sadar, Joypurhat'),
		(70007, 'Chittagong', 'Mirersorai, Chittagong'),
		(70008, 'Dhaka', 'Najim Uddin Road, Old Dhaka')
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Branches
GO
--INSERT DATA INTO THE EMPLOYEES TABLE--
INSERT INTO Employees
VALUES	(11101, 'Jobaida Tasmin','01998023454', 70001),
		(11102, 'Parul Akter', '01965764059', 70001),
		(11103, 'Zulekha Akter', '01999390525',70001),
		(11104, 'Maksuda Yesmin', '01673993374',70002),
		(11105, 'Taniya sultana','01580956893',70002),
		(11106, 'Subarna Rahman', '01773028065',70003),
		(11107, 'Shraboni Akter ','01518788114',70007),
		(11108, 'Jesmin Akter','01719809882',70008)
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Employees
GO
--INSERT DATA INTO THE GURDIANS TABLE--
INSERT INTO Gurdians
VALUES	(1201, 'Mohammad Shafiq', 'Lalmatia, Mohammadpur', '01942432133'),
		(1202, 'Tamanna Khan', 'Salna, Jaydebpur', '01303216097'),
		(1203, 'Sohanur Rahman', 'Sadar, Chittagong', '01712315410'),
		(1204, 'Sadia Ahmed', 'Sadar, Brahmanbaria', '01684937787'),
		(1205, 'Arif Hassan', 'Sadar, Chandpur', '01716290121'),
		(1206, 'Habibul Haque', 'Sadar, Joypurhat', '01811695986'),
		(1207, 'Jobaida Rahman', 'Mirersorai, Chittagong', '01773028060'),
		(1208, 'Mohammad Shuvo', 'Najim Uddin Road, Old Dhaka',  '01858732484')
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Gurdians
GO
--INSERT DATA INTO THE CHILDRENS TABLE--
INSERT INTO Childrens
VALUES	(12601, 'Shuvo Rahman', 70001, 1201),
		(12602, 'Jara Rahman', 70002, 1201 ),
		(12603, 'Md.Jubayer',  70003, 1201),
		(12604, 'Md Raju Ahmed', 70004, 1202),
		(12605, 'Mithi Rahman',  70005, 1202),
		(12606, 'Abir Hasan', 70006, 1202 ),
		(12607, 'Junayed khan',  70007, 1207),
		(12608, 'Anamika Hasan',  70008, 1205),
		(12609, 'anupama Bissash',  70008, 1205),
		(12610, 'Hridi Haqe',  70008, 1208),
		(12611, 'Arman khan',  70008, 1208)
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Childrens
GO

--JOIN ALL THE TABLE --
SELECT *
FROM Employees
INNER JOIN  Branches  ON Employees.Branch_ID = Branches.Branch_ID
INNER JOIN Childrens  ON Branches.Branch_ID = Childrens.Branch_ID
INNER JOIN Gurdians  ON Gurdians.Gurdian_ID = Childrens.Gurdian_ID
GO
--INSERT DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spInsertbranch 'Dhaka', 'Lalmatia, Mohammadpur'
EXEC spInsertbranch 'Gazipur', 'Salna, Jaydebpur'
EXEC spInsertbranch 'Chittagong', 'Sadar, Chittagong'
EXEC spInsertbranch 'Brahmanbaria', 'Sadar, Brahmanbaria'
EXEC spInsertbranch 'Chandpur', 'Sadar, Chandpur'
EXEC spInsertbranch 'Joypurhat', 'Sadar, Joypurhat'
GO

SELECT * FROM Branches
GO
--UPDATE DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spUpdatebranch 70009, 'Chittagong', 'Mirersorai, Chittagong'
EXEC spUpdatebranch 70010, 'Joypurhat', 'Sadar, Joypurhat'
EXEC spUpdatebranch 70011, 'Brahmanbaria', 'Sadar, Brahmanbaria'
GO

SELECT * FROM Branches
GO
--DELETE DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spDeletebranch 70012
EXEC spDeletebranch 70013
EXEC spDeletebranch 70014
GO

SELECT * FROM branches
GO
--INSERT DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spInsertemployee 'Jobaida Tasmin','01998023454', 70001
EXEC spInsertemployee 'Parul Akter','01965764059', 70001
EXEC spInsertemployee  'Zulekha Akter','01999390525',70001
EXEC spInsertemployee 'Maksuda Yesmin','01673993374',70002
EXEC spInsertemployee 'Taniya sultana','01580956893',70002
EXEC spInsertemployee 'Subarna Rahman', '01773028060',70003
EXEC spInsertemployee 'Shraboni Akter ','01518788114',70007
EXEC spInsertemployee 'Jesmin Akter','01719809882',70008
GO

SELECT * FROM Employees
GO
--UPDATE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spUpdateemployee 11109,  'Maksuda Yesmin', '01673993374',70002,
EXEC spUpdateemployee 11110, 'Taniya sultana','01580956893',70002
EXEC spUpdateemployee 11111, 'Jobaida Tasmin','01998023454', 70001
GO

SELECT * FROM Employees
GO
--DELETE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spDeleteemployee 11114
EXEC spDeleteemployee 11115
EXEC spDeleteemployee 11116
GO

SELECT * FROM Employees
GO
--INSERT DATA TO THE GURDIAN TABLE USING PROCEDURE--
EXEC spInsertgurdian 'Mohammad Shafiq','Lalmatia, Mohammadpur', '01942432133'
EXEC spInsertgurdian 'Tamanna Khan', 'Salna, Jaydebpur', '01303216097'
EXEC spInsertgurdian 'Sohanur Rahman', 'Sadar, Chittagong', '01712315410'
EXEC spInsertgurdian 'Sadia Ahmed', 'Sadar, Brahmanbaria', '01684937787'
EXEC spInsertgurdian 'Arif Hassan', 'Sadar, Chandpur', '01716290121'
EXEC spInsertgurdian 'Habibul Haque', 'Sadar, Joypurhat', '01811695986'
EXEC spInsertgurdian 'Jobaida Rahman ', 'Mirersorai, Chittagong',  '01773028060'
EXEC spInsertgurdian 'Mohammad Shuvo', 'Najim Uddin Road, Old Dhaka', '01858732484'
GO

SELECT * FROM gurdians
GO
--UPDATE DATA TO THE GURDIAN TABLE USING PROCEDURE--
EXEC spUpdategurdian 1209, 'Ikram Mahbub', 'Solimullah Road, Sirajganj', '01968363446'
EXEC spUpdategurdian 1210, 'Tipu Sultan', 'Ahmed Nagar, Fatullah', '01620151533'
EXEC spUpdategurdian 1210, 'Mannan Bhuiyan', 'Gulshan 2', '01521487370'
GO

SELECT * FROM gurdians
GO

--DELETE DATA TO THE GURDIAN TABLE USING PROCEDURE--
EXEC spDeletegurdian 1214
EXEC spDeletegurdian 1215
EXEC spDeletegurdian 1216
GO

SELECT * FROM gurdians
GO
--INSERT DATA TO THE CHILDREN TABLE USING PROCEDURE--
EXEC spInsertchildren 'Shuvo Rahman', 70001, 1201
EXEC spInsertchildren 'Jara Rahman', 70002, 1201
EXEC spInsertchildren  'Md.Jubayer',  70003, 1201
EXEC spInsertchildren 'Md Raju Ahmed', 70004, 1202
EXEC spInsertchildren 'Mithi Rahman',  70005, 1202
EXEC spInsertchildren 'Abir Hasan', 70006, 1202
EXEC spInsertchildren 'Junayed khan',  70007, 1207
EXEC spInsertchildren 'Anamika Hasan',  70008, 1205
GO

SELECT * FROM Childrens
GO
--UPDATE DATA TO THE CHILDREN TABLE USING PROCEDURE--
EXEC spUpdatechildren 12614, 'Abir Hasan', 70006, 1202
EXEC spUpdatechildren 12615, 'Junayed khan',  70007, 1207
EXEC spUpdatechildren 12616, 'Anamika Hasan',  70008, 1208
GO

SELECT * FROM Childrens
GO
--DELETE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spDeletechildren 12615
EXEC spDeletechildren 12616
EXEC spDeletechildren 12617
GO

SELECT * FROM Childrens
GO
--AGAIN INSERT USING PROCEDURE--
EXEC spInsertgurdian 'Mohammad Shafiq','Lalmatia, Mohammadpur', '01942432133'
EXEC spInsertgurdian 'Tamanna Khan', 'Salna, Jaydebpur',  '01303216097'
EXEC spInsertgurdian'Sohanur Rahman', 'Sadar, Chittagong', '01712315410'
EXEC spInsertgurdian 'Sadia Ahmed', 'Sadar, Brahmanbaria', '01684937787'
GO

SELECT * FROM gurdians
GO

--CALING THE SCALAR FUNCTION--
SELECT dbo.fnScalar (1201) AS 'Children'
GO

--CALING THE TABLE VALUED FUNCTION--
SELECT * 
FROM fnTable(1201)
GO

--EXTRACT THE VIEW--
SELECT *
FROM vInfo
GO

--CHECK THE TRIGGER--
SELECT *
FROM employees
GO
--THERE IS A ERROR ON INSERTING DATA BY TRIGGER--
--ERROR--
INSERT INTO employees
VALUES	(11114,'Jobaida Tasmin','01998023454', 70004),
		(11115, 'Parul Akter', '01965764059', 70004),
		(11116,  'Zulekha Akter', '01999390525',70004),
		(11117, 'Maksuda Yesmin', '01673993374',70004)
GO
--INSERTED--
INSERT INTO employees
VALUES	(11114, 'Jobaida Tasmin','01998023454', 70004),
		(11115, 'Parul Akter', '01965764059', 70004),
		(11116, 'Zulekha Akter', '01999390525',70004)
GO
--CRETE A SUB QUERY--
SELECT C.*
FROM ( SELECT gurdians.gurdian_id, gurdian_name,  children_id, children_name, COUNT(children_id) 'Children'
FROM gurdians 
INNER JOIN childrens ON gurdians.gurdian_id = childrens.gurdian_id
GROUP BY gurdians.gurdian_id, gurdian_name, children_id, children_name
) AS C
WHERE gurdian_id = 1201
GO
--ANOTHER SUB QUERY FOR BRANCH TABLE--
SELECT B.*
FROM ( SELECT employee_id,employee_name, employee_phone,branches.branch_id, COUNT(employees.branch_id) 'Employee'
FROM branches 
INNER JOIN employees ON employees.branch_id = branches.branch_id
GROUP BY employee_id,employee_name, employee_phone,branches.branch_id
) AS B
WHERE branch_id = 70001
GO
--CREATE A CTE--
--CTE WITH GURDIAN TABLE--
WITH CTE AS
(
	SELECT gurdian_id, gurdian_name,gurdian_address,gurdian_phn
	FROM gurdians
)
SELECT gurdians.gurdian_id, gurdian_name, children_id, children_name, gurdian_address
FROM childrens
INNER JOIN gurdians ON childrens.gurdian_id = childrens.gurdian_id
GO
--CTE WITH EMPLOYEE TABLE--
WITH CTE AS
(
	SELECT employee_id, employee_name, employee_phone, branch_id
	FROM employees
)
SELECT branches.branch_id, branch_name, branch_address, employee_id, employee_name, employee_phone
FROM branches
INNER JOIN employees ON employees.branch_id = branches.branch_id
GO
--TO DELETE THE CURRENT DATABASE-UN COMMENT THE BELOW CODE AND RUN---

--USE master
--GO
--DROP DATABASE IF EXISTS daycaredb
--GO


