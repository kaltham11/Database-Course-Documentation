SELECT m.Member_ID, m.Name, COUNT(b.BorrowID) AS TotalBorrowings
FROM Members m
LEFT JOIN Borrowing b ON m.Member_ID = b.MemberID
GROUP BY m.Member_ID, m.Name;

SELECT c.Category_Name, COUNT(bc.BookID) AS NumBooks
FROM Categories c
LEFT JOIN BookCategories bc ON c.Category_ID = bc.CategoryID
GROUP BY c.Category_Name;


SELECT br.Branch_Name, COUNT(b.BorrowID) AS OverdueCount
FROM Branches br
LEFT JOIN Borrowing b ON br.Branch_ID = b.BranchID
WHERE b.Status = 'Overdue'
GROUP BY br.Branch_Name;


SELECT YEAR(PaymentDate) AS Year, MONTH(PaymentDate) AS Month, SUM(PaidAmount) AS TotalCollected
FROM Fines
WHERE Status = 'Paid'
GROUP BY YEAR(PaymentDate), MONTH(PaymentDate);

SELECT m.Member_ID, m.Name, SUM(f.FineAmount - f.PaidAmount) AS PendingFines
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Pending'
GROUP BY m.Member_ID, m.Name;

SELECT p.Name AS PublisherName, SUM(b.Available_Copies) AS TotalAvailableCopies
FROM Publishers p
JOIN Books b ON p.Publisher_ID = b.Publisher_ID
GROUP BY p.Name;


SELECT AVG(DATEDIFF(DAY, BorrowDate, ISNULL(ReturnDate, GETDATE()))) AS AvgBorrowDays
FROM Borrowing;

SELECT m.Member_ID, m.Name, AVG(f.FineAmount) AS AvgFine
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
GROUP BY m.Member_ID, m.Name;

SELECT br.Branch_ID, br.Branch_Name, AVG(BorrowCount) AS AvgBooksBorrowed
FROM Branches br
JOIN (
    SELECT BranchID, COUNT(*) AS BorrowCount
    FROM Borrowing
    GROUP BY BranchID
) AS sub ON br.Branch_ID = sub.BranchID
GROUP BY br.Branch_ID, br.Branch_Name;

SELECT MIN(Publication_Year) AS OldestPublication,
       MAX(Publication_Year) AS NewestPublication
FROM Books;


SELECT TOP 1 m.Name, COUNT(b.BorrowID) AS BorrowCount
FROM Members m
LEFT JOIN Borrowing b ON m.Member_ID = b.MemberID
GROUP BY m.Name
ORDER BY BorrowCount DESC; -- الأكبر

SELECT TOP 1 m.Name, COUNT(b.BorrowID) AS BorrowCount
FROM Members m
LEFT JOIN Borrowing b ON m.Member_ID = b.MemberID
GROUP BY m.Name
ORDER BY BorrowCount ASC; -- الأصغر


SELECT MAX(FineAmount) AS MaxFine
FROM Fines;

SELECT c.Category_Name, COUNT(bc.BookID) AS NumBooks
FROM Categories c
JOIN BookCategories bc ON c.Category_ID = bc.CategoryID
GROUP BY c.Category_Name
HAVING COUNT(bc.BookID) > 5;

SELECT m.Name, COUNT(b.BorrowID) AS BorrowCount
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
WHERE b.BorrowDate BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()
GROUP BY m.Name
HAVING COUNT(b.BorrowID) > 3;

SELECT a.Name, COUNT(ba.BookID) AS NumBooks
FROM Authors a
JOIN BookAuthors ba ON a.Author_ID = ba.AuthorID
GROUP BY a.Name
HAVING COUNT(ba.BookID) > 2;

SELECT br.Branch_Name, SUM(f.FineAmount - f.PaidAmount) AS TotalPendingFines
FROM Branches br
JOIN Borrowing b ON br.Branch_ID = b.BranchID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Pending'
GROUP BY br.Branch_Name
HAVING SUM(f.FineAmount - f.PaidAmount) > 100;

SELECT br.Branch_Name, YEAR(b.BorrowDate) AS Year, MONTH(b.BorrowDate) AS Month, COUNT(b.BorrowID) AS BorrowCount
FROM Borrowing b
JOIN Branches br ON b.BranchID = br.Branch_ID
GROUP BY br.Branch_Name, YEAR(b.BorrowDate), MONTH(b.BorrowDate);

SELECT m.Name, YEAR(f.PaymentDate) AS Year, SUM(f.PaidAmount) AS TotalCollected
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Paid'
GROUP BY m.Name, YEAR(f.PaymentDate);

SELECT bk.Title, COUNT(b.BorrowID) AS TimesBorrowed
FROM Books bk
JOIN Borrowing b ON bk.Book_ID = b.BookID
GROUP BY bk.Title
HAVING COUNT(b.BorrowID) > (
    SELECT AVG(BorrowCount) 
    FROM (
        SELECT COUNT(*) AS BorrowCount
        FROM Borrowing
        GROUP BY BookID
    ) AS sub
);


SELECT m.Name, SUM(f.PaidAmount) AS TotalPaid
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Paid'
GROUP BY m.Name
HAVING SUM(f.PaidAmount) > (
    SELECT AVG(TotalPaid)
    FROM (
        SELECT SUM(f2.PaidAmount) AS TotalPaid
        FROM Members m2
        JOIN Borrowing b2 ON m2.Member_ID = b2.MemberID
        JOIN Fines f2 ON b2.BorrowID = f2.BorrowID
        WHERE f2.Status = 'Paid'
        GROUP BY m2.Member_ID
    ) AS sub
);










