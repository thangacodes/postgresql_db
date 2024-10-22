-- SQL script to truncate tables and check their counts

-- Truncate the specified tables
TRUNCATE TABLE public.design;
TRUNCATE TABLE public.docs;

-- Check the count of records in the tables after truncation
SELECT 'Count of records in design:' AS table_name, COUNT(*) FROM public.design;
SELECT 'Count of records in docs:' AS table_name, COUNT(*) FROM public.docs;

-- Takeway:
-- The TRUNCATE command removes all rows from the specified tables quickly and efficiently.
-- The SELECT COUNT(*) statements will return 0 after truncation, as the tables will be empty.
-- Make sure you have the necessary permissions to truncate the tables, and be cautious as this operation cannot be rolled back.
