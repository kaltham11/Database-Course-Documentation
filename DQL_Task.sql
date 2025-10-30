USE Company_SD;
GO

SELECT  d.Dnum AS departement_id,
d.Dname As department_name,
d.MGRSSN As manager_ID,
e.Fname+ ' '+e.Lname As Manager_Full_Name
From Departments d
JOIN Employee e
ON d.MGRSSN =e.SSN;

SELECT 
d.Dname As department_name,
p.Pname AS project_name
From Departments d
JOIN Project p
ON d.Dnum =p.Dnum;


SELECT 
d.ESSN,
d.Dependent_name,
d.Sex,
d.Bdate,
e.Fname+ ' '+e.Lname As Full_Name
From Dependent d
JOIN Employee e
ON d.ESSN=e.SSN;

SELECT 
Pnumber,
Pname,
Plocation
From Project
WHERE City IN ('Cairo','Alex');


SELECT *
From Project
WHERE Pname LIKE 'A%';


SELECT 
SSN,
Fname+ ' '+ Lname As Full_Name
From Employee
WHERE Dno=30
AND Salary BETWEEN 1000 AND 2000;

SELECT 
e.Fname+ ' '+ e.Lname As Full_Name
From Employee e
JOIN Works_for w 
ON e.SSN=w.ESSn
JOIN Project p
ON w.Pno=p.Pnumber 
WHERE e.Dno=10 AND
w.Hours >=10 AND
p.Pname ='AL Rabwah';

SELECT 
e.Fname+ ' '+ e.Lname As Full_Name
From Employee e
JOIN Employee s
ON e.Superssn=s.SSN
WHERE s.Fname= 'Kamel' AND s.Lname='Mohamed';

SELECT 
e.Fname+ ' '+ e.Lname As Full_Name,
p.Pname AS project_name
From Employee e
JOIN Works_for w
ON e.SSN=w.ESSn
JOIN Project p
ON w.Pno=p.Pnumber
ORDER BY
p.Pname;


SELECT 
p.Pnumber AS project_number,
d.Dname AS department_name,
e.Lname AS manager_lastName,
e.address AS address_manager,
e.Bdate AS Birth_date
From Project p
JOIN Departments d ON p.Dnum=d.Dnum
JOIN Employee e ON d.MGRSSN=e.SSN
WHERE p.City ='Cairo';


SELECT *
From Employee e
JOIN Departments d
ON e.SSN=d.MGRSSN;

SELECT 
e.Fname+ ' '+ e.Lname As Full_Name,
d.Dependent_name,
d.Bdate,
d.Sex
From Employee e
LEFT JOIN Dependent d
ON e.SSN=d.ESSN;




