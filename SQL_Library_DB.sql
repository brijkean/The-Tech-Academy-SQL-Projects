CREATE DATABASE db_Library
USE db_Library

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(30) NOT NULL
);

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT BookID_fk FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk3_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk2_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL, 
	DateDue DATE NOT NULL
);

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL,
);


INSERT INTO Library_Branch
	(BranchName, Address)
	VALUES
	('Central','801 SW 10th Ave'),
	('Sharpstown','7660 Osage St'),
	('Elma','118 N 1st St'),
	('Holbrook','403 S Park St')
;

INSERT INTO Books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe','Picador'),
	('A Memory Called Empire', 'Tor'),
	('Jane Eyre','Penguin Classics'),
	('This One Summer', 'First Second'),
	('All Systems Red', 'Tor'),
	('Whiskey When We''re Dry', 'Viking'),
	('Something That May Shock and Discredit You', 'Atria'),
	('Because Internet: Understanding the New Rules of Language', 'Riverhead Books'),
	('Willful Subjects', 'Duke University Press'),
	('The Horse Latitudes', 'Propeller Books'),
	('Strange Matters: Undiscovered Ideas at the Frontiers of Time and Space','Berkley Books'),
	('Foxglove Summer', 'Gollancz'),
	('Rivers of London', 'Gollancz'),
	('Jonathan Strange & Mr Norrell', 'Bloomsbury'),
	('Redwall','Philomel Books'),
	('Mossflower','Philomel Books'),
	('IT', 'Viking'	),
	('11/22/63', 'Scribner'),
	('The Bedlam Stacks','Bloomsbury'),
	('Blood Meridan','Random House')
;

INSERT INTO Book_Authors
	(BookID,AuthorName)
	VALUES
	(1,'Mark Lee'),
	(2,'Arkady Martine'),
	(3,'Charlotte Brontë'),
	(4,'Jillian Tamaki & Mariko Tamaki'),
	(5,'Martha Wells'),
	(6,'John Larison'),
	(7,'Daniel Mallory Ortberg'),
	(8,'Gretchen McCulloch'),
	(9,'Sara Ahmed'),
	(10,'Matthew Robinson'),
	(11,'Tom Siegfried'),
	(12,'Ben Aaronovitch'),
	(13,'Ben Aaronovitch'),
	(14,'Susanna Clarke'),
	(15,'Brian Jacques'),
	(16,'Brian Jacques'),
	(17,'Stephen King'),
	(18,'Stephen King'),
	(19, 'Natasha Pulley'),
	(20,'Cormac McCarthy')
;

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Picador','20 New Wharf Rd, Kings Cross, London N1 9RR, United Kingdom','+44 20 7014 6000'),
	('Tor','120 Broadway, New York, NY 10271','(212) 455-3670'),
	('Penguin Classics','80 Strand, London WC2R 0RL, United Kingdom','+44 20 7139 3000'),
	('First Second','120 Broadway, New York, NY 10271','(212) 490-0666'),
	('Viking', '32 East 48th Street. New York, NY 10017', '(212) 490-0667'),
	('Atria', '1230 6th Ave, New York, NY 10020', '(212) 698-7086'),
	('Riverhead Books', '375 Hudson Street, New York, NY 10014', '(212) 366-2547'),
	('Duke University Press', '905 W Main St Suite 18-B, Durham, NC 27701', '(919) 688-5134'),
	('Propeller Books', 'Portland, OR', 'not listed'),
	('Berkley Books', '75 Hudson Street, New York, NY 10013', '(212) 366-2000'),
	('Gollancz','3rd Floor, Carmelite House, 50 Victoria Embankment, London, EC4Y 0DZ','+44 20 3122 6000'),
	('Bloomsbury', '1385 Broadway, 5th Floor, New York, NY 10018', '(212) 419-5300'),
	('Philomel Books', '345 Hudson St. New York NY 10014', '212 414-3610'),
	('Scribner', '1230 6th Ave, New York, NY 10020', '(212) 698-7000'),
	('Random House','1745 Broadway, New York, NY 10019','(800) 793-2665')
;

INSERT INTO Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1,2,2),
	(2,1,2),
	(3,4,2),
	(3,1,3),
	(4,3,2),
	(5,1,2),
	(6,4,3),
	(7,2,2),
	(8,2,4),
	(9,2,2),
	(10,3,2),
	(11,3,2),
	(11,4,2),
	(12,1,2),
	(12,3,2),
	(13,3,2),
	(14,3,2),
	(15,3,2),
	(15,2,2),
	(16,2,2),
	(17,1,4),
	(18,1,2),
	(18,4,2),
	(19,2,2),
	(20,4,2)
;

INSERT INTO Borrower
	(Name,Address,Phone)
	VALUES
	('Jackson, David', '1288 W Erie St, Holbrook', '(928)-326-0155' ),
	('Alaniz, Tessa','Apt #24, 3rd St, Holbrook', '(928)-016-2242'),
	('Everett, Jack','1240 Workman Creek Rd, Elma', '(930)-520-1235'),
	('Carter, Jen','342 Leader St, Sharpstown', '(926)-455-6325'),
	('Seawoll, Alice','3244 Lambert Rd, Central', '(930)-636-2455'),
	('Thorne, Wray','32 Allen Rd, Elma', '(930)-680-4380'),
	('Schaff, Devon','32 Vista Dr, Holbrook', '(940)-545-3868'),
	('Claver, Henry','122 Anita Dr, Sharpstown', '(926)-568-0043'),
	('Matthis, Chloe','1246 Triola Ln, Central', '(210)-468-7633')
;

	--additional borrower added so that when db queried for borrowers with no books checked out, it returns a borrower 
INSERT INTO Borrower
	(Name,Address,Phone)
	VALUES
	('Jolene','Jorine Dr, Sharpstown','810-888')
;

INSERT INTO Book_Loans
	(BookID,BranchID,CardNo,DateOut,DateDue)
	VALUES
	(6, 4, 100,'2018-10-10', '2018-10-17'),
	(11, 3, 100, '2018-10-10', '2018-10-17'),
	(1,2, 100, '2018-10-10', '2018-10-17'),
	(10, 3, 100, '2018-10-10', '2018-10-17'),
	(18, 1, 100, '2018-10-10', '2018-10-17'),
	(2, 1, 101,  '2018-10-10', '2018-10-17'),
	(7 , 2, 101,  '2018-10-10', '2018-10-17'),
	(9 , 2, 101,  '2018-10-10', '2018-10-17'),
	(12 , 1, 101,  '2018-10-10', '2018-10-17'),
	(4 , 3, 101,  '2018-10-10', '2018-10-17'),
	(19, 2, 101,  '2018-10-10', '2018-10-17'),
	(10 , 3, 102,  '2018-10-14', '2018-10-21'),
	(20 , 4, 102,  '2018-10-14', '2018-10-21'),
	(6 , 4, 102,  '2018-10-14', '2018-10-21'),
	(3,  4, 102,  '2018-10-14', '2018-10-21'),
	(12 , 1, 103,  '2018-10-10', '2018-10-17'),
	(13 , 3, 103, '2018-10-10', '2018-10-17'),
	(14 , 3, 103,  '2018-10-10', '2018-10-17'),
	(17 , 1, 104,  '2018-10-14', '2018-10-21'),
	(4 , 3, 104, '2018-10-14', '2018-10-21'),
	(19 , 2, 105, '2018-10-14', '2018-10-21'),
	(20 , 4, 105, '2018-10-14', '2018-10-21'),
	(7 , 2, 105, '2018-10-14', '2018-10-21'),
	(9 , 2, 105, '2018-10-14', '2018-10-21'),
	(19 , 2, 105, '2018-10-22', '2018-10-29'),
	(18 , 1, 105, '2018-10-14', '2018-10-21'),
	(8 , 2, 106, '2018-10-10', '2018-10-17'),
	(15 , 3, 106, '2018-10-10', '2018-10-17'),
	(13 , 3, 106, '2018-10-10', '2018-10-17'),
	(12 , 3, 107,  '2018-10-18', '2018-10-25'),
	(13 , 3, 107, '2018-10-18', '2018-10-25'),
	(3 , 4, 107,  '2018-10-18', '2018-10-25'),
	(11 , 3, 108, '2018-10-10', '2018-10-17'),
	(12 , 3, 108,  '2018-10-10', '2018-10-17'),
	(13 , 3, 108,  '2018-10-18', '2018-10-25'),
	(8 , 2, 108,  '2018-10-10', '2018-10-17'),
	(4 , 3, 108,  '2018-10-18', '2018-10-25'),
	(3 , 1, 108,  '2018-10-10', '2018-10-17'),
	(16, 2, 104,  '2018-10-18', '2018-10-25'),
	(16, 2, 108,  '2018-10-18', '2018-10-25'),
	(5, 1, 103,  '2018-10-10', '2018-10-17'),
	(5, 1, 104,  '2018-10-10', '2018-10-17'),
	(17, 1, 107,  '2018-10-18', '2018-10-25'),
	(17, 1, 106,  '2018-10-17', '2018-10-24'),
	(18, 4, 102,  '2018-10-18', '2018-10-25'),
	(2, 1, 103,  '2018-10-18', '2018-10-25'),
	(5, 1, 103,  '2018-10-18', '2018-10-25'),
	(14, 3, 105,  '2018-10-18', '2018-10-25'),
	(15, 2, 105, '2018-10-14', '2018-10-21'),
	(6, 4, 101, '2018-10-18', '2018-10-25')
;

--Queries for info--
GO
CREATE PROCEDURE GetLostTribeInfo 
AS
--retrieve how many copies of the the book titled "The Lost Tribe" owned by the Sharpstown branch
SELECT a1.BookID, a2.Title, a3.BranchName, a1.Number_Of_Copies  
FROM Book_Copies a1
INNER JOIN Books a2 ON a2.BookID = a1.BookID
INNER JOIN Library_Branch a3 ON a3.BranchID = a1.BranchID
WHERE a1.BookID = 1 AND a3.BranchName = 'Sharpstown';

--retrieves how many copies of the book titled "The Lost Tribe" are owned by each branch
SELECT a1.BookID, a2.Title, a3.BranchName, a1.Number_Of_Copies   
FROM Book_Copies a1
INNER JOIN Books a2 ON a2.BookID = a1.BookID
INNER JOIN Library_Branch a3 ON a3.BranchID = a1.BranchID
WHERE a1.BookID = 1;
GO

--retrieve the names of borrowers who have no books checked out 
CREATE PROCEDURE GetNoCheckouts
AS
SELECT Borrower.CardNo, Borrower.Name
FROM Borrower
FULL OUTER JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
WHERE Borrower.CardNo NOT IN (SELECT CardNo FROM Book_Loans)
;
GO

--retrieve the book title, borrower's name, and borrower's address for all the books loaned from Sharpstown that are due today
CREATE PROCEDURE BooksDueToday
AS

DECLARE @today VARCHAR(50)
SET @today = CONVERT(date, GETDATE()) 
DECLARE @results AS VARCHAR(5)
DECLARE @errorMessage AS VARCHAR(50)
SET @errorMessage = 'There are no books due today.'

BEGIN TRY
SET @results = (SELECT COUNT(Book_Loans.DateDue) FROM Book_Loans WHERE DateDue = @today)
	IF @results = 0
	BEGIN
		RAISERROR(@errorMessage, 2, 1) 
		RETURN
	END;
ELSE IF @results = 1
	BEGIN
		SELECT a3.Title, a2.Name, a2.Address 
		FROM Book_Loans a1
		INNER JOIN Borrower a2 ON a2.CardNo = a1.CardNo
		INNER JOIN Books a3 ON a3.BookID = a1.BookID
		WHERE DateDue IN (@today);
	END
END TRY

BEGIN CATCH
	SELECT @errorMessage = ERROR_MESSAGE()
	RAISERROR (@errorMessage, 2, 1)
END CATCH
GO

--for each branch, retrieve the branch name and number of books checked out from that branch 
CREATE PROCEDURE GetAllCurrentBranchCheckouts
AS
SELECT Library_Branch.BranchName, COUNT(Book_Loans.BookID) AS 'Total # of books checked out'
	FROM Book_Loans
	FULL OUTER JOIN Library_Branch 
	ON Book_Loans.BranchID = Library_Branch.BranchID
	GROUP BY Library_Branch.BranchName
;
GO

--for each borrower that has more than five books out, retrieve their name, address, and number of books checked out
CREATE PROCEDURE GetBorrowerInfo_MoreThan5
AS
SELECT Borrower.Name, Borrower.Address, COUNT(Book_Loans.CardNo) AS 'Number of Books Out'
	FROM Borrower
	FULL OUTER JOIN Book_Loans
	ON Borrower.CardNo = Book_Loans.CardNo
	GROUP BY Borrower.Name, Borrower.Address
	HAVING COUNT(Book_Loans.CardNo) > 5
	;
GO

--for each book with Stephen King as an author, retrieve the book title and number of copies that the Central branch owns	
CREATE PROCEDURE GetAN_King_LBN_Central
AS
SELECT a1.Title, a2.AuthorName, a4.BranchName, a3.Number_Of_Copies
FROM Books a1
INNER JOIN Book_Authors a2 ON a2.BookID = a1.BookID
INNER JOIN Book_Copies a3 ON a3.BookID = a1.BookID
INNER JOIN Library_Branch a4 ON a4.BranchID = a3.BranchID
WHERE a2.AuthorName = 'Stephen King' AND a4.BranchName = 'Central'
;
GO	
