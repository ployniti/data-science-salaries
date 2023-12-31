CREATE TABLE group5.employment_type (
	type_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	type CHAR(2) NOT NULL UNIQUE
);

INSERT INTO group5.employment_type (type) VALUES ('FT'), ('PT'), ('CT'), ('FL');

ALTER TABLE group5.main ADD COLUMN type_id INT;

UPDATE group5.main
SET type_id = employment_type.type_id
FROM group5.employment_type
WHERE group5.main.employment_type = group5.employment_type.type;

ALTER TABLE group5.main DROP COLUMN employment_type;

ALTER TABLE group5.main
ADD CONSTRAINT employment_type_fk_listing
FOREIGN KEY (type_id)
REFERENCES group5.employment_type (type_id)
ON DELETE CASCADE;

