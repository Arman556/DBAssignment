CREATE table roles(
    fname VARCHAR(100) NOT NULL,
    fkey serial NOT NULL,
    discription VARCHAR(300),
    CONSTRAINT new_pk2 PRIMARY KEY (fkey)
);