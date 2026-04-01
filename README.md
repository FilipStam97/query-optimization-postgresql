# query-optimization-postgresql
Query optimizations for PostgreSQL , part of advanced RDBMS masters course


### Start the psql tool
docker compose exec db psql -U admin -d bank

### Implement migrations
\i /sql/01_schema.sql
\i /sql/02_seed.sql