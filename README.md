# DVD Store

DVD Store is based on the The Dell DVD Store 2 ( https://linux.dell.com/files/dvdstore/ ), which is an open source simulation of an online e-commerce site with different SQL implementations.

Aim: This repo recreates the small size database from the original for learning purposes.

### MySQL Installation

There are two ways to install. The file paths are written assuming you are in the `mysql` directory.

1. Using `mysql`

`mysql -u <username> -p <password> < ds2_schema.sql`

`mysql -u <username> -p <password> ds2 < ds2_data.sql`

Sometimes, if mysql information schema doesn't register the new tables properly. Please run the following command to update `information_schema` with the new tables information.

`analyze table <each table name>;`

2. Using `mysqlsh`

`mysqlsh -u <username> -p <password>`

Once inside the `mysqlsh` shell:

`util.loadDump("./ds2", {threads: 4})`

This should take much less time to install than the `mysql` commands.

#### Exporting `ds2`

To a folder using mysqlsh

```js
util.dumpSchemas(["ds2"],"ds2", {threads: 1, bytesPerChunk: "200M"})
```

Schema SQL using mysqldump

```
mysqldump -u <username> --single-transaction --default-character-set=utf8mb4 --no-data --routines --databases ds2 --result-file ds2_schema.sql
```

Data SQL using mysqldump

```
mysqldump --no-create-db --no-create-info --single-transaction --complete-insert --extended-insert=FALSE --flush-logs -u <username> ds2 > ds2_data.sql
```

### PostgreSQL Installation

Install the Database import from SQL file but first change the name in the SQL file from `dbowner` to an existing user or to `postgres' which is the default user.

```
psql -h localhost -U <username> -d postgres -f ds2dump.sql
```

#### Exporting `ds2`

Database export to SQL

```
pg_dump -h localhost -U remo -d ds2 -c -C -S ds2u -f ds2dump.sql
```

Database export to folder

```
pg_dump -h localhost -U remo -d ds2 -c -C -Fd -f dss
```

### Misc. Information.

Database Comparison between mysql & postgresql

```

mysql> SELECT CONCAT(
    'SELECT "', 
    table_name, 
    '" AS table_name, COUNT(*) AS exact_row_count FROM `', 
    table_schema,
    '`.`',
    table_name, 
    '` UNION '
) 
FROM INFORMATION_SCHEMA.TABLES 
WHERE table_schema = 'ds2';

mysql> SELECT "categories" AS table_name, COUNT(*) AS exact_row_count FROM `ds2`.`categories` UNION
SELECT "cust_hist" AS table_name, COUNT(*) AS exact_row_count FROM `ds2`.`cust_hist` UNION  
SELECT "customers" AS table_name, COUNT(*) AS exact_row_count FROM `ds2`.`customers` UNION  
SELECT "inventory" AS table_name, COUNT(*) AS exact_row_count FROM `ds2`.`inventory` UNION  
SELECT "orderlines" AS table_name, COUNT(*) AS exact_row_count FROM `ds2`.`orderlines` UNION
SELECT "orders" AS table_name, COUNT(*) AS exact_row_count FROM `ds2`.`orders` UNION    
SELECT "products" AS table_name, COUNT(*) AS exact_row_count FROM `ds2`.`products` UNION
SELECT "reorder" AS table_name, COUNT(*) AS exact_row_count FROM `ds2`.`reorder`;

+------------+-----------------+
| table_name | exact_row_count |
+------------+-----------------+
| categories |              16 |
| cust_hist  |           60350 |
| customers  |           20000 |
| inventory  |           10000 |
| orderlines |           60350 |
| orders     |           12000 |
| products   |           10000 |
| reorder    |               0 |
+------------+-----------------+
8 rows in set (1.67 sec)

ds2-# SELECT  nspname, proname FROM pg_catalog.pg_namespace JOIN pg_catalog.pg_proc ON pronamespace = pg_namespace.oid WHERE nspname = 'public';

 schemaname |  relname   | n_live_tup
------------+------------+------------
 public     | categories |         16
 public     | cust_hist  |      60350
 public     | customers  |      20000
 public     | inventory  |      10000
 public     | orderlines |      60350
 public     | orders     |      12000
 public     | products   |      10000
 public     | reorder    |          0
(8 rows)

```