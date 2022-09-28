
--CREATEING DATABASE--
IF DB_ID('daycaredb') IS NULL
	CREATE DATABASE  daycaredb
GO
USE daycaredb
GO
--CREATE  BRANCHES TABLE--
 CREATE TABLE branches
 (
   branch_id INT PRIMARY KEY,
   branch_name NVARCHAR(30) NOT NULL,
   branch_address NVARCHAR(100) NOT NULL
 )
GO
--CREATE  EMPLOYEES TABLE--
CREATE TABLE employees
 (
   employee_id INT PRIMARY KEY,
   employee_name NVARCHAR(40) NOT NULL,
   employee_phone NVARCHAR(20) NOT NULL,
   branch_id INT NOT NULL REFERENCES branches(branch_id)
 )
GO
--CREATE  GURDIANS TABLE--
CREATE TABLE gurdians
 (
   gurdian_id INT PRIMARY KEY,
   gurdian_name NVARCHAR(40) NOT NULL,
   gurdian_address NVARCHAR(100) NOT NULL,
   gurdian_phn NVARCHAR(20) NOT NULL   
 )
GO
--CREATE  CHILDREN TABLE--
CREATE TABLE childrens
 (
   children_id INT PRIMARY KEY,
   children_name NVARCHAR(40) NOT NULL,
   branch_id INT NOT NULL REFERENCES branches(branch_id),
   gurdian_id INT NOT NULL REFERENCES gurdians(gurdian_id)  
 )
GO
--CREATE INDEX--
CREATE INDEX ixEmpName
ON employees(employee_name)
GO
--CREATE PROCEDURE DATA INSERT TO BRANCHS TABLE--
CREATE PROC spInsertbranch @b_name NVARCHAR(40),
                            @b_address NVARCHAR(100)
						
AS
DECLARE @b_id INT
SELECT @b_id=ISNULL(MAX (branch_id),0)+1 FROM branches
BEGIN TRY
       INSERT INTO branches(branch_id,branch_name,branch_address)
	   VALUES(@b_id,@b_name,@b_address)
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA UPDATE TO BRANCHES TABLE--
CREATE PROC spUpdatebranch @b_id INT,
                            @b_name NVARCHAR(40),
                            @b_address NVARCHAR(100)
							
AS
BEGIN TRY
       Update branches
	   SET branch_name= @b_name,branch_address=@b_address
	   WHERE branch_id=@b_id
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA DELETE TO BRANCHES TABLE--
CREATE PROC spDeletebranch @b_id INT
                            
AS
BEGIN TRY
       DELETE branches
	   WHERE branch_id=@b_id
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA INSERT TO EMPLOYEE TABLE--
CREATE PROC spInsertemployee @e_name NVARCHAR(40),
                            @e_phn NVARCHAR(20),
							@b_id INT
AS
DECLARE @e_id INT
SELECT @e_id=ISNULL(MAX (employee_id),0)+1 FROM employees
BEGIN TRY
       INSERT INTO employees(employee_id,employee_name,employee_phone,branch_id)
	   VALUES(@e_id,@e_name,@e_phn,@b_id)
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA UPDATE TO EMPLOYEE TABLE--
CREATE PROC spUpdateemployee @e_id INT,
                            @e_name NVARCHAR(40),
                            @e_phn NVARCHAR(20),
							@b_id INT
AS
BEGIN TRY
       Update employees
	   SET employee_name= @e_name,employee_phone=@e_phn, branch_id=@b_id
	   WHERE employee_id=@e_id
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA DELETE TO EMPLOYEE TABLE--
CREATE PROC spDeleteemployee @e_id INT
                            
AS
BEGIN TRY
       DELETE employees
	   WHERE employee_id=@e_id
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA INSERT TO GURDIANS TABLE--
CREATE PROC spInsertgurdian @g_name NVARCHAR(40),
                            @g_address NVARCHAR(100),
							@g_phn NVARCHAR(20)
AS
DECLARE @g_id INT
SELECT @g_id=ISNULL(MAX (gurdian_id),0)+1 FROM gurdians
BEGIN TRY
       INSERT INTO gurdians(gurdian_id,gurdian_name,gurdian_address,gurdian_phn)
	   VALUES(@g_id,@g_name,@g_address,@g_phn)
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA UPDATE TO GURDIAN TABLE--
CREATE PROC spUpdategurdian @g_id INT,
                            @g_name NVARCHAR(40),
                            @g_address NVARCHAR(100),
							@g_phn NVARCHAR(20)
AS
BEGIN TRY
       Update gurdians
	   SET gurdian_name= @g_name,gurdian_address=@g_address,gurdian_phn=@g_phn
	   WHERE gurdian_id=@g_id
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA DELETE TO GURDIAN TABLE--
CREATE PROC spDeletegurdian @g_id INT
                            
AS
BEGIN TRY
       DELETE gurdians
	   WHERE gurdian_id=@g_id
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA INSERT TO CHILDREN TABLE--
CREATE PROC spInsertchildren @c_name NVARCHAR(40),
                            @b_id INT,
							@g_id INT
AS
DECLARE @c_id INT
SELECT @c_id=ISNULL(MAX (children_id),0)+1 FROM childrens
BEGIN TRY
       INSERT INTO childrens(children_id,children_name,branch_id,gurdian_id)
	   VALUES(@c_id,@c_name,@b_id,@g_id)
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA UPDATE TO CHILDREN TABLE--
CREATE PROC spUpdatechildren @c_id INT,
                            @c_name NVARCHAR(40),
                            @b_id INT,
							@g_id INT
AS
BEGIN TRY
       Update childrens
	   SET children_name= @c_name,branch_id=@b_id,gurdian_id=@g_id
	   WHERE children_id=@c_id
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA DELETE TO CHILDREN TABLE--
CREATE PROC spDeletechildren @c_id INT                           
AS
BEGIN TRY
       DELETE childrens
	   WHERE children_id=@c_id
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE SCALAR FUNCTION--
CREATE FUNCTION fnScalar(@gurdian_id INT)RETURNS INT
AS
BEGIN
    DECLARE @n INT
	SELECT @n=COUNT(*)FROM childrens
	WHERE gurdian_id=@gurdian_id
	RETURN @n
END
GO
--CREATE TABLE VALUED FUNCTION--
CREATE FUNCTION  fnTable(@gurdian_id INT)RETURNS TABLE
AS
RETURN
(
   SELECT b.branch_name,e.employee_id,e.employee_name,g.gurdian_name,c.children_id,c.children_name
FROM branches b
INNER JOIN employees e ON b.branch_id=e.branch_id
INNER JOIN childrens c ON e.branch_id=c.branch_id
INNER JOIN gurdians g ON c.gurdian_id=g.gurdian_id
)
GO
--CRAETE VIEW--
CREATE VIEW vInfo
AS
SELECT b.branch_name,e.employee_id,e.employee_name,g.gurdian_name,c.children_id,c.children_name
FROM branches b
INNER JOIN employees e ON b.branch_id=e.branch_id
INNER JOIN childrens c ON e.branch_id=c.branch_id
INNER JOIN gurdians g ON c.gurdian_id=g.gurdian_id
GO
--CREATE TRIGGER--
CREATE TRIGGER trEmpInsert
ON employees FOR INSERT 
AS
BEGIN
	DECLARE @bid INT, @c INT
	SELECT @bid = branch_id from inserted
	SELECT @c = COUNT(employee_id) FROM employees
	WHERE branch_id = @bid
	IF @c > 3 
	BEGIN
		ROLLBACK TRANSACTION
		;
		THROW 50001, 'There cannot be more than 3 employees', 1
	END
END
GO


