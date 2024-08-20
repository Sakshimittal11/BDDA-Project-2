create database pancard;
use pancard;
CREATE TABLE Applicant (
    ApplicantID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Title ENUM('Shri', 'Smt.', 'Kumari', 'M/s'),
    KnownByOtherName BOOLEAN,
    OtherName VARCHAR(255),
    Gender ENUM('Male', 'Female', 'Transgender'),
    DateOfBirth DATE NOT NULL,
    Status ENUM('Government', 'Individual', 'Hindu undivided family', 'Company', 'Partnership Firm', 
                'Association of Persons', 'Trusts', 'Body of Individuals', 'Local Authority', 
                'Artificial Juridical Persons', 'Limited Liability Partnership'),
    AadhaarNumber VARCHAR(12),
    AadhaarEnrolmentID VARCHAR(28),
    SourceOfIncome ENUM('Salary', 'Capital Gains', 'Income from Business/Profession', 
                        'Income from Other sources', 'Income from House property', 'No income')
);

CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicantID INT,
    AddressType ENUM('Residence', 'Office'),
    FlatNo VARCHAR(50),
    PremisesName VARCHAR(255),
    RoadName VARCHAR(255),
    AreaLocality VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Pincode VARCHAR(10),
    Country VARCHAR(50),
    FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);
CREATE TABLE ParentDetails (
    ParentID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicantID INT,
    ParentType ENUM('Father', 'Mother'),
    FullName VARCHAR(255),
    IsSingleParent BOOLEAN,
    NameToPrint ENUM('Father', 'Mother'),
    FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);
CREATE TABLE CommunicationDetails (
    CommunicationID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicantID INT,
    CountryCode VARCHAR(5),
    AreaCode VARCHAR(10),
    TelephoneNumber VARCHAR(15),
    EmailID VARCHAR(255),
    PreferredAddress ENUM('Residence', 'Office'),
    FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);
CREATE TABLE DocumentProof (
    ProofID INT AUTO_INCREMENT PRIMARY KEY,
    ApplicantID INT,
    ProofOfIdentity VARCHAR(255),
    ProofOfAddress VARCHAR(255),
    ProofOfDateOfBirth VARCHAR(255),
    FOREIGN KEY (ApplicantID) REFERENCES Applicant(ApplicantID)
);

-- Insert each row individually to check for issues
INSERT INTO Address (ApplicantID, AddressType, FlatNo, PremisesName, RoadName, AreaLocality, City, State, Pincode, Country)
VALUES (1, 'Residence', 'B-101', 'Green Meadows', 'MG Road', 'Andheri West', 'Mumbai', 'Maharashtra', '400058', 'India');

INSERT INTO Address (ApplicantID, AddressType, FlatNo, PremisesName, RoadName, AreaLocality, City, State, Pincode, Country)
VALUES (1, 'Office', '12th Floor', 'Tech Park', 'Link Road', 'Malad West', 'Mumbai', 'Maharashtra', '400064', 'India');

INSERT INTO ParentDetails (ApplicantID, ParentType, FullName, IsSingleParent, NameToPrint)
VALUES 
(1, 'Father', 'Vikram Sharma', FALSE, 'Father'),
(1, 'Mother', 'Meera Sharma', FALSE, 'Father'),
(2, 'Father', 'Rakesh Singh', FALSE, 'Father');
INSERT INTO CommunicationDetails (ApplicantID, CountryCode, AreaCode, TelephoneNumber, EmailID, PreferredAddress)
VALUES 
(1, '+91', '022', '9876543210', 'rahul.sharma@example.com', 'Residence'),
(2, '+91', '033', '9876501234', 'neha.verma@example.com', 'Residence');

INSERT INTO DocumentProof (ApplicantID, ProofOfIdentity, ProofOfAddress, ProofOfDateOfBirth)
VALUES 
(1, 'Passport', 'Electricity Bill', 'Birth Certificate'),
(2, 'Voter ID', 'Aadhaar Card', 'School Leaving Certificate');