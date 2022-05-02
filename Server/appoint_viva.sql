SET SERVEROUTPUT ON;
SET VERIFY OFF;

select * from Applicants@site1;
SELECT * from Company@site1;


ACCEPT X NUMBER PROMPT 'ENTER COMPANY ID: '
ACCEPT Y NUMBER PROMPT 'ENTER APPLICANT ID: '
ACCEPT Z CHAR PROMPT 'DATE: '


CREATE OR REPLACE TRIGGER placement
AFTER INSERT
ON VivaInvitation
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('VivaInvitation IS PLACED....');
END;
/


CREATE OR REPLACE PACKAGE p AS
	FUNCTION verifyInfo(Q in VivaInvitation.cid%TYPE)
	RETURN NUMBER;
	PROCEDURE insertInfo(Q in VivaInvitation.cid%TYPE, W in VivaInvitation.aid%TYPE, E in VivaInvitation.vdate%TYPE);  
	
END p;
/


CREATE OR REPLACE PACKAGE BODY p AS
	
	FUNCTION verifyInfo(Q in VivaInvitation.cid%TYPE)
	RETURN NUMBER
	IS
		Flag number:=0;
		BEGIN 
			IF Q>10 THEN
				Flag := 1;
			END IF;
			
		RETURN Flag;	
		END verifyInfo;
		

	PROCEDURE insertInfo(Q in VivaInvitation.cid%TYPE, W in VivaInvitation.aid%TYPE,E in VivaInvitation.vdate%TYPE)
	IS

		BEGIN

			insert into VivaInvitation@site1 values(Q,W,E);
			commit;
		END insertInfo;
					
END p;
/ 




DECLARE
	A number:=&X; 
	B number:=&Y;
    C varchar2(20):= '&Z';
	flag number;
	founded EXCEPTION;
BEGIN
	flag:= p.verifyInfo(A);
	
	IF flag=0 THEN
		p.insertInfo(A,B,C);
	else
		RAISE founded;
	end if;
	
	EXCEPTION
		when founded THEN	
			DBMS_OUTPUT.PUT_LINE('NO SUCH COMPANY ID FOUND IN THE DATABASE!');
	
	
END;
/


create or replace view view_VivaInvitation as
select * from VivaInvitation@site1;

select * from view_VivaInvitation;
commit;














