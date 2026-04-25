-- Check duplicate patient records
SELECT patient_id, COUNT(*) AS record_count
FROM hospital_readmission
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- Check missing values (key fields)
SELECT
    COUNT(*) - COUNT(patient_id) AS missing_patient_id,
    COUNT(*) - COUNT(age) AS missing_age,
    COUNT(*) - COUNT(gender) AS missing_gender
FROM hospital_readmission;
