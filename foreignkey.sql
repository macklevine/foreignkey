CREATE DATABASE IF NOT EXISTS foreignkey;

USE foreignkey;

DROP TABLE IF EXISTS persons;

-- describes a one-to-many relationship: one person has many orders.

CREATE TABLE persons
  ( P_Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LastName varchar(100) NOT NULL,
    FirstName varchar(100) NOT NULL,
    Address varchar(100) NOT NULL,
    City varchar(100) NOT NULL
  );

CREATE TABLE orders
  ( O_Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderNo int NOT NULL,
    P_Id int, 
    FOREIGN KEY(P_Id) REFERENCES persons(P_Id)
  );

--select * from orders left join persons on persons.P_Id = orders.P_Id;

-- +------+---------+------+------+----------+-----------+---------+----------+
-- | O_Id | OrderNo | P_Id | P_Id | LastName | FirstName | Address | City     |
-- +------+---------+------+------+----------+-----------+---------+----------+
-- |    1 |    7188 |    1 |    1 | Levine   | Mack      | 1067    | Oakland  |
-- |    3 |    2343 |    2 |    2 | Sara     | Fraley    | 1067    | Oakland  |
-- |    2 |    2349 |    3 |    3 | Smith    | Tom       | 1022    | Berkeley |
-- +------+---------+------+------+----------+-----------+---------+----------+


--select * from orders right join persons on persons.P_Id = orders.P_Id;

-- +------+---------+------+------+----------+-----------+---------+-----------+
-- | O_Id | OrderNo | P_Id | P_Id | LastName | FirstName | Address | City      |
-- +------+---------+------+------+----------+-----------+---------+-----------+
-- |    1 |    7188 |    1 |    1 | Levine   | Mack      | 1067    | Oakland   |
-- |    2 |    2349 |    3 |    3 | Smith    | Tom       | 1022    | Berkeley  |
-- |    3 |    2343 |    2 |    2 | Sara     | Fraley    | 1067    | Oakland   |
-- | NULL |    NULL | NULL |    4 | Burns    | Dion      | 2053    | Palo Alto |
-- +------+---------+------+------+----------+-----------+---------+-----------+