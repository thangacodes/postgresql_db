-- Revoke privileges on tables
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM vadmin; --'vadmin is the functional user';

-- Revoke usage on schema
REVOKE USAGE ON SCHEMA public FROM vadmin; --'removing privilege from public schema';

-- Revoke connect privilege on database (if applicable)
REVOKE CONNECT ON DATABASE vedhu FROM vadmin;  --'removing privilege from database called vedhu;

-- If you have any default privileges set for the role, revoke them as well
ALTER DEFAULT PRIVILEGES IN SCHEMA public REVOKE ALL ON TABLES FROM vadmin;
