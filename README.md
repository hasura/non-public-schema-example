# Non-public Schema Example
Instructions and an example for how to setup up Postgres requirements to use Hasura GraphQL engine when the public schema cannot be used.

The Postgres requirements are fully detailed [here](https://hasura.io/docs/latest/graphql/core/deployment/postgres-requirements/)

## Postgres permissions
If you're running in a controlled environment, you might need to configure the Hasura GraphQL engine to use a specific Postgres user that your DBA gives you.

The Hasura GraphQL engine needs access to your Postgres database(s) with the following permissions

### Metadata Database Permissions
- (required) Read & write access on the schema hdb_catalog.
### User Database Permissions
- (required) Read access to the information_schema and pg_catalog schemas, to query for list of tables. Note that these permissions are usually available by default to all postgres users via [PUBLIC](https://www.postgresql.org/docs/current/sql-grant.html) grant.
- (required) Read access to the schemas (public or otherwise) if you only want to support queries.
- (optional) Write access to the schemas if you want to support mutations as well.
- (optional) To create tables and views via the Hasura console (the admin UI) you'll need the privilege to create tables/views. This might not be required when you're working with an existing database.
- (required only if event triggers are needed) Read, write & create access on schema: hdb_catalog.

### Files
- init-pg/00-postgres-prerequites.sql: SQL code to be run by DBA or privileged user to create hdb_catalog (for Hasura GraphQL engine metadata) & example schemas and hasura_metadata_user & hasura_user users. Granting required permissions.
- init-pg/01-test-example-data.sql: SQL code to be run by DBA or privileged user to create example tables with sample data
- init-pg/02-postgres-table-privileges.sql: SQL code to be run by DBA or privileged user to grante required permissions on the newly created example tables
- docker-compose.yaml: Docker Compose file to run the example with a Postgres database to store the metadata and the test schema
- hasura-metadata: Hasura metadata export that can be re-imported to re-hydrate the Hasura GraphQL engine example. Docs on how to import metadata are [here](https://hasura.io/docs/latest/graphql/core/migrations/manage-metadata/#applying-metadata), just click on the "Console" tab to see detailed step-by-step instructions.