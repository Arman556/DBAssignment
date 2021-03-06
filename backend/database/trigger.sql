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