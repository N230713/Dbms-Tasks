create database GramaPanchayath;
use GramaPanchayath;
 create table Citizen(
 citizen_id int primary key, 
 full_name varchar(100) not null,
 Dob date not null,
 Gender varchar(10) not null,
 mobile_num bigint  not null unique,
 occupation varchar(50) ,
 village_name varchar(50) not null,
is_active Boolean not null
 );
insert into Citizen(citizen_id,full_name,Dob, Gender,mobile_num, occupation,village_name,is_active)
values(102,"ravikumar","1995-06-15","male",879879878,"farmer","ramapuram",TRUE),
(101,"laksmiDevi","1995-06-15","female","8797397977","tailor","ramapuram",TRUE),
(103,"sureshbabu","1992-03-10","male",987988778,"shopkeeper","seethampeta",TRUE),
(104,"anjalirao","1995-06-15","male",9900879878,"student","ramapuram",TRUE),
(105,"KiranKumar","1985-01-18","male",909090909,"electrician","purushothapuram",TRUE),
(106,"MeenaKumari","1998-12-30","female",80008892,"teacher","lakshmipuram",FALSE);

insert into Citizen(citizen_id,full_name,Dob, Gender,mobile_num, occupation,village_name,is_active)
values(107,"nandini","2007-01-15","female",87988978,"student","buradapadu",TRUE);
delete from citizen where citizen_id=107;
alter table citizen add adress varchar(100);

update  Citizen set occupation="electrical tecgnician" where citizen_id=105;
select * from Citizen;


-- part-g
-- id same (primary key)
insert into Citizen(citizen_id,full_name,Dob, Gender,mobile_num, occupation,village_name,is_active)
values(101,"pallavi","2007-01-11","female",87988228,"student","east godavari",TRUE);
-- duplicate entry error

-- phn same(unique)
insert into Citizen(citizen_id,full_name,Dob, Gender,mobile_num, occupation,village_name,is_active)
values(112,"Meena","1998-11-30","female",80008892,"teacher","lakshmipuram",FALSE);




