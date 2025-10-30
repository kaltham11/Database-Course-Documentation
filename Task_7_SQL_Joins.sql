SELECT b.BorrowID, m.Name AS MemberName, bk.Title AS BookTitle, b.BorrowDate, b.DueDate, b.Status
FROM Borrowing b
INNER JOIN Members m ON b.MemberID = m.Member_ID
INNER JOIN Books bk ON b.BookID = bk.Book_ID;

SELECT bk.Book_ID, bk.Title, a.Name AS AuthorName
FROM Books bk
INNER JOIN BookAuthors ba ON bk.Book_ID = ba.BookID
INNER JOIN Authors a ON ba.AuthorID = a.Author_ID;

SELECT b.BorrowID, bk.Title AS BookTitle, m.Name AS MemberName, br.Branch_Name, br.Address AS BranchAddress, b.BorrowDate, b.DueDate, b.Status
FROM Borrowing b
INNER JOIN Books bk ON b.BookID = bk.Book_ID
INNER JOIN Members m ON b.MemberID = m.Member_ID
INNER JOIN Branches br ON b.BranchID = br.Branch_ID
WHERE b.Status = 'Borrowed';

SELECT bk.Book_ID, bk.Title, b.BorrowID, b.Status
FROM Books bk
LEFT JOIN Borrowing b ON bk.Book_ID = b.BookID AND b.Status = 'Borrowed';


SELECT m.Member_ID, m.Name, b.BorrowID, b.BookID, b.Status
FROM Members m
LEFT JOIN Borrowing b ON m.Member_ID = b.MemberID AND b.Status = 'Borrowed';


SELECT c.Category_ID, c.Category_Name, COUNT(bc.BookID) AS BookCount
FROM Categories c
LEFT JOIN BookCategories bc ON c.Category_ID = bc.CategoryID
GROUP BY c.Category_ID, c.Category_Name;








