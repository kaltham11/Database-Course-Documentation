Create DATABASE Library_DB;


USE Library_DB;

CREATE TABLE Members (
Member_ID INT IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(10) NOT NULL,
Email NVARCHAR(20) UNIQUE NOT NULL,
Phone NVARCHAR(15),
Address NVARCHAR(20),
Membership_Type VARCHAR(10) CHECK (Membership_Type IN ('Standard', 'Premium')) NOT NULL,
Status VARCHAR(10) DEFAULT 'Active' CHECK (Status IN ('Active', 'Expired', 'Suspended')) NOT NULL,
Join_Date DATE NOT NULL,
Expiry_Date DATE NOT NULL
);

CREATE TABLE Publishers (
Publisher_ID INT IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(10) NOT NULL,
Country NVARCHAR(20),
Contact_Email NVARCHAR(20),
Established_Year INT
);

CREATE TABLE Books (
Book_ID INT IDENTITY(1,1) PRIMARY KEY,
ISBN NVARCHAR(20) UNIQUE NOT NULL,
Title NVARCHAR(20) NOT NULL,
Edition NVARCHAR(25),
Publication_Year INT,
Total_Copies INT CHECK (Total_Copies >= 0),
Available_Copies INT,
Shelf_Location NVARCHAR(25),
Book_Condition NVARCHAR(20) DEFAULT 'Good',
Publisher_ID INT NOT NULL,
CONSTRAINT FK_Books_Publishers FOREIGN KEY (Publisher_ID) REFERENCES Publishers(Publisher_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

ALTER TABLE Books ALTER COLUMN Available_Copies INT NOT NULL;

ALTER TABLE Books
ADD CONSTRAINT CK_Books_Copies
CHECK (Available_Copies <= Total_Copies AND Available_Copies >= 0);

CREATE TABLE Authors (
Author_ID INT IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(100) NOT NULL,
Biography NVARCHAR(MAX),
Birth_Year DATE,
Nationality NVARCHAR(20)
);

CREATE TABLE Categories (
Category_ID INT IDENTITY(1,1) PRIMARY KEY,
Category_Name NVARCHAR(20) NOT NULL UNIQUE,
Description NVARCHAR(MAX)
);

CREATE TABLE Branches (
Branch_ID INT IDENTITY(1,1) PRIMARY KEY,
Branch_Name NVARCHAR(10) NOT NULL,
Address NVARCHAR(25),
Phone NVARCHAR(20),
Manager_Name NVARCHAR(10),
Opening_Date DATE
);


CREATE TABLE Borrowing (
BorrowID INT IDENTITY(1,1) PRIMARY KEY,
MemberID INT NOT NULL,
BookID INT NOT NULL,
BranchID INT NOT NULL,
BorrowDate DATE NOT NULL DEFAULT GETDATE(),
DueDate DATE NOT NULL,
ReturnDate DATE NULL,
Status VARCHAR(20) DEFAULT 'Borrowed' CHECK (Status IN ('Borrowed','Returned','Overdue')),
CONSTRAINT FK_Borrowing_Member FOREIGN KEY (MemberID)
REFERENCES Members(Member_ID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT FK_Borrowing_Book FOREIGN KEY (BookID)
REFERENCES Books(Book_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_Borrowing_Branch FOREIGN KEY (BranchID) REFERENCES Branches(Branch_ID)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Fines (
FineID INT IDENTITY(1,1) PRIMARY KEY,
BorrowID INT NOT NULL,
FineAmount DECIMAL(6,2) CHECK (FineAmount >= 0),
PaidAmount DECIMAL(6,2) DEFAULT 0 CHECK (PaidAmount >= 0),
PaymentDate DATE NULL,
Status VARCHAR(20) DEFAULT 'Pending' CHECK (Status IN ('Pending','Paid','Waived')),
CONSTRAINT FK_Fines_Borrow FOREIGN KEY (BorrowID) REFERENCES Borrowing(BorrowID)
 ON DELETE CASCADE
 ON UPDATE CASCADE
)CREATE TABLE Reservations (
ReservationID INT IDENTITY(1,1) PRIMARY KEY,
MemberID INT NOT NULL,
BookID INT NOT NULL,
ReservationDate DATE NOT NULL DEFAULT GETDATE(),
ExpiryDate DATE NOT NULL,
Status VARCHAR(20) DEFAULT 'Active' CHECK (Status IN ('Active','Fulfilled','Expired')),
CONSTRAINT FK_Reservations_Member FOREIGN KEY (MemberID) REFERENCES Members(Member_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
CONSTRAINT FK_Reservations_Book FOREIGN KEY (BookID) REFERENCES Books(Book_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);

CREATE INDEX IDX_Borrowing_Member ON Borrowing(MemberID);
CREATE INDEX IDX_Borrowing_Book ON Borrowing(BookID);
CREATE INDEX IDX_Borrowing_Branch ON Borrowing(BranchID);
CREATE INDEX IDX_Reservations_Member ON Reservations(MemberID);
CREATE INDEX IDX_Reservations_Book ON Reservations(BookID);
CREATE INDEX IDX_Books_Title ON Books(Title);
CREATE INDEX IDX_Members_Name ON Members(Name);
CREATE INDEX IDX_Borrowing_BorrowDate ON Borrowing(BorrowDate);
CREATE INDEX IDX_Borrowing_ReturnDate ON Borrowing(ReturnDate);
CREATE INDEX IDX_Reservations_Date ON Reservations(ReservationDate);


ALTER TABLE Members
ADD Last_Login DATETIME NULL;

ALTER TABLE Books
ADD Rating INT CHECK (Rating BETWEEN 1 AND 5);

ALTER TABLE Publishers
ALTER COLUMN Name NVARCHAR(50) NOT NULL;

ALTER TABLE Branches
ALTER COLUMN Manager_Name NVARCHAR(50);


CREATE TABLE BookAuthors (
BookID INT NOT NULL,
AuthorID INT NOT NULL,
PRIMARY KEY (BookID, AuthorID),
CONSTRAINT FK_BookAuthors_Book FOREIGN KEY (BookID) REFERENCES Books(Book_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
CONSTRAINT FK_BookAuthors_Author FOREIGN KEY (AuthorID) REFERENCES Authors(Author_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);

CREATE TABLE BookCategories (
BookID INT NOT NULL,
CategoryID INT NOT NULL,
PRIMARY KEY (BookID, CategoryID),
CONSTRAINT FK_BookCategories_Book FOREIGN KEY (BookID) REFERENCES Books(Book_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
CONSTRAINT FK_BookCategories_Category FOREIGN KEY (CategoryID)
 REFERENCES Categories(Category_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);