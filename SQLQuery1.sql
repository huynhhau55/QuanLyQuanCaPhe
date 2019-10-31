CREATE DATABASE QuanLyQuanCaPhe
GO

USE QuanLyQuanCaPhe
GO

--Food
--Table
--FoodCategory
--Account
--Bill
--BillInfo

CREATE TABLE TableFood
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(20) NOT NULL DEFAULT 'Chưa đặt tên',
	Status NVARCHAR(100) DEFAULT 'Trống'
	

)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,
	DisplayName NVARCHAR(100) NOT NULL DEFAULT 'Chưa đặt tên',	
	Password NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL DEFAULT 0 -- 0: STAFF , 1: ADMIN

)
GO

CREATE TABLE FoodCategory
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL DEFAULT 'Chưa đặt tên'
)
GO

CREATE TABLE Food
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL DEFAULT 'Chưa đặt tên',
	IdCategory  INT NOT NULL,
	Price FLOAT NOT NULL DEFAULT 0
	FOREIGN KEY (IdCategory) REFERENCES FoodCategory(Id)
)
GO

CREATE TABLE Bill
(
	Id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE NOT NULL,
	IdTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0-- 1: Đã thanh toán, 0: Chưa thanh toán
	FOREIGN KEY (IdTable) REFERENCES TableFood(Id)
)
GO

CREATE TABLE BillInfo
(
	Id INT IDENTITY PRIMARY KEY,
	IdBill INT NOT NULL,
	IdFood INT NOT NULL,
	Count INT DEFAULT 0,
	FOREIGN KEY (IdBill) REFERENCES Bill(Id),
	FOREIGN KEY (IdFood) REFERENCES Food(Id)
)
GO


-- Create account
INSERT INTO dbo.Account(UserName,DisplayName,Password,Type) VALUES('admin','admin','admin',1)
INSERT INTO dbo.Account(UserName,DisplayName,Password,Type) VALUES('hau',N'Huỳnh Văn Hậu','123',0)

SELECT * FROM Account