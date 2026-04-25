- `vw_patient_details` → Main dataset for reporting  
 
CREATE VIEW vw_patient_details AS
SELECT
    patient_id,
    admission_date,
    age,
    age_group,
    gender,
    region,
    primary_diagnosis,

    comorbidities_count,
    length_of_stay,
    stay_category,

    prev_readmissions,
    patient_type,

    insurance_type,
    discharge_disposition,

    readmission_risk_score,
    risk_category,
    label
FROM cleaned_hospital;


- `vw\_readmission\_summary` → KPI metrics


CREATE VIEW vw_readmission_summary AS
SELECT
    COUNT(*) AS total_patients,
    SUM(label) AS readmissions,
    AVG(label) AS readmission_rate,
    AVG(readmission_risk_score) AS avg_risk_score
FROM cleaned_hospital;


- `vw\_diagnosis\_analysis` → Diagnosis-level insights


CREATE VIEW vw_diagnosis_analysis AS
SELECT
    primary_diagnosis,
    COUNT(*) AS patient_count,
    AVG(label) AS readmission_rate
FROM cleaned_hospital
GROUP BY primary_diagnosis;


- `vw\_risk\_vs\_actual` → Risk segmentation validation


CREATE VIEW vw_risk_vs_actual AS
SELECT
    risk_category,
    COUNT(*) AS patient_count,
    AVG(label) AS actual_readmission_rate
FROM cleaned_hospital
GROUP BY risk_category;
