-- Remove public schema
DROP SCHEMA public;

-- Hasura GrapQL engine prerequisite 
-- Create hasura_metadata_user & hdb_catalog schema with privileges
CREATE USER hasura_metadata_user WITH PASSWORD 'hasura_metadata_user_password';
CREATE SCHEMA IF NOT EXISTS hdb_catalog;
ALTER SCHEMA hdb_catalog OWNER TO hasura_metadata_user;
ALTER ROLE hasura_metadata_user SET search_path TO hdb_catalog;
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA hdb_catalog;

-- Hasura GrapQL engine prerequisite
-- Create hasura_user with hdb_catalog privileges
CREATE USER hasura_user WITH PASSWORD 'hasura_user_password';
GRANT USAGE ON SCHEMA hdb_catalog TO hasura_user;
GRANT CREATE ON SCHEMA hdb_catalog TO hasura_user;
GRANT ALL ON ALL TABLES IN SCHEMA hdb_catalog TO hasura_user;
GRANT ALL ON ALL SEQUENCES IN SCHEMA hdb_catalog TO hasura_user;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA hdb_catalog TO hasura_user;

-- Create example schema to illustrate accessing data from a schema 
-- that is not public
CREATE SCHEMA IF NOT EXISTS example;
GRANT USAGE ON SCHEMA example TO hasura_user;
GRANT SELECT ON ALL TABLES IN SCHEMA information_schema TO hasura_user;
GRANT SELECT ON ALL TABLES IN SCHEMA pg_catalog TO hasura_user;

-- Hasura GrapQL engine prerequisite 
-- Install pgcrypto
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA example;

-- Hasura GrapQL engine prerequisite 
-- Add hdb_catalog to the user/role search_path
ALTER ROLE hasura_user SET search_path TO example,hdb_catalog;
