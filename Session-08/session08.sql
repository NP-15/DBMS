--PPT-1
BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLO');
END;
/

--PPT-2
DECLARE
	V_NAME VARCHAR(20);
	V_REG_NO VARCHAR(9);
BEGIN
	V_NAME := 'NIRAJIT PRAMANIK';
	V_REG_NO := '22BAI1347';
	DBMS_OUTPUT.PUT_LINE('NAME IS: ' || V_NAME);
	DBMS_OUTPUT.PUT_LINE('REGISTRATION NUMBER IS: ' || V_REG_NO);
END;
/


--PPT-3
DECLARE
	A INT;
	B INT;
	C INT;
BEGIN
	A := 5;
	B := 2;
	C := A + B;
	DBMS_OUTPUT.PUT_LINE('A + B IS ' || C);
END;
/

--PPT-4
DECLARE
	V_NO INT;
BEGIN
	SELECT SSN INTO V_NO FROM EMPLOYEE_22BAI1347 WHERE NAME='x';
	DBMS_OUTPUT.PUT_LINE('SSN NUMBER IS: ' || V_NO);
END;
/


--PPT-5
DECLARE
	V_NO EMPLOYEE_22BAI1347.SSN%type;
BEGIN
	SELECT SSN INTO V_NO FROM EMPLOYEE_22BAI1347 WHERE NAME='x';
	DBMS_OUTPUT.PUT_LINE('SSN NUMBER IS: ' || V_NO);
END;
/

--PPT-6
DECLARE
	V_NO EMPLOYEE_22BAI1347.SSN%type;
BEGIN
	SELECT SSN INTO V_NO FROM EMPLOYEE_22BAI1347 WHERE NAME='&name';
	DBMS_OUTPUT.PUT_LINE('SSN NUMBER IS: ' || V_NO);
END;
/

--PPT-7
DECLARE
	A INT;
	B INT;
	C INT;
BEGIN
	A := '&A';
	B := '&B';
	C := A * B;
	DBMS_OUTPUT.PUT_LINE('THE MULTIPLICATION IS: ' || C);
END;
/

--PPT-8
DECLARE
	AMT INT;
BEGIN
	SELECT AMOUNT INTO AMT FROM LOAN_22BAI1347 WHERE LOAN_NO = '&LOAN_NO';
	DBMS_OUTPUT.PUT_LINE('THE LOAN AMOUNT IS: ' || AMT);
END;
/

--EXERCISE QUESTIONS

--QUESTION 1
DECLARE
	RES VARCHAR(50);
	UNI VARCHAR(50);
BEGIN
	RES := 'BENGALURU, KARNATAKA, INDIA';
	UNI := 'VIT CHENNAI, VANDALUR, CHENNAI, INDIA';

	DBMS_OUTPUT.PUT_LINE('RESIDENTIAL ADDRESS: ' || RES);
	DBMS_OUTPUT.PUT_LINE('UNIVERSITY ADDRESS: ' || UNI);
END;
/

--QUESTION 2
DECLARE
	A INT;
	B INT;
	C INT;
	D INT;
	E INT;
	F INT;
BEGIN
	A := 20;
	B := 10;
	
	C := A - B;
	DBMS_OUTPUT.PUT_LINE('ADDITION: ' || C);

	D := A * B;
	DBMS_OUTPUT.PUT_LINE('MULITPLICATION: ' || D);

	E := A / B;
	DBMS_OUTPUT.PUT_LINE('DIVISION: ' || E);

	F := MOD(A, B);
	DBMS_OUTPUT.PUT_LINE('MODULO: ' || F);
END;
/

--QUESTION 3
DECLARE
	INR INT;
	USD INT;
	INRC FLOAT;
	USDC FLOAT;
BEGIN
	INR := '&INR';
	USD := '&USD';

	USDC := INR * 0.012;
	INRC := USD * 82.95;

	DBMS_OUTPUT.PUT_LINE(INR || ' INR IS EQUAL TO ' || USDC || ' USD');
	DBMS_OUTPUT.PUT_LINE(USD || ' USD IS EQUAL TO ' || INRC || ' INR');
END;
/

--QUESTION 4
DECLARE
	MINS INT;
	SECONDS INT;
	HOURS FLOAT;
	MINUTES FLOAT;
BEGIN
	MINS := '&MINS';
	SECONDS := '&SECONDS';

	HOURS := MINS/60;
	MINUTES := SECONDS/60;

	DBMS_OUTPUT.PUT_LINE(MINS || ' MINUTES IS EQUAL TO ' || HOURS || ' HOURS');
	DBMS_OUTPUT.PUT_LINE(SECONDS || ' SECONDS IS EQUAL TO ' || MINUTES || ' MINUTES');
END;
/

--QUESTION 5
DECLARE
	P INT;
	T INT;
	R INT;
	INTEREST INT;
BEGIN
	P := '&PRINCIPLE';
	T := '&TIME';
	R := '&RATE';

	INTEREST := (P * T * R) / 100;

	DBMS_OUTPUT.PUT_LINE('THE INTEREST IS: ' || INTEREST);
END;
/

--QUESTION 6
DECLARE
	EMP_NAME VARCHAR(5);
BEGIN
	SELECT NAME INTO EMP_NAME FROM EMPLOYEE_22BAI1347 WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE_22BAI1347);
	DBMS_OUTPUT.PUT_LINE('THE HIGHEST PAID EMPLOYEE IS ' || EMP_NAME);
END;
/
