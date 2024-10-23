CREATE DATABASE IF NOT EXISTS healthcare_analytics;
USE healthcare_analytics;
DROP TABLE IF EXISTS train_df;
CREATE TABLE train_df (
    age INT,
    gender VARCHAR(10),
    primary_diagnosis VARCHAR(100),
    num_procedures INT,
    days_in_hospital INT,
    comorbidity_score INT,
    discharge_to VARCHAR(100),
    readmitted INT
);
SELECT 
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN primary_diagnosis IS NULL THEN 1 ELSE 0 END) AS missing_primary_diagnosis,
    SUM(CASE WHEN num_procedures IS NULL THEN 1 ELSE 0 END) AS missing_num_procedures,
    SUM(CASE WHEN days_in_hospital IS NULL THEN 1 ELSE 0 END) AS missing_days_in_hospital,
    SUM(CASE WHEN comorbidity_score IS NULL THEN 1 ELSE 0 END) AS missing_comorbidity_score,
    SUM(CASE WHEN discharge_to IS NULL THEN 1 ELSE 0 END) AS missing_discharge_to,
    SUM(CASE WHEN readmitted IS NULL THEN 1 ELSE 0 END) AS missing_readmitted
FROM train_df;
SELECT age, gender, primary_diagnosis, num_procedures, days_in_hospital, comorbidity_score, discharge_to, readmitted, COUNT(*) 
FROM train_df
GROUP BY age, gender, primary_diagnosis, num_procedures, days_in_hospital, comorbidity_score, discharge_to, readmitted
HAVING COUNT(*) > 1;
SET SQL_SAFE_UPDATES = 0;

WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY age, gender, primary_diagnosis, num_procedures, days_in_hospital, comorbidity_score, discharge_to, readmitted
                              ORDER BY (SELECT NULL)) AS row_num
    FROM train_df
)
DELETE t
FROM train_df t
JOIN cte ON t.age = cte.age
          AND t.gender = cte.gender
          AND t.primary_diagnosis = cte.primary_diagnosis
          AND t.num_procedures = cte.num_procedures
          AND t.days_in_hospital = cte.days_in_hospital
          AND t.comorbidity_score = cte.comorbidity_score
          AND t.discharge_to = cte.discharge_to
          AND t.readmitted = cte.readmitted
WHERE cte.row_num > 1;
SELECT 
    AVG(days_in_hospital) AS avg_days_in_hospital,
    MIN(days_in_hospital) AS min_days_in_hospital,
    MAX(days_in_hospital) AS max_days_in_hospital
FROM train_df;
SELECT gender, COUNT(*) AS num_patients
FROM train_df
GROUP BY gender;
SELECT primary_diagnosis, 
       COUNT(*) AS total_patients, 
       SUM(readmitted) AS total_readmitted, 
       (SUM(readmitted) / COUNT(*)) * 100 AS readmission_rate
FROM train_df
GROUP BY primary_diagnosis;
SELECT age, 
       COUNT(*) AS total_patients, 
       SUM(readmitted) AS total_readmitted, 
       (SUM(readmitted) / COUNT(*)) * 100 AS readmission_rate
FROM train_df
GROUP BY age;
SELECT comorbidity_score, 
       COUNT(*) AS total_patients, 
       SUM(readmitted) AS total_readmitted, 
       (SUM(readmitted) / COUNT(*)) * 100 AS readmission_rate
FROM train_df
GROUP BY comorbidity_score;
SELECT age, comorbidity_score, 
       COUNT(*) AS total_patients, 
       SUM(readmitted) AS total_readmitted, 
       (SUM(readmitted) / COUNT(*)) * 100 AS readmission_rate
FROM train_df
GROUP BY age, comorbidity_score;
