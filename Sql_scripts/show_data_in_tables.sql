-- Print a banner message
RAISE NOTICE '***********************************************************************';

DO $$
BEGIN
    RAISE NOTICE 'Starting to execute a SQL script to show the data that exists in tables';
END $$;

-- Print another banner message
RAISE NOTICE '***********************************************************************';

-- Declare and set variables
DO $$
DECLARE
    table_name1 TEXT := 'design';
    table_name2 TEXT := 'employee_info';
    table_name3 TEXT := 'project_managers';
    table_name4 TEXT := 'site_operations';
BEGIN
-- Print the table names in a single message
RAISE NOTICE 'Displaying data from: %, %, %, %', table_name1, table_name2, table_name3, table_name4;

-- Execute dynamic SQL for each table
    RAISE NOTICE 'Data from table: %', table_name1;
    EXECUTE format('SELECT * FROM %I', table_name1);

    RAISE NOTICE 'Data from table: %', table_name2;
    EXECUTE format('SELECT * FROM %I', table_name2);

    RAISE NOTICE 'Data from table: %', table_name3;
    EXECUTE format('SELECT * FROM %I', table_name3);

    RAISE NOTICE 'Data from table: %', table_name4;
    EXECUTE format('SELECT * FROM %I', table_name4);
END $$;

-- Note: If you want to see the actual data, you must run SELECT statements separately.

SELECT * FROM design;
SELECT * FROM employee_info;
SELECT * FROM project_managers;
SELECT * FROM site_operations;
