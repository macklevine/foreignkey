CREATE DATABASE IF NOT EXISTS jointable;

USE jointable;

CREATE TABLE Classes
  ( CID int auto_increment PRIMARY KEY,
    Name varchar(100)
  );

CREATE TABLE Students
  ( SID int auto_increment PRIMARY KEY,
    Name varchar(100)
  );

CREATE TABLE StudentsInClasses
  ( RELID int NOT NULL auto_increment PRIMARY KEY,
    CID int NOT NULL,
    SID int NOT NULL,
    FOREIGN KEY(CID) REFERENCES Classes(CID),
    FOREIGN KEY(SID) REFERENCES Students(SID)
  );


  ---------------------------------------

  var Sequelize = require("sequelize");
  var sequelize = new Sequelize("jointable", "root", "");

  var Class = sequelize.define("Class", {
    Name: Sequelize.STRING,
    });

  var Students = sequelize.define("Student", {
    Name: Sequelize.STRING
    });

  var StudentsInClasses



--Modification: the above can be modified to make RELID represent
--a unique mapping of CID and SID:

--CONSTRAINT RELID PRIMARY KEY
--(
--CID,
--SID
--)

--   select * from Students;
-- +-----+---------+
-- | SID | Name    |
-- +-----+---------+
-- |   1 | Mack    |
-- |   2 | Ciny    |
-- |   3 | Sara    |
-- |   4 | Dion    |
-- |   5 | Melissa |
-- +-----+---------+

-- select * from Classes;
-- +-----+----------+
-- | CID | Name     |
-- +-----+----------+
-- |   1 | History  |
-- |   2 | Art      |
-- |   3 | Biology  |
-- |   4 | Calculus |
-- |   5 | English  |
-- +-----+----------+

-- below: a junction table.

-- select * from StudentsInClasses
--     -> ;
-- +-------+-----+-----+
-- | RELID | CID | SID |
-- +-------+-----+-----+
-- |     1 |   1 |   1 |
-- |     2 |   1 |   5 |
-- |     3 |   3 |   5 |
-- |     4 |   3 |   1 |
-- |     5 |   3 |   3 |
-- |     6 |   3 |   2 |
-- |     7 |   4 |   1 |
-- |     8 |   4 |   2 |
-- +-------+-----+-----+

--Select Students.Name, Classes.Name from StudentsInClasses join Students on Students.SID = StudentsInClasses.SID join Classes on Classes.CID = StudentsInClasses.CID;

--OR:

-- select Classes.Name, Students.Name from StudentsInClasses, Classes, Students where Classes.CID = StudentsInClasses.CID and Students.SID = StudentsInClasses.SID;

-- +---------+----------+
-- | Name    | Name     |
-- +---------+----------+
-- | Mack    | History  |
-- | Melissa | History  |
-- | Mack    | Biology  |
-- | Ciny    | Biology  |
-- | Sara    | Biology  |
-- | Melissa | Biology  |
-- | Mack    | Calculus |
-- | Ciny    | Calculus |
-- +---------+----------+