CREATE DATABASE HOMEPRODUCT
USE HOMEPRODUCT

CREATE TABLE Roles(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) NOT NULL UNIQUE
)

CREATE TABLE Users (
Id INT PRIMARY KEY IDENTITY,
UserName NVARCHAR(25) NOT NULL UNIQUE,
Password NVARCHAR(10) NOT NULL UNIQUE,
RoleId INT,
FOREIGN KEY (RoleId) REFERENCES Roles(Id)
)

INSERT INTO Roles(Name) VALUES
('Admin'),
('Moderator'),
('User');

INSERT INTO Users(UserName, Password) VALUES
('NazrinAli','mysecur09.'),
('Aqsin123','aqsin12p.'),
('Zahide19','ksjied13.');

SELECT R.Name AS Role, U.Username AS UserName
FROM Users U
JOIN Roles R ON U.RoleId = R.Id;


CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(60) NOT NULL
);

CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100) NOT NULL UNIQUE,
Price DECIMAL(6,2) CHECK(Price>0), 
Cost DECIMAL CHECK(Cost >= 0),
CategoryId INT REFERENCES Categories(Id)
);


--Color yaradaq elave-muellimin sonda daxil etdiyi sert:
CREATE TABLE Colors(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(90) NOT NULL UNIQUE
)

CREATE TABLE ProductColors(
Id INT PRIMARY KEY IDENTITY,
ProductId INT REFERENCES Products(Id),
ColorId INT REFERENCES Colors(Id)
)
--bunlara value verek
INSERT INTO Colors(Name) VALUES
('Orange'),
('Blue'),
('Green'),
('Yellow');



--Bir mehsulun bir nece sizes(ölçüleri) ola biler 
--ve bir size bir nece mehsula aid ola bilir
--(Relationlari duzgun qurun).

CREATE TABLE Sizes(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE PoductsSizes(
Id INT PRIMARY KEY IDENTITY,
PoductId INT REFERENCES Products(Id),
SizeId INT REferences Sizes(Id)
)


--Deyer elave edek yaratdigimiz cedvellere:
INSERT INTO Categories(Name) VALUES
('Electronics'),
('Clothing'),
('Books');


INSERT INTO Products(Name, Price, Cost) VALUES
('Laptop', 888.00, 699.00),
('T-Shirt', 25.50, 19.00),
('Novel', 10.22, 5.05);


INSERT INTO Sizes (Name) VALUES
('Small'),
('Medium'),
('Large');



--Butun mehsullari Size adlari ve Categori adlari ile bir yerde qaytaran sorgu:.
--Category adlari Category Name, Color adlari Color Name sheklinde cixarmaq:

SELECT P.Name AS ProductName, C.Name AS CategoryName, S.Name AS SizeName, Co.Name AS ColorName
FROM Products P
JOIN Categories C ON P.CategoryId = C.Id
JOIN ProductColors PC ON P.Id = PC.ProductId
JOIN Colors Co ON PC.ColorId = Co.Id
JOIN PoductsSizes PS ON P.Id = PS.PoductId
JOIN Sizes S ON PS.SizeId = S.Id;










