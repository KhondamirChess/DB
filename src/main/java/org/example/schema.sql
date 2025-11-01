CREATE TABLE BookTable
(
    book_id       SERIAL PRIMARY KEY,
    book_name     VARCHAR(100),
    book_category VARCHAR(50),
    book_author   VARCHAR(50)
);

CREATE TABLE ReaderTable
(
    reader_id      SERIAL PRIMARY KEY,
    reader_name    VARCHAR(100),
    reader_phone   VARCHAR(20),
    reader_address VARCHAR(150),
    reader_email   VARCHAR(100)
);

CREATE TABLE PersonalTable
(
    per_id    SERIAL PRIMARY KEY,
    per_name  VARCHAR(100),
    per_phone VARCHAR(20),
    per_email VARCHAR(100)
);

CREATE TABLE IssueTable
(
    issue_id    SERIAL PRIMARY KEY,
    reader_id   INT REFERENCES ReaderTable (reader_id),
    book_id     INT REFERENCES BookTable (book_id) ON DELETE CASCADE,
    per_id      INT REFERENCES PersonalTable (per_id),
    issue_date  DATE,
    return_date DATE
);