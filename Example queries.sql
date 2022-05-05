/*CRUD in RDBMS*/

/*Data definition language (DDL)*/
CREATE TABLE employees (
    id            INTEGER       PRIMARY KEY,
    first_name    VARCHAR(50)   not null,
    last_name     VARCHAR(75)   not null,
    mid_name      VARCHAR(50)   not null,
    dateofbirth   DATE          not null
);

DROP TABLE employees;
ALTER TABLE sink ADD bubbles INTEGER;
ALTER TABLE sink DROP COLUMN bubbles;

/*TRUNCATE statement is used to delete all data from a table. It's much faster than DELETE.*/
TRUNCATE TABLE table_name; 

/*Data control language(DCL)*/
 Grant SELECT,INSERT,UPDATE,DELETE on Employee To User1

 Revoke INSERT On Employee To user1

 Deny Update On Employee to user1

/*Data manipulation language (DML)*/

SELECT *
 FROM  Book
 WHERE price > 100.00
 ORDER BY title;

SELECT Book.title AS Title,
       count(*) AS Authors
 FROM  Book
 JOIN  Book_author
   ON  Book.isbn = Book_author.isbn
 GROUP BY Book.title;

 SELECT title,
       count(*) AS Authors
 FROM  Book
 NATURAL JOIN Book_author
 GROUP BY title;

 INSERT INTO phone_book (name, number) VALUES ('John Doe', '555-1212');
 INSERT INTO phone_book VALUES ('John Doe', '555-1212');

 INSERT INTO phone_book2
  SELECT *
   FROM   phone_book
    WHERE  name IN ('John Doe', 'Peter Doe')

 UPDATE T
   SET C1 = C1 + 1
   WHERE C2 = 'a'

 DELETE FROM mytable
   WHERE id IN (
       SELECT id
         FROM mytable2
      );