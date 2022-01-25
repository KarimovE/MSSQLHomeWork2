CREATE DATABASE Library1Db

USE Library1Db


CREATE TABLE Books(
	Id int primary key identity,
	Name nvarchar(50) not null,
	AuthorId int references Authors(Id)
)

INSERT INTO Books (Name, AuthorId)
VALUES ('A tail of two cities', 1),
	   ('Chess', 2),
	   ('La chute', 3),
	   ('Canistan', 4),
	   ('Uvercinka', 5)

SELECT * FROM Books
CREATE TABLE Authors(
	Id int primary key identity,
	Name nvarchar(50) not null,
)

INSERT INTO Authors (Name)
VALUES ('Charles Dickens'),
	   ('Zweing'),
	   ('Albert Camus'),
	   ('Yusuf Atilgan'),
	   ('Cemal Sureya')


CREATE TABLE Genres(
	Id int primary key identity,
	Name nvarchar(50) not null,
)

INSERT INTO Genres (Name)
VALUES ('Poem'),
	   ('Novel'),
	   ('Romance')


CREATE TABLE Customers(
	Id int primary key identity,
	Name nvarchar(50) not null,
)

ALTER TABLE Customers
ADD Age int


INSERT INTO Customers (Name, Age)
VALUES ('Alisimran Memmedli', 26),
	   ('Azim Memmedov', 21),
	   ('Ceyhun Shirinov', 29)



CREATE TABLE BooksCustomers(
	Id int primary key identity,
	BooksId int references Books(Id),
	CustomersId int references Customers(Id),
	DateOfRecieve datetime default GETDATE(),
	DateOfBack datetime default NULL,
)

INSERT INTO BooksCustomers (BooksId, CustomersId)
VALUES (3,2),
	   (2,3),
	   (2,1),
	   (4,1),
	   (2,1)

CREATE TABLE BooksGenres(
	Id int primary key identity,
	BooksId int references Books(Id),
	GenresId int references Genres(Id),
)

INSERT INTO BooksGenres (BooksId, GenresId)
VALUES (1,1),
	   (2,2),
	   (3,3)



CREATE TABLE AuthorsGenres(
	Id int primary key identity,
	AuthorsId int references Authors(Id),
	GenresId int references Genres(Id),
)

INSERT INTO AuthorsGenres (AuthorsId, GenresId)
VALUES (1,1),
	   (2,2),
	   (3,3),
	   (4,3),
	   (5,3),
	   (5,1)

SELECT Books.Id, Books.Name 'Books', Authors.Name 'Authors' 
FROM Books
FULL JOIN Authors
ON Books.AuthorId = Authors.Id