- Standardized categorical values (lowercase, trimmed)  
- Converted date formats for consistency  

CREATE TABLE hospital_stagelayer AS
SELECT
    patient_id,
    STR_TO_DATE(admission_date, '%Y-%m-%d') AS admission_date,

    age,
    LOWER(TRIM(season)) AS season,
    LOWER(TRIM(gender)) AS gender,
    LOWER(TRIM(region)) AS region,
    LOWER(TRIM(primary_diagnosis)) AS primary_diagnosis,

    comorbidities_count,
    length_of_stay,
    LOWER(TRIM(treatment_type)) AS treatment_type,
    medications_count,
    followup_visits_last_year,
    prev_readmissions,

    LOWER(TRIM(insurance_type)) AS insurance_type,
    LOWER(TRIM(discharge_disposition)) AS discharge_disposition,

    readmission_risk_score,
    label
FROM hospital_readmission;
