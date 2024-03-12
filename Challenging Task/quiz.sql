/*Internal Quiz*/

DROP SEQUENCE SEQ1;
DROP TABLE RESERVES_1347;
DROP TABLE SAILOR_1347;
DROP TABLE BOAT_1347;
DROP TABLE LOWRATING_1347;

CREATE TABLE SAILOR_1347(
	SID INT PRIMARY KEY,
	SNAME VARCHAR(20),
	RATING INT,
	AGE INT
);

CREATE TABLE BOAT_1347(
	BID INT PRIMARY KEY,
	BNAME VARCHAR(20),
	COLOR VARCHAR(15)
);

CREATE TABLE RESERVES_1347(
	SID INT,
	BID INT,
	RDATE DATE,
	FOREIGN KEY(SID) REFERENCES SAILOR_1347(SID),
	FOREIGN KEY(BID) REFERENCES BOAT_1347(BID)
);

--part (b)
CREATE SEQUENCE SEQ1
START WITH 99
MINVALUE 99
MAXVALUE 201
INCREMENT BY 2;

INSERT INTO SAILOR_1347 VALUES(SEQ1.NEXTVAL, 'JOHN', 4, 25);
INSERT INTO SAILOR_1347 VALUES(SEQ1.NEXTVAL, 'JACOB', 4, 25);
INSERT INTO SAILOR_1347 VALUES(SEQ1.NEXTVAL, 'STEVE', 2, 29);
INSERT INTO SAILOR_1347 VALUES(SEQ1.NEXTVAL, 'BOBBY', 3, 32);
INSERT INTO SAILOR_1347 VALUES(SEQ1.NEXTVAL, 'THOR', 5, 39);
INSERT INTO SAILOR_1347 VALUES(SEQ1.NEXTVAL, 'CHESTER', 4, 41);

INSERT INTO BOAT_1347 VALUES(101, 'MARS', 'BLUE');
INSERT INTO BOAT_1347 VALUES(102, 'STORM TROOPER', 'RED');
INSERT INTO BOAT_1347 VALUES(103, 'MIDSTORM', 'GREEN');
INSERT INTO BOAT_1347 VALUES(104, 'TITANIC', 'BLUE');
INSERT INTO BOAT_1347 VALUES(105, 'WAVECRASHER', 'BLACK');

INSERT INTO RESERVES_1347 VALUES(101, 101, '21/MAR/2024');
INSERT INTO RESERVES_1347 VALUES(103, 103, '22/FEB/2024');
INSERT INTO RESERVES_1347 VALUES(105, 104, '15/JAN/2024');
INSERT INTO RESERVES_1347 VALUES(107, 102, '02/APR/2024');
INSERT INTO RESERVES_1347 VALUES(111, 102, '02/JAN/2024');
INSERT INTO RESERVES_1347 VALUES(109, 105, '22/SEP/2024');
INSERT INTO RESERVES_1347 VALUES(107, 105, '22/JAN/2024');
INSERT INTO RESERVES_1347 VALUES(105, 105, '22/MAR/2024');
INSERT INTO RESERVES_1347 VALUES(103, 105, '22/MAY/2024');
INSERT INTO RESERVES_1347 VALUES(101, 105, '22/JUL/2024');

--displaying tables
SELECT * FROM SAILOR_1347;
SELECT * FROM BOAT_1347;
SELECT * FROM RESERVES_1347;

--part (c)
SELECT S.SNAME FROM SAILOR_1347 S
JOIN RESERVES_1347 R ON S.SID = R.SID
WHERE (S.RATING >= 5) OR (R.BID = 103);

--part (d)
SELECT DISTINCT(S.SNAME) FROM SAILOR_1347 S
JOIN RESERVES_1347 R ON S.SID = R.SID
JOIN BOAT_1347 B ON R.BID = B.BID
WHERE R.BID NOT IN (SELECT BID FROM BOAT_1347 WHERE BNAME LIKE '%STORM%')
ORDER BY S.SNAME;

--part (e)
ALTER TABLE SAILOR_1347 ADD MOBILE_NO VARCHAR(11);
ALTER TABLE SAILOR_1347 ADD CONSTRAINT MOB_CONST CHECK (MOBILE_NO LIKE '91%');

--part (f)
CREATE TABLE LOWRATING_1347 AS
(SELECT * FROM SAILOR_1347 WHERE RATING=(SELECT MIN(RATING) FROM SAILOR_1347));

SELECT * FROM LOWRATING_1347;

--part (g)
SELECT R.BID, AVG(S.AGE) AS AVERAGE_AGE, COUNT(R.BID) AS SAILORS_COUNT FROM BOAT_1347 B
JOIN RESERVES_1347 R ON B.BID = R.BID
JOIN SAILOR_1347 S ON S.SID = R.SID
GROUP BY R.BID
HAVING COUNT(R.BID) >= 5;

--part (h)
SELECT R.BID FROM BOAT_1347 B
JOIN RESERVES_1347 R ON R.BID = B.BID
JOIN SAILOR_1347 S ON S.SID = R.SID
WHERE S.AGE = (SELECT MAX(AGE) FROM SAILOR_1347);