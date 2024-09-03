# BDDA-Project-2_Bottom up-Pan Card
# Overview
This project focuses on the design and implementation of a relational database tailored for a PAN (Permanent Account Number) card management system. The database is structured using a top-down approach, emphasizing key aspects such as applicant management, address details, communication information, document proofs, and parent details. The project involves creating interconnected tables that capture various attributes related to PAN card applications, along with defining user roles with specific permissions to ensure secure and efficient data handling.

# Approach
The project adopts a top-down approach to database design. We began by identifying the major entities involved in the PAN card application process, then further decomposed these into detailed components and relationships. This method allowed us to create a robust database structure that effectively represents the complexities of PAN card management, ensuring data integrity and ease of retrieval.

# Project Structure
The project is structured around the following main entities:

Applicant: Contains information about the PAN card applicant, including fields like ApplicantID, FullName, Title, Gender, DateOfBirth, AadhaarNumber, and SourceOfIncome.
Address: Stores address information with fields such as AddressID, ApplicantID, AddressType, FlatNo, PremisesName, RoadName, AreaLocality, City, State, Pincode, and Country.
CommunicationDetails: Manages communication details including CommunicationID, ApplicantID, CountryCode, AreaCode, TelephoneNumber, EmailID, and PreferredAddress.
DocumentProof: Contains document proof information with fields such as ProofID, ApplicantID, ProofOfIdentity, ProofOfAddress, and ProofOfDateOfBirth.
ParentDetails: Records parent details including ParentID, ApplicantID, ParentType, FullName, IsSingleParent, and NameToPrint.
# Database Schema
The database schema includes the following tables:

Applicant
Address
CommunicationDetails
DocumentProof
ParentDetails
Each table is designed with appropriate fields and data types to ensure efficient data storage, accurate relationships, and easy data retrieval.

# Relationships
The database schema includes the following key relationships:

Applicant to Address: One-to-Many
Applicant to CommunicationDetails: One-to-Many
Applicant to DocumentProof: One-to-Many
Applicant to ParentDetails: One-to-Many
# Roles and Permissions
The system defines various user roles with distinct access levels:

Administrator: Full access to all tables and data.
Data Entry Operator: Can add and update applicant information, addresses, communication details, and document proofs.
Auditor: Read-only access to all tables for audit purposes.
Customer Support: Access to applicant information and communication details to assist applicants.
Applicant: Access to view and update their own application status and details (if implementing an applicant portal).
Each role is assigned specific permissions to ensure data security, adhere to privacy standards, and maintain the principle of least privilege.

