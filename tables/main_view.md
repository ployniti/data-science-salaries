# Create Main View

The **main view** will allow us to quickly query data and minimize the query statements necessary across all reference tables.

- Schema: group5
- View: main_view
- Columns: listing_id (PK), work_year, experience, location, salary_in_usd, remote_ratio, size, residence, title, and type

## CREATE VIEW Schema.Main_VIEW

```sql
CREATE VIEW group5.main_view AS
    SELECT listing_id, work_year, experience, location, salary_in_usd, remote_ratio, size, residence, title, type
    FROM
        group5.main
    INNER JOIN
        group5.work_year
    ON
        group5.main.work_year_id = group5.work_year.work_year_id
    INNER JOIN
        group5.experience
    ON
        group5.main.experience_id = group5.experience.experience_id
    INNER JOIN
        group5.company_location
    ON
        group5.main.location_id = group5.company_location.location_id
    INNER JOIN
        group5.salary
    ON
        group5.main.salary_id = group5.salary.salary_id
    INNER JOIN
        group5.remote_ratio
    ON
        group5.main.remote_ratio_id = group5.remote_ratio.remote_ratio_id
    INNER JOIN
        group5.company_size
    ON
        group5.main.size_id = group5.company_size.size_id
    INNER JOIN
        group5.employee_residence
    ON
        group5.main.residence_id = group5.employee_residence.residence_id
    INNER JOIN
        group5.job_title
    ON
        group5.main.title_id = group5.job_title.title_id
    INNER JOIN
        group5.employment_type
    ON
        group5.main.type_id = group5.employment_type.type_id;
```

## Verify View Structure

```sql
\d+ group5.main_view
```

- View Structure

```bash
                                     View "group5.main_view"
    Column     |          Type          | Collation | Nullable | Default | Storage  | Description
---------------+------------------------+-----------+----------+---------+----------+-------------
 listing_id    | integer                |           |          |         | plain    |
 work_year     | integer                |           |          |         | plain    |
 experience    | character(2)           |           |          |         | extended |
 location      | character(2)           |           |          |         | extended |
 salary_in_usd | real                   |           |          |         | plain    |
 remote_ratio  | integer                |           |          |         | plain    |
 size          | character(1)           |           |          |         | extended |
 residence     | character(2)           |           |          |         | extended |
 title         | character varying(100) |           |          |         | extended |
 type          | character(2)           |           |          |         | extended |
View definition:
 SELECT main.listing_id,
    work_year.work_year,
    experience.experience,
    company_location.location,
    salary.salary_in_usd,
    remote_ratio.remote_ratio,
    company_size.size,
    employee_residence.residence,
    job_title.title,
    employment_type.type
   FROM group5.main
     JOIN group5.work_year ON main.work_year_id = work_year.work_year_id
     JOIN group5.experience ON main.experience_id = experience.experience_id
     JOIN group5.company_location ON main.location_id = company_location.location_id
     JOIN group5.salary ON main.salary_id = salary.salary_id
     JOIN group5.remote_ratio ON main.remote_ratio_id = remote_ratio.remote_ratio_id
     JOIN group5.company_size ON main.size_id = company_size.size_id
     JOIN group5.employee_residence ON main.residence_id = employee_residence.residence_id
     JOIN group5.job_title ON main.title_id = job_title.title_id
     JOIN group5.employment_type ON main.type_id = employment_type.type_id;
```
## View

```sql
SELECT * FROM group5.main_view limit 5;
```

```bash
 listing_id | work_year | experience | location | salary_in_usd | remote_ratio | size | residence |       title        | type
------------+-----------+------------+----------+---------------+--------------+------+-----------+--------------------+------
       2945 |      2022 | SE         | US       |        250000 |            0 | M    | US        | Analytics Engineer | FT
        116 |      2023 | SE         | US       |        150000 |            0 | M    | US        | Data Scientist     | FT
       3619 |      2021 | EN         | US       |         72500 |          100 | L    | US        | Data Engineer      | FT
         71 |      2023 | SE         | US       |        115000 |            0 | M    | US        | Data Engineer      | FT
       1887 |      2022 | SE         | US       |        190000 |            0 | M    | US        | Data Scientist     | FT
(5 rows)
```