---
title: "MySQL for Oracle Developers"
tags:
  - Oracle
  - MySQL
---
I've been using Oracle DBMS for years, and sometimes it's hard to differentiate what is an "Oracle built-in" and a standard SQL feature.

In teaching a Database Modeling course at RIT in MySQL I have found out that there are some differences between Oracle and MySQL:

- MySQL comparisons are case-insensitive, so `SELECT * FROM table WHERE name='ABC';` returns the same results as `SELECT * FROM table WHERE name='abc';`

- MySQL table names *are* case-sensitive but only on Linux.

- MySQL has a lot richer set of datatypes, especially for integer types: `tinyint`, `smallint`, `mediumint`, `int`, and `bigint`

- Single and double-quotes are allowed for string literals (but cannot be mixed).

- Executing queries in an Oracle database are done by specifying the database name in the connect string. MySQL supports the `USE` command to choose a database to run.

- There are a lot fewer functions available than in Oracle (which is a potential series of blog posts, an-oracle-function-a-day).

- Constratints in DDL are supported but ignored before MySQL 8.
