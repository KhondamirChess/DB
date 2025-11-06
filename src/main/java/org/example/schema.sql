CREATE TABLE Book_Table
(
    book_id       SERIAL PRIMARY KEY,
    book_name     VARCHAR(100) NOT NULL,
    book_author   VARCHAR(50) NOT NULL,
    ADD COLUMN category_id INT REFERENCES Book_Category(category_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;
);

CREATE TABLE BookCategory
(
    category_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Reader_Table
(
    reader_id      SERIAL PRIMARY KEY,
    reader_name    VARCHAR(100) NOT NULL ,
    reader_phone   VARCHAR(20) NOT NULL ,
    reader_address VARCHAR(150) NOT NULL ,
    reader_email   VARCHAR(100) UNIQUE
);

CREATE TABLE Personal_Table
(
    per_id    SERIAL PRIMARY KEY,
    per_name  VARCHAR(100) NOT NULL ,
    per_phone VARCHAR(20) NOT NULL ,
    per_email VARCHAR(100) UNIQUE
);

CREATE TABLE Issue_Table
(
    issue_id    SERIAL PRIMARY KEY,
    reader_id   INT REFERENCES Reader_Table (reader_id) ON DELETE CASCADE ,
    book_id     INT REFERENCES Book_Table (book_id) ON DELETE CASCADE,
    per_id      INT REFERENCES Personal_Table (per_id) ON DELETE CASCADE,
    issue_date  DATE,
    return_date DATE,
    CONSTRAINT chk_dates CHECK (return_date >= issue_date)
);