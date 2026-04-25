- Created **risk categories** (Low / Medium / High)  
- Derived **length of stay categories**  
- Classified patient behavior (Frequent vs Normal readmissions)  


CREATE TABLE cleaned_hospital AS
SELECT
    *,

    -- Risk category
    CASE
        WHEN readmission_risk_score < 0.4 THEN 'Low'
        WHEN readmission_risk_score < 0.7 THEN 'Medium'
        ELSE 'High'
    END AS risk_category,

    -- Length of stay category
    CASE
        WHEN length_of_stay <= 3 THEN 'Short'
        WHEN length_of_stay <= 7 THEN 'Medium'
        ELSE 'Long'
    END AS stay_category,

    -- Patient behavior
    CASE
        WHEN prev_readmissions >= 3 THEN 'Frequent'
        ELSE 'Normal'
    END AS patient_type

FROM hospital_stagelayer;
