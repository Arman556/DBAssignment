CREATE TABLE customer(
    customer_id serial NOT NULL,
    cname VARCHAR(100) NOT NULL,
    website VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    CONSTRAINT new_pk1 PRIMARY KEY (customer_id)
);