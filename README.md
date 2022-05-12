#SQL Basics

#####Write a SQL query to find the 10th highest employee salary from an Employee table.

MySQL:
SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 9,1;

PostgreSQL:
SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 1 OFFSET 9;


######Write a SQL query using UNION ALL (not UNION) that uses the WHERE clause to eliminate duplicates.
SELECT * FROM mytable WHERE a=X UNION ALL SELECT * FROM mytable WHERE b=Y AND a!=X

######How can you select all the even number records from a table? All the odd number records?

Select * from table where id % 2 = 0 

To select all the odd number records from a table:
Select * from table where id % 2 != 0


######What is the difference between the WHERE and HAVING clauses?
Answer:  When GROUP BY is not used, the WHERE and HAVING clauses are essentially equivalent. However, when GROUP BY is used:

- The WHERE clause is used to filter records from a result. The filtering occurs before any groupings are made.
- The HAVING clause is used to filter values from a group (i.e., to check conditions after aggregation into groups has been performed).


#####What is the difference between char and varchar2?
Answer:When stored in a database, varchar2 uses only the allocated space. E.g. if you have a varchar2(1999) and put 50 bytes in the table, it will use 52 bytes. But when stored in a database, char always uses the maximum length and is blank-padded. E.g. if you have char(1999) and put 50 bytes in the table, it will consume 2000 bytes.


######What does UNION do? What is the difference between UNION and UNION ALL?
Answer:UNION merges the contents of two structurally-compatible tables into a single combined table. The difference between UNION and UNION ALL is that UNION will omit duplicate records whereas UNION ALL will include duplicate records.

It is important to note that the performance of UNION ALL will typically be better than UNION, since UNION requires the server to do the additional work of removing any duplicates. So, in cases where is is certain that there will not be any duplicates, or where having duplicates is not a problem, use of UNION ALL would be recommended for performance reasons. 




What are the different Clauses used in SQL?
WHERE Clause: This clause is used to define the condition, extract and display only those records which fulfill the given condition.

GROUP BY Clause: It is used with SELECT statement to group the result of the executed query using the value specified in it. It matches the value with the column name in tables and groups the end result accordingly.

HAVING clause: This clause is used in association with the GROUP BY clause. It is applied to each group of results or the entire result as a single group. It is much similar as WHERE clause but the only difference is you cannot use it without GROUP BY clause

ORDER BY clause: This clause is used to define the order of the query output either in ascending (ASC) or in descending (DESC). Ascending (ASC) is set as the default one but descending (DESC) is set explicitly.

USING clause: USING clause comes in use while working with SQL JOIN. It is used to check equality based on columns when tables are joined. It can be used instead of the ON clause in JOIN.

Example Syntax:

SELECT column_name(s) 
 FROM table_name 
 WHERE condition 
 ORDER BY column_name ASC|DESC;


Why do we use SQL constraints? Which constraints we can use while creating a database in SQL?
Answer: Constraints are used to set the rules for all records in the table. If any constraints get violated then it can abort the action that caused it.

Constraints are defined while creating the database itself with the CREATE TABLE statement or even after the table is created once with the ALTER TABLE statement. There are 5 major constraints are used in SQL, such as

NOT NULL: That indicates that the column must have some value and cannot be left NULL.
UNIQUE: This constraint is used to ensure that each row and column has a unique value and no value is being repeated in any other row or column.
PRIMARY KEY: This constraint is used in association with NOT NULL and UNIQUE constraints such as on one or the combination of more than one column to identify the particular record with a unique identity.
FOREIGN KEY: It is used to ensure the referential integrity of data in the table. It matches the value in one table with another using the PRIMARY KEY.
CHECK: It ensures whether the value in columns fulfills the specified condition.
 
What are different JOINS used in SQL?
Answer: 4 major types of Joins are used while working on multiple tables in SQL databases:

INNER JOIN: It is also known as SIMPLE JOIN which returns all rows from BOTH tables when it has at least one matching column.

LEFT JOIN (LEFT OUTER JOIN): This join returns all rows from the LEFT table and its matched rows from a RIGHT table.

RIGHT JOIN (RIGHT OUTER JOIN): This joins returns all rows from the RIGHT table and its matched rows from the LEFT table.

FULL JOIN (FULL OUTER JOIN): This joins returns all results when there is a match either in the RIGHT table or in the LEFT table.

Syntax:

SELECT column_name(s)
 FROM table_name1
 FULL OUTER JOIN table_name2
 ON column_name1=column_name2;
For Example,


What are transactions and their controls?
Answer: A transaction can be defined as the sequence task that is performed on databases in a logical manner to gain certain results. Operations like Creating, updating, deleting records performed in the database come from transactions.In simple words, we can say that a transaction means a group of SQL queries executed on database records. There are 4 transaction controls such as

COMMIT: It is used to save all changes made through the transaction.
ROLLBACK: It is used to roll back the transaction. All changes made by the transaction are reverted back and the database remains as before.
SET TRANSACTION: Set the name of the transaction.
SAVEPOINT: It is used to set the point where the transaction is to be rolled back.

What are the properties of the transaction?
Answer: Properties of the transaction are known as ACID properties. These are:

Atomicity: Ensures the completeness of all transactions performed. Checks whether every transaction is completed successfully or not. If not, then the transaction is aborted at the failure point and the previous transaction is rolled back to its initial state as changes are undone.
Consistency: Ensures that all changes made through successful transactions are reflected properly on the database.
Isolation: Ensures that all transactions are performed independently and changes made by one transaction are not reflected on others.
Durability: Ensures that the changes made in the database with committed transactions persist as it is even after a system failure.

How many Aggregate functions are available in SQL?
Answer: SQL Aggregate functions determine and calculate values from multiple columns in a table and return a single value. There are 7 aggregate functions in SQL:

AVG(): Returns the average value from specified columns.
COUNT(): Returns number of table rows.
MAX(): Returns the largest value among the records.
MIN(): Returns smallest value among the records.
SUM(): Returns the sum of specified column values.
FIRST(): Returns the first value.
LAST(): Returns last value.

What are Scalar functions in SQL?
Answer: Scalar functions are used to return a single value based on the input values. Scalar Functions are as follows:

UCASE(): Converts the specified field in the upper case.
LCASE(): Converts the specified field in lower case.
MID(): Extracts and returns character from the text field.
FORMAT(): Specifies the display format.
LEN(): Specifies the length of the text field.
ROUND(): Rounds up the decimal field value to a number.

What are triggers?
Answer: Triggers in SQL is kind of stored procedures used to create a response to a specific action performed on the table such as INSERT, UPDATE or DELETE. You can invoke triggers explicitly on the table in the database.

Action and Event are two main components of SQL triggers. When certain actions are performed, the event occurs in response to that action.
Syntax:

CREATE TRIGGER name {BEFORE|AFTER} (event [OR..]}
ON table_name [FOR [EACH] {ROW|STATEMENT}]
EXECUTE PROCEDURE functionname {arguments}

What is View in SQL?
Answer: A View can be defined as a virtual table that contains rows and columns with fields from one or more tables.
Syntax:

CREATE VIEW view_name AS
SELECT column_name(s) 
FROM table_name 
WHERE condition

How we can update the view?
Answer: SQL CREATE and REPLACE can be used for updating the view.
Syntax:

CREATE OR REPLACE VIEW view_name AS
 SELECT column_name(s)
 FROM table_name
 WHERE condition

Explain the working of SQL Privileges?
Answer: SQL GRANT and REVOKE commands are used to implement privileges in SQL multiple user environments. The administrator of the database can grant or revoke privileges to or from users of database objects by using commands like SELECT, INSERT, UPDATE, DELETE, ALL, etc.

GRANT Command: This command is used to provide database access to users other than the administrator.
Syntax:

GRANT privilege_name
 ON object_name
 TO {user_name|PUBLIC|role_name}
 [WITH GRANT OPTION];
In the above syntax, the GRANT option indicates that the user can grant access to another user too.

REVOKE command: This command is used to provide database deny or remove access to database objects.
Syntax:

REVOKE privilege_name
 ON object_name
 FROM {user_name|PUBLIC|role_name};

How many types of Privileges are available in SQL?
Answer: There are two types of privileges used in SQL, such as

System privilege: System privilege deals with the object of a particular type and provides users the right to perform one or more actions on it. These actions include performing administrative tasks, ALTER ANY INDEX, ALTER ANY CACHE GROUP CREATE/ALTER/DELETE TABLE, CREATE/ALTER/DELETE VIEW etc.
Object privilege: This allows to perform actions on an object or object of another user(s) viz. table, view, indexes etc. Some of the object privileges are EXECUTE, INSERT, UPDATE, DELETE, SELECT, FLUSH, LOAD, INDEX, REFERENCES etc.

What is SQL Injection?
Answer: SQL Injection is a type of database attack technique where malicious SQL statements are inserted into an entry field of database in a way that once it is executed, the database is exposed to an attacker for the attack. This technique is usually used for attacking data-driven applications to have access to sensitive data and perform administrative tasks on databases.

For Example,
SELECT column_name(s) FROM table_name WHERE condition;

What is SQL Sandbox in SQL Server?
Answer: SQL Sandbox is a safe place in the SQL server environment where untrusted scripts are executed. There are 3 types of SQL sandbox:

Safe Access Sandbox: Here a user can perform SQL operations such as creating stored procedures, triggers etc. but cannot have access to the memory as well as cannot create files.
External Access Sandbox: Users can access files without having the right to manipulate the memory allocation.
Unsafe Access Sandbox: This contains untrusted codes where a user can have access to memory.


What is the use of the NVL function?
Answer: NVL function is used to convert the null value to its actual value.

What is the Cartesian product of the table?
The output of Cross Join is called a Cartesian product. It returns rows combining each row from the first table with each row of the second table. For Example, if we join two tables having 15 and 20 columns the Cartesian product of two tables will be 15×20=300 rows.


How many row comparison operators are used while working with a subquery?
Answer: There are 3-row comparison operators that are used in subqueries such as IN, ANY and ALL.

What is the difference between clustered and non-clustered indexes?
Answer: The differences between the two are as follows:

One table can have only one clustered index but multiple non-clustered indexes.
Clustered indexes can be read rapidly rather than non-clustered indexes.
Clustered indexes store data physically in the table or view whereas, non-clustered indexes do not store data in the table as it has separate structure from the data row.

How to write a query to show the details of a student from Students table whose name start with K?
Answer: Query:

SELECT * FROM Student WHERE Student_Name like ‘K%’;
Here ‘like’ operator is used to perform pattern matching.

What is the difference between Nested Subquery and Correlated Subquery?
Answer: Subquery within another subquery is called Nested Subquery.  If the output of a subquery depends on column values of the parent query table then the query is called Correlated Subquery.

SELECT adminid(SELEC Firstname+' '+Lastname&nbsp;&nbsp;FROM Employee WHERE
 empid=emp. adminid)AS EmpAdminId FROM Employee;
The result of the query is the details of an employee from the Employee table.

What is Normalization? How many Normalization forms are there?
Answer: Normalization is used to organize the data in such a manner that data redundancy will never occur in the database and avoid insert, update and delete anomalies. There are 5 forms of Normalization:

First Normal Form (1NF): It removes all duplicate columns from the table. It creates a table for related data and identifies unique column values.
First Normal Form (2NF): Follows 1NF and creates and places data subsets in an individual table and defines the relationship between tables using the primary key.
Third Normal Form (3NF): Follows 2NF and removes those columns which are not related through the primary key.
Fourth Normal Form (4NF): Follows 3NF and does not define multi-valued dependencies. 4NF is also known as BCNF.

What is a Relationship? How many types of Relationships are there?
Answer: The relationship can be defined as the connection between more than one table in the database. There are 4 types of relationships:

One to One Relationship
Many to One Relationship
Many to Many Relationship
One to Many Relationship

What do you mean by Stored Procedures? How do we use it?
Answer: A stored procedure is a collection of SQL statements that can be used as a function to access the database. We can create these stored procedures earlier before using it and can execute them wherever required by applying some conditional logic to it. Stored procedures are also used to reduce network traffic and improve performance.

Syntax:

CREATE Procedure Procedure_Name
 (
 //Parameters
 )
 AS
 BEGIN
 SQL statements in stored procedures to update/retrieve records
 END
 

What are Nested Triggers?
Answer: Triggers may implement data modification logic by using INSERT, UPDATE, and DELETE statements. These triggers that contain data modification logic and find other triggers for data modification are called Nested Triggers.

What is a Cursor?
Answer: A cursor is a database object which is used to manipulate data in a row-to-row manner. Cursor follows steps as given below:

Declare Cursor
Open Cursor
Retrieve row from the Cursor
Process the row
Close Cursor
Deallocate Cursor

What is Collation?
Answer: Collation is a set of rules that check how the data is sorted by comparing it. Such as character data is stored using correct character sequence along with case sensitivity, type, and accent.

What do we need to check in Database Testing?
Answer: In Database testing, the following thing is required to be tested:

Database connectivity
Constraint check
Required application field and its size
Data Retrieval and processing with DML operations
Stored Procedures
Functional flow

What is Database White Box Testing?
Answer: Database White Box testing involves:

Database Consistency and ACID properties
Database triggers and logical views
Decision Coverage, Condition Coverage, and Statement Coverage
Database Tables, Data Model, and Database Schema
Referential integrity rules

What is Database Black Box Testing?
Answer: Database Black Box testing involves:

Data Mapping
Data stored and retrieved
Use of Black Box testing techniques such as Equivalence Partitioning and Boundary Value Analysis (BVA)

What are Indexes in SQL?
Answer: The index can be defined as the way to retrieve the data more quickly. We can define indexes using CREATE statements.

Syntax:

CREATE INDEX index_name
 ON table_name (column_name)
Further, we can also create a Unique Index using the following syntax:

CREATE UNIQUE INDEX index_name
 ON table_name (column_name)
UPDATE: We have added few more short questions for practice.


What is the syntax to add a record to a table?
Answer: To add a record in a table INSERT syntax is used.
For Example, INSERT into table_name VALUES (value1, value2..);

How do you add a column to a table?
Answer: To add another column in the table, use the following command:
ALTER TABLE table_name ADD (column_name);

Define COMMIT?
Answer: COMMIT saves all changes made by DML statements.

What is the Primary key?
Answer: A Primary key is a column whose values uniquely identify every row in a table. Primary key values can never be reused.

What are Foreign keys?
Answer: When a table’s primary key field is added to related tables in order to create the common field which relates the two tables, it called a foreign key in other tables. Foreign key constraints enforce referential integrity.

What is CHECK Constraint?
Answer: A CHECK constraint is used to limit the values or type of data that can be stored in a column. They are used to enforce domain integrity.

What are the possible values for the BOOLEAN data field?
Answer: For a BOOLEAN data field, two values are possible: -1(true) and 0(false).

What is a stored procedure?
Answer: A stored procedure is a set of SQL queries that can take input and send back output.

What is identity in SQL?
Answer: An identity column in where SQL automatically generates numeric values. We can define a start and increment value of the identity column.

How to select random rows from a table?
Answer: Using a SAMPLE clause we can select random rows. For Example,
SELECT * FROM table_name SAMPLE(10);

Which TCP/IP port does SQL Server run?
Answer: By default SQL Server runs on port 1433.

Write a SQL SELECT query that only returns each name only once from a table?
Answer: To get the result as each name only once, we need to use the DISTINCT keyword.
SELECT DISTINCT name FROM table_name;

Explain DML and DDL?
Answer: DML stands for Data Manipulation Language. INSERT, UPDATE and DELETE  are DML statements.
DDL stands for Data Definition Language. CREATE, ALTER, DROP, RENAME are DDL statements.

Can we rename a column in the output of the SQL query?
Answer: Yes. SELECT column_name AS new_name FROM table_name;

What is the order of SQL SELECT?
Answer: Order of SQL SELECT clauses is: SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY. Only the SELECT and FROM clauses are mandatory.

Suppose a Student column has two columns, Name and Marks. How to get names and marks of the top three students.
Answer: SELECT Name, Marks FROM Student s1 where 3 <= (SELECT COUNT(*) FROM Students s2 WHERE s1.marks = s2.marks)

What is SQL comments?
Answer: SQL comments can be inserted by adding two consecutive hyphens (–).

Difference between TRUNCATE, DELETE and DROP commands?
Answer: DELETE removes some or all rows from a table based on the condition. It can be rolled back.
TRUNCATE removes ALL rows from a table by de-allocating the memory pages. The operation cannot be rolled back
DROP command removes a table from the database completely.

What do you mean by ROWID?
Answer: It’s an 18 character long pseudo column attached with each row of a table.

Define UNION, MINUS, UNION ALL, INTERSECT?
Answer:

MINUS – returns all distinct rows selected by the first query but not by the second.
UNION – returns all distinct rows selected by either query
UNION ALL – returns all rows selected by either query, including all duplicates.
INTERSECT – returns all distinct rows selected by both queries.


What is the difference between UNIQUE and PRIMARY KEY constraints?

Answer: A table can have only one PRIMARY KEY whereas there can be any number of UNIQUE keys.
The primary key cannot contain Null values whereas the Unique key can contain Null values.

What is a composite primary key?
Answer: The primary key created on more than one column is called composite primary key.

What is an Index?
Answer: An Index is a special structure associated with a table to speed up the performance of queries. The index can be created on one or more columns of a table.

What is the Subquery?
Answer: A Subquery is a subset of select statements whose return values are used in filtering conditions of the main query.

 What do you mean by query optimization?
Answer: Query optimization is a process in which a database system compares different query strategies and select the query with the least cost.

What is Collation?
Answer: Set of rules that define how data is stored, how case-sensitivity and Kana character can be treated etc.

What is Referential Integrity?
Answer: Set of rules that restrict the values of one or more columns of the tables based on the values of the primary key or unique key of the referenced table.

What is the Case function?
Answer: Case facilitates if-then-else type of logic in SQL. It evaluates a list of conditions and returns one of the multiple possible result expressions.

Define a temp table?
Answer: A temp table is a temporary storage structure to store the data temporarily.


Explain the difference between Rename and Alias?
Answer: Rename is a permanent name given to a table or column whereas Alias is a temporary name given to a table or column.


What are the advantages of Views?
Answer: Advantages of Views are:

Views restrict access to the data because the view can display selective columns from the table.
Views can be used to make simple queries to retrieve the results of complicated queries. For Example, views can be used to query information from multiple tables without the user knowing.

What is the difference between the HAVING clause and WHERE clause?
Answer: Both specify a search condition but Having clause is used only with the SELECT statement and typically used with GROUP BY clause.
If GROUP BY clause is not used then Having behaved like WHERE clause only.

What is the difference between Local and Global temporary tables?
Answer: If defined inside a compound statement a local temporary table exists only for the duration of that statement but a global temporary table exists permanently in the DB but its rows disappear when the connection is closed.

What is CTE?
Answer: A CTE or common table expression is an expression that contains temporary result set which is defined in a SQL statement.

How do you copy data from one table to another table ?
Answer:
INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;
