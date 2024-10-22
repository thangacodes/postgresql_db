-- Script Usage
DO $$
BEGIN
    RAISE NOTICE 'CREATING A TABLE against a DATABASE';
END $$;
CREATE TABLE EMPLOYEE_INFO (
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    emp_id VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    email_id VARCHAR(100)
);
DO $$
BEGIN
    RAISE NOTICE 'INSERTING DATAS TO A TABLE against a DATABASE';
END $$;
INSERT INTO EMPLOYEE_INFO (employee_name, emp_id, position, email_id)
VALUES 
    ('rajesh', '1203', 'MLOps Engineer', 'rajesh@example.com'),
    ('sijesh', '1204', 'AI Engineer', 'sijesh@example.com'),
    ('murugan', '1205', 'Project Manager', 'murugan@example.com');
-- 
DO $$
BEGIN
    RAISE NOTICE 'INSERTING DATAS TO A TABLE against a DATABASE';
END $$;
INSERT INTO EMPLOYEE_INFO (employee_name, emp_id, position, email_id)
VALUES 
    ('priya', '1206', 'TAG Analyst', 'priya@example.com'),
    ('sivani', '1207', 'TAG Lead', 'sivani@example.com'),
    ('Indraja', '1208', 'TAG Head', 'indraja@example.com');
-- 
DO $$
BEGIN
    RAISE NOTICE 'CREATING A TABLE against a DATABASE';
END $$;
CREATE TABLE project_managers (
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    emp_id VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    email_id VARCHAR(100)
);
DO $$
BEGIN
    RAISE NOTICE 'CREATING A TABLE against a DATABASE';
END $$;
CREATE TABLE site_operations (
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    emp_id VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    email_id VARCHAR(100)
);
--
DO $$
BEGIN
    RAISE NOTICE 'INSERTING A TABLE against a DATABASE';
END $$;
INSERT INTO project_managers (employee_name, emp_id, position, email_id)
VALUES 
    ('Kiran', '1210', 'Project Manager', 'kiran@exnample.com'),
    ('Anita', '1211', 'Senior Project Manager', 'anita@example.com');
INSERT INTO site_operations (employee_name, emp_id, position, email_id)
VALUES 
    ('Suresh', '1212', 'Site Supervisor', 'suresh@example.com'),
    ('girish', '1213', 'Operations Manager', 'girish@example.com');
--
-- How can I connect to the 'anvi' database using an application or functional user named 'dbadmin'?
DO $$
BEGIN
    RAISE NOTICE 'CREATE USER, GRANT PRIVILEGES, against a DATABASE CALLED ANVI';
END $$;
begin;
set local lock_timeout='2s'; 
CREATE USER dbadmin WITH PASSWORD '12345';  # Create the user with password set
GRANT CONNECT ON DATABASE anvi TO dbadmin;  # Grant privileges to the database
GRANT USAGE ON SCHEMA public TO dbadmin;    # Grant usage on the schema (assuming it's the public schema)
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dbadmin; # Grant privileges on all tables in the schema:
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO dbadmin; # Ensure that any future tables created in the schema also grant these privileges
commit;
-- 
DO $$
BEGIN
    RAISE NOTICE 'CREATING TABLES against a DATABASE';
END $$;
CREATE TABLE operations;
CREATE TABLE housekeeping (
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    vendor_name VARCHAR(100),
    email_id VARCHAR(100)
);
CREATE TABLE guest (
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    visit_purpose VARCHAR(100),
    email_id VARCHAR(100)
);

INSERT INTO housekeeping (employee_name, vendor_name, email_id)
VALUES 
    ('Hari', 'SSS', 'Hari@example.com'),
    ('Dhamodhar', 'SSS', 'Dhamodhar@example.com');

INSERT INTO guest (employee_name, visit_purpose, email_id)
VALUES 
    ('david', 'Meetup with CEO', 'david@johnson.com'),
    ('john', 'Meetup with CTO', 'john@apple.com');
-- 
-- How to check the sizes of the tables guest and housekeeping ?
SELECT pg_size_pretty(pg_total_relation_size('guest'));
SELECT pg_size_pretty(pg_total_relation_size('housekeeping'));
SELECT table_name, pg_size_pretty(pg_total_relation_size(table_name)) AS size
FROM (VALUES ('guest'), ('housekeeping')) AS t(table_name);

-- 
-- How can I connect to the 'operations' database using an application or functional user named 'appadmin'?
begin;
set local lock_timeout='2s'; 
CREATE USER appadmin WITH PASSWORD '12345';  
GRANT CONNECT ON DATABASE operations TO appadmin;  
GRANT USAGE ON SCHEMA public TO appadmin;    
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO appadmin; 
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO appadmin;
commit;
-- 
begin;
set local lock_timeout='2s'; 
GRANT CONNECT ON DATABASE operations TO postgres;  
GRANT USAGE ON SCHEMA public TO postgres;    
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO postgres; 
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO postgres;
commit;
--
DO $$
BEGIN
    RAISE NOTICE 'CHECKING DATABASE SIZE FOR DATABASES';
END $$;
SELECT pg_size_pretty(pg_database_size('anvi')) AS size_of_anvi;
SELECT pg_size_pretty(pg_database_size('operations')) AS size_of_operations;
SELECT pg_size_pretty(pg_database_size('postgres')) AS size_of_postgres;




