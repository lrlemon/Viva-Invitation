SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT 'ID: '
ACCEPT Y CHAR PROMPT 'ENTER NAME: '
ACCEPT Z NUMBER PROMPT 'ENTER AGE: '
ACCEPT M CHAR PROMPT 'PHONE: '
ACCEPT N CHAR PROMPT 'EMAIL: '
ACCEPT O CHAR PROMPT 'DEGREE: '
ACCEPT P NUMBER PROMPT 'CGPA: '


CREATE OR REPLACE PROCEDURE printInfo(A in Applicants.aid%TYPE, B in Applicants.aname%TYPE,
C IN Applicants.age%TYPE,D in Applicants.PhoneNo%TYPE, E IN Applicants.email%TYPE,
F IN Applicants.degree%TYPE,G IN Applicants.cgpa%TYPE)
IS
flag int;
BEGIN
	flag:= searchAccount(A,B,C,D,E,F,G);
	IF flag=1 THEN
		DBMS_OUTPUT.PUT_LINE('Account already exists!');
	ELSIF flag=0 THEN
		insert into Applicants values(A,B,C,D,E,F,G);
		DBMS_OUTPUT.PUT_LINE('Applicant info inserted.');
	END IF;
END printInfo;
/
show errors;

CREATE OR REPLACE FUNCTION searchAccount(A in Applicants.aid%TYPE, B in Applicants.aname%TYPE,
C IN Applicants.age%TYPE,D in Applicants.PhoneNo%TYPE, E IN Applicants.email%TYPE,
F IN Applicants.degree%TYPE,G IN Applicants.cgpa%TYPE)
RETURN int
IS
foundId int:=0;

BEGIN

	for r in(select * from Applicants where aid=A and aname=B and age=C and PhoneNo=D and email=E and degree=F and cgpa=G) loop
		foundId:=1;
	end loop;


	return foundId;
END searchAccount;
/
show errors;


DECLARE
	id number;
	name varchar2(20);
	age integer;
    PhoneNo varchar2(20);
	email varchar2(20);
	degree varchar2(20);
    cgpa NUMBER;
    
BEGIN
	id:= &X;
	name:= '&Y';
	age:= &Z;
    PhoneNo:= '&M';
	email:= '&N';
	degree:= '&O';
    cgpa:= &P;
	
    
	
	printInfo(id,name,age,PhoneNo,email,degree,cgpa);
	

END;
/
commit;

select * from Applicants;


commit;


