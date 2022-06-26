-----------UC1-----------:
CREATE DATABASE ADDRESSBOOK_SERVICE

SELECT * FROM SYS.DATABASES

USE ADDRESSBOOK_SERVICE

-----------UC2-------------:
CREATE TABLE ADDRESS_BOOK(
ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25) NOT NULL,
LAST_NAME VARCHAR(25) NOT NULL,
ADDRESS VARCHAR(100) NOT NULL,
CITY VARCHAR(25) NOT NULL,
STATE VARCHAR(25) NOT NULL,
ZIP_CODE FLOAT NOT NULL,
PHONE_NUMBER FLOAT NOT NULL,
EMAIL VARCHAR(50) NOT NULL)

SELECT * FROM ADDRESS_BOOK

------------UC3--------------:
INSERT INTO ADDRESS_BOOK VALUES('Madhavi','Khalate','11A','Baramati','Maharashtra',654321,9087654321,'madhavi@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Pooja','Kadam','12B','Phaltan','Maharashtra',645321,8907654321,'pooja@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Komal','Kale','13C','Barshi','Maharashtra',634521,7890123456,'komal@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Sagar','Salve','14D','Malegaon','Maharashtra',621345,6543217890,'sagar@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Kishor','Kumar','15E','Chennai','Tamil Nadu',456321,9907564231,'kishor@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Ajit','Mane','11A','Pune','Maharashtra',654321,6789054123,'Ajit@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Sudha','Patil','16F','Mumbai','Maharashtra',645312,7890654321,'sudha@gmail.com')
INSERT INTO ADDRESS_BOOK VALUES('Nandini','Late','11A','Pandharpur','Maharashtra',456321,9786672345,'nandini@gmail.com')

------------UC4-----------:
UPDATE ADDRESS_BOOK SET CITY = 'Pandharpur' WHERE FIRST_NAME = 'Komal'

------------UC5-----------:
DELETE FROM ADDRESS_BOOK WHERE FIRST_NAME = 'Kishor'

------------UC6-----------:
SELECT * FROM ADDRESS_BOOK WHERE CITY = 'Pune'
SELECT * FROM ADDRESS_BOOK WHERE STATE = 'Maharashtra'

------------UC7------------:
SELECT CITY, COUNT(CITY) AS CITY_COUNT FROM ADDRESS_BOOK GROUP BY CITY
SELECT STATE, COUNT(STATE) AS STATE_COUNT FROM ADDRESS_BOOK GROUP BY STATE

------------UC8-------------:
SELECT * FROM ADDRESS_BOOK WHERE CITY = 'Baramati' ORDER BY FIRST_NAME ASC

------------UC9-------------:
ALTER TABLE ADDRESS_BOOK ADD TYPE VARCHAR(20) NOT NULL DEFAULT('')
UPDATE ADDRESS_BOOK SET TYPE = 'Family' WHERE FIRST_NAME = 'Madhavi'
UPDATE ADDRESS_BOOK SET TYPE = 'Family' WHERE FIRST_NAME = 'Pooja'
UPDATE ADDRESS_BOOK SET TYPE = 'Family' WHERE FIRST_NAME = 'Komal'
UPDATE ADDRESS_BOOK SET TYPE = 'Family' WHERE FIRST_NAME = 'Sagar'
UPDATE ADDRESS_BOOK SET TYPE = 'Friends' WHERE FIRST_NAME = 'Ajit'
UPDATE ADDRESS_BOOK SET TYPE = 'Friends' WHERE FIRST_NAME = 'Sudha'
UPDATE ADDRESS_BOOK SET TYPE = 'Friends' WHERE FIRST_NAME = 'Nandini'

----------UC10-----------:
SELECT TYPE, COUNT(TYPE) AS TYPE_COUNT FROM ADDRESS_BOOK GROUP BY TYPE

----------UC11-----------:
INSERT INTO ADDRESS_BOOK VALUES('Amit','Purab','20Z','Pune','Maharashtra',612345,6543217890,'amit@gmail.com','Friends')
INSERT INTO ADDRESS_BOOK VALUES('Suraj','Raj','20Z','Mumbai','Maharashtra',612345,6543217890,'suraj@gmail.com','Family')

----------UC12-----------:
-----CREATING CONTACT_TYPE TABLE-----
CREATE TABLE CONTACT_TYPE(
TYPE_ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
TYPE_NAME VARCHAR(25) NOT NULL)

INSERT INTO CONTACT_TYPE VALUES('Family'),('Friends'),('Colleagues')

SELECT * FROM CONTACT_TYPE

--CREATING CONTACT_ADDRESS TABLE
CREATE TABLE CONTACT_ADDRESS(
CONTACT_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25) NOT NULL,
LAST_NAME VARCHAR(25) NOT NULL,
ADDRESS VARCHAR(100) NOT NULL,
CITY VARCHAR(25) NOT NULL,
STATE VARCHAR(25) NOT NULL,
ZIP_CODE FLOAT NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
TYPE_ID INT NOT NULL)

SELECT * FROM CONTACT_ADDRESs

INSERT INTO CONTACT_ADDRESS VALUES('Madhavi','Khalate','11A','Baramati','Maharashtra',654321,'madhavi@gmail.com',1)
INSERT INTO CONTACT_ADDRESS VALUES('Pooja','Kadam','12B','Phaltan','Maharashtra',645321,'pooja@gmail.com',2)
INSERT INTO CONTACT_ADDRESS VALUES('Komal','Kale','13C','Barshi','Maharashtra',634521,'komal@gmail.com',2)
INSERT INTO CONTACT_ADDRESS VALUES('Sagar','Salve','14D','Malegaon','Maharashtra',621345,'sagar@gmail.com',2)
INSERT INTO CONTACT_ADDRESS VALUES('Kishor','Kumar','15E','Chennai','Tamil Nadu',456321,'kishor@gmail.com',3)
INSERT INTO CONTACT_ADDRESS VALUES('Ajit','Mane','11A','Pune','Maharashtra',654321,'Ajit@gmail.com',1)
INSERT INTO CONTACT_ADDRESS VALUES('Sudha','Patil','16F','Mumbai','Maharashtra',645312,'sudha@gmail.com',1)
INSERT INTO CONTACT_ADDRESS VALUES('Nandini','Late','11A','Pandharpur','Maharashtra',456321,'nandini@gmail.com',1)

--CREATING CONTACT_PHONE TABLE
CREATE TABLE CONTACT_PHONE(
CONTACT_ID INT NOT NULL,
FIRST_NAME VARCHAR(25) NOT NULL,
PHONE_1 FLOAT NOT NULL,
PHONE_2 FLOAT NULL)

INSERT INTO CONTACT_PHONE VALUES(1,'Elavarasu',9087654321,6987523410)
INSERT INTO CONTACT_PHONE (CONTACT_ID,FIRST_NAME,PHONE_1) VALUES(2,'Nantha',8907654321)
INSERT INTO CONTACT_PHONE VALUES(3,'Senthil',7890123456,7689054321)
INSERT INTO CONTACT_PHONE VALUES(4,'Thamarai',6543217890,8906745123)
INSERT INTO CONTACT_PHONE VALUES(5,'Steven',9907564231,7908645231)
INSERT INTO CONTACT_PHONE (CONTACT_ID,FIRST_NAME,PHONE_1) VALUES(6,'Appusamy',6789054123)
INSERT INTO CONTACT_PHONE VALUES(7,'Sudha',7890654321,6795321405)
INSERT INTO CONTACT_PHONE VALUES(8,'Sarasmani',9786672345,8755428901)

SELECT * FROM CONTACT_PHONE

--ADDING CONSTRAINTS TO THE TABLE
ALTER TABLE CONTACT_ADDRESS ADD CONSTRAINT FK_CONTACT_TYPE FOREIGN KEY(TYPE_ID) REFERENCES CONTACT_TYPE(TYPE_ID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE CONTACT_PHONE ADD CONSTRAINT FK_CONTACT_PHONE FOREIGN KEY(CONTACT_ID) REFERENCES CONTACT_ADDRESS(CONTACT_ID) ON DELETE CASCADE ON UPDATE CASCADE

--UC13:Ensuring UC6, UC7, UC8, UC10
SELECT * FROM CONTACT_ADDRESS WHERE CITY = 'Phaltan'
SELECT * FROM CONTACT_ADDRESS WHERE STATE = 'Maharashtra'

SELECT CITY, COUNT(CITY) AS CONTACT_ADDRESS FROM ADDRESS_BOOK GROUP BY CITY
SELECT STATE, COUNT(STATE) AS CONTACT_ADDRESS FROM ADDRESS_BOOK GROUP BY STATE

SELECT * FROM CONTACT_ADDRESS WHERE CITY = 'Mumbai' ORDER BY FIRST_NAME ASC

SELECT TYPE_NAME,COUNT(TYPE_NAME) FROM CONTACT_TYPE CT INNER JOIN CONTACT_ADDRESS CA ON CT.TYPE_ID = CA.TYPE_ID GROUP BY TYPE_NAME
SELECT TYPE_NAME,CA.FIRST_NAME,PHONE_1 FROM CONTACT_TYPE CT INNER JOIN CONTACT_ADDRESS CA ON CT.TYPE_ID = CA.TYPE_ID INNER JOIN CONTACT_PHONE CP ON CA.CONTACT_ID = CP.CONTACT_ID
