SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT 'Enter Company Id: '
ACCEPT Y CHAR PROMPT 'Enter Applicant Id: '


CREATE OR REPLACE PROCEDURE App_info(A in VivaInvitation.cid%TYPE, B in VivaInvitation.aid%TYPE)
IS
flag int;
BEGIN
	flag:= account_search(A,B);
	IF flag=1 THEN
		DBMS_OUTPUT.PUT_LINE('VivaInvitation Exits!');
	
		delete from VivaInvitation@site1 where cid=A and aid=B;
		commit;
		DBMS_OUTPUT.PUT_LINE('VivaInvitation Cancelled.');
		ELSIF flag=0 THEN
		DBMS_OUTPUT.PUT_LINE('No Such VivaInvitation');
		
	END IF;
END App_info;
/
show errors;

CREATE OR REPLACE FUNCTION account_search(A in VivaInvitation.cid%TYPE, B in VivaInvitation.aid%TYPE)
RETURN int
IS
foundId int:=0;

BEGIN

	for r in(select * from VivaInvitation@site1 where cid=A and aid=B  ) loop
		foundId:=1;
	end loop;


	return foundId;
END account_search;
/
show errors;


DECLARE
	cid number;
	aid number;
	
BEGIN
	cid:= &X;
	aid:= &Y;
	
	
	App_info(cid,aid);
	

END;
/
commit;



create or replace view view_VivaInvitation as
select * from VivaInvitation@site1;

select * from view_VivaInvitation;
commit;