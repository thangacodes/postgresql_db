DO $$
BEGIN
    RAISE NOTICE 'CREATING DATABASE';
END $$;

CREATE DATABASE vedhu;

-- Connect to the 'vedhu' database
\c vedhu vadmin;  --Connecting the newly created database using superuser called 'vadmin'

DO $$
BEGIN
    RAISE NOTICE 'Sleeping for 5 seconds...';
    PERFORM pg_sleep(5);
    RAISE NOTICE 'conninfo...';
    \conninfo
END $$;

-- Print a message for creating the FAMILY table
DO $$
BEGIN
    RAISE NOTICE 'CREATING FAMILY TABLE against the DATABASE';
END $$;

-- Create the FAMILY table
CREATE TABLE FAMILY (
    id SERIAL PRIMARY KEY,
    members_name VARCHAR(90),
    members_age INT NOT NULL, -- Changed to INT for age
    members_education VARCHAR(90),
    members_dob DATE -- Changed to DATE for better data handling
);

INSERT INTO FAMILY (members_name, members_age, members_education, members_dob)
VALUES
    ('joe', 35, 'engineering', '1989-06-07'),
    ('john', 36, 'engineering', '1989-04-10'),
    ('silpa', 42, 'degree', '1882-10-02'),
    ('ajay', 32, 'degree', '1992-08-12'),
    ('spurthi', 35, 'engineering', '1989-08-15'),
    ('vedhu', 20, 'doctor', '1990-03-03');

-- Create a Role called vadmin with password
DO $$
BEGIN
   RAISE NOTICE 'creating role vadmin and granting permission to the database vedhu';
END $$;

-- Create Role vadmin with password
CREATE ROLE vadmin WITH LOGIN PASSWORD 'login1-2'; -- Use CREATE ROLE with LOGIN
GRANT CONNECT ON DATABASE vedhu TO vadmin;
GRANT USAGE ON SCHEMA public TO vadmin; -- Grant to vadmin, not vedhu
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO vadmin; -- Grant to vadmin
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO vadmin; -- Grant to vadmin
GRANT TRUNCATE ON TABLE family TO vadmin;
