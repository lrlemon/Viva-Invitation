clear screen;


DROP TABLE Company1 CASCADE CONSTRAINTS;
DROP TABLE Applicants CASCADE CONSTRAINTS;
DROP TABLE VivaInvitation CASCADE CONSTRAINTS; 



CREATE TABLE Company1(
	cid number PRIMARY KEY,
	cname varchar2(15),
	address varchar2(15),
	ctype varchar2(15)
);
	

create table Applicants(
	aid number PRIMARY KEY,
	aname varchar2(7),
	age number,
	PhoneNo varchar2(11),
	email varchar2(20),
	degree varchar2(5),
	cgpa number
);	


create table VivaInvitation(
	cid number,
	aid number,
    vdate varchar2(20));
	
	
	
insert into Company1 values(11, 'Sheltech', 'Dhaka', 'RealStateHoding');
insert into Company1 values(12, 'Titas Gas', 'Dhaka', 'Exploration');
insert into Company1 values(13,'Walton','Chandra', 'Electronics');



	
insert into Applicants values(100,'Lokon',25,'01796778344','lokon@gmial.com','BSC',3.4);
insert into Applicants values(101,'Rabbi',32,'01797785644','rabbi@gmial.com','MSC',3.2);
insert into Applicants values(102,'Nayem',18,'01896178344','nayem@gmial.com','BSS',3.6);
insert into Applicants values(104,'Arif',42,'01316778344','arif@gmial.com','HSC',4.5);
insert into Applicants values(105,'Maruf',25,'01696785314','maruf@gmial.com','SSC',4.7);
insert into Applicants values(106,'Karni',40,'01796778344','karni@gmial.com','BSc',2.9);
insert into Applicants values(107,'Rafi',30,'01496778341','rafi@gmial.com','MBA',3.4);
insert into Applicants values(108,'Asik',50,'01596748342','asik@gmial.com','BSC',3.1);
insert into Applicants values(109,'Tuhin',38,'01696728243','tuhin@gmial.com','MBA',3.3);
insert into Applicants values(110,'Pulok',28,'01896775345','pulok@gmial.com','MSC',2.8);


	
insert into VivaInvitation values(1,100,'16-AUG-2021');
insert into VivaInvitation values(1,101,'10-OCT-2021');
insert into VivaInvitation values(1,102,'03-NOV-2021');
insert into VivaInvitation values(1,109,'05-JULY-2021');
insert into VivaInvitation values(1,104,'16-APR-2021');
insert into VivaInvitation values(2,101,'4-APR-2021');
insert into VivaInvitation values(2,102,'15-JAN-2021');



	
	

--commit;

select * from Company1 UNION select * from Company@site1;
