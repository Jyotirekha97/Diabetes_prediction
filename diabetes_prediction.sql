use Diabetes_prediction_data;
select * from Diabetes_prediction_data;

/*1. Retrieve the Patient_id and ages of all patients.*/

select Patient_id,Employee_Name,Age from Diabetes_prediction_data;

/*2. Select all female patients who are older than 40.*/

select patient_id,Employee_Name,Age from Diabetes_prediction_data where Gender='Female' and age>40;

/*3. Calculate the average BMI of patients.*/

select AVG(BMI) AS Average_BMI_of_patients FROM Diabetes_prediction_data;

/*4. List patients in descending order of blood glucose levels.*/

select * from Diabetes_prediction_data order by blood_Glucose_level desc;

/*5. Find patients who have hypertension and diabetes.*/

select * from Diabetes_prediction_data where Hypertension=1 and Diabetes=1;

/*6. Determine the number of patients with heart disease */

select count(*) as number_of_patients_with_heart_disease from Diabetes_prediction_data where Heart_Disease=1;

/*7. Group patients by smoking history and count how many smokers and nonsmokers there are.*/
SELECT
    SUM(CASE WHEN Smoking_History IN ('current', 'former','ever','not current') THEN 1 ELSE 0 END) AS smokers,
    SUM(CASE WHEN Smoking_History = 'never' THEN 1 ELSE 0 END) AS nonsmokers
FROM
    Diabetes_prediction_data;

/*8. Retrieve the Patient_ids of patients who have a BMI greater than the average BMI.*/

select Employee_Name,Patient_id,BMI from Diabetes_prediction_data
where BMI>(select avg(BMI) from Diabetes_prediction_data);

/*9. Find the patient with the highest HbA1c level and the patient with the lowest HbA1clevel.*/

 select Employee_Name,Patient_id,HbA1c_level as max_HbA1c_level from Diabetes_prediction_data
 where HbA1c_level=(select max(HbA1c_level)from Diabetes_prediction_data);

 select Employee_Name,Patient_id,HbA1c_level as min_HbA1c_level  from Diabetes_prediction_data
 where HbA1c_level=(select min(HbA1c_level)from Diabetes_prediction_data);




/*11. Rank patients by blood glucose level within each gender group.*/

SELECT
    Patient_id,
    Gender,
    blood_Glucose_level,
    RANK() OVER (PARTITION BY Gender ORDER BY blood_Glucose_level DESC) AS GlucoseLevelRank
FROM
    Diabetes_prediction_data;

/*12. Update the smoking history of patients who are older than 50 to "Ex-smoker."*/

UPDATE Diabetes_prediction_data
SET Smoking_History = 'Ex-smoker'
WHERE Age > 50;
select Employee_Name,Patient_id,Age,Smoking_History from Diabetes_prediction_data where Age>50;

/*13. Insert a new patient into the database with sample data.*/


select * from Diabetes_prediction_data

INSERT INTO Diabetes_prediction_data (Employee_Name, Patient_id, Gender, Age, Hypertension, Heart_Disease, Smoking_History, BMI, HbA1c_level,blood_Glucose_level,Diabetes)
VALUES ('John Doe', 'PT113', 'Male', 55, 1, 0, 'current', 28.45, 6.2, 120, 1);

select * from Diabetes_prediction_data where Employee_Name='John Doe'

/*14. Delete all patients with heart disease from the database.*/

DELETE FROM Diabetes_prediction_data
WHERE Heart_Disease = 1;

select * from Diabetes_prediction_data

/*15. Find patients who have hypertension but not diabetes using the EXCEPT operator.*/

-- Patients with hypertension
SELECT Employee_Name,Patient_id
FROM Diabetes_prediction_data
WHERE Hypertension = 1

EXCEPT

-- Patients with both hypertension and diabetes
SELECT Employee_Name,Patient_id
FROM Diabetes_prediction_data
WHERE Hypertension = 1 AND Diabetes = 1;

/*16. Define a unique constraint on the "patient_id" column to ensure its values are unique.*/

ALTER TABLE Diabetes_prediction_data
ADD CONSTRAINT UQ_PatientID UNIQUE (Patient_id);

/*17. Create a view that displays the Patient_ids, ages, and BMI of patients*/

CREATE VIEW PatientInfoView AS
SELECT
    Patient_id,
    Age,
    BMI
FROM
    Diabetes_prediction_data;

SELECT * FROM PatientInfoView;



























 




