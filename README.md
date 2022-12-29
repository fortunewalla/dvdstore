# DVD Store

DVD Store is based on the The Dell DVD Store 2 ( https://linux.dell.com/files/dvdstore/ ), which is an open source simulation of an online e-commerce site with different SQL implementations.

Aim: This repo recreates the small size database from the original for learning purposes.

### Installation

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

### Exporting `ds2`

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
