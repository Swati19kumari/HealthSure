drop database if exists healthsure;

create database healthsure;
use healthsure;

CREATE TABLE Recipient (
    h_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    mobile VARCHAR(10) UNIQUE NOT NULL,
    user_name VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('MALE', 'FEMALE') NOT NULL,
    dob DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    status ENUM('ACTIVE', 'INACTIVE', 'BLOCKED') DEFAULT 'ACTIVE',
    login_attempts INT DEFAULT 0,
    locked_until DATETIME DEFAULT NULL,
    last_login DATETIME DEFAULT NULL,
    password_updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE otp (
    otp_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) UNIQUE NOT NULL,
    otp_code INT NOT NULL,
    new_password VARCHAR(255),
    status ENUM('PENDING', 'VERIFIED', 'EXPIRED') DEFAULT 'PENDING',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_at DATETIME NOT NULL,
    purpose ENUM('REGISTER','FORGOT_PASSWORD') NOT NULL,
    FOREIGN KEY (user_name) REFERENCES Recipient(user_name) ON DELETE CASCADE
);

-- Abishek
CREATE TABLE providers (
    provider_id VARCHAR(20) PRIMARY KEY,
    provider_name VARCHAR(100) NOT NULL,
    hospital_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(225),
    city VARCHAR(225),
    state VARCHAR(225),
    zipcode VARCHAR(225),
    password VARCHAR(255) NOT NULL,
    status ENUM('PENDING', 'APPROVED', 'REJECTED') DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Doctors (
    doctor_id VARCHAR(20) PRIMARY KEY,
    provider_id VARCHAR(20),
    doctor_name VARCHAR(100) NOT NULL,
    qualification VARCHAR(255),
    specialization VARCHAR(100),
    license_no VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(225) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    type ENUM('STANDARD', 'ADHOC') DEFAULT 'STANDARD',
    doctor_status ENUM('ACTIVE', 'INACTIVE') DEFAULT 'INACTIVE',
    FOREIGN KEY (provider_id) REFERENCES Providers(provider_id)
);

CREATE TABLE Doctor_availability (
    availability_id VARCHAR(36) PRIMARY KEY,
    doctor_id VARCHAR(36) NOT NULL,
    available_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    slot_type ENUM('STANDARD', 'ADHOC') DEFAULT 'STANDARD',
    max_capacity INT NOT NULL DEFAULT 15,
    is_recurring BOOLEAN DEFAULT FALSE,
    notes VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
); 

-- Sandhan--
CREATE TABLE appointment (
    appointment_id VARCHAR(36) PRIMARY KEY,
    provider_id VARCHAR(36) NOT NULL,
    doctor_id VARCHAR(36) NOT NULL,
    h_id VARCHAR(36) NOT NULL,
    availability_id VARCHAR(36) NOT NULL,
    slot_no int NOT NULL,
    requested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    booked_at TIMESTAMP NULL,
    status ENUM('PENDING', 'BOOKED', 'CANCELLED', 'COMPLETED') DEFAULT 'PENDING',
    notes TEXT,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (h_id) REFERENCES Recipient(h_id),
    FOREIGN KEY (availability_id) REFERENCES doctor_availability(availability_id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);

-- Nirmalaya 
CREATE TABLE medical_procedure (
procedure_id VARCHAR(20) PRIMARY KEY,
 appointment_id VARCHAR(20) NOT NULL,
h_id VARCHAR(20) NOT NULL,
provider_id VARCHAR(20) NOT NULL,
doctor_id VARCHAR(20) NOT NULL,
 procedure_date DATE NOT NULL,
 diagnosis TEXT NOT NULL,
recommendations TEXT,
from_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
to_date TIMESTAMP,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id),
FOREIGN KEY (h_id) REFERENCES Recipient(h_id),
 FOREIGN KEY (provider_id) REFERENCES Providers(provider_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
 
CREATE TABLE prescription (
    prescription_id VARCHAR(20) PRIMARY KEY,
    procedure_id VARCHAR(20) NOT NULL,
    h_id VARCHAR(20) NOT NULL,
    provider_id VARCHAR(20) NOT NULL,
    doctor_id VARCHAR(20) NOT NULL,
    written_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (procedure_id) REFERENCES medical_procedure(procedure_id),
    FOREIGN KEY (h_id) REFERENCES Recipient(h_id),
    FOREIGN KEY (provider_id) REFERENCES Providers(provider_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE prescribed_medicines (
    prescribed_id VARCHAR(20) PRIMARY KEY,
    prescription_id VARCHAR(20) NOT NULL,
    medicine_name VARCHAR(255) NOT NULL,
    dosage VARCHAR(100),
    duration VARCHAR(100),
    notes TEXT,
     start_date TIMESTAMP,
    end_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (prescription_id) REFERENCES prescription(prescription_id)
);

CREATE TABLE prescribed_tests (
    test_id VARCHAR(20) PRIMARY KEY,
    prescription_id VARCHAR(20) NOT NULL,
    test_name VARCHAR(100) NOT NULL,
    test_date DATE NOT NULL,
    result_summary TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (prescription_id) REFERENCES prescription(prescription_id)
);


-- 2. Insurance_company Table
-- ================================
CREATE TABLE Insurance_company (
    company_id     VARCHAR(50) PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    logo_url       VARCHAR(255),
    head_office    VARCHAR(255),
    contact_email  VARCHAR(100),
    contact_phone  VARCHAR(20)
);

-- ================================
-- 3. Insurance_plan Table
-- ================================
CREATE TABLE Insurance_plan (
    plan_id                  VARCHAR(50) PRIMARY KEY,
    company_id               VARCHAR(50) NOT NULL,
    plan_name                VARCHAR(100) NOT NULL,
    plan_type                ENUM('SELF', 'FAMILY', 'SENIOR', 'CRITICAL_ILLNESS'),
    min_entry_age            INT DEFAULT 18,
    max_entry_age            INT DEFAULT 65,
    description              TEXT,
    available_cover_amounts  VARCHAR(100),
    waiting_period           VARCHAR(50),
    created_on               DATE DEFAULT '2025-06-01',
    expire_date              DATE DEFAULT '2099-12-31',
    periodic_diseases ENUM('YES', 'NO'),    -- type ENUM('STANDARD', 'ADHOC') DEFAULT 'STANDARD',--
    FOREIGN KEY (company_id) REFERENCES Insurance_company(company_id)
);

-- ================================
-- 4. Insurance_coverage_option Table
-- ================================
CREATE TABLE Insurance_coverage_option (
    coverage_id       VARCHAR(50) PRIMARY KEY,
    plan_id           VARCHAR(50),
    premium_amount    double(9,2),
    coverage_amount   double(9,2),
    status            VARCHAR(30) DEFAULT 'ACTIVE',
    FOREIGN KEY (plan_id) REFERENCES Insurance_plan(plan_id)
);
ALTER TABLE insurance_coverage_option
MODIFY COLUMN premium_amount double(9,2),
MODIFY COLUMN coverage_amount double(9,2);
-- ================================
-- 5. subscribe Table
-- ================================
CREATE TABLE subscribe (
    subscribe_id    VARCHAR(50) PRIMARY KEY,
    h_id            VARCHAR(50),
    coverage_id     VARCHAR(50),
    subscribe_date  DATE NOT NULL,
    expiry_date     DATE NOT NULL,
    type            ENUM('INDIVIDUAL', 'FAMILY'),
    status          ENUM('ACTIVE', 'EXPIRED') NOT NULL,
    total_premium   DECIMAL(10, 2) NOT NULL,
    amount_paid     DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (h_id) REFERENCES Recipient(h_id),
    FOREIGN KEY (coverage_id) REFERENCES Insurance_coverage_option(coverage_id)
);

-- ================================
-- 6. subscribed_members Table
-- ================================
CREATE TABLE subscribed_members (
    member_id               VARCHAR(50) PRIMARY KEY,
    subscribe_id            VARCHAR(50),
    full_name               VARCHAR(100) NOT NULL,
    age                     INT,
    gender                  VARCHAR(10),
    relation_with_proposer  VARCHAR(30),
    aadhar_no               VARCHAR(20),
    FOREIGN KEY (subscribe_id) REFERENCES subscribe(subscribe_id)
);




CREATE TABLE Claims (
    claim_id VARCHAR(20) PRIMARY KEY,
    subscribe_id VARCHAR(50) NOT NULL,
    procedure_id VARCHAR(20) NOT NULL,
    provider_id VARCHAR(20) NOT NULL,
    h_id VARCHAR(20) NOT NULL,
    claim_status ENUM('PENDING', 'APPROVED', 'DENIED') DEFAULT 'PENDING',
    claim_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount_claimed DECIMAL(10, 2) NOT NULL,
    amount_approved DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (procedure_id) REFERENCES medical_procedure(procedure_id),
    FOREIGN KEY (provider_id) REFERENCES Providers(provider_id),
    FOREIGN KEY (h_id) REFERENCES Recipient(h_id),
    FOREIGN KEY (subscribe_id) REFERENCES subscribe(subscribe_id)
);

CREATE TABLE Claim_history(
	claim_history_id VARCHAR(20) PRIMARY KEY,
    claim_id VARCHAR(20),
    description VARCHAR(255),
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (claim_id) REFERENCES Claims(claim_id)
);

INSERT INTO providers (provider_id, provider_name, hospital_name, email, address, city, state, zipcode, password, status)
VALUES 
('PROV001', 'HealthSure Group', 'HealthSure Hospital', 'contact@healthsure.com', '12 Main Road', 'Delhi', 'Delhi', '110001', 'provpass123', 'APPROVED');

select * from providers;

INSERT INTO Doctors (doctor_id, provider_id, doctor_name, qualification, specialization, license_no, email, address, gender, type, doctor_status)
VALUES 
('DOC001', 'PROV001', 'Dr. A Sharma', 'MBBS, MD', 'Cardiology', 'LIC001', 'a.sharma@hospital.com', 'Delhi', 'MALE', 'STANDARD', 'ACTIVE'),
('DOC002', 'PROV001', 'Dr. B Mehta', 'MBBS, MS', 'Orthopedics', 'LIC002', 'b.mehta@hospital.com', 'Delhi', 'FEMALE', 'STANDARD', 'ACTIVE'),
('DOC003', 'PROV001', 'Dr. C Iyer', 'MBBS, DGO', 'Gynecology', 'LIC003', 'c.iyer@hospital.com', 'Delhi', 'FEMALE', 'STANDARD', 'ACTIVE'),
('DOC004', 'PROV001', 'Dr. D Singh', 'MBBS, DM', 'Neurology', 'LIC004', 'd.singh@hospital.com', 'Delhi', 'MALE', 'STANDARD', 'ACTIVE'),
('DOC005', 'PROV001', 'Dr. E Khan', 'MBBS', 'General', 'LIC005', 'e.khan@hospital.com', 'Delhi', 'MALE', 'STANDARD', 'ACTIVE');

select * from Doctors;

INSERT INTO Recipient (h_id, first_name, last_name, mobile, user_name, gender, dob, address, password, email)
VALUES 
('HID001', 'Ravi', 'Sharma', '9876543210', 'ravi_s', 'MALE', '1990-01-01', 'Patel Nagar', 'ravipass', 'ravi@gmail.com'),
('HID002', 'Priya', 'Verma', '9898989898', 'priya_v', 'FEMALE', '1992-02-15', 'Nehru Place', 'priyapass', 'priya@gmail.com'),
('HID003', 'Amit', 'Kumar', '9812345678', 'amit_k', 'MALE', '1985-05-20', 'Rohini', 'amitpass', 'amit@gmail.com'),
('HID004', 'Sneha', 'Rao', '9823456789', 'sneha_r', 'FEMALE', '1994-08-10', 'Dwarka', 'snehapass', 'sneha@gmail.com'),
('HID005', 'Vikas', 'Yadav', '9834567890', 'vikas_y', 'MALE', '1988-11-30', 'Saket', 'vikaspass', 'vikas@gmail.com');

INSERT INTO Recipient (h_id, first_name, last_name, mobile, user_name, gender, dob, address, password, email)
VALUES 
('HID006', 'Neha', 'Singh', '9845612378', 'neha_s', 'FEMALE', '1993-03-12', 'Lajpat Nagar', 'neha123', 'neha@gmail.com'),
('HID007', 'Manish', 'Verma', '9823451290', 'manish_v', 'MALE', '1987-07-01', 'Karol Bagh', 'manish123', 'manish@gmail.com'),
('HID008', 'Divya', 'Joshi', '9811234509', 'divya_j', 'FEMALE', '1995-12-09', 'Punjabi Bagh', 'divya123', 'divya@gmail.com'),
('HID009', 'Rohan', 'Kapur', '9834561234', 'rohan_k', 'MALE', '1990-04-18', 'CP', 'rohan123', 'rohan@gmail.com'),
('HID010', 'Meena', 'Reddy', '9845617800', 'meena_r', 'FEMALE', '1991-11-11', 'Green Park', 'meena123', 'meena@gmail.com'),
('HID011', 'Kunal', 'Tiwari', '9876541098', 'kunal_t', 'MALE', '1992-10-10', 'Janakpuri', 'kunal123', 'kunal@gmail.com'),
('HID012', 'Simran', 'Chawla', '9867543210', 'simran_c', 'FEMALE', '1994-06-16', 'Lodhi Road', 'simran123', 'simran@gmail.com'),
('HID013', 'Arjun', 'Patel', '9812344501', 'arjun_p', 'MALE', '1989-05-05', 'Rajouri Garden', 'arjun123', 'arjun@gmail.com'),
('HID014', 'Isha', 'Malhotra', '9871234567', 'isha_m', 'FEMALE', '1996-08-08', 'Mayur Vihar', 'isha123', 'isha@gmail.com'),
('HID015', 'Raj', 'Chauhan', '9890123456', 'raj_c', 'MALE', '1986-01-01', 'Nizamuddin', 'raj123', 'raj@gmail.com');

select * from Recipient;


-- Doctor availability and appointment (10 total)
INSERT INTO Doctor_availability (availability_id, doctor_id, available_date, start_time, end_time)
VALUES
('AV001', 'DOC003', '2025-06-30', '10:00:00', '12:00:00'),
('AV002', 'DOC003', '2025-06-28', '10:00:00', '12:00:00'),
('AV003', 'DOC004', '2025-06-26', '11:00:00', '13:00:00'),
('AV004', 'DOC005', '2025-06-24', '09:00:00', '11:00:00'),
('AV005', 'DOC004', '2025-06-22', '10:30:00', '12:30:00'),
('AV006', 'DOC002', '2025-06-20', '14:00:00', '16:00:00'),
('AV007', 'DOC005', '2025-06-18', '08:30:00', '10:30:00'),
('AV008', 'DOC001', '2025-06-16', '09:00:00', '11:00:00'),
('AV009', 'DOC002', '2025-06-14', '15:00:00', '17:00:00'),
('AV010', 'DOC001', '2025-06-12', '10:00:00', '12:00:00');

INSERT INTO Doctor_availability (availability_id, doctor_id, available_date, start_time, end_time)
VALUES
('AV011', 'DOC001', '2025-07-01', '09:00:00', '11:00:00'),
('AV012', 'DOC003', '2025-07-02', '10:00:00', '12:00:00'),
('AV013', 'DOC004', '2025-07-03', '11:00:00', '13:00:00'),
('AV014', 'DOC005', '2025-07-04', '14:00:00', '16:00:00'),
('AV015', 'DOC002', '2025-07-05', '10:30:00', '12:30:00');


select * from doctor_availability;

INSERT INTO appointment (appointment_id, provider_id, doctor_id, h_id, availability_id, slot_no, booked_at, status)
VALUES
('AP001', 'PROV001', 'DOC003', 'HID001', 'AV001', 7, NOW(), 'BOOKED'),
('AP002', 'PROV001', 'DOC003', 'HID003', 'AV002', 10, NOW(), 'BOOKED'),
('AP003', 'PROV001', 'DOC004', 'HID004', 'AV003', 5, NOW(), 'BOOKED'),
('AP004', 'PROV001', 'DOC005', 'HID002', 'AV004', 3, NOW(), 'BOOKED'),
('AP005', 'PROV001', 'DOC004', 'HID005', 'AV005', 8, NOW(), 'BOOKED'),
('AP006', 'PROV001', 'DOC002', 'HID001', 'AV006', 4, NOW(), 'BOOKED'),
('AP007', 'PROV001', 'DOC005', 'HID002', 'AV007', 2, NOW(), 'BOOKED'),
('AP008', 'PROV001', 'DOC001', 'HID003', 'AV008', 9, NOW(), 'BOOKED'),
('AP009', 'PROV001', 'DOC002', 'HID004', 'AV009', 6, NOW(), 'BOOKED'),
('AP010', 'PROV001', 'DOC001', 'HID005', 'AV010', 1, NOW(), 'BOOKED');

INSERT INTO appointment (appointment_id, provider_id, doctor_id, h_id, availability_id, slot_no, booked_at, status)
VALUES
('AP011', 'PROV001', 'DOC001', 'HID006', 'AV011', 1, NOW(), 'BOOKED'),
('AP012', 'PROV001', 'DOC003', 'HID007', 'AV012', 2, NOW(), 'BOOKED'),
('AP013', 'PROV001', 'DOC004', 'HID008', 'AV013', 3, NOW(), 'BOOKED'),
('AP014', 'PROV001', 'DOC005', 'HID009', 'AV014', 4, NOW(), 'BOOKED'),
('AP015', 'PROV001', 'DOC002', 'HID010', 'AV015', 5, NOW(), 'BOOKED');


select * from appointment;

INSERT INTO Insurance_company (company_id, name, logo_url, head_office, contact_email, contact_phone)
VALUES 
('IC001', 'CareHealth Ltd.', 'https://logo.carehealth.com/care.png', 'Mumbai, India', 'support@carehealth.com', '1800-200-300');

 select * from Insurance_company;
 
 INSERT INTO Insurance_plan (plan_id, company_id, plan_name, plan_type, description, available_cover_amounts, waiting_period, periodic_diseases)
VALUES 
('PLAN001', 'IC001', 'Basic Health', 'SELF', 'Basic self coverage', '100000,200000', '6 months', 'NO'),
('PLAN002', 'IC001', 'Family Secure', 'FAMILY', 'Covers full family', '300000,500000', '12 months', 'YES'),
('PLAN003', 'IC001', 'Senior Health', 'SENIOR', 'For individuals above 60', '100000,300000', '24 months', 'YES'),
('PLAN004', 'IC001', 'Critical Shield', 'CRITICAL_ILLNESS', 'For critical illnesses', '500000,1000000', '12 months', 'YES'),
('PLAN005', 'IC001', 'Young Saver', 'SELF', 'For young individuals', '50000,100000', '3 months', 'NO');

select * from Insurance_plan;

-- For PLAN001
INSERT INTO Insurance_coverage_option (coverage_id, plan_id, premium_amount, coverage_amount)
VALUES 
('COV001', 'PLAN001', 1500.00, 100000.00),
('COV002', 'PLAN001', 2800.00, 200000.00),
('COV003', 'PLAN001', 4200.00, 300000.00),

-- For PLAN002
('COV004', 'PLAN002', 5500.00, 300000.00),
('COV005', 'PLAN002', 8500.00, 500000.00),
('COV006', 'PLAN002', 11000.00, 700000.00),

-- For PLAN003
('COV007', 'PLAN003', 6000.00, 100000.00),
('COV008', 'PLAN003', 9000.00, 300000.00),
('COV009', 'PLAN003', 12000.00, 500000.00),

-- For PLAN004
('COV010', 'PLAN004', 15000.00, 500000.00),
('COV011', 'PLAN004', 25000.00, 1000000.00),
('COV012', 'PLAN004', 35000.00, 1500000.00),

-- For PLAN005
('COV013', 'PLAN005', 500.00, 50000.00),
('COV014', 'PLAN005', 1000.00, 100000.00),
('COV015', 'PLAN005', 1500.00, 150000.00);

select * from  Insurance_coverage_option;


INSERT INTO subscribe (subscribe_id, h_id, coverage_id, subscribe_date, expiry_date, type, status, total_premium, amount_paid)
VALUES
('SUB001', 'HID001', 'COV001', '2025-06-01', '2026-06-01', 'INDIVIDUAL', 'ACTIVE', 1500.00, 1500.00),
('SUB002', 'HID002', 'COV004', '2025-06-01', '2026-06-01', 'FAMILY', 'ACTIVE', 5500.00, 5500.00),
('SUB003', 'HID003', 'COV007', '2025-06-01', '2026-06-01', 'INDIVIDUAL', 'ACTIVE', 6000.00, 6000.00),
('SUB004', 'HID004', 'COV010', '2025-06-01', '2026-06-01', 'INDIVIDUAL', 'ACTIVE', 15000.00, 15000.00),
('SUB005', 'HID005', 'COV013', '2025-06-01', '2026-06-01', 'INDIVIDUAL', 'ACTIVE', 500.00, 500.00),
('SUB006', 'HID006', 'COV002', '2025-06-01', '2026-06-01', 'INDIVIDUAL', 'ACTIVE', 2800.00, 2800.00),
('SUB007', 'HID007', 'COV006', '2025-06-01', '2026-06-01', 'FAMILY', 'ACTIVE', 11000.00, 11000.00),
('SUB008', 'HID008', 'COV009', '2025-06-01', '2026-06-01', 'INDIVIDUAL', 'ACTIVE', 12000.00, 12000.00),
('SUB009', 'HID009', 'COV012', '2025-06-01', '2026-06-01', 'INDIVIDUAL', 'ACTIVE', 35000.00, 35000.00),
('SUB010', 'HID010', 'COV015', '2025-06-01', '2026-06-01', 'INDIVIDUAL', 'ACTIVE', 1500.00, 1500.00);

select * from subscribe;
 
-- For SUB001 to SUB010 (3 members each)
INSERT INTO subscribed_members (member_id, subscribe_id, full_name, age, gender, relation_with_proposer, aadhar_no)
VALUES 
('MEM001', 'SUB001', 'Ravi Sharma', 35, 'MALE', 'SELF', 'AADHAR001'),
('MEM002', 'SUB001', 'Meena Sharma', 33, 'FEMALE', 'SPOUSE', 'AADHAR002'),
('MEM003', 'SUB001', 'Aryan Sharma', 5, 'MALE', 'SON', 'AADHAR003'),

('MEM004', 'SUB002', 'Priya Verma', 32, 'FEMALE', 'SELF', 'AADHAR004'),
('MEM005', 'SUB002', 'Anil Verma', 34, 'MALE', 'SPOUSE', 'AADHAR005'),
('MEM006', 'SUB002', 'Nina Verma', 6, 'FEMALE', 'DAUGHTER', 'AADHAR006'),

('MEM007', 'SUB003', 'Amit Kumar', 40, 'MALE', 'SELF', 'AADHAR007'),
('MEM008', 'SUB003', 'Rita Kumar', 38, 'FEMALE', 'SPOUSE', 'AADHAR008'),
('MEM009', 'SUB003', 'Raj Kumar', 10, 'MALE', 'SON', 'AADHAR009'),

('MEM010', 'SUB004', 'Sneha Rao', 30, 'FEMALE', 'SELF', 'AADHAR010'),
('MEM011', 'SUB004', 'Vinay Rao', 32, 'MALE', 'SPOUSE', 'AADHAR011'),
('MEM012', 'SUB004', 'Aanya Rao', 3, 'FEMALE', 'DAUGHTER', 'AADHAR012'),

('MEM013', 'SUB005', 'Vikas Yadav', 37, 'MALE', 'SELF', 'AADHAR013'),
('MEM014', 'SUB005', 'Maya Yadav', 35, 'FEMALE', 'SPOUSE', 'AADHAR014'),
('MEM015', 'SUB005', 'Avi Yadav', 7, 'MALE', 'SON', 'AADHAR015'),

('MEM016', 'SUB006', 'Neha Singh', 29, 'FEMALE', 'SELF', 'AADHAR016'),
('MEM017', 'SUB006', 'Raj Singh', 31, 'MALE', 'SPOUSE', 'AADHAR017'),
('MEM018', 'SUB006', 'Tina Singh', 2, 'FEMALE', 'DAUGHTER', 'AADHAR018'),

('MEM019', 'SUB007', 'Manish Verma', 36, 'MALE', 'SELF', 'AADHAR019'),
('MEM020', 'SUB007', 'Pooja Verma', 35, 'FEMALE', 'SPOUSE', 'AADHAR020'),
('MEM021', 'SUB007', 'Kunal Verma', 8, 'MALE', 'SON', 'AADHAR021'),

('MEM022', 'SUB008', 'Divya Joshi', 28, 'FEMALE', 'SELF', 'AADHAR022'),
('MEM023', 'SUB008', 'Ramesh Joshi', 30, 'MALE', 'SPOUSE', 'AADHAR023'),
('MEM024', 'SUB008', 'Sia Joshi', 4, 'FEMALE', 'DAUGHTER', 'AADHAR024'),

('MEM025', 'SUB009', 'Rohan Kapur', 33, 'MALE', 'SELF', 'AADHAR025'),
('MEM026', 'SUB009', 'Nina Kapur', 31, 'FEMALE', 'SPOUSE', 'AADHAR026'),
('MEM027', 'SUB009', 'Ansh Kapur', 6, 'MALE', 'SON', 'AADHAR027'),

('MEM028', 'SUB010', 'Meena Reddy', 34, 'FEMALE', 'SELF', 'AADHAR028'),
('MEM029', 'SUB010', 'Ajay Reddy', 36, 'MALE', 'SPOUSE', 'AADHAR029'),
('MEM030', 'SUB010', 'Sana Reddy', 5, 'FEMALE', 'DAUGHTER', 'AADHAR030');
select * from subscribed_members;



INSERT INTO medical_procedure (procedure_id, appointment_id, h_id, provider_id, doctor_id, procedure_date, diagnosis, recommendations)
VALUES
('PROC001', 'AP001', 'HID001', 'PROV001', 'DOC003', '2025-06-30', 'Hypertension', 'Reduce salt intake and exercise'),
('PROC002', 'AP002', 'HID003', 'PROV001', 'DOC003', '2025-06-28', 'Knee Pain', 'MRI recommended'),
('PROC003', 'AP003', 'HID004', 'PROV001', 'DOC004', '2025-06-26', 'Migraine', 'Avoid screen time, take rest'),
('PROC004', 'AP004', 'HID002', 'PROV001', 'DOC005', '2025-06-24', 'Fever & cough', 'Suspected viral infection'),
('PROC005', 'AP005', 'HID005', 'PROV001', 'DOC004', '2025-06-22', 'Back pain', 'Physiotherapy advised'),
('PROC006', 'AP006', 'HID001', 'PROV001', 'DOC002', '2025-06-20', 'Throat infection', 'Complete antibiotic course'),
('PROC007', 'AP007', 'HID002', 'PROV001', 'DOC005', '2025-06-18', 'Sprain', 'Cold compress and rest'),
('PROC008', 'AP008', 'HID003', 'PROV001', 'DOC001', '2025-06-16', 'High sugar levels', 'Switch to diabetic diet'),
('PROC009', 'AP009', 'HID004', 'PROV001', 'DOC002', '2025-06-14', 'Fracture checkup', 'Plaster review'),
('PROC010', 'AP010', 'HID005', 'PROV001', 'DOC001', '2025-06-12', 'Allergy', 'Antihistamines prescribed');

select * from  medical_procedure;

INSERT INTO prescription (prescription_id, procedure_id, h_id, provider_id, doctor_id, start_date, end_date)
VALUES
('PR001', 'PROC001', 'HID001', 'PROV001', 'DOC003', '2025-06-30', '2025-07-10'),
('PR002', 'PROC002', 'HID003', 'PROV001', 'DOC003', '2025-06-28', '2025-07-08'),
('PR003', 'PROC003', 'HID004', 'PROV001', 'DOC004', '2025-06-26', '2025-07-05'),
('PR004', 'PROC004', 'HID002', 'PROV001', 'DOC005', '2025-06-24', '2025-07-04'),
('PR005', 'PROC005', 'HID005', 'PROV001', 'DOC004', '2025-06-22', '2025-07-02'),
('PR006', 'PROC006', 'HID001', 'PROV001', 'DOC002', '2025-06-20', '2025-06-30'),
('PR007', 'PROC007', 'HID002', 'PROV001', 'DOC005', '2025-06-18', '2025-06-28'),
('PR008', 'PROC008', 'HID003', 'PROV001', 'DOC001', '2025-06-16', '2025-06-26'),
('PR009', 'PROC009', 'HID004', 'PROV001', 'DOC002', '2025-06-14', '2025-06-24'),
('PR010', 'PROC010', 'HID005', 'PROV001', 'DOC001', '2025-06-12', '2025-06-22');

select * from prescription;

INSERT INTO prescribed_medicines (prescribed_id, prescription_id, medicine_name, dosage, duration, notes, start_date, end_date)
VALUES
('MED001', 'PR001', 'Telmisartan', '40mg', '10 days', 'Once daily', '2025-06-30', '2025-07-10'),
('MED002', 'PR001', 'Amlodipine', '5mg', '10 days', 'After breakfast', '2025-06-30', '2025-07-10'),

('MED003', 'PR002', 'Paracetamol', '500mg', '5 days', 'Thrice daily', '2025-06-28', '2025-07-03'),
('MED004', 'PR002', 'Ibuprofen', '400mg', '5 days', 'With food', '2025-06-28', '2025-07-03'),

('MED005', 'PR003', 'Sumatriptan', '50mg', '7 days', 'During migraine', '2025-06-26', '2025-07-02'),

('MED006', 'PR004', 'Azithromycin', '500mg', '3 days', 'Once daily', '2025-06-24', '2025-06-27'),
('MED007', 'PR004', 'Cetirizine', '10mg', '5 days', 'At night', '2025-06-24', '2025-06-29'),

('MED008', 'PR005', 'Diclofenac', '50mg', '7 days', 'Twice daily', '2025-06-22', '2025-06-29'),

('MED009', 'PR006', 'Amoxicillin', '500mg', '7 days', 'Every 8 hours', '2025-06-20', '2025-06-27'),

('MED010', 'PR007', 'Ibuprofen', '400mg', '5 days', 'With food', '2025-06-18', '2025-06-23'),
('MED011', 'PR007', 'Aceclofenac', '100mg', '5 days', 'Morning and Night', '2025-06-18', '2025-06-23'),

('MED012', 'PR008', 'Metformin', '500mg', '10 days', 'Morning', '2025-06-16', '2025-06-26'),

('MED013', 'PR009', 'Calcium Supplement', '500mg', '7 days', 'Once daily', '2025-06-14', '2025-06-21'),

('MED014', 'PR010', 'Levocetirizine', '5mg', '5 days', 'Before bedtime', '2025-06-12', '2025-06-17');

select * from  prescribed_medicines;

INSERT INTO prescribed_tests (test_id, prescription_id, test_name, test_date, result_summary)
VALUES
('TEST001', 'PR001', 'Blood Pressure Monitoring', '2025-07-01', 'BP readings elevated'),
('TEST002', 'PR002', 'Knee X-ray', '2025-07-02', 'No fracture detected'),
('TEST003', 'PR003', 'MRI Brain', '2025-07-03', 'Normal'),
('TEST004', 'PR004', 'CBC', '2025-07-04', 'WBC slightly elevated'),
('TEST005', 'PR005', 'Spine X-ray', '2025-07-05', 'Minor disc bulge'),
('TEST006', 'PR006', 'Throat Culture', '2025-07-06', 'Bacterial infection detected'),
('TEST007', 'PR007', 'Ankle X-ray', '2025-07-07', 'No fracture'),
('TEST008', 'PR008', 'Fasting Blood Sugar', '2025-07-08', 'High glucose level'),
('TEST009', 'PR009', 'X-ray Arm', '2025-07-09', 'Fracture healed'),
('TEST010', 'PR010', 'Allergy Panel', '2025-07-10', 'Dust allergy detected');

select * from  prescribed_tests;

INSERT INTO Claims (claim_id, subscribe_id, procedure_id, provider_id, h_id, claim_status, amount_claimed, amount_approved)
VALUES
('CL001', 'SUB001', 'PROC001', 'PROV001', 'HID001', 'PENDING', 20000.00, 0.00),
('CL002', 'SUB002', 'PROC002', 'PROV001', 'HID002', 'APPROVED', 30000.00, 25000.00),
('CL003', 'SUB003', 'PROC003', 'PROV001', 'HID003', 'DENIED', 40000.00, 0.00),
('CL004', 'SUB004', 'PROC004', 'PROV001', 'HID004', 'APPROVED', 18000.00, 18000.00),
('CL005', 'SUB005', 'PROC005', 'PROV001', 'HID005', 'PENDING', 10000.00, 0.00),
('CL006', 'SUB006', 'PROC006', 'PROV001', 'HID006', 'APPROVED', 12000.00, 10000.00),
('CL007', 'SUB007', 'PROC007', 'PROV001', 'HID007', 'PENDING', 22000.00, 0.00),
('CL008', 'SUB008', 'PROC008', 'PROV001', 'HID008', 'APPROVED', 15000.00, 13000.00),
('CL009', 'SUB009', 'PROC009', 'PROV001', 'HID009', 'DENIED', 17000.00, 0.00),
('CL010', 'SUB010', 'PROC010', 'PROV001', 'HID010', 'PENDING', 11000.00, 0.00);


select * from Claims;




INSERT INTO Claim_history (claim_history_id, claim_id, description)
VALUES
('CH001', 'CL001', 'Claim initiated'),
('CH002', 'CL001', 'Under review'),
('CH003', 'CL002', 'Claim approved'),
('CH004', 'CL002', 'Payment done'),
('CH005', 'CL003', 'Claim denied due to insufficient docs'),
('CH006', 'CL004', 'Claim approved fully'),
('CH007', 'CL005', 'Claim submitted'),
('CH008', 'CL006', 'Partial approval done'),
('CH009', 'CL007', 'Claim pending verification'),
('CH010', 'CL008', 'Investigation completed'),
('CH011', 'CL009', 'Claim rejected due to policy lapse'),
('CH012', 'CL010', 'Initial review done');

select * from Claim_history;

-- Insert 10 dummy records into otp table
INSERT INTO otp (otp_id, user_name, otp_code, new_password, status, created_at, expires_at, purpose)
VALUES
(1, 'ravi_s', 123456, 'newpass123', 'PENDING', '2025-07-01 10:00:00', '2025-07-01 10:30:00', 'FORGOT_PASSWORD'),
(2, 'priya_v', 654321, 'newpass456', 'VERIFIED', '2025-07-02 11:00:00', '2025-07-02 11:30:00', 'REGISTER'),
(3, 'amit_k', 789012, NULL, 'EXPIRED', '2025-07-03 12:00:00', '2025-07-03 12:30:00', 'FORGOT_PASSWORD'),
(4, 'sneha_r', 345678, 'newpass789', 'PENDING', '2025-07-04 13:00:00', '2025-07-04 13:30:00', 'REGISTER'),
(5, 'vikas_y', 901234, NULL, 'VERIFIED', '2025-07-05 14:00:00', '2025-07-05 14:30:00', 'FORGOT_PASSWORD'),
(6, 'neha_s', 567890, 'newpass012', 'PENDING', '2025-07-06 15:00:00', '2025-07-06 15:30:00', 'REGISTER'),
(7, 'manish_v', 234567, NULL, 'EXPIRED', '2025-07-07 16:00:00', '2025-07-07 16:30:00', 'FORGOT_PASSWORD'),
(8, 'divya_j', 890123, 'newpass345', 'VERIFIED', '2025-07-08 17:00:00', '2025-07-08 17:30:00', 'REGISTER'),
(9, 'rohan_k', 456789, NULL, 'PENDING', '2025-07-09 18:00:00', '2025-07-09 18:30:00', 'FORGOT_PASSWORD'),
(10, 'meena_r', 012345, 'newpass678', 'VERIFIED', '2025-07-10 19:00:00', '2025-07-10 19:30:00', 'REGISTER');


-- FOR HID001 THE DATA IS THIER --

use healthsure;




-- Additional medical_procedure entries for HID001 to show multiple hospital visits
INSERT INTO medical_procedure (procedure_id, appointment_id, h_id, provider_id, doctor_id, procedure_date, diagnosis, recommendations)
VALUES
('PROC011', 'AP011', 'HID001', 'PROV001', 'DOC001', '2025-07-01', 'Gastritis', 'Avoid spicy food, take antacids'),
('PROC012', 'AP006', 'HID001', 'PROV001', 'DOC002', '2025-07-02', 'Sinusitis', 'Steam inhalation advised'),
('PROC013', 'AP001', 'HID001', 'PROV001', 'DOC003', '2025-07-03', 'Asthma', 'Use inhaler as prescribed'),
('PROC014', 'AP011', 'HID001', 'PROV001', 'DOC001', '2025-07-04', 'Fatigue', 'Blood tests recommended'),
('PROC015', 'AP006', 'HID001', 'PROV001', 'DOC002', '2025-07-05', 'Conjunctivitis', 'Use eye drops'),
('PROC016', 'AP001', 'HID001', 'PROV001', 'DOC003', '2025-07-06', 'Anemia', 'Iron supplements prescribed'),
('PROC017', 'AP011', 'HID001', 'PROV001', 'DOC001', '2025-07-07', 'UTI', 'Increase fluid intake'),
('PROC018', 'AP006', 'HID001', 'PROV001', 'DOC002', '2025-07-08', 'Dermatitis', 'Apply topical cream'),
('PROC019', 'AP001', 'HID001', 'PROV001', 'DOC003', '2025-07-09', 'Migraine', 'Avoid triggers, rest'),
('PROC020', 'AP011', 'HID001', 'PROV001', 'DOC001', '2025-07-10', 'Sprained Ankle', 'Rest and ice application');

select * from  medical_procedure;

-- Additional prescription entries for HID001's new procedures
INSERT INTO prescription (prescription_id, procedure_id, h_id, provider_id, doctor_id, start_date, end_date)
VALUES
('PR011', 'PROC011', 'HID001', 'PROV001', 'DOC001', '2025-07-01', '2025-07-11'),
('PR012', 'PROC012', 'HID001', 'PROV001', 'DOC002', '2025-07-02', '2025-07-12'),
('PR013', 'PROC013', 'HID001', 'PROV001', 'DOC003', '2025-07-03', '2025-07-13'),
('PR014', 'PROC014', 'HID001', 'PROV001', 'DOC001', '2025-07-04', '2025-07-14'),
('PR015', 'PROC015', 'HID001', 'PROV001', 'DOC002', '2025-07-05', '2025-07-15'),
('PR016', 'PROC016', 'HID001', 'PROV001', 'DOC003', '2025-07-06', '2025-07-16'),
('PR017', 'PROC017', 'HID001', 'PROV001', 'DOC001', '2025-07-07', '2025-07-17'),
('PR018', 'PROC018', 'HID001', 'PROV001', 'DOC002', '2025-07-08', '2025-07-18'),
('PR019', 'PROC019', 'HID001', 'PROV001', 'DOC003', '2025-07-09', '2025-07-19'),
('PR020', 'PROC020', 'HID001', 'PROV001', 'DOC001', '2025-07-10', '2025-07-20');
 
 select * from  medical_procedure;


-- Additional prescribed_medicines entries for HID001's new prescriptions (2 medicines per prescription)
INSERT INTO prescribed_medicines (prescribed_id, prescription_id, medicine_name, dosage, duration, notes, start_date, end_date)
VALUES
('MED015', 'PR011', 'Omeprazole', '20mg', '10 days', 'Before meals', '2025-07-01', '2025-07-11'),
('MED016', 'PR011', 'Ranitidine', '150mg', '10 days', 'At night', '2025-07-01', '2025-07-11'),
('MED017', 'PR012', 'Fluticasone Nasal Spray', '50mcg', '7 days', 'Twice daily', '2025-07-02', '2025-07-09'),
('MED018', 'PR012', 'Cetirizine', '10mg', '7 days', 'At night', '2025-07-02', '2025-07-09'),
('MED019', 'PR013', 'Salbutamol Inhaler', '100mcg', '10 days', 'As needed', '2025-07-03', '2025-07-13'),
('MED020', 'PR013', 'Montelukast', '10mg', '10 days', 'Evening', '2025-07-03', '2025-07-13'),
('MED021', 'PR014', 'Multivitamin', '1 tablet', '10 days', 'With breakfast', '2025-07-04', '2025-07-14'),
('MED022', 'PR014', 'Vitamin B12', '500mcg', '10 days', 'Daily', '2025-07-04', '2025-07-14'),
('MED023', 'PR015', 'Ofloxacin Eye Drops', '0.3%', '5 days', 'Twice daily', '2025-07-05', '2025-07-10'),
('MED024', 'PR015', 'Artificial Tears', '0.5%', '5 days', 'As needed', '2025-07-05', '2025-07-10'),
('MED025', 'PR016', 'Ferrous Sulfate', '200mg', '10 days', 'With food', '2025-07-06', '2025-07-16'),
('MED026', 'PR016', 'Folic Acid', '5mg', '10 days', 'Daily', '2025-07-06', '2025-07-16'),
('MED027', 'PR017', 'Ciprofloxacin', '500mg', '7 days', 'Twice daily', '2025-07-07', '2025-07-14'),
('MED028', 'PR017', 'Paracetamol', '500mg', '7 days', 'As needed', '2025-07-07', '2025-07-14'),
('MED029', 'PR018', 'Hydrocortisone Cream', '1%', '7 days', 'Apply twice daily', '2025-07-08', '2025-07-15'),
('MED030', 'PR018', 'Antihistamine', '10mg', '7 days', 'At night', '2025-07-08', '2025-07-15'),
('MED031', 'PR019', 'Sumatriptan', '50mg', '7 days', 'During migraine', '2025-07-09', '2025-07-16'),
('MED032', 'PR019', 'Ibuprofen', '400mg', '7 days', 'With food', '2025-07-09', '2025-07-16'),
('MED033', 'PR020', 'Aceclofenac', '100mg', '5 days', 'Twice daily', '2025-07-10', '2025-07-15'),
('MED034', 'PR020', 'Paracetamol', '500mg', '5 days', 'As needed', '2025-07-10', '2025-07-15');

select * from  prescribed_medicines;

-- Additional prescribed_tests entries for HID001's new prescriptions (1 test per prescription)
INSERT INTO prescribed_tests (test_id, prescription_id, test_name, test_date, result_summary)
VALUES
('TEST011', 'PR011', 'Gastric Endoscopy', '2025-07-02', 'Mild gastritis observed'),
('TEST012', 'PR012', 'Sinus X-ray', '2025-07-03', 'Sinus inflammation detected'),
('TEST013', 'PR013', 'Pulmonary Function Test', '2025-07-04', 'Mild asthma confirmed'),
('TEST014', 'PR014', 'Complete Blood Count', '2025-07-05', 'Low hemoglobin'),
('TEST015', 'PR015', 'Eye Examination', '2025-07-06', 'Conjunctivitis confirmed'),
('TEST016', 'PR016', 'Iron Profile', '2025-07-07', 'Iron deficiency detected'),
('TEST017', 'PR017', 'Urine Culture', '2025-07-08', 'Bacterial infection confirmed'),
('TEST018', 'PR018', 'Skin Patch Test', '2025-07-09', 'Allergic dermatitis'),
('TEST019', 'PR019', 'MRI Brain', '2025-07-10', 'Normal, no abnormalities'),
('TEST020', 'PR020', 'Ankle X-ray', '2025-07-11', 'Minor sprain, no fracture');

select * from  prescribed_tests ;


-- Additional Claims entries for HID001's new procedures
INSERT INTO Claims (claim_id, subscribe_id, procedure_id, provider_id, h_id, claim_status, claim_date, amount_claimed, amount_approved)
VALUES
('CL011', 'SUB001', 'PROC011', 'PROV001', 'HID001', 'PENDING', '2025-07-02 10:00:00', 25000.00, 0.00),
('CL012', 'SUB001', 'PROC012', 'PROV001', 'HID001', 'APPROVED', '2025-07-03 12:00:00', 18000.00, 16000.00),
('CL013', 'SUB001', 'PROC013', 'PROV001', 'HID001', 'DENIED', '2025-07-04 14:00:00', 22000.00, 0.00),
('CL014', 'SUB001', 'PROC014', 'PROV001', 'HID001', 'APPROVED', '2025-07-05 09:00:00', 15000.00, 14000.00),
('CL015', 'SUB001', 'PROC015', 'PROV001', 'HID001', 'PENDING', '2025-07-06 11:00:00', 12000.00, 0.00),
('CL016', 'SUB001', 'PROC016', 'PROV001', 'HID001', 'APPROVED', '2025-07-07 13:00:00', 20000.00, 18000.00),
('CL017', 'SUB001', 'PROC017', 'PROV001', 'HID001', 'PENDING', '2025-07-08 15:00:00', 17000.00, 0.00),
('CL018', 'SUB001', 'PROC018', 'PROV001', 'HID001', 'APPROVED', '2025-07-09 10:00:00', 14000.00, 12000.00),
('CL019', 'SUB001', 'PROC019', 'PROV001', 'HID001', 'DENIED', '2025-07-10 12:00:00', 19000.00, 0.00),
('CL020', 'SUB001', 'PROC020', 'PROV001', 'HID001', 'PENDING', '2025-07-11 14:00:00', 16000.00, 0.00);

select * from  Claims ;

-- Additional Claim_history entries for new claims
INSERT INTO Claim_history (claim_history_id, claim_id, description)
VALUES
('CH013', 'CL011', 'Claim submitted for gastritis treatment'),
('CH014', 'CL011', 'Under review by insurance team'),
('CH015', 'CL012', 'Claim approved for sinusitis treatment'),
('CH016', 'CL012', 'Payment processed'),
('CH017', 'CL013', 'Claim denied due to policy exclusion'),
('CH018', 'CL014', 'Claim approved for blood tests'),
('CH019', 'CL015', 'Claim submitted for eye treatment'),
('CH020', 'CL016', 'Claim approved for anemia treatment'),
('CH021', 'CL017', 'Claim pending for UTI treatment'),
('CH022', 'CL018', 'Claim approved for dermatitis treatment'),
('CH023', 'CL019', 'Claim denied due to incomplete documentation'),
('CH024', 'CL020', 'Claim under initial review');

select * from  Claim_history;

use healthsure;
