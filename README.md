# Healthcare_Project

### 📌 Project Overview

This project focuses on transforming raw healthcare data into a clean, structured dataset and building an interactive Tableau dashboard.
The goal is to provide hospital managers and healthcare administrators with real-time insights into patient demographics, diagnoses, hospital workloads, and health trends.

### Data Source

- Dataset: Patient records (includes patient_id, age, gender, height, weight, BMI, diagnosis, hospital, visit_date).
- Source: Provided as a CSV file.
- Size: 10,000

### 🛠 Tools

- Mysql → Data cleaning & preprocessing
- Tableau → Visualization & dashboard design
- GitHub → Project documentation and sharing

### 🧹 Data Cleaning Process

1 Removed duplicate records
2 Handled missing values (imputed or dropped depending on column importance)
3 Converted data types (e.g., dates to datetime, numeric fields to integers/floats)
4 Validated data ranges (e.g., age > 0, height and weight realistic values)

### 🔍 Exploratory Data Analysis (EDA)

- Distribution of patient age groups
- Gender balance across patients
- Hospital-level patient counts
- Common diagnoses by age & gender
- Trend of patient visits over time

### 📈 Data Analysis

```
SELECT 
    CASE 
        WHEN age = -1 THEN 'Unknown'
        ELSE age
    END AS age
FROM patients_health;

UPDATE patients_health
SET age = -1
WHERE age IS NULL OR age = '';
```

Interactive filters included:

- Hospital id
- Gender
- Diagnosis
- Age
- Valid visit date

### 🖼 Dashboard Preview
![hospital image dash](https://github.com/user-attachments/assets/36e48a46-4b50-4ebf-ac1b-7a80699c7328)


### ✅ Results

Built a fully interactive Tableau dashboard with KPI cards, bar charts, pie charts, and trend lines.

Provided insights into:

- Age and gender distribution
- Most common diagnoses
- Workload differences between hospitals
- Monthly/annual patient visit patterns

### Recommendations

- Allocate resources to hospitals with higher patient loads
- Monitor rising diagnoses (e.g., chronic diseases) and plan preventive care
- Track BMI & age groups to design targeted health programs
- Use dashboard filters regularly for real-time decision making instead of waiting for manual reports
