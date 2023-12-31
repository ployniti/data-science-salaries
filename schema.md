# CREATE Database

- Create the database (give it any name you want)

```sql
CREATE DATABASE cs486_db;
```

- Switch to the new database

```sql
\c cs486_db
```

## CREATE SCHEMA

Make sure you are in the correct database before creating a schema. Feel free to change the 'group5' name of the schema to a more relavent name. Of course, you will need to use this schema name to create/list the tables, views, or other queries created on the schema.

```sql
CREATE SCHEMA group5;
```

## CREATE MAIN Table

- Copy this to postgres to create the table

```bash
CREATE TABLE group5.main (
  listing_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	work_year INT,
	experience CHAR(2),
	company_location CHAR(2),
	salary REAL,
	remote_ratio INT,
	company_size CHAR(1),
	employee_residence CHAR(2),
	job_title VARCHAR(100),
	employment_type CHAR(2)
);
```

## Using \copy to Load Main Table

Navigate to the directory where the table csv's are located: /express_server/cs486_db_notes/table_csv. Open this directory in your Terminal and use the following to \copy the data into the group5.main table.

- [Quick Link to directory holding the: salaries_main.csv](./table_csv/)

```sql
\copy group5.main (work_year, experience, employment_type,
job_title, salary, employee_residence, remote_ratio, company_location, company_size)
from salaries_main.csv with csv header
```

## Using INSERT INTO | if \copy did not work

- If you are on a Windows or (WSL), you may not be able to use the \copy or COPY function to pull in the data from the [salaries_main.csv file](./table_csv/main_insert_into.csv) and will need to copy and paste the data from the provided 'main_insert_into.csv' link. This has been set up to simply copy and paste into your terminal. The total number of rows in the data table will be 3755.

- [Open main_insert_into.csv](./table_csv/main_insert_into.csv)
