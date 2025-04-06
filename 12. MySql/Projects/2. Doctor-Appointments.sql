-- Doctor Appointments 
-- Allow patients to book a doctor appointment on a specified date and time with a doctor, 
-- record when the patient arrives at the clinic, and record when the patient has completed 
-- their appontment with the doctor

-- Create Database
CREATE DATABASE IF NOT EXISTS doctor_appointments;

-- Use Database
USE doctor_appointments;

-- Create Table
-- 1. Clinics Table
CREATE TABLE IF NOT EXISTS clinics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. Doctors Tables
CREATE TABLE IF NOT EXISTS doctors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. Patients Tables
CREATE TABLE IF NOT EXISTS patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4. Appointments Table
CREATE TABLE IF NOT EXISTS appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_datetime DATETIME NOT NULL,
    arrival_time DATETIME NULL,
    completed_time DATETIME NULL,
    status ENUM('scheduled', 'arrived', 'completed', 'canceled') DEFAULT 'scheduled',
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    clinic_id INT NOT NULL,
    FOREIGN KEY (patient_id)
        REFERENCES patients (id)
        ON DELETE CASCADE,
    FOREIGN KEY (doctor_id)
        REFERENCES doctors (id)
        ON DELETE CASCADE,
    FOREIGN KEY (clinic_id)
        REFERENCES clinics (id)
        ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert Patients
-- INSERT INTO patients (first_name, last_name, phone, email) VALUES
-- ('John', 'Doe', '9876543210', 'john.doe@example.com'),
-- ('Jane', 'Smith', '9123456789', 'jane.smith@example.com'),
-- ('Alice', 'Johnson', '9345678901', 'alice.johnson@example.com'),
-- ('Robert', 'Williams', '9456789012', 'robert.williams@example.com'),
-- ('Emma', 'Brown', '9567890123', 'emma.brown@example.com'),
-- ('Michael', 'Davis', '9678901234', 'michael.davis@example.com'),
-- ('Sophia', 'Clark', '9789012345', 'sophia.clark@example.com'),
-- ('William', 'Hall', '9890123456', 'william.hall@example.com'),
-- ('Olivia', 'Miller', '9901234567', 'olivia.miller@example.com'),
-- ('James', 'Anderson', '9012345678', 'james.anderson@example.com');

-- Insert Doctors
-- INSERT INTO doctors (first_name, last_name, specialization, phone, email) VALUES
-- ('Dr. Robert', 'Brown', 'Cardiologist', '9234567890', 'robert.brown@example.com'),
-- ('Dr. Emily', 'Davis', 'Dermatologist', '9567890123', 'emily.davis@example.com'),
-- ('Dr. Michael', 'Clark', 'Pediatrician', '9678901234', 'michael.clark@example.com'),
-- ('Dr. Sarah', 'Wilson', 'Neurologist', '9789012345', 'sarah.wilson@example.com'),
-- ('Dr. John', 'Taylor', 'Orthopedic', '9890123456', 'john.taylor@example.com'),
-- ('Dr. Anna', 'Moore', 'Gynecologist', '9901234567', 'anna.moore@example.com'),
-- ('Dr. David', 'White', 'General Physician', '9012345678', 'david.white@example.com'),
-- ('Dr. Jennifer', 'Martin', 'ENT Specialist', '9123456789', 'jennifer.martin@example.com');

-- -- Insert Clinics
-- INSERT INTO clinics (name, address) VALUES
-- ('City Health Clinic', '123 Main Street, New York'),
-- ('Sunrise Hospital', '456 Elm Street, Los Angeles'),
-- ('Wellness Center', '789 Oak Avenue, Chicago'),
-- ('Greenfield Medical', '159 Pine Lane, Houston'),
-- ('Hope Hospital', '753 Willow Street, San Francisco'),
-- ('CarePlus Clinic', '369 Maple Road, Miami');

-- -- Insert Appointments
-- INSERT INTO appointments (appointment_datetime, arrival_time, completed_time, status, patient_id, clinic_id, doctor_id) VALUES
-- ('2024-03-18 10:00:00', '2024-03-18 09:55:00', '2024-03-18 10:30:00', 'completed', 1, 1, 1),
-- ('2024-03-19 14:30:00', NULL, NULL, 'scheduled', 2, 2, 2),
-- ('2024-03-20 16:00:00', '2024-03-20 15:55:00', NULL, 'arrived', 3, 3, 3),
-- ('2024-03-21 09:00:00', '2024-03-21 08:55:00', '2024-03-21 09:30:00', 'completed', 4, 4, 4),
-- ('2024-03-22 11:30:00', NULL, NULL, 'scheduled', 5, 5, 5),
-- ('2024-03-23 13:00:00', '2024-03-23 12:55:00', NULL, 'arrived', 6, 6, 6),
-- ('2024-03-24 15:00:00', '2024-03-24 14:55:00', '2024-03-24 15:30:00', 'completed', 7, 1, 7),
-- ('2024-03-25 17:30:00', NULL, NULL, 'scheduled', 8, 2, 8),
-- ('2024-03-26 10:30:00', '2024-03-26 10:25:00', '2024-03-26 11:00:00', 'completed', 9, 3, 1),
-- ('2024-03-27 12:00:00', '2024-03-27 11:55:00', NULL, 'arrived', 10, 4, 2),
-- ('2024-03-28 14:00:00', NULL, NULL, 'scheduled', 1, 5, 3),
-- ('2024-03-29 16:30:00', '2024-03-29 16:25:00', '2024-03-29 17:00:00', 'completed', 2, 6, 4),
-- ('2024-03-30 18:00:00', NULL, NULL, 'scheduled', 3, 1, 5),
-- ('2024-03-31 09:30:00', '2024-03-31 09:25:00', NULL, 'arrived', 4, 2, 6),
-- ('2024-04-01 11:00:00', NULL, NULL, 'scheduled', 5, 3, 7),
-- ('2024-04-02 13:30:00', '2024-04-02 13:25:00', '2024-04-02 14:00:00', 'completed', 6, 4, 8),
-- ('2024-04-03 15:00:00', NULL, NULL, 'scheduled', 7, 5, 1),
-- ('2024-04-04 17:30:00', '2024-04-04 17:25:00', NULL, 'arrived', 8, 6, 2),
-- ('2024-04-05 10:00:00', NULL, NULL, 'scheduled', 9, 1, 3),
-- ('2024-04-06 12:30:00', '2024-04-06 12:25:00', '2024-04-06 13:00:00', 'completed', 10, 2, 4);

-- INSERT INTO doctors (first_name, last_name, specialization, phone, email) VALUES
-- ('Dr. Daniel', 'Lee', 'Cardiologist', '9023456789', 'daniel.lee@example.com'),
-- ('Dr. Sophia', 'Harris', 'Dermatologist', '9134567890', 'sophia.harris@example.com'),
-- ('Dr. Ethan', 'Walker', 'Pediatrician', '9245678901', 'ethan.walker@example.com');


-- INSERT INTO appointments (appointment_datetime, arrival_time, completed_time, status, patient_id, clinic_id, doctor_id) VALUES
-- -- Missed Appointments (arrival_time NULL, past date)
-- ('2024-03-10 10:30:00', NULL, NULL, 'missed', 1, 1, 1),
-- ('2024-03-12 14:00:00', NULL, NULL, 'missed', 2, 2, 2),

-- -- Repeated Patients
-- ('2024-03-14 11:00:00', '2024-03-14 10:55:00', '2024-03-14 11:30:00', 'completed', 3, 3, 3),
-- ('2024-03-18 16:00:00', '2024-03-18 15:55:00', '2024-03-18 16:30:00', 'completed', 3, 4, 4),
-- ('2024-03-20 09:30:00', '2024-03-20 09:25:00', '2024-03-20 10:00:00', 'completed', 3, 5, 5),

-- -- Future Appointments
-- ('2025-04-15 14:00:00', NULL, NULL, 'scheduled', 4, 1, 6),
-- ('2025-04-16 09:30:00', NULL, NULL, 'scheduled', 5, 2, 7),
-- ('2025-04-17 12:00:00', NULL, NULL, 'scheduled', 6, 3, 8),
-- ('2025-04-18 15:00:00', NULL, NULL, 'scheduled', 7, 4, 1);


-- 1. Get all upcoming appointments
-- Write a query to retrieve all future appointments (from today onwards).
-- SELECT * FROM appointments a WHERE a.appointment_datetime > NOW();

-- 2. List all doctors working in a specific clinic
-- Given a clinic_id = 2, find all doctors who have appointments in that clinic.
-- SELECT DISTINCT
--     c.name,
--     CONCAT(d.first_name, ' ', d.last_name) AS doctor_name
-- FROM
--     appointments a
--         JOIN
--     doctors d ON a.doctor_id = d.id
--         JOIN
--     clinics c ON a.clinic_id = c.id
-- WHERE
--     c.id = 2;

-- 3. Find the total number of patients
-- Write a query to count how many patients are registered in the database.
-- SELECT COUNT(*) AS total_patients FROM patients;

-- 4. Show all appointments for a specific patient
-- Given a patient_id = 5, list all of their past and future appointments.
-- SELECT 
--     CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
--     a.appointment_datetime,
--     CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
--     c.name AS clinic_name
-- FROM
--     appointments a
--         JOIN
--     clinics c ON a.clinic_id = c.id
--         JOIN
--     patients p ON a.patient_id = p.id
--         JOIN
--     doctors d ON a.doctor_id = d.id
-- WHERE
--     p.id = 5;

-- 5.  Find doctors who have no appointments yet
-- Retrieve all doctors who haven’t had any appointments booked yet.
-- SELECT 
--     CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
--     a.appointment_datetime
-- FROM
--     appointments a
--         RIGHT JOIN
--     doctors d ON a.doctor_id = d.id
-- WHERE
--     a.id IS NULL;

-- 6.  Find the doctor with the most appointments
-- Identify the doctor who has the highest number of appointments.
-- SELECT 
--     CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
--     COUNT(*) AS appointment_count
-- FROM
--     appointments a
--         JOIN
--     doctors d ON a.doctor_id = d.id
-- GROUP BY d.id
-- ORDER BY appointment_count DESC
-- LIMIT 1;

-- 7. Get the total number of appointments per clinic
-- Show a list of all clinics along with the number of appointments booked in each.
-- SELECT 
--     c.name AS clinic_name, COUNT(*) AS appointment_count
-- FROM
--     appointments a
--         JOIN
--     clinics c ON a.clinic_id = c.id
-- GROUP BY c.id; 

-- 8. Find patients who have visited more than once
-- Get a list of patients who have had more than one appointment.
-- SELECT 
--     CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
--     COUNT(*) AS appointment_count
-- FROM
--     appointments a
--         JOIN
--     patients p ON a.patient_id = p.id
-- GROUP BY p.id
-- HAVING appointment_count > 1
-- ORDER BY appointment_count DESC;

-- 9. Find the busiest time slot for appointments
-- Identify the most common appointment_time that doctors get booked.

-- 10. Find patients who have missed their appointments
-- Show all appointments where arrival_time is NULL but the appointment_datetime has passed
-- SELECT 
--     CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
--     a.arrival_time,
--     a.appointment_datetime,
--     a.status
-- FROM
--     appointments a
--         JOIN
--     patients p ON a.patient_id = p.id
-- WHERE
--     a.arrival_time IS NULL
--         AND a.appointment_datetime < NOW();