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