DROP DATABASE IF EXISTS school;
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- 1. TABLES, like # in python
-- 1.1. teacher

CREATE TABLE IF NOT EXISTS teacher ( -- NOT NULL
	teacher_id INT PRIMARY KEY, 
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    language_1 CHAR(2), -- VARCHAR / CHAR: EN, ES, PT, DE
    language_2 CHAR(2),
    dob DATE,
    tax_id INT UNIQUE NOT NULL,
    phone_no VARCHAR(10) -- varchar as you can find: +, (, ) 
);
-- ctrl + A
-- ctrl + shift + enter

-- 1.2. client
CREATE TABLE IF NOT EXISTS client (
	client_id INT PRIMARY KEY, -- not null, it's PK
    client_name VARCHAR(40) NOT NULL,
    address VARCHAR(40),
    industry VARCHAR(40)
);

-- 1.3. participant
CREATE TABLE IF NOT EXISTS participant (
	participant_id INT PRIMARY KEY,
	first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40),
    phone_no VARCHAR(40),
    client INT 
);
 -- client will be the FK referencing 
 -- the PK on client table


-- 1.4. course
CREATE TABLE IF NOT EXISTS course (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(40) NOT NULL,
    language CHAR(3) NOT NULL,
    level CHAR(2) NOT NULL, -- B2, C1, C2...
    course_length_weeks INT,
    start_date DATE,
    in_school BOOLEAN,
    teacher INT, -- this is the PK in another table (FK)
    client INT
    );

-- 2. ALTER TABLES: establish relationships
ALTER TABLE participant 
	ADD FOREIGN KEY (client) -- participant.client
REFERENCES client(client_id) -- table(column)
ON DELETE CASCADE;


ALTER TABLE course
	ADD FOREIGN KEY (teacher) 
REFERENCES teacher(teacher_id)
ON DELETE SET NULL;

ALTER TABLE course
	ADD FOREIGN KEY (client)
REFERENCES client(client_id) -- client, language, level
ON DELETE SET NULL;


CREATE TABLE takes_course (
	participant_id INT,
    course_id INT,
    PRIMARY KEY (participant_id, course_id),
	FOREIGN KEY (participant_id) REFERENCES participant(participant_id) 
        ON DELETE CASCADE,
	FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE
);


-- 4. populate
INSERT INTO teacher (teacher_id, first_name, last_name, language_1, language_2, tax_id)
VALUES (1,  "Mica", "Katzman", "ES", "EN", "234567890");

INSERT INTO teacher VALUES
(2, "Marcel", "fffff", "ES", "CA", NULL, "12345", "98788865");

INSERT INTO teacher VALUES
(3, "Hugo", "Rodríguez", "EN", "CA", NULL, "98765409", "98788865"),
(4, "Marc", "Martínez", "ES", "CA", "1990-01-01", "09876", "98788865"),
(5, "Ronaldo", "Sánchez", "EN", "CA", NULL, "987", "98788865");


-- row 4: From Marc -> Alfons
UPDATE teacher
SET first_name = "Alfons"
WHERE teacher_id = 4;


DELETE FROM teacher WHERE  teacher_id = 1; -- YOU NEED A WHERE
select * from teacher;
