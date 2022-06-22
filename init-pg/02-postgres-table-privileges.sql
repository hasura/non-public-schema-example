-- Grant privileges on newly created tables (in file 01-...) 
GRANT ALL ON ALL TABLES IN SCHEMA example TO hasura_user;
GRANT ALL ON ALL SEQUENCES IN SCHEMA example TO hasura_user;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA example TO hasura_user;
