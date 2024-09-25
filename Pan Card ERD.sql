-- Create database and use it
CREATE DATABASE IF NOT EXISTS pancard;
USE pancard;

-- Create Applicant table
CREATE TABLE Applicant (
    ApplicantID INT AUTO_INCREMENT PRIMARY KEY,
    Title ENUM('Shri', 'Smt.', 'Kumari', 'M/s'),
    LastName VARCHAR(10) NOT NULL,
    FirstName VARCHAR(10) NOT NULL,
    MiddleName VARCHAR(10),
    AbbreviationName VARCHAR(10) NOT NULL, -- Name to be printed on the PAN card
    KnownByOtherName BOOLEAN DEFAULT FALSE,
    OtherTitle ENUM('Shri', 'Smt.', 'Kumari', 'M/s') DEFAULT NULL,
    OtherLastName VARCHAR(10) DEFAULT NULL,
    OtherFirstName VARCHAR(10) DEFAULT NULL,
    OtherMiddleName VARCHAR(10) DEFAULT NULL,
    Gender ENUM('Male', 'Female', 'Transgender'),
    DateOfBirth DATE NOT NULL, -- For individuals, actual date of birth; for others, date of incorporation
    Status ENUM('Government', 'Individual', 'Hindu Undivided Family', 'Company', 'Partnership Firm', 
                'Association of Persons', 'Trusts', 'Body of Individuals', 'Local Authority', 
                'Artificial Juridical Persons', 'Limited Liability Partnership') NOT NULL,
    AadhaarNumber CHAR(12) UNIQUE,
    AadhaarEnrolmentID VARCHAR(28) DEFAULT NULL,
    SourceOfIncome ENUM('Salary', 'Capital Gains', 'Income from Business/Profession', 
                        'Income from Other Sources', 'Income from House Property', 'No Income') NOT NULL
);

-- Create ParentDetails table
CREATE TABLE ParentDetails (
    ParentID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicantID INT NOT NULL,
    ParentType ENUM('Father', 'Mother') NOT NULL,
    LastName VARCHAR(10) NOT NULL,
    FirstName VARCHAR(10) NOT NULL,
    MiddleName VARCHAR(10),
    IsSingleParent BOOLEAN DEFAULT FALSE,
    NameToPrint ENUM('Father', 'Mother') NOT NULL, -- Which parent's name should be printed on the PAN card
    FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);

-- Create Address table
CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicantID INT NOT NULL,
    AddressType ENUM('Residence', 'Office') NOT NULL,
    FlatNo VARCHAR(10),
    PremisesName VARCHAR(25),
    RoadName VARCHAR(25),
    AreaLocality VARCHAR(25),
    City VARCHAR(15),
    State VARCHAR(15),
    Pincode CHAR(6),
    Country VARCHAR(15) DEFAULT 'India',
    FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);

-- Create CommunicationDetails table
CREATE TABLE CommunicationDetails (
    CommunicationID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicantID INT NOT NULL,
    CountryCode VARCHAR(5) DEFAULT '+91',
    AreaCode VARCHAR(10),
    TelephoneNumber VARCHAR(10),
    EmailID VARCHAR(50),
    PreferredAddress ENUM('Residence', 'Office') NOT NULL,
    FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);

-- Create DocumentProof table
CREATE TABLE DocumentProof (
    ProofID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicantID INT NOT NULL,
    ProofOfIdentity VARCHAR(20) NOT NULL,
    ProofOfAddress VARCHAR(100) NOT NULL,
    ProofOfDateOfBirth VARCHAR(20) NOT NULL,
    FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);

-- Sample data insertions
INSERT INTO Applicant (Title, LastName, FirstName, AbbreviationName, Gender, DateOfBirth, Status, SourceOfIncome)
VALUES 
('Shri', 'Sharma', 'Rahul', 'R. Sharma', 'Male', '1990-05-12', 'Individual', 'Salary');

INSERT INTO ParentDetails (ApplicantID, ParentType, LastName, FirstName, MiddleName, IsSingleParent, NameToPrint)
VALUES 
(1, 'Father', 'Sharma', 'Vikram', NULL, FALSE, 'Father'),
(1, 'Mother', 'Sharma', 'Meera', NULL, FALSE, 'Father');

INSERT INTO Address (ApplicantID, AddressType, FlatNo, PremisesName, RoadName, AreaLocality, City, State, Pincode, Country)
VALUES 
(1, 'Residence', 'B-101', 'Green Meadows', 'MG Road', 'Andheri West', 'Mumbai', 'Maharashtra', '400058', 'India');

INSERT INTO CommunicationDetails (ApplicantID, CountryCode, AreaCode, TelephoneNumber, EmailID, PreferredAddress)
VALUES 
(1, '+91', '022', '9876543210', 'rahul.sharma@example.com', 'Residence');

INSERT INTO DocumentProof (ApplicantID, ProofOfIdentity, ProofOfAddress, ProofOfDateOfBirth)
VALUES 
(1, 'Passport', 'Electricity Bill', 'Birth Certificate');
