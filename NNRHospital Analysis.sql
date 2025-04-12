-- Create a database for healthcare analysis
CREATE DATABASE HealthcareDB;
USE HealthcareDB;

-- Create a table for patient records
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other'),
    DOB DATE,
    ContactNumber VARCHAR(15),
    Address TEXT
);

-- Create a table for diagnoses
CREATE TABLE Diagnoses (
    DiagnosisID INT PRIMARY KEY,
    PatientID INT,
    DiagnosisDate DATE,
    DiagnosisDescription TEXT,
    DoctorName VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Create a table for hospital visits
CREATE TABLE HospitalVisits (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    VisitDate DATE,
    VisitReason TEXT,
    TreatmentGiven TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert sample data
INSERT INTO Patients (PatientID, FirstName, LastName, Gender, DOB, ContactNumber, Address) VALUES
(1, 'John', 'Doe', 'Male', '1985-07-12', '123-456-7890', '123 Main St, City, Country'),
(2, 'Jane', 'Smith', 'Female', '1990-03-22', '987-654-3210', '456 Oak St, City, Country');

INSERT INTO Diagnoses (DiagnosisID, PatientID, DiagnosisDate, DiagnosisDescription, DoctorName) VALUES
(1, 1, '2024-01-15', 'Hypertension', 'Dr. Roberts'),
(2, 2, '2024-02-10', 'Diabetes Type II', 'Dr. Brown');

INSERT INTO HospitalVisits (VisitID, PatientID, VisitDate, VisitReason, TreatmentGiven) VALUES
(1, 1, '2024-03-05', 'Routine Checkup', 'Blood Pressure Medication'),
(2, 2, '2024-04-12', 'Diabetes Consultation', 'Dietary Guidance & Medication');

-- Retrieve patient details along with diagnoses
SELECT p.PatientID, p.FirstName, p.LastName, p.Gender, d.DiagnosisDate, d.DiagnosisDescription, d.DoctorName
FROM Patients p
JOIN Diagnoses d ON p.PatientID = d.PatientID;

-- Retrieve hospital visit history for each patient
SELECT p.FirstName, p.LastName, h.VisitDate, h.VisitReason, h.TreatmentGiven
FROM Patients p
JOIN HospitalVisits h ON p.PatientID = h.PatientID;
