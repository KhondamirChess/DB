DROP VIEW IF EXISTS Issue_View;
CREATE VIEW Issue_View AS
SELECT Issue_Table.issue_id,
       Reader_Table.reader_name AS reader,
       Book_Table.book_name   AS book,
       Personal_Table.per_name    AS staff,
       Issue_Table.issue_date,
       Issue_Table.return_date
FROM Issue_Table
         JOIN Reader_Table ON Issue_Table.reader_id = Reader_Table.reader_id
         JOIN Book_Table ON Issue_Table.book_id = Book_Table.book_id
         JOIN Personal_Table ON Issue_Table.per_id = Personal_Table.per_id;