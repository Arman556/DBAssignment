CREATE TABLE users
(
  empid SERIAL NOT NULL ,
  firstname VARCHAR(100) NOT NULL,
  middlename VARCHAR(100),
  lastname VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phoneno bigint NOT NULL,
  role integer,
  address VARCHAR(100) NOT NULL,
  CONSTRAINT employee_role_check CHECK (role IN ('0','1','2')),
  CONSTRAINT new_check CHECK (email like '%@%.%'),
  CONSTRAINT new_pk1 PRIMARY KEY (empid),
  CONSTRAINT new_fk1 FOREIGN KEY (role) REFERENCES roles(fkey),
);

insert into users("firstname","middlename","lastname","email","phoneno","role","address")
VALUES ('Arman','deep','singh','arman@gmail.com',8360088497,0,'2402'),
('Ajay','vir','singh','ajay@gmail.com',8349783600,1,'2405'),
('Jass','','Taneja','jass@gmail.com',8392973392,2,'2403');


CREATE OR REPLACE FUNCTION update_validations()
RETURNS TRIGGER AS
$$
BEGIN 
IF NEW.firstname='' THEN
RAISE EXCEPTION 'PLEASE ENTER FIRSTNAME';
END IF;
IF NEW.lastname='' THEN
RAISE EXCEPTION 'PLEASE ENTER LASTNAME';
END IF;
IF NEW.address='' THEN
RAISE EXCEPTION 'PLEASE ENTER ADDRESS';
END IF;
IF NEW.email NOT LIKE '%@%.%' THEN
RAISE EXCEPTION 'PLEASE ENTER VALID EMAIL';
END IF;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER last_updation
  BEFORE UPDATE OR INSERT
  ON users
  FOR EACH ROW
  EXECUTE PROCEDURE update_validations();

  ALTER TABLE users
ADD timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP;