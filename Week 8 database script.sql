CREATE DATABASE health_db;
USE health_db;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    Address VARCHAR(255)
);
INSERT INTO Patients (Name, Age, Gender, Address) VALUES
('John Doe', 45, 'Male', '123 Elm St'),
('Jane Smith', 38, 'Female', '456 Oak St'),
('Emily Johnson', 50, 'Female', '789 Pine St'),
('Michael Brown', 60, 'Male', '101 Maple St'),
('Sarah Davis', 29, 'Female', '202 Birch St'),
('David Wilson', 54, 'Male', '303 Cedar St'),
('Laura Martinez', 41, 'Female', '404 Walnut St'),
('Chris Anderson', 35, 'Male', '505 Ash St'),
('Olivia Taylor', 47, 'Female', '606 Spruce St'),
('Daniel Thomas', 52, 'Male', '707 Fir St');
CREATE TABLE DiabetesRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DiagnosisDate DATE,
    BloodSugarLevel DECIMAL(5,2),
    TreatmentPlan TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
INSERT INTO DiabetesRecords (PatientID, DiagnosisDate, BloodSugarLevel, TreatmentPlan) VALUES
(1, '2024-01-15', 180, 'Metformin 500mg twice daily'),
(2, '2024-02-10', 210, 'Insulin therapy, 30 units daily'),
(3, '2024-03-05', 220, 'Metformin 1000mg daily'),
(4, '2024-04-22', 190, 'Insulin therapy, 25 units daily'),
(5, '2024-05-17', 160, 'Metformin 500mg once daily'),
(6, '2024-06-20', 200, 'Metformin 1000mg twice daily'),
(7, '2024-07-14', 230, 'Insulin therapy, 40 units daily'),
(8, '2024-08-30', 170, 'Metformin 500mg twice daily'),
(9, '2024-09-18', 250, 'Insulin therapy, 35 units daily'),
(10, '2024-10-25', 180, 'Metformin 1000mg daily');
CREATE TABLE LifestyleFactors (
    FactorID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    ExerciseFrequency ENUM('Never', 'Rarely', 'Sometimes', 'Often', 'Always'),
    DietType ENUM('Vegetarian', 'Non-Vegetarian', 'Vegan', 'Other'),
    SmokingStatus ENUM('Yes', 'No'),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
INSERT INTO LifestyleFactors (PatientID, ExerciseFrequency, DietType, SmokingStatus) VALUES
(1, 'Sometimes', 'Non-Vegetarian', 'No'),
(2, 'Rarely', 'Vegan', 'Yes'),
(3, 'Often', 'Other', 'No'),
(4, 'Always', 'Non-Vegetarian', 'No'),
(5, 'Never', 'Vegetarian', 'No'),
(6, 'Sometimes', 'Other', 'Yes'),
(7, 'Often', 'Vegan', 'No'),
(8, 'Never', 'Vegetarian', 'No'),
(9, 'Rarely', 'Vegan', 'Yes'),
(10, 'Always', 'Non-Vegetarian', 'No');
CREATE TABLE HealthCenters (
    CenterID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(255),
    ServicesOffered TEXT
);
INSERT INTO HealthCenters (Name, Location, ServicesOffered) VALUES
('Springfield Wellness Center', '123 Main St', 'General health, diabetes management, nutrition counseling'),
('Elm Street Clinic', '456 Elm St', 'Diabetes care, physical therapy, lab services'),
('Pine Ridge Health', '789 Pine St', 'Diabetes treatment, weight management, mental health services'),
('Maple Leaf Hospital', '101 Maple St', 'Emergency care, diabetes management, specialist consultations'),
('Birchwood Health Center', '202 Birch St', 'Diabetes care, preventive health, family medicine'),
('Cedar Park Clinic', '303 Cedar St', 'Chronic disease management, diabetes care, wellness programs'),
('Walnut Grove Hospital', '404 Walnut St', 'Diabetes care, surgery, inpatient services'),
('Ashwood Medical Center', '505 Ash St', 'Diabetes treatment, physical therapy, nutrition services'),
('Spruce Valley Clinic', '606 Spruce St', 'Diabetes management, mental health support, chronic care'),
('Fir Street Health Center', '707 Fir St', 'General health, diabetes care, preventive screenings');
SELECT * FROM DiabetesRecords;
SELECT p.Name, d.DiagnosisDate, d.BloodSugarLevel
FROM Patients p
JOIN DiabetesRecords d ON p.PatientID = d.PatientID;
SELECT
    CASE
        WHEN Age < 40 THEN 'Under 40'
        WHEN Age BETWEEN 40 AND 60 THEN '40-60'
        ELSE 'Above 60'
    END AS AgeGroup,
    AVG(BloodSugarLevel) AS AvgBloodSugar
FROM Patients p
JOIN DiabetesRecords d ON p.PatientID = d.PatientID
GROUP BY AgeGroup;
SELECT SmokingStatus, COUNT(*) AS PatientCount
FROM LifestyleFactors
GROUP BY SmokingStatus;


