# query-optimization-postgresql
Query optimizations for PostgreSQL , part of advanced RDBMS masters course


### Start the psql tool
docker compose exec db psql -U admin -d bank

### Implement migrations
\i /sql/01_schema.sql
\i /sql/02_seed.sql
\i /sql/03_check_data.sql
\i /sql/04_get_orderid.sql
\i /sql/05_no_index_test_analyze.sql
\i /sql/06_create_index_orders.sql
\i /sql/07_query_rewrite_bad.sql
\i /sql/08_query_rewrite_good.sql
\i /sql/09_join_order_optimization.sql
\i /sql/10_index_selectivity_query.sql
\i /sql/08_query_rewrite_good.sql



