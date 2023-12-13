--CODING CHALLENGES: CAREERHUB, THE JOB BOARD(BY: Ravikant Ujjwal)

-- Creating database
Create database CareerHub;

Use CareerHub;

-- Create Companies table
CREATE TABLE Companies (
    CompanyID INT not null PRIMARY KEY,
    CompanyName VARCHAR(255) not null,
    Location VARCHAR(255)not null
);

-- Create Jobs table
CREATE TABLE Jobs (
    JobID INT not null PRIMARY KEY,
    CompanyID INT not null,
    JobTitle VARCHAR(100) not null,
    JobDescription TEXT not null,
    JobLocation VARCHAR(100) not null,
    Salary DECIMAL not null,
    JobType VARCHAR(100) not null,
    PostedDate DATETIME not null,
);

-- Create Applicants table
CREATE TABLE Applicants (
    ApplicantID INT not null PRIMARY KEY,
    FirstName VARCHAR(100) not null,
    LastName VARCHAR(100) not null,
    Email VARCHAR(100) not null,
    Phone VARCHAR(20) not null,
    Resume TEXT not null
);

-- Create Applications table
CREATE TABLE Applications (
    ApplicationID INT not null PRIMARY KEY,
    JobID INT not null,
    ApplicantID INT not null,
    ApplicationDate DATETIME not null,
    CoverLetter TEXT not null,
);


--Q3 Creating foreign key constraints
-- Add foreign key to Jobs table
ALTER TABLE Jobs
ADD CONSTRAINT FK_Companies FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID);

-- Add foreign key to Applications table referencing Jobs table
ALTER TABLE Applications
ADD CONSTRAINT FK_Applications_Jobs FOREIGN KEY (JobID) REFERENCES Jobs(JobID);

-- Add foreign key to Applications table referencing Applicants table
ALTER TABLE Applications
ADD CONSTRAINT FK_Applications_Applicants FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID);


-- Inserting data into Companies table
INSERT INTO Companies (CompanyID, CompanyName, Location)
VALUES
    (1, 'Company A', 'Location A'),
    (2, 'Company B', 'Location B'),
    (3, 'Company C', 'Location C'),
    (4, 'Company D', 'Location D'),
    (5, 'Company E', 'Location E'),
    (6, 'Company F', 'Location F'),
    (7, 'Company G', 'Location G'),
    (8, 'Company H', 'Location H'),
    (9, 'Company I', 'Location I'),
    (10, 'Company J', 'Location J');

-- Inserting data into Jobs table
INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
VALUES
    (1, 1, 'Software Engineer', 'Develop software applications', 'Location A', 80000.00, 'Full-time', '2023-01-01 08:00:00'),
    (2, 1, 'Marketing Specialist', 'Create and implement marketing strategies', 'Location A', 60000.00, 'Part-time', '2023-01-02 10:30:00'),
    (3, 2, 'Data Analyst', 'Analyze and interpret data', 'Location B', 70000.00, 'Full-time', '2023-01-03 12:00:00'),
    (4, 2, 'Sales Representative', 'Promote and sell products', 'Location B', 55000.00, 'Full-time', '2023-01-04 14:30:00'),
    (5, 3, 'Graphic Designer', 'Create visual concepts', 'Location C', 65000.00, 'Part-time', '2023-01-05 09:45:00'),
    (6, 3, 'HR Manager', 'Oversee human resources functions', 'Location C', 75000.00, 'Full-time', '2023-01-06 11:15:00'),
    (7, 4, 'Financial Analyst', 'Conduct financial analysis', 'Location D', 72000.00, 'Full-time', '2023-01-07 13:30:00'),
    (8, 4, 'Customer Support Specialist', 'Assist customers with inquiries', 'Location D', 50000.00, 'Part-time', '2023-01-08 15:45:00'),
    (9, 5, 'Project Manager', 'Manage project timelines and resources', 'Location E', 85000.00, 'Full-time', '2023-01-09 17:00:00'),
    (10, 5, 'IT Support Technician', 'Provide technical support', 'Location E', 60000.00, 'Full-time', '2023-01-10 19:15:00');

-- Inserting data into Applicants table
INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resume)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', 'Resume for John Doe'),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', 'Resume for Jane Smith'),
    (3, 'Mike', 'Johnson', 'mike.johnson@email.com', '345-678-9012', 'Resume for Mike Johnson'),
    (4, 'Emily', 'Williams', 'emily.williams@email.com', '567-890-1234', 'Resume for Emily Williams'),
    (5, 'Chris', 'Brown', 'chris.brown@email.com', '789-012-3456', 'Resume for Chris Brown'),
    (6, 'Laura', 'Miller', 'laura.miller@email.com', '901-234-5678', 'Resume for Laura Miller'),
    (7, 'David', 'Jones', 'david.jones@email.com', '234-567-8901', 'Resume for David Jones'),
    (8, 'Emma', 'Taylor', 'emma.taylor@email.com', '456-789-0123', 'Resume for Emma Taylor'),
    (9, 'Brian', 'White', 'brian.white@email.com', '678-901-2345', 'Resume for Brian White'),
    (10, 'Olivia', 'Davis', 'olivia.davis@email.com', '890-123-4567', 'Resume for Olivia Davis');

-- Inserting data into Applications table
INSERT INTO Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES(1, 1, 1, '2023-01-03 12:45:00', 'Cover letter for Software Engineer from John Doe'),
    (2, 1, 2, '2023-01-04 14:20:00', 'Cover letter for Software Engineer from Jane Smith'),
    (3, 2, 3, '2023-01-05 15:30:00', 'Cover letter for Marketing Specialist from Mike Johnson'),
    (4, 2, 4, '2023-01-06 16:45:00', 'Cover letter for Marketing Specialist from Emily Williams'),
    (5, 3, 5, '2023-01-07 18:00:00', 'Cover letter for Data Analyst from Chris Brown'),
    (6, 3, 6, '2023-01-08 19:15:00', 'Cover letter for Data Analyst from Laura Miller'),
    (7, 4, 7, '2023-01-09 20:30:00', 'Cover letter for Sales Representative from David Jones'),
    (8, 4, 8, '2023-01-10 21:45:00', 'Cover letter for Sales Representative from Emma Taylor'),
    (9, 5, 9, '2023-01-11 23:00:00', 'Cover letter for Graphic Designer from Brian White'),
    (10, 5, 10, '2023-01-12 01:15:00', 'Cover letter for Graphic Designer from Olivia Davis');

/*Q5--Write an SQL query to count the number of applications received for each job listing in the 
"Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all 
jobs, even if they have no applications.*/
Select Jobtitle, COUNT(Applications.ApplicantID) as number_of_application from Jobs
join Applications
on Jobs.JobID=Applications.ApplicantID
group by jobs.JobID,jobs.JobTitle;

/*Q6--Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary 
range. Allow parameters for the minimum and maximum salary values. Display the job title, 
company name, location, and salary for each matching job*/
SELECT Jobs.JobTitle, Companies.CompanyName,Jobs.JobLocation,Jobs.Salary
FROM Jobs
JOIN Companies 
ON Jobs.CompanyID = Companies.CompanyID
WHERE Jobs.Salary >= 40000 AND Jobs.Salary <= 60000;

/*Q7--Write an SQL query that retrieves the job application history for a specific applicant. Allow a
parameter for the ApplicantID, and return a result set with the job titles, company names, and
application dates for all the jobs the applicant has applied to.*/

SELECT Jobs.JobTitle,(SELECT CompanyName FROM Companies WHERE CompanyID = Jobs.CompanyID) AS CompanyName,Applications.ApplicationDate
FROM Applications
JOIN Jobs
ON Applications.JobID = Jobs.JobID
WHERE Applications.ApplicantID = 2;

/*Q8--Create an SQL query that calculates and displays the average salary offered by all companies for
job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.*/

SELECT AVG(Salary) AS AverageSalary FROM Jobs
WHERE Salary > 0;

/*Q9--Write an SQL query to identify the company that has posted the most job listings. Display the
company name along with the count of job listings they have posted. Handle ties if multiple
companies have the same maximum count.*/

SELECT TOP 1 WITH TIES Companies.CompanyName,COUNT(Jobs.JobID) AS No_of_jobs
FROM Companies
LEFT JOIN Jobs
ON Companies.CompanyID = Jobs.CompanyID
GROUP BY Companies.CompanyID, Companies.CompanyName
ORDER BY No_of_jobs DESC;
    
--Q11--Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.
SELECT DISTINCT JobID,JobTitle,Salary FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

-- 12. Find the jobs that have not received any applications
SELECT Jobs.* FROM Jobs
LEFT JOIN Applications 
ON Jobs.JobID = Applications.JobID
WHERE Applications.ApplicationID IS NULL;

--13.Retrieve a list of job applicants along with the companies they have applied to and the positions  they have applied for.
SELECT Concat(Applicants.FirstName,' ',Applicants.LastName) as Applicant_name,Companies.CompanyName,Jobs.jobTitle FROM Applicants
JOIN Applications 
ON Applicants.ApplicantID =Applications.ApplicantID
JOIN Jobs 
ON Applications.JobID=Jobs.JobID
JOIN Companies 
ON Jobs.CompanyID =Companies.CompanyID;

--Q14 Retrieve a list of companies along with the count of jobs they have posted, even if they have not  received any applications.
SELECT Companies.CompanyName ,COUNT(Jobs.JobID) AS No_of_jobs
FROM Companies
LEFT JOIN Jobs ON Companies.CompanyID =Jobs.CompanyID
GROUP BY Companies.CompanyName;

--15 List all applicants along with the companies and positions they have applied for, including those  who have not applied

SELECT aps.FirstName , aps.LastName ,cp.CompanyName ,js.JobTitle FROM Applicants aps
LEFT JOIN Applications ap 
ON aps.ApplicantID=ap.ApplicantID
LEFT JOIN Jobs js
ON ap.JobID =js.JobID
LEFT JOIN Companies cp ON js.CompanyID = cp.CompanyID;

--16Find companies that have posted jobs with a salary higher than the average salary of all jobs.
SELECT DISTINCT Companies.CompanyID,Companies.CompanyName FROM Companies 
JOIN Jobs
ON Companies.CompanyID = Jobs.CompanyID
WHERE Jobs.Salary > (SELECT AVG(Salary) FROM Jobs);


--18 Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.

SELECT JobID,JobTitle FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';

--19 Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.

SELECT A.ApplicantID,Concat(A.FirstName,A.LastName) As applicants_name,j.JobID,j.JobTitle
FROM Applicants A
JOIN Applications App 
ON A.ApplicantID = App.ApplicantID AND A.ApplicantID = App.ApplicantID
join Jobs j
on j.JobID=App.JobID;



--Below are teh solution of question those are not found in the sequence

--17 Display a list of applicants with their names and a concatenated string of their city and state.

--since we donot have these tables in schema and we are required of these so we need to add it and update some data
ALTER TABLE Applicants
ADD City VARCHAR(100),State VARCHAR(100);

UPDATE Applicants SET City = 'SampleCity', State = 'SampleState'
WHERE ApplicantID = 3;

SELECT ApplicantID,Concat(FirstName,' ', LastName)as Applicants_name,CONCAT(City, ', ', State) AS Location
FROM Applicants; 


--Q10 Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience

-- NOTE : we don't have experience cloumn in schema so adding here 
ALTER TABLE Applicants
ADD Experience INT;

UPDATE Applicants
SET Experience = 4 
WHERE ApplicantID = 3; 

SELECT  Applicants.* FROM Applicants
JOIN Applications
ON Applicants.ApplicantID = Applications.ApplicantID
JOIN Jobs 
ON Applications.JobID = Jobs.JobID
JOIN Companies 
ON Jobs.CompanyID = Companies.CompanyID
WHERE Companies.Location = 'Location A' AND Applicants.Experience >= 3;

/*20  List all combinations of applicants and companies where the company is in a specific city and the 
applicant has more than 2 years of experience. For example: city=Chennai*/
SELECT Applicants.ApplicantID,Concat(Applicants.FirstName,Applicants.LastName) as Applicants_name,Applicants.Experience,
Companies.CompanyID,Companies.CompanyName,Companies.Location AS CompanyLocation
FROM Applicants
CROSS JOIN Companies 
WHERE Companies.Location = 'Location A' AND Applicants.Experience >2;