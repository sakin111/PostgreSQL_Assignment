# ** What is postgreSQL? ** :elephant:

Postgres is a open source object relational database system though it supports 
SQL(relational) and JSON(non relational) data queries. It's known for its robust features, flexibility, and standards compliance.Making it suitable for wide range of application.


## origin and history:
- PostgreSQL began in 1986 as an evolution of INGRES, an open-source SQL relational database project from the University of California, Berkeley.
- In 1994, the project added support for SQL, and it was officially named PostgreSQL


## key feature and benefits :

### ** open source **
 PostgreSQL is open source and free to use Language for a large community of developers and contributors.

### ** Performance and Scalability **
PostgreSQL is designed to handle large amounts of data and concurrent transactions, making it suitable for demanding application.

### ** SQL Support **
PostgreSQL uses SQL (Structured Query Language) for querying and managing data, a widely understood language in the database industry


### ** Cross Platform **

it can be used in a web application and also Mobile applications that require robust data storage and retrieval.



# ** What is the purpose of a database schema in PostgreSQL? **

A schema is way to organize a database object with in a database. it allows user to interact with  tables, views, functions, and other objects logically and enabling multiple users to work collaboratively without interfering with each other's objects.


### Schema Helps

- Schemas help organize database objects into logical groups, making it easier to manage and understand complex database.
- Schemas prevent naming conflicts by allowing objects with the same name to exist in different schemas
- Multiple users can work on different schemas within the same database without interfering with each other
- schema can  enhance  the security of a Database.



#  ** Explain the Primary Key and Foreign Key concepts in PostgreSQL? **

### ** Primary Key ** 

Primary key is a unique key in a row that act as constraint to restrict data input and ensure validation. it can be single column or  multiple column, known as composite key.
it can not be assign as NUll value, as it is used as criterion to filter data from a particular table.

* for example 

| student_id | student_name| age |
|  1         |  john       | 23  |
|  2         |  peter      | 24  |
|  3         |  mark       | 27  |

In the Table the student_id is a primary key because it is a unique key that only for the particular subject here 1 is john , 2 is peter and 3 is mark which can not be NULL value.


### ** Foreign Key ** 

A foreign key is a column  in one table that references the primary key of another table, establishing a link between the two tables. The table containing the foreign key is known as the "child table" and the table to which it refers is known as the "parent table."

-  It ensures that the relationship between two tables remains consistent.
-  The table containing the primary key.
-  The table that includes the foreign key, referencing the primary key of another table.

* for example 

| subject_id | subject_name| student_id |
|  1         |  Maths      | 2          |
|  2         |  Science    | 3          |
|  3         |  Arts       | 1          |


Here we can see in this table a reference from a previous table student_id which is a primary key  but in this table it is a foreign key linking the subject table with the students.



# What is the difference between the VARCHAR and CHAR data types?


## ** CHAR Data Type **

 - Fixed-length string type.
 - Always stores exactly n characters.
 - add padding which is extra.
 - Example: CHAR(5) will store "abc" as "abc " (with 2 trailing spaces).

## ** VARCHAR Data Type **

- Variable-length string type.
- Can store up to n characters, but does not pad with spaces.
- No extra padding added to string
- Example: VARCHAR(5) storing "abc" stays as "abc" (no extra spaces).



# ** Explain the purpose of the WHERE clause in a SELECT statement. **


The purpose of the WHERE clause in a PostgreSQL SELECT statement is to filter the rows returned by the query based on a specified condition. It restricts the result set to only those rows that satisfy the condition, allowing you to retrieve relevant data instead of all rows from the table.

Key points about the WHERE clause in PostgreSQL:

- It is placed immediately after the FROM clause in the SELECT statement.

- The condition in the WHERE clause is a boolean expression that evaluates to true, false, or unknown.

- Only rows for which the condition evaluates to true are included in the query result.

- The condition can use comparison operators (e.g., =, >, <, >=, <=, !=), logical operators (AND, OR, NOT), and other expressions like IN, BETWEEN, LIKE, IS NULL.

- The WHERE clause is also used in other SQL statements like UPDATE and DELETE to specify which rows to update or delete.


* for example 

```
SELECT employee_id, employee_name, salary
FROM employees
WHERE department = 'IT';

```
