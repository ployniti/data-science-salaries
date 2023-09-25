CREATE TABLE group5.employee_residence (
	residence_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	residence CHAR(2) NOT NULL UNIQUE
);

INSERT INTO group5.employee_residence (residence) VALUES ('ES');
INSERT INTO group5.employee_residence (residence) VALUES ('US');
INSERT INTO group5.employee_residence (residence) VALUES ('CA');
INSERT INTO group5.employee_residence (residence) VALUES ('DE');
INSERT INTO group5.employee_residence (residence) VALUES ('GB');
INSERT INTO group5.employee_residence (residence) VALUES ('NG');
INSERT INTO group5.employee_residence (residence) VALUES ('IN');
INSERT INTO group5.employee_residence (residence) VALUES ('HK');
INSERT INTO group5.employee_residence (residence) VALUES ('PT');
INSERT INTO group5.employee_residence (residence) VALUES ('NL');
INSERT INTO group5.employee_residence (residence) VALUES ('CH');
INSERT INTO group5.employee_residence (residence) VALUES ('CF');
INSERT INTO group5.employee_residence (residence) VALUES ('FR');
INSERT INTO group5.employee_residence (residence) VALUES ('AU');
INSERT INTO group5.employee_residence (residence) VALUES ('FI');
INSERT INTO group5.employee_residence (residence) VALUES ('UA');
INSERT INTO group5.employee_residence (residence) VALUES ('IE');
INSERT INTO group5.employee_residence (residence) VALUES ('IL');
INSERT INTO group5.employee_residence (residence) VALUES ('GH');
INSERT INTO group5.employee_residence (residence) VALUES ('AT');
INSERT INTO group5.employee_residence (residence) VALUES ('CO');
INSERT INTO group5.employee_residence (residence) VALUES ('SG');
INSERT INTO group5.employee_residence (residence) VALUES ('SE');
INSERT INTO group5.employee_residence (residence) VALUES ('SI');
INSERT INTO group5.employee_residence (residence) VALUES ('MX');
INSERT INTO group5.employee_residence (residence) VALUES ('UZ');
INSERT INTO group5.employee_residence (residence) VALUES ('BR');
INSERT INTO group5.employee_residence (residence) VALUES ('TH');
INSERT INTO group5.employee_residence (residence) VALUES ('HR');
INSERT INTO group5.employee_residence (residence) VALUES ('PL');
INSERT INTO group5.employee_residence (residence) VALUES ('KW');
INSERT INTO group5.employee_residence (residence) VALUES ('VN');
INSERT INTO group5.employee_residence (residence) VALUES ('CY');
INSERT INTO group5.employee_residence (residence) VALUES ('AR');
INSERT INTO group5.employee_residence (residence) VALUES ('AM');
INSERT INTO group5.employee_residence (residence) VALUES ('BA');
INSERT INTO group5.employee_residence (residence) VALUES ('KE');
INSERT INTO group5.employee_residence (residence) VALUES ('GR');
INSERT INTO group5.employee_residence (residence) VALUES ('MK');
INSERT INTO group5.employee_residence (residence) VALUES ('LV');
INSERT INTO group5.employee_residence (residence) VALUES ('RO');
INSERT INTO group5.employee_residence (residence) VALUES ('PK');
INSERT INTO group5.employee_residence (residence) VALUES ('IT');
INSERT INTO group5.employee_residence (residence) VALUES ('MA');
INSERT INTO group5.employee_residence (residence) VALUES ('LT');
INSERT INTO group5.employee_residence (residence) VALUES ('BE');
INSERT INTO group5.employee_residence (residence) VALUES ('AS');
INSERT INTO group5.employee_residence (residence) VALUES ('IR');
INSERT INTO group5.employee_residence (residence) VALUES ('HU');
INSERT INTO group5.employee_residence (residence) VALUES ('SK');
INSERT INTO group5.employee_residence (residence) VALUES ('CN');
INSERT INTO group5.employee_residence (residence) VALUES ('CZ');
INSERT INTO group5.employee_residence (residence) VALUES ('CR');
INSERT INTO group5.employee_residence (residence) VALUES ('TR');
INSERT INTO group5.employee_residence (residence) VALUES ('CL');
INSERT INTO group5.employee_residence (residence) VALUES ('PR');
INSERT INTO group5.employee_residence (residence) VALUES ('DK');
INSERT INTO group5.employee_residence (residence) VALUES ('BO');
INSERT INTO group5.employee_residence (residence) VALUES ('PH');
INSERT INTO group5.employee_residence (residence) VALUES ('DO');
INSERT INTO group5.employee_residence (residence) VALUES ('EG');
INSERT INTO group5.employee_residence (residence) VALUES ('ID');
INSERT INTO group5.employee_residence (residence) VALUES ('AE');
INSERT INTO group5.employee_residence (residence) VALUES ('MY');
INSERT INTO group5.employee_residence (residence) VALUES ('JP');
INSERT INTO group5.employee_residence (residence) VALUES ('EE');
INSERT INTO group5.employee_residence (residence) VALUES ('HN');
INSERT INTO group5.employee_residence (residence) VALUES ('TN');
INSERT INTO group5.employee_residence (residence) VALUES ('RU');
INSERT INTO group5.employee_residence (residence) VALUES ('DZ');
INSERT INTO group5.employee_residence (residence) VALUES ('IQ');
INSERT INTO group5.employee_residence (residence) VALUES ('BG');
INSERT INTO group5.employee_residence (residence) VALUES ('JE');
INSERT INTO group5.employee_residence (residence) VALUES ('RS');
INSERT INTO group5.employee_residence (residence) VALUES ('NZ');
INSERT INTO group5.employee_residence (residence) VALUES ('MD');
INSERT INTO group5.employee_residence (residence) VALUES ('LU');
INSERT INTO group5.employee_residence (residence) VALUES ('MT');

ALTER TABLE group5.main ADD COLUMN residence_id INT;

UPDATE group5.main
SET residence_id = employee_residence.residence_id
FROM group5.employee_residence
WHERE group5.main.employee_residence = group5.employee_residence.residence;

ALTER TABLE group5.main DROP COLUMN employee_residence;

ALTER TABLE group5.main
ADD CONSTRAINT employee_residence_fk_listing
FOREIGN KEY (residence_id)
REFERENCES group5.employee_residence (residence_id)
ON DELETE CASCADE;

