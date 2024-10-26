Healthcare Analytics Project

Welcome to the Healthcare Analytics Project! This project uses a healthcare dataset sourced from Kaggle to analyze patient health data, focusing on patterns in readmission rates, length of stay, and key health metrics. By exploring patient demographics and health outcomes, this project provides insights that can guide decision-making to improve patient care and optimize hospital resources.

Project Overview

This project includes:

	1.	Database Setup: Creation of a structured database using Kaggle data.
	2.	Data Quality Checks: Verification of missing values and duplicate records to ensure data integrity.
	3.	Exploratory Analysis: Examination of hospital stay durations, patient demographics, readmission rates by diagnosis, and the impact of comorbidities.

Project Objectives

The main objectives of this project are:

	•	To build a structured and reliable database.
	•	To ensure data quality through comprehensive checks.
	•	To analyze key metrics like readmission rates by diagnosis, age, gender, and comorbidity scores.
	•	To provide actionable insights into patient demographics, length of stay, and readmission patterns.

Dataset

The dataset used in this project is sourced from Kaggle and includes information on:

	•	Patient Demographics: Age, gender, and primary diagnosis.
	•	Hospital Metrics: Number of procedures, days in hospital, and discharge destinations.
	•	Readmission: Whether or not a patient was readmitted.

Data Quality

The dataset has been checked for missing values and duplicates, ensuring high data quality for analysis.

Methods and Analyses

1. Database Creation and Table Structure

Created a new database (healthcare_analytics) with a table named train_df containing columns for age, gender, primary diagnosis, procedures, length of stay, comorbidity scores, discharge destinations, and readmission.

2. Data Quality Checks

	•	Missing Value Check: Verified missing values across all columns.
	•	Duplicate Removal: Utilized SQL CTE and ROW_NUMBER() to remove duplicate entries and retain unique records.

3. Exploratory Analysis

	•	Length of Stay Analysis: Calculated average, minimum, and maximum days spent in the hospital.
	•	Demographic Analysis: Grouped data by gender and primary diagnosis.
	•	Readmission Analysis:
	•	By Primary Diagnosis: Analyzed total patients, readmissions, and readmission rates per diagnosis.
	•	By Age: Analyzed readmission trends based on age.
	•	By Comorbidity Score: Examined readmission rates by comorbidity level.
	•	Combined Analysis:
	•	By Age and Comorbidity Score: Analyzed interaction between age and comorbidities in readmission rates.

Key Findings

	•	Length of Stay: Insights on hospital stay durations for resource management.
	•	Readmission Trends: Identification of high-risk groups by diagnosis, comorbidities, and age.
	•	Demographic Insights: Gender and diagnosis-specific trends in patient readmissions.

Project Structure

	•	/data/: Initial Kaggle dataset and data files.
	•	/scripts/: SQL scripts for database setup, data cleaning, and analysis.
	•	/documentation/: Detailed documentation of findings, insights, and recommendations.

Getting Started

Prerequisites

	•	SQL environment (e.g., MySQL)
	•	Data visualization and reporting tools (optional)

Installation

	1.	Clone this repository:

git clone https://github.com/vishnupv7/health_data_project.git


	2.	Run the SQL scripts in /scripts/ to create and analyze the healthcare data in your SQL environment.