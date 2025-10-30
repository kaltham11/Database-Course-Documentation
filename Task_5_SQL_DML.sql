INSERT INTO Branches (Branch_Name, Address, Phone, Manager_Name, Opening_Date) VALUES
('Central', 'Downtown Street', '91234567', 'Ahmed Ali', '2015-05-01'),
('East Wing', 'East City', '92345678', 'Sara Hassan', '2017-06-15'),
('West Point', 'West Avenue', '93456789', 'Omar Khalid', '2018-09-10'),
('North Gate', 'North Square', '94567890', 'Fatima Noor', '2020-01-20'),
('South Hub', 'South District', '95678901', 'Huda Saleh', '2021-03-25');

INSERT INTO Members (Name, Email, Phone, Address, Membership_Type, Status, Join_Date, Expiry_Date) VALUES
('Ali', 'ali@mail.com', '900001', 'Muscat', 'Standard', 'Active', '2024-01-10', '2025-01-10'),
('Sara', 'sara@mail.com', '900002', 'Sohar', 'Premium', 'Active', '2023-12-01', '2025-12-01'),
('Omar', 'omar@mail.com', '900003', 'Nizwa', 'Standard', 'Expired', '2022-03-05', '2023-03-05'),
('Laila', 'laila@mail.com', '900004', 'Ibri', 'Premium', 'Active', '2024-05-20', '2025-05-20'),
('Hassan', 'hassan@mail.com', '900005', 'Salalah', 'Standard', 'Active', '2024-04-10', '2025-04-10'),
('Maha', 'maha@mail.com', '900006', 'Muscat', 'Premium', 'Active', '2023-08-15', '2025-08-15'),
('Yousef', 'yousef@mail.com', '900007', 'Muscat', 'Standard', 'Expired', '2022-01-01', '2023-01-01'),
('Fatma', 'fatma@mail.com', '900008', 'Sohar', 'Premium', 'Active', '2024-02-02', '2025-02-02'),
('Noor', 'noor@mail.com', '900009', 'Nizwa', 'Standard', 'Active', '2024-03-03', '2025-03-03'),
('Salim', 'salim@mail.com', '900010', 'Ibri', 'Standard', 'Active', '2024-06-06', '2025-06-06'),
('Maryam', 'maryam@mail.com', '900011', 'Salalah', 'Premium', 'Expired', '2022-05-05', '2023-05-05'),
('Jasim', 'jasim@mail.com', '900012', 'Muscat', 'Standard', 'Active', '2024-01-15', '2025-01-15'),
('Khalid', 'khalid@mail.com', '900013', 'Sohar', 'Premium', 'Active', '2024-02-22', '2025-02-22'),
('Rania', 'rania@mail.com', '900014', 'Nizwa', 'Standard', 'Active', '2024-03-18', '2025-03-18'),
('Fahad', 'fahad@mail.com', '900015', 'Ibri', 'Premium', 'Active', '2023-09-09', '2025-09-09'),
('Mona', 'mona@mail.com', '900016', 'Salalah', 'Standard', 'Active', '2024-07-07', '2025-07-07'),
('Adel', 'adel@mail.com', '900017', 'Muscat', 'Premium', 'Expired', '2022-10-10', '2023-10-10'),
('Rashid', 'rashid@mail.com', '900018', 'Sohar', 'Standard', 'Active', '2024-04-04', '2025-04-04'),
('Nadia', 'nadia@mail.com', '900019', 'Nizwa', 'Premium', 'Active', '2023-11-11', '2025-11-11'),
('Huda', 'huda@mail.com', '900020', 'Muscat', 'Standard', 'Active', '2024-08-08', '2025-08-08');

INSERT INTO Publishers (Name, Country, Contact_Email, Established_Year) VALUES
('Pearson', 'UK', 'contact@pearson.com', 1980),
('Oxford', 'UK', 'info@oxford.com', 1970),
('Penguin', 'USA', 'support@penguin.com', 1990),
('McGrawHill', 'USA', 'help@mcgraw.com', 1965),
('AlManhal', 'UAE', 'admin@almanhal.com', 2000);

ALTER TABLE Authors
ADD Birth_Year_Int INT;

ALTER TABLE Authors
DROP COLUMN Birth_Year;

EXEC sp_rename 'Authors.Birth_Year_Int', 'Birth_Year', 'COLUMN';


INSERT INTO Authors (Name, Biography, Birth_Year, Nationality) VALUES
('John Smith', 'Expert in history', 1975, 'USA'),
('Aisha Ahmed', 'Fiction writer', 1985, 'Oman'),
('Robert Lee', 'Science author', 1969, 'UK'),
('Fatima Noor', 'Children literature', 1990, 'UAE'),
('David Kim', 'Tech author', 1980, 'Korea'),
('Lina Hassan', 'Romance novels', 1988, 'Egypt'),
('Ahmed Said', 'History researcher', 1972, 'Egypt'),
('Hiro Tanaka', 'Japanese author', 1975, 'Japan'),
('Emily Clark', 'Fantasy writer', 1992, 'USA'),
('Mohammed Al Balushi', 'Omani cultural books', 1983, 'Oman');


INSERT INTO Categories (Category_Name, Description) VALUES
('Fiction', 'Novels and stories'),
('Science', 'Scientific topics'),
('History', 'Historical events'),
('Technology', 'IT and AI books'),
('Children', 'Books for kids'),
('Culture', 'Cultural and social topics'),
('Romance', 'Love stories'),
('Education', 'Learning materials');

INSERT INTO Books (ISBN, Title, Edition, Publication_Year, Total_Copies, Available_Copies, Shelf_Location, Book_Condition, Publisher_ID) VALUES
('ISBN001', 'AI Basics', '1st', 2022, 10, 5, 'A1', 'New', 1),
('ISBN002', 'Omani Culture', '2nd', 2021, 7, 3, 'B2', 'Good', 5),
('ISBN003', 'World History', '3rd', 2020, 12, 8, 'C3', 'Fair', 2),
('ISBN004', 'Science Facts', '1st', 2023, 9, 6, 'D4', 'New', 3),
('ISBN005', 'Love in Cairo', '2nd', 2022, 6, 2, 'E5', 'Good', 4),
('ISBN006', 'Smart Kids', '1st', 2021, 15, 10, 'F6', 'New', 5),
('ISBN007', 'Ancient Egypt', '3rd', 2019, 8, 4, 'G7', 'Fair', 2),
('ISBN008', 'Programming 101', '1st', 2024, 10, 10, 'H8', 'New', 1),
('ISBN009', 'Fantasy World', '1st', 2020, 5, 1, 'I9', 'Good', 3),
('ISBN010', 'Social Harmony', '2nd', 2023, 7, 6, 'J10', 'New', 5);

SELECT *
From Borrowing

SELECT *
From Books




DELETE FROM Borrowing



SELECT * 
From Branches 

DELETE FROM Books

ALTER TABLE Books
ALTER COLUMN Title NVARCHAR(50) NOT NULL;


INSERT INTO Books (ISBN, Title, Edition, Publication_Year, Total_Copies, Available_Copies, Shelf_Location, Book_Condition, Publisher_ID) VALUES
('ISBN001', 'AI Basics', '1st', 2022, 10, 5, 'A1', 'New', 1),
('ISBN002', 'Omani Culture', '2nd', 2021, 7, 3, 'B2', 'Good', 5),
('ISBN003', 'World History', '3rd', 2020, 12, 8, 'C3', 'Fair', 2),
('ISBN004', 'Science Facts', '1st', 2023, 9, 6, 'D4', 'New', 3),
('ISBN005', 'Love in Cairo', '2nd', 2022, 6, 2, 'E5', 'Good', 4),
('ISBN006', 'Smart Kids', '1st', 2021, 15, 10, 'F6', 'New', 5),
('ISBN007', 'Ancient Egypt', '3rd', 2019, 8, 4, 'G7', 'Fair', 2),
('ISBN008', 'Programming 101', '1st', 2024, 10, 10, 'H8', 'New', 1),
('ISBN009', 'Fantasy World', '1st', 2020, 5, 1, 'I9', 'Good', 3),
('ISBN010', 'Social Harmony', '2nd', 2023, 7, 6, 'J10', 'New', 5),
('ISBN011', 'AI Advanced', '2nd', 2023, 12, 9, 'A2', 'New', 1),
('ISBN012', 'Omani History', '1st', 2020, 8, 2, 'B3', 'Good', 5),
('ISBN013', 'Physics Basics', '1st', 2021, 10, 0, 'C4', 'New', 3),
('ISBN014', 'Chemistry 101', '2nd', 2022, 9, 4, 'D5', 'Fair', 3),
('ISBN015', 'Love in Muscat', '1st', 2021, 6, 6, 'E6', 'Good', 4),
('ISBN016', 'Smart Teens', '1st', 2020, 15, 7, 'F7', 'New', 5),
('ISBN017', 'Ancient Rome', '2nd', 2019, 8, 3, 'G8', 'Fair', 2),
('ISBN018', 'Python Programming', '1st', 2024, 12, 12, 'H9', 'New', 1),
('ISBN019', 'Fantasy Lands', '1st', 2021, 5, 0, 'I10', 'Good', 3),
('ISBN020', 'Social Studies', '2nd', 2023, 7, 5, 'J11', 'New', 5),
('ISBN021', 'AI for Kids', '1st', 2022, 10, 4, 'A3', 'New', 1),
('ISBN022', 'Omani Folklore', '2nd', 2021, 9, 2, 'B4', 'Good', 5),
('ISBN023', 'Biology Basics', '1st', 2020, 11, 9, 'C5', 'New', 3),
('ISBN024', 'Chemistry Experiments', '1st', 2022, 8, 1, 'D6', 'Fair', 3),
('ISBN025', 'Love Stories', '3rd', 2023, 6, 0, 'E7', 'Good', 4),
('ISBN026', 'Smart Children', '1st', 2021, 15, 12, 'F8', 'New', 5),
('ISBN027', 'Ancient Greece', '2nd', 2019, 8, 5, 'G9', 'Fair', 2),
('ISBN028', 'Java Programming', '1st', 2024, 12, 10, 'H10', 'New', 1),
('ISBN029', 'Fantasy Adventures', '1st', 2020, 5, 2, 'I11', 'Good', 3),
('ISBN030', 'Global Society', '2nd', 2023, 7, 6, 'J12', 'New', 5);

SELECT * 
From Books

INSERT INTO Borrowing (MemberID, BookID, BranchID, BorrowDate, DueDate, ReturnDate, Status) VALUES
(1, 35, 3, '2025-09-01', '2025-09-15', '2025-09-14', 'Returned'),
(2, 36, 4, '2025-09-02', '2025-09-16', NULL, 'Borrowed'),
(3, 37, 5, '2025-09-03', '2025-09-17', NULL, 'Overdue'),
(4, 38, 6, '2025-09-04', '2025-09-18', '2025-09-18', 'Returned'),
(5, 39, 7, '2025-09-05', '2025-09-19', NULL, 'Borrowed'),
(6, 40, 3, '2025-09-06', '2025-09-20', '2025-09-20', 'Returned'),
(7, 41, 4, '2025-09-07', '2025-09-21', NULL, 'Borrowed'),
(8, 42, 5, '2025-09-08', '2025-09-22', NULL, 'Overdue'),
(9, 43, 6, '2025-09-09', '2025-09-23', '2025-09-23', 'Returned'),
(10, 44, 7, '2025-09-10', '2025-09-24', NULL, 'Borrowed'),
(11, 45, 3, '2025-09-11', '2025-09-25', NULL, 'Overdue'),
(12, 46, 4, '2025-09-12', '2025-09-26', '2025-09-26', 'Returned'),
(13, 47, 5, '2025-09-13', '2025-09-27', NULL, 'Borrowed'),
(14, 48, 6, '2025-09-14', '2025-09-28', NULL, 'Borrowed'),
(15, 49, 7, '2025-09-15', '2025-09-29', '2025-09-29', 'Returned'),
(16, 50, 3, '2025-09-16', '2025-09-30', NULL, 'Borrowed'),
(17, 51, 4, '2025-09-17', '2025-10-01', NULL, 'Overdue'),
(18, 52, 5, '2025-09-18', '2025-10-02', NULL, 'Borrowed'),
(19, 53, 6, '2025-09-19', '2025-10-03', '2025-10-02', 'Returned'),
(20, 54, 7, '2025-09-20', '2025-10-04', NULL, 'Borrowed'),
(1, 55, 3, '2025-09-21', '2025-10-05', NULL, 'Overdue'),
(2, 56, 4, '2025-09-22', '2025-10-06', '2025-10-05', 'Returned'),
(3, 57, 5, '2025-09-23', '2025-10-07', NULL, 'Borrowed'),
(4, 58, 6, '2025-09-24', '2025-10-08', NULL, 'Overdue'),
(5, 59, 7, '2025-09-25', '2025-10-09', NULL, 'Borrowed');


SELECT *
fROM Books


INSERT INTO Fines (BorrowID, FineAmount, PaidAmount, PaymentDate, Status) VALUES
(17, 5.00, 0, NULL, 'Pending'),      -- Overdue, not paid
(19, 3.50, 3.50, '2025-09-28', 'Paid'), -- Returned late, paid
(22, 2.00, 0, NULL, 'Pending'),      -- Overdue, not paid
(24, 4.50, 4.50, '2025-09-30', 'Paid'), -- Borrowed, fine already paid
(31, 6.00, 0, NULL, 'Pending'),      -- Overdue, not paid
(33, 2.50, 2.50, '2025-10-03', 'Paid'), -- Returned, paid
(35, 7.00, 0, NULL, 'Pending'),      -- Overdue, not paid
(38, 1.50, 0, NULL, 'Pending');      -- Overdue, not paid


INSERT INTO Reservations (MemberID, BookID, ReservationDate, ExpiryDate, Status) VALUES
(1, 35, '2025-10-01', '2025-10-08', 'Active'),
(2, 36, '2025-10-02', '2025-10-09', 'Fulfilled'),
(3, 37, '2025-10-03', '2025-10-10', 'Expired'),
(4, 38, '2025-10-04', '2025-10-11', 'Active'),
(5, 39, '2025-10-05', '2025-10-12', 'Active');


DELETE FROM BookAuthors

SELECT * 
From Authors

INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(35, 1),   -- AI Basics by John Smith
(35, 5),   -- AI Basics also by David Kim
(36, 2),   -- Omani Culture by Aisha Ahmed
(37, 3),   -- World History by Robert Lee
(37, 7),   -- World History also by Ahmed Said
(38, 4),   -- Science Facts by Fatima Noor
(39, 6),   -- Love in Cairo by Lina Hassan
(40, 2),   -- Smart Kids by Aisha Ahmed
(41, 3),   -- Ancient Egypt by Robert Lee
(42, 5),   -- Programming 101 by David Kim
(42, 8),   -- Programming 101 also by Hiro Tanaka
(43, 9),   -- Fantasy World by Emily Clark
(44, 6),   -- Social Harmony by Lina Hassan
(45, 1),   -- AI Advanced by John Smith
(46, 2),   -- Omani History by Aisha Ahmed
(47, 3),   -- Physics Basics by Robert Lee
(48, 4),   -- Chemistry 101 by Fatima Noor
(49, 6),   -- Love in Muscat by Lina Hassan
(50, 2),   -- Smart Teens by Aisha Ahmed
(51, 3),   -- Ancient Rome by Robert Lee
(52, 5),   -- Python Programming by David Kim
(53, 9),   -- Fantasy Lands by Emily Clark
(54, 6),   -- Social Studies by Lina Hassan
(55, 1),   -- AI for Kids by John Smith
(56, 2);   -- Omani Folklore by Aisha Ahmed


DELETE FROM BookCategories

SELECT * 
From Categories


INSERT INTO BookCategories (BookID, CategoryID) VALUES
(35, 4),  -- AI Basics -> Technology
(36, 6),  -- Omani Culture -> Culture
(37, 3),  -- World History -> History
(37, 1),  -- World History -> Fiction (????? ??? ???????)
(38, 2),  -- Science Facts -> Science
(39, 7),  -- Love in Cairo -> Romance
(40, 5),  -- Smart Kids -> Children
(41, 3),  -- Ancient Egypt -> History
(42, 4),  -- Programming 101 -> Technology
(42, 8),  -- Programming 101 -> Education
(43, 1),  -- Fantasy World -> Fiction
(44, 6),  -- Social Harmony -> Culture
(45, 4),  -- AI Advanced -> Technology
(46, 3),  -- Omani History -> History
(47, 2),  -- Physics Basics -> Science
(48, 2),  -- Chemistry 101 -> Science
(49, 7),  -- Love in Muscat -> Romance
(50, 5),  -- Smart Teens -> Children
(51, 3),  -- Ancient Rome -> History
(52, 4),  -- Python Programming -> Technology
(53, 1),  -- Fantasy Lands -> Fiction
(54, 6),  -- Social Studies -> Culture
(55, 4),  -- AI for Kids -> Technology
(55, 5),  -- AI for Kids -> Children
(56, 6);  -- Omani Folklore -> Culture











