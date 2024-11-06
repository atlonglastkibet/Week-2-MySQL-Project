CREATE DATABASE stud_db;
USE stud_db;
 
SET SQL_SAFE_UPDATES =0;

CREATE TABLE personal_details (
national_ID INTEGER(15) , stud_ID VARCHAR(15),stud_name VARCHAR(100),
phone_number VARCHAR(15),age INTEGER, gender VARCHAR(10),
PRIMARY KEY(national_ID) );

INSERT INTO personal_details (national_ID,stud_ID,stud_name,phone_number,age,gender)
VALUES("344534","stud101","Hermione Granger" ,"0712345678",20,"Male"),
("379683","stud102","Draco Malfo" ,"0723456781",21,"Female"),
("347403","stud103","Jayden Wamashati" ,"0734567812",22,"Male"),
("377302","stud104","Ron Weasley" ,"0745678123",19,"Female"),
("336741","stud105","Dolores Umbridge" ,"0756781234",21,"Male"),
("307243","stud106","Hedwig Tonks" ,"0767812345",21,"Female"),
("310932","stud107","Chao Chang" ,"0778123456",22,"Male"),
("343920","stud108","Curfew Yaeitpm" ,"0781234567",20,"Female"),
("345261","stud109","Chaptr Mukenya" ,"0722345678",20,"Male"),
("339152","stud110","Natalie Mpema" ,"0733456781",21,"Female"),
("339746","stud111","Crew Nundi" ,"0744567812",20,"Male"),
("336373","stud112","Bandi Kagunda" ,"0755678123",22,"Female"),
("325252","stud113","Testimony Omolo" ,"0766456781",21,"Male"),
("321746","stud114","Career Mpya" ,"0741367812",20,"Male"),
("390234","stud115","Deamon Anduro" ,"0744421123",22,"Female");

# ------------------------------------------------------------------------------------------

CREATE TABLE school_details(stud_ID VARCHAR(15), current_home_county VARCHAR(20), 
secondary_school_county VARCHAR(20), residence VARCHAR(15), stud_email VARCHAR(50),
PRIMARY KEY (stud_ID)  );

INSERT INTO school_details(stud_ID)
SELECT stud_ID
FROM personal_details;

UPDATE school_details 
SET stud_email = (SELECT CONCAT(REPLACE (stud_name,' ','') ,'@zinduaschool.ac')
					FROM personal_details
					WHERE school_details.stud_ID = personal_details.stud_ID) ;

UPDATE school_details SET current_home_county="Nakuru", secondary_school_county="Nairobi", residence="In school" WHERE stud_ID="stud101";  
UPDATE school_details SET current_home_county="Nairobi", secondary_school_county="Nakuru", residence="In school" WHERE stud_ID="stud102";
UPDATE school_details SET current_home_county="Samburu", secondary_school_county="Nairobi", residence="Out of school" WHERE stud_ID="stud103";
UPDATE school_details SET current_home_county="Kericho", secondary_school_county="Nairobi", residence="In school" WHERE stud_ID="stud104";
UPDATE school_details SET current_home_county="Nyamira", secondary_school_county="Nakuru", residence="In school" WHERE stud_ID="stud105";
UPDATE school_details SET current_home_county="Kisumu", secondary_school_county="Nairobi", residence="Out of school" WHERE stud_ID="stud106";
UPDATE school_details SET current_home_county="Nakuru", secondary_school_county="Nairobi", residence="Out of school" WHERE stud_ID="stud107";
UPDATE school_details SET current_home_county="Kisumu", secondary_school_county="Mombasa", residence="Out of school" WHERE stud_ID="stud108";
UPDATE school_details SET current_home_county="Kericho", secondary_school_county="Mombasa", residence="In school" WHERE stud_ID="stud109";
UPDATE school_details SET current_home_county="Nakuru", secondary_school_county="Mombasa", residence="In school" WHERE stud_ID="stud110";
UPDATE school_details SET current_home_county="Kiambu", secondary_school_county="Turkana", residence="In school" WHERE stud_ID="stud111";
UPDATE school_details SET current_home_county="Nairobi", secondary_school_county="Nakuru", residence="In school" WHERE stud_ID="stud112";
UPDATE school_details SET current_home_county="Samburu", secondary_school_county="Taita Taveta", residence="In school" WHERE stud_ID="stud113";
UPDATE school_details SET current_home_county="Kericho", secondary_school_county="Nairobi", residence="Out of school" WHERE stud_ID="stud114";
UPDATE school_details SET current_home_county="Kiambu", secondary_school_county="Mombasa", residence="In school" WHERE stud_ID="stud115";

# ------------------------------------------------------------------------------------------

CREATE TABLE contact_details (stud_email VARCHAR(50) , phone_number VARCHAR(15), next_of_kin_name VARCHAR(50),next_of_kin_relation VARCHAR(10), next_of_kin_contacts VARCHAR(13) );
INSERT INTO contact_details(phone_number, next_of_kin_name,next_of_kin_relation,next_of_kin_contacts)
VALUES("0712345678","Darius Young","Father","0782382383"),
("0723456781","Lucy Nderitu","Mother","0723238983"),
("0734567812","Jerotich Koech","Mother","0779343126"),
("0745678123","Mwaura Mwangi","Father","0798246347"),
("0756781234","Ian Patrick","Father","0711234453"),
("0767812345","Lebron James","Father","0765439233"),
("0778123456","Magna Carter","Father","0702526243"),
("0781234567","Cindy Wayne","Mother","0747282839"),
("0722345678","Farah Maalim","Mother","0753927482"),
("0733456781","Faiba Mbugua","Father","0713245748"),
("0744567812","John Doe","Father","0725737383"),
("0755678123","Klaus Michealson","Father","0789346276"),
("0766456781","Suluhu Amdany","Mother","0785739259"),
("0741367812","Daisy Auma","Mother","0791344537"),
("0755421123","Getrude Karen","Mother","0765748244");


UPDATE contact_details
SET stud_email = (SELECT school_details.stud_email
FROM school_details, personal_details
WHERE school_details.stud_ID = personal_details.stud_ID
AND personal_details.phone_number = contact_details.phone_number);

ALTER TABLE contact_details
MODIFY stud_email VARCHAR(50) PRIMARY KEY;

# ------------------------------------------------------------------------------------------

CREATE TABLE financial_details (stud_ID VARCHAR(15) ,stud_name VARCHAR(50) ,
sem_fee INTEGER(6) , fee_paid INTEGER(6),
PRIMARY KEY(stud_ID) );

INSERT INTO financial_details(stud_ID,stud_name)
SELECT personal_details.stud_ID, personal_details.stud_name
FROM personal_details;

UPDATE financial_details SET sem_fee = 25000, fee_paid=25000 WHERE stud_ID = "stud101";
UPDATE financial_details SET sem_fee= 25000, fee_paid=19000 WHERE stud_ID = "stud102";
UPDATE financial_details SET sem_fee= 21900, fee_paid=20000 WHERE stud_ID = "stud103";
UPDATE financial_details SET sem_fee= 22000, fee_paid=22000 WHERE stud_ID = "stud104";
UPDATE financial_details SET sem_fee= 25000, fee_paid=23400 WHERE stud_ID = "stud105";
UPDATE financial_details SET sem_fee= 25000, fee_paid=27000 WHERE stud_ID = "stud106";
UPDATE financial_details SET sem_fee= 24230, fee_paid=21200 WHERE stud_ID = "stud107";
UPDATE financial_details SET sem_fee= 25000, fee_paid=23500 WHERE stud_ID = "stud108";
UPDATE financial_details SET sem_fee= 25000, fee_paid=24500 WHERE stud_ID = "stud109";
UPDATE financial_details SET sem_fee= 25000, fee_paid=25000 WHERE stud_ID = "stud110";
UPDATE financial_details SET sem_fee= 26000, fee_paid=26000 WHERE stud_ID = "stud111";
UPDATE financial_details SET sem_fee= 25000, fee_paid=20900 WHERE stud_ID = "stud112";
UPDATE financial_details SET sem_fee= 25000, fee_paid=22300 WHERE stud_ID = "stud113";
UPDATE financial_details SET sem_fee= 19000, fee_paid=19000 WHERE stud_ID = "stud114";
UPDATE financial_details SET sem_fee= 20800, fee_paid=20800 WHERE stud_ID = "stud115";

SET SQL_SAFE_UPDATES =1;

-- VIEWING THE TABLES
SELECT * FROM personal_details;
SELECT * FROM school_details;
SELECT * FROM financial_details;
DROP TABLE contact_details;
SELECT * FROM contact_details;
DROP VIEW new_stud_details;

-- a. Using JOIN get the student names, school id, email, phone number (new_stud_details)
CREATE VIEW new_stud_details AS
    SELECT personal_details.stud_name, personal_details.stud_ID, personal_details.phone_number, school_details.stud_email
    FROM personal_details
    LEFT JOIN school_details
    ON personal_details.stud_ID = school_details.stud_ID;

SELECT * FROM new_stud_details; -- To view

-- b. Create a table with all the details from contacts to school and financial details (full_stud_details)
CREATE VIEW full_stud_details AS
SELECT
    personal_details.national_ID,
    personal_details.stud_ID,
    personal_details.stud_name,
    personal_details.phone_number,
    personal_details.age,
    personal_details.gender,
    school_details.current_home_county,
    school_details.secondary_school_county,
    school_details.residence,
    school_details.stud_email,
    financial_details.sem_fee,
    financial_details.fee_paid
FROM personal_details
INNER JOIN school_details
ON personal_details.stud_ID = school_details.stud_ID
INNER JOIN financial_details
ON school_details.stud_ID = financial_details.stud_ID;

SELECT * FROM full_stud_details;

-- c. Add student names on any empty row of stud_name in financial_details
SELECT * FROM financial_details;
INSERT INTO financial_details (stud_ID, stud_name, sem_fee, fee_paid)
    VALUES ('stud116', 'David Kibet', 34000, 23000);

SELECT * FROM financial_details;

-- d. On the financial_details table add a column, fee_cleared, that has True if student has cleared current fee and False if not (financial_details_view)
CREATE VIEW financial_details_view AS
SELECT
    financial_details.stud_name,
    financial_details.stud_ID,
    financial_details.sem_fee,
    financial_details.fee_paid,
    (fee_paid >= sem_fee) AS Fee_cleared
FROM financial_details;
-- 1 is True, 0 is false


-- e. Get the national ID and name of all students who have cleared their fees (fee_cleared)
CREATE VIEW Fee_cleared_View AS -- First I create a view to store financial details where fee cleared is true
SELECT *
FROM financial_details_view
WHERE Fee_cleared = TRUE;

SELECT personal_details.national_ID,Fee_cleared_View.stud_ID, Fee_cleared_View.Fee_cleared -- I use inner join to place national ID and Fee cleared
FROM personal_details
INNER JOIN Fee_cleared_View
ON personal_details.stud_ID = Fee_cleared_View.stud_ID;

-- f. Get the total sum of fees paid so far and the total current deficit (total_fee_balance)
SELECT
    SUM(financial_details.sem_fee - financial_details.fee_paid)
        AS total_fee_balance
FROM financial_details;

 -- g. Get the count of students who share a current home county i.e., Say Nairobi, get the number of students whose current_home_county is Nairobi, and so on for all available counties (home_county_count)
 SELECT current_home_county, COUNT(stud_ID)
 FROM school_details
 GROUP BY current_home_county;

-- h. Get the count of Male and/or Female students from each secondary_school_county (secondary_school_count). The table should contain a column for male student count and female student count for each county.
SELECT
    secondary_school_county,
    COUNT(gender = 'Male') AS Male,
    COUNT(gender ='Female') AS Female
FROM full_stud_details
GROUP BY secondary_school_county;

-- i. Get the percentage of students who set their next_of_kin as Mother vs those that set it as Father1. (kin_percentage)
SELECT * FROM contact_details;
SELECT next_of_kin_relation,
    (COUNT(next_of_kin_relation)*100/(SELECT COUNT(*) FROM contact_details)) AS kin_percentage
    FROM contact_details
GROUP BY next_of_kin_relation;