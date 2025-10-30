SELECT *
From Books
WHERE Publication_Year>2020


SELECT *
From Members
WHERE Expiry_Date BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE());



SELECT *
FROM Borrowing
WHERE ReturnDate IS NULL
  AND DueDate < CAST(GETDATE() AS DATE);


SELECT b.*
FROM Books b
LEFT JOIN Borrowing br ON b.Book_ID = br.BookID
WHERE br.BookID IS NULL;


SELECT *
From Fines

SELECT m.Member_ID, m.Name, SUM(f.FineAmount - f.PaidAmount) AS PendingAmount
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Pending'
GROUP BY m.Member_ID, m.Name
HAVING SUM(f.FineAmount - f.PaidAmount) > 10;

SELECT b.Book_ID, b.Title, b.ISBN, c.Category_Name
FROM Books b
JOIN BookCategories cb ON b.Book_ID = cb.BookID
JOIN Categories c ON cb.CategoryID = c.Category_ID
WHERE c.Category_Name = 'Fiction';


SELECT Book_ID, Title, ISBN, Available_Copies
FROM Books
WHERE Available_Copies < 2;

SELECT *
FROM Authors
WHERE Nationality IN ('USA', 'UK');

SELECT b.Book_ID, b.Title, b.Publication_Year, p.Name
FROM Books b
JOIN Publishers p ON b.Publisher_ID = p.Publisher_ID
WHERE p.Name = 'Penguin Random House';

SELECT *
FROM Borrowing
WHERE BorrowDate BETWEEN 
      DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0)  -- First day of last month
      AND
      EOMONTH(GETDATE(), -1);  -- Last day of last month












