CREATE VIEW IssueView AS
SELECT i.issue_id,
       r.reader_name AS reader,
       b.book_name   AS book,
       p.per_name    AS staff,
       i.issue_date,
       i.return_date
FROM IssueTable i
         JOIN ReaderTable r ON i.reader_id = r.reader_id
         JOIN BookTable b ON i.book_id = b.book_id
         JOIN PersonalTable p ON i.per_id = p.per_id;