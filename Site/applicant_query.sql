SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT X NUMBER PROMPT 'ENTER applicant ID: '


declare	
	a number := &X;

	K varchar2(30);
	L varchar2(30);
	M varchar2(30);
	flag number;
	
	
begin
	flag:=0;
	for R in (Select cname from Company where cid in (Select cid from VivaInvitation where aid=a)) loop
		K:= R.cname;
		DBMS_OUTPUT.PUT_LINE('COMPANY NAME: '||K);
	end loop;
	
	for S in(Select aname from Applicants where aid=a) loop
		L:= S.aname;
	    DBMS_OUTPUT.PUT_LINE('APPLICANT NAME: '|| L);
	end loop;
	
	for T in(Select vdate from VivaInvitation where aid=a) loop
		M:= T.vdate;
	    DBMS_OUTPUT.PUT_LINE('VIVA DATE: '|| M);
		flag:=1;
	end loop;
	
	IF flag=0 THEN
	
	 DBMS_OUTPUT.PUT_LINE('Applicant Not Called Yet.');
	
	END IF;
	
end;
/
show errors;