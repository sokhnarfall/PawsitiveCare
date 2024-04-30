SHOW DATABASES;
USE [replace_with_your_connection];

CREATE TABLE IF NOT EXISTS Pet (
  id int not null auto_increment primary key,
  name varchar(100),
  birthdate date,
  type varchar(100),
  species varchar(100),
  sex varchar(1),
  notes varchar(500), 
  microchip_id bigint
 );
 
 CREATE TABLE IF NOT EXISTS Owner (
  id int not null auto_increment primary key,
  first_name varchar(100),
  last_name varchar(100),
  street varchar(100),
  city varchar(100),
  state varchar(100),
  zipcode int,
  phone varchar(100),
  email varchar(100)
);

CREATE TABLE IF NOT EXISTS Pet_Owner (
  id int not null auto_increment primary key,
  pet_id int,
  owner_id int,
  FOREIGN KEY (pet_id) REFERENCES Pet(id),
  FOREIGN KEY (owner_id) REFERENCES Owner(id)
);

CREATE TABLE IF NOT EXISTS Veterinarian (
  id int not null auto_increment primary key,
  first_name varchar(100),
  last_name varchar(100),
  license_number int
);

CREATE TABLE IF NOT EXISTS Appointment (
  id int not null auto_increment primary key,
  date datetime,
  typeofappt varchar(100),
  notes varchar(100),
  veterinarian_id int,
  FOREIGN KEY (veterinarian_id) REFERENCES Veterinarian(id) 
);

CREATE TABLE IF NOT EXISTS Pet_Appointment (
  id int not null auto_increment primary key,
  pet_id int,
  appointment_id int,
  FOREIGN KEY (pet_id) REFERENCES Pet(id),
  FOREIGN KEY (appointment_id) REFERENCES Appointment(id)
);

CREATE TABLE IF NOT EXISTS Lab (
  id int not null auto_increment primary key,
  type varchar(100),
  results varchar(100),
  pet_id int,
  appointment_id int, 
  FOREIGN KEY (pet_id) REFERENCES Pet(id),
  FOREIGN KEY (appointment_id) REFERENCES Appointment(id)
);


CREATE TABLE IF NOT EXISTS Vaccine (
  id int not null auto_increment primary key,
  name varchar(100),
  pet_id int,
  appointment_id int,
  FOREIGN KEY (pet_id) REFERENCES Pet(id),
  FOREIGN KEY (appointment_id) REFERENCES Appointment(id)
);

CREATE TABLE IF NOT EXISTS Weight (
  id int not null auto_increment primary key,
  pet_id int,
  weight float,
  appointment_id int,
  FOREIGN KEY (pet_id) REFERENCES Pet(id),
  FOREIGN KEY (appointment_id) REFERENCES Appointment(id)
);

CREATE TABLE IF NOT EXISTS AfterVisitSummary (
  id int not null auto_increment primary key,
  notes varchar(100),
  vaccine_administered varchar(1),
  pet_appointment_id int,
  FOREIGN KEY (pet_appointment_id) REFERENCES Pet_Appointment(id)
);


-- INSERTING FAKE DATA
INSERT INTO Pet (name, birthdate, type, species, sex, notes, microchip_id) VALUES
('Luna', '2019-05-10', 'Dog', 'Corgis', 'F', 'Luna is very friendly and loves to play fetch. 
She enjoys long walks and is trained to sit and stay.', '096782154'),
('Simba', '2018-07-20', 'Cat', 'Maine Coon', 'M', 'Simba is a playful cat who enjoys chasing toy mice. 
He is litter box trained and loves sunbathing by the window.', '589554241'),
('Daisy', '2020-02-15', 'Hamster', 'Golden Hamster', 'F', 'Daisy is a charming furball with round beady eyes. 
When shes not busy nibbling on treats shes burning calories on her exercise wheel.', '916357824'),
('Gizmo', '2017-11-12', 'Rabbit', 'Holland Lop', 'M', 'Gizmo is a curious and friendly rabbit. 
He enjoys exploring his playpen and loves treats like fresh greens and carrots.', '328710987');

INSERT INTO Owner (first_name, last_name, street, city, state, zipcode, phone, email) VALUES
('Joseph', 'Smith', '123 Main St', 'Manhattan', 'NY', '12345', '919-808-9821', 'joseph.smith@gmail.com'),
('Emily', 'Johnson', '456 Elm St', 'Queens', 'NY', '54321', '336-655-0012', 'emily.johnson@yahoo.com'),
('Amy', 'Williams', '789 Oak St', 'Queens', 'NY', '98765', '704-891-0923', 'amy.williams@gmail.com'),
('Michael', 'Johnson', '789 Oak Ave', 'Brooklyn', 'NY', '11223', '718-555-1234', 'michael.johnson@aol.com');

INSERT INTO Pet_Owner (pet_id, owner_id) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 4);

INSERT INTO Veterinarian (first_name, last_name, license_number) VALUES
('Holly', 'Smith', '87453'),
('Jamie', 'Johnson', '01946'),
('Holly', 'Brown', '94857'),
('Nathan', 'Smith', '67392');

INSERT INTO Appointment (date, typeofappt, notes, veterinarian_id) VALUES
('2024-02-11 13:00:00', 'Routine checkup', 'Patient seems healthy overall, no concerns.', 1),
('2024-02-02 09:00:00', 'Vaccination', 'Administered annual vaccinations, patient responded well.', 4),
('2024-03-19 09:00:00', 'Vaccination', 'Administered annual vaccinations, patient fatigued.', 3),
('2024-02-02 10:00:00', 'Dental cleaning', 'Patient had tartar buildup, teeth cleaned successfully.', 3),
('2024-03-08 12:00:00', 'X-ray', 'X-ray performed on spine after patient shows signs of loss of bladder control and pain.', 2),
('2024-05-15 14:30:00', 'Follow-up visit', 'Checked healing progress, patient recovering as expected.', 1),
('2024-04-18 08:15:00', 'Fecal Analysis', 'Routine fecal analysis for routine preventative care.', 3),
('2024-05-22 11:30:00', 'Grooming session', 'Trimmed nails and fur.', 3),
('2024-05-09 14:45:00', 'Vaccination', 'Administered second and final dose of vaccine.', 4),
('2024-03-25 16:00:00', 'Emergency visit', 'Treated eye injury due to sharp item in cage, patient discharged with instructions for care.', 4),
('2024-04-28 09:30:00', 'Urinalysis', 'Requested by owner to assess patient kidney function.', 1),
('2024-05-30 10:30:00', 'Blood test', 'Collected blood sample for testing, awaiting results.', 2),
('2024-05-21 15:15:00', 'Vaccination', 'Administered first dose of vaccine.', 2),
('2024-01-21 12:15:00', 'Dental Cleaning', 'Cleaned and trimmed overgrown teeth', 3),
('2024-05-02 14:30:00', 'Routine checkup', 'Patient is in great condition. No concerns.', 1),
('2018-07-20 08:27:00', 'Initial Visit', 'Newborn kitty is in healthy & feeding successfully. Next visit in two weeks.', 4),
('2024-05-09 10:15:00', 'Routine checkup', 'Patient is in great condition. No concerns', 4);

INSERT INTO Pet_Appointment (pet_id, appointment_id) VALUES
(3,1),
(2,2),
(4,3),
(1,9),
(3,13),
(3,12),
(1,7),
(2,11),
(1,5),
(1,4),
(2,6),
(2,8),
(3,10),
(4,14),
(4,15),
(2,16),
(2,17);

INSERT INTO Lab (type, results, pet_id, appointment_id) VALUES
('Blood Test', 'Normal blood cell count, no abnormalities detected.', 3, 12),
('Fecal Analysis', 'No signs of parasites or abnormal bacteria in fecal sample.', 1, 7),
('Urinalysis', 'Normal urine composition, no signs of infection or kidney issues.', 2, 11),
('X-ray', 'Clear spine X-ray showed signs of Intervertebral Disc Disease.', 1, 5);

INSERT INTO Vaccine (name, pet_id, appointment_id) VALUES
('rabies',2,2),
('rabbit calicivirus',4,3),
('feline herpesvirus',2,2),
('bordetella',1,9),
('rabies',1,13);

INSERT INTO Weight (pet_id, weight, appointment_id) VALUES
(3, 0.5, 1),
(2, 18, 2),
(4, 3, 3),
(1, 25, 9),
(3, 0.42, 13),
(3, 0.52, 12),
(1, 22, 7),
(2, 17, 11),
(1, 27, 5),
(1, 28, 4),
(2, 19, 6),
(2, 20, 8),
(3, 0.6, 10),
(4,4,14),
(4,6,15),
(2,0.35,16),
(2,23,17);

INSERT INTO AfterVisitSummary (notes, vaccine_administered, pet_appointment_id) VALUES
('Patient seems healthy overall, no concerns. Schedule next routine checkup for August 9, 2024.', 'N', 1),
('Administered annual vaccinations, patient responded well.', 'Y', 2),
('Administered annual vaccinations, patient fatigued. Rest and hydration encouraged', 'Y', 3),
('Maintain oral health by brushing and flossing once per day.', 'N', 10),
('Pain medication available for pickup. Physical therapy to start in one week.', 'N', 9),
('Continue to rest and take medications as instructed.', 'N', 11), 
('Will contact owner with instructions following results of fecal analysis.', 'N', 7), 
('Next grooming appointment scheduled for January 8, 2025', 'N', 12),
('All vaccines are up to date. Come back for routine checkup.', 'Y', 4),
('Keep bandage on injured eye until next visit in one week.', 'N', 13),
('Will follow up with results of urinalysis and care instructions (if needed).', 'N', 8), 
('Will follow up with blood test results.', 'N', 6),
('Patient is healthy and up to date on all vaccines.', 'Y', 5),
('Teeth in good condition for now. In the future, bring patient sooner since teeth grow fast', 'N', 14),
('Schedule next checkup for October 2024.', 'N', 15),
('Feed newborn kitten 1-3 oz of milk per day.', 'N', 16),
('Patient needs to drink more water.', 'N', 17);

-- CREATING QUERIES
-- Query 1: Pet Vaccines and Lab Records
SELECT Pet.id as PetID, Pet.name as PetName, GROUP_CONCAT(DISTINCT Lab.type) as LabType, GROUP_CONCAT(DISTINCT Lab.results) as LabResults, GROUP_CONCAT(DISTINCT Vaccine.name) as Vaccine FROM Pet 
	LEFT OUTER JOIN Lab ON Pet.id = Lab.pet_id
    LEFT OUTER JOIN Vaccine ON Pet.id = Vaccine.pet_id
    GROUP BY Pet.ID;

-- Query 2: Pets and Owners
SELECT Pet.id as PetID, Pet.name as PetName, Owner.id as OwnerID, 
CONCAT (Owner.first_name, ' ', Owner.last_name) AS OwnerName FROM Pet 
	LEFT OUTER JOIN Pet_Owner ON Pet.id = Pet_Owner.pet_id
	RIGHT OUTER JOIN Owner ON Owner.id = Pet_Owner.owner_id
    ORDER BY PetName ASC;
    
-- Query 3: Pet Weight min & max weight at certain period
SELECT 
    Pet.name AS PetName, 
    CONCAT(Owner.first_name, ' ', Owner.last_name) AS OwnerName, 
    MIN(Weight.weight) AS MinWeight, 
    MAX(Weight.weight) AS MaxWeight, 
    MIN(Appointment.date) AS MinWeightDate,
    MAX(Appointment.date) AS MaxWeightDate
FROM 
    Pet 
    LEFT JOIN Pet_Owner ON Pet.id = Pet_Owner.pet_id
    LEFT JOIN Owner ON Pet_Owner.owner_id = Owner.id
    LEFT JOIN Weight ON Pet.id = Weight.pet_id
    LEFT JOIN Appointment ON Weight.appointment_id = Appointment.id
WHERE Appointment.date >= DATE_SUB(NOW(), INTERVAL 3 MONTH)
GROUP BY 
    Pet.name, 
    Owner.first_name, 
    Owner.last_name;

-- Query 4: Upcoming/past pet appointments 
-- Query 4A: Shows all pet appointments
SELECT Pet.id as PetID, Pet.name as PetName, Appointment.id as ApptID, Appointment.date as ApptDate FROM Pet 
	LEFT OUTER JOIN Pet_Appointment ON Pet.id= Pet_Appointment.pet_id
    RIGHT OUTER JOIN Appointment ON Pet_Appointment.appointment_id = Appointment.id
    ORDER BY PetID, ApptDate ASC;

-- Query 4B: Shows upcoming appointments if we only want to look at "next 10 days".
SELECT Pet.id as PetID, Pet.name as PetName, Appointment.id as ApptID, Appointment.date as ApptDate FROM Pet 
	LEFT OUTER JOIN Pet_Appointment ON Pet.id= Pet_Appointment.pet_id
    RIGHT OUTER JOIN Appointment ON Pet_Appointment.appointment_id = 
    Appointment.id WHERE (Appointment.date between '2024-05-13' and '2024-05-23')
    ORDER BY ApptDate ASC;

-- Query 5: Frequency of each typeofappt  
SELECT typeofappt, count(typeofappt) AS VisitFrequency FROM Appointment
GROUP BY typeofappt 
    ORDER BY count(typeofappt) DESC;

-- Query 6: Comprehensive Health Summary
-- Query 6A selecting all information from joined tables
SELECT * FROM Pet
    LEFT JOIN Pet_Owner ON Pet.id = Pet_Owner.pet_id
    LEFT JOIN Owner ON Pet_Owner.owner_id = Owner.id
	LEFT JOIN Pet_Appointment ON Pet.id = Pet_Appointment.pet_id  
    LEFT JOIN Appointment ON Appointment.id = Pet_Appointment.appointment_id
	LEFT JOIN Weight ON Appointment.id = Weight.appointment_id
	LEFT JOIN Vaccine ON Appointment.id = Vaccine.appointment_id
	LEFT JOIN Lab ON Appointment.id = Lab.appointment_id
	LEFT JOIN AfterVisitSummary ON Pet_Appointment.id = AfterVisitSummary.pet_appointment_id
    LEFT JOIN Veterinarian ON Veterinarian.id = Appointment.veterinarian_id
	WHERE Appointment.id=10;
    
-- Query 6B Choosing an appointment for a CompHealthSummary
SELECT 
Pet.id AS PetID, 
Pet.name AS PetName, 
CONCAT(Owner.first_name, ' ', Owner.last_name) AS OwnerName, 
Appointment.date AS ApptDate,
CONCAT(Veterinarian.first_name, ' ', Veterinarian.last_name) AS VeterinarianName, 
TIMESTAMPDIFF (YEAR, birthdate, Appointment.date) AS Age,
Pet.birthdate,
Weight.weight AS Weight,
GROUP_CONCAT(DISTINCT Vaccine.name) AS Vaccines,
GROUP_CONCAT(DISTINCT Lab.type) AS LabType,
GROUP_CONCAT(DISTINCT Lab.results) AS LabResults,
Appointment.notes AS ApptNotes,
AfterVisitSummary.notes AS AfterVisitSummaryNotes
FROM Pet
    LEFT JOIN Pet_Owner ON Pet.id = Pet_Owner.pet_id
    LEFT JOIN Owner ON Pet_Owner.owner_id = Owner.id
	LEFT JOIN Pet_Appointment ON Pet.id = Pet_Appointment.pet_id  
    LEFT JOIN Appointment ON Appointment.id = Pet_Appointment.appointment_id
	LEFT JOIN Weight ON Appointment.id = Weight.appointment_id
	LEFT JOIN Vaccine ON Appointment.id = Vaccine.appointment_id
	LEFT JOIN Lab ON Appointment.id = Lab.appointment_id
	LEFT JOIN AfterVisitSummary ON Pet_Appointment.id = AfterVisitSummary.pet_appointment_id
    LEFT JOIN Veterinarian ON Veterinarian.id = Appointment.veterinarian_id
WHERE Appointment.id=10
GROUP BY Pet.id, Owner.first_name, Owner.last_name, Weight.weight, Lab.type, Lab.results, Appointment.notes, AfterVisitSummary.notes;
