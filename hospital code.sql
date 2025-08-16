select * from patients_health_records_dirty_10k;

select count(*) from patients_health_records_dirty_10k;

create table patients_health like patients_health_records_dirty_10k;
select * from patients_health ;

insert into patients_health select * from patients_health_records_dirty_10k;
select count(*) from patients_health;
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN patient_id IS NULL THEN 1 ELSE 0 END) AS null_patient_id,
    SUM(CASE WHEN name IS NULL OR name = '' THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN gender IS NULL OR gender = '' THEN 1 ELSE 0 END) AS null_gender,
    SUM(CASE WHEN blood_type IS NULL OR blood_type = '' THEN 1 ELSE 0 END) AS null_blood_type,
    SUM(CASE WHEN height_cm IS NULL THEN 1 ELSE 0 END) AS null_height,
    SUM(CASE WHEN weight_kg IS NULL THEN 1 ELSE 0 END) AS null_weight,
    SUM(CASE WHEN diagnosis IS NULL OR diagnosis = '' THEN 1 ELSE 0 END) AS null_diagnosis,
    SUM(CASE WHEN visit_date IS NULL THEN 1 ELSE 0 END) AS null_visit_date,
    SUM(CASE WHEN hospital_id IS NULL OR hospital_id = '' THEN 1 ELSE 0 END) AS null_hospital_id,
    SUM(CASE WHEN medication IS NULL OR medication = '' THEN 1 ELSE 0 END) AS null_medication
FROM patients_health;



SELECT *
FROM patients_health
WHERE 
    patient_id IS NULL OR patient_id = '' 
    OR name IS NULL OR name = '' 
    OR age IS NULL OR age < 0 OR age > 120
    OR gender IS NULL OR gender NOT IN ('Male','Female')
    OR blood_type IS NULL OR blood_type NOT IN ('A+','A-','B+','B-','AB+','AB-','O+','O-')
    OR height_cm IS NULL OR height_cm < 50 OR height_cm > 250
    OR weight_kg IS NULL OR weight_kg < 2 OR weight_kg > 300
    OR diagnosis IS NULL OR diagnosis = ''
    OR visit_date IS NULL OR visit_date = '' 
    OR hospital_id IS NULL OR hospital_id = ''
    OR medication IS NULL OR medication = '';



-- Fix common typos and inconsistencies
UPDATE patients_health
SET gender = 'Male'
WHERE LOWER(gender) IN ('m', 'male', 'man');

UPDATE patients_health
SET gender = 'Female'
WHERE LOWER(gender) IN ('f', 'female', 'femle', 'woman', 'girl');

-- Optional: set unknown values to NULL
UPDATE patients_health 
SET gender = NULL
WHERE gender NOT IN ('Male', 'Female');


select * from  patients_health;


-- Remove invalid dates (e.g., 32-13-2020)
UPDATE  patients_health
SET visit_date = NULL
WHERE visit_date NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

-- Ensure consistent format (uppercase, valid types)
UPDATE patients_health
SET blood_type = UPPER(blood_type);

UPDATE  patients_health
SET blood_type = 'Unknown'
WHERE blood_type IS NULL OR blood_type = '';

-- Set extreme ages outside normal human range to NULL
UPDATE patients_health
SET age = null
WHERE age < 0 OR age > 120;

-- Set unrealistic heights (<50 cm or >250 cm) to NULL
UPDATE patients_health
SET height_cm = NULL
WHERE height_cm < 50 OR height_cm > 250;

-- Set unrealistic weights (<2 kg or >300 kg) to NULL
UPDATE patients_health
SET weight_kg = NULL
WHERE weight_kg < 2 OR weight_kg > 300;


UPDATE patients_health
SET height_cm = 'Unknown'
WHERE height_cm IS NULL OR hieght_cm = '';


UPDATE patients_health
SET name = 'Unknown'
WHERE name IS NULL OR name = '';

select * from patients_health;

UPDATE patients_health
SET medication = 'Unknown'
WHERE medication IS NULL OR medication = '';

SELECT 
    CASE 
        WHEN age = -1 THEN 'Unknown'
        ELSE age
    END AS age
FROM patients_health;

UPDATE patients_health
SET age = -1
WHERE age IS NULL OR age = '';


UPDATE patients_health
SET height_cm = -1
WHERE height_cm IS NULL OR height_cm = '';



UPDATE patients_health
SET weight_kg = -1
WHERE weight_kg IS NULL OR weight_kg = '';

UPDATE patients_health
SET hospital_id = 'Unknown'
WHERE hospital_id IS NULL OR hospital_id = '';


DESCRIBE patients_health;

ALTER TABLE patients_health
MODIFY visit_date DATE;


UPDATE patients_health
SET visit_date = '1900-01-01'
WHERE visit_date IS NULL;

ALTER TABLE patients_health
MODIFY visit_date DATE DEFAULT '1900-01-01' NOT NULL;


select * from patients_health;
