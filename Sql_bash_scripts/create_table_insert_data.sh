#!/bin/bash

# Define database connection parameters
DB_NAME="anvi"
DB_USER="postgres"

# Create the SQL commands
SQL_COMMANDS=$(cat <<EOF
DROP TABLE IF EXISTS design;
CREATE TABLE design (
    id SERIAL PRIMARY KEY,
    emp_id VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    project_hr VARCHAR(100)
);
INSERT INTO department (emp_id, position, project_hr)
VALUES ('1000', 'Systems Engineer', 'emp1@cloudbird.fun');
EOF
)

# Execute the SQL commands
psql -U "$DB_USER" -d "$DB_NAME" -c "$SQL_COMMANDS"
