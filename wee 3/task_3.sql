use GramaPanchayath;
alter table Certificate_application drop column certificate_name ;
-- alter table certificate_application drop column;
alter table Certificate_application add certificate_id int;
alter table Certificate_application add office_id int;
-- set SQL_SAFE_UPDATES=0; -- use when you get safe updates error
 update Certificate_application t1
 join certificate_type t2
 on t1.certificate_name=t2.certificate_name
 set t1.certificate_id=t2.certificate_type_id;
 -- set SQL_SAFE_UPDATES=1;
 update Certificate_application t1
 join panchayat_office t2
 on t1.certificate_id=t2.office_id
 set t1.office_id=t2.office_id;
--  activity 4
alter table Certificate_application 
add constraint fk_citizen
foreign key (citizen_id)references Citizen(citizen_id); -- first id in () must exist in first entered table  Certificate_application with data
alter table Certificate_application 
add constraint fk_certificate
foreign key (certificate_id)references  certificate_type(certificate_type_id);
alter table Certificate_application 
add constraint fk_office
foreign key (office_id)references  panchayat_office(office_id);
show create table Certificate_application;
-- activity 6
insert into Certificate_application values(1007,107,"pancard","2026-07-07","all rounder","submitted",50.00,"gp20260007",7,5);
insert into Certificate_application values(1008,108,"votercard","2026-07-08","for votting","submitted",50.00,"gp20260008",3,8);
delete from  Citizen where citizen_id=1;
delete from certificate_type where certificate_type_id=1;
-- part c
select * from Citizen;
select * from Certificate_application;
select  full_name from Citizen order by full_name ASC;
select DISTINCT village_name from Citizen;
select DISTINCT office_name from panchayat_office;
select DISTINCT certificate_name from certificate_type;
select * from certificate_application where status='pending';
select * from Citizen where village_name='ramapuram';
select * from Certificate_application where year(application_date)=2026;
select * from Certificate_application order by application_date desc;
select ca.*
from certificate_application ca
join panchayat_office po on ca.office_id=po.office_id
where po.office_name='nuzvid panchayat office';
select c.full_name
from Citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id
where ct.certificate_name='income certificate';
-- level-1
select c.full_name
from Citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id
where ct.certificate_name='income certificate'
 union 
 select c.full_name
from Citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id 
where ct.certificate_name='recidentialcertificate';

select * from certificate_application where month(application_date)=1
union
select * from certificate_application where month(application_date)=2;

select*from Citizen where village_name='ramapuram'
union 
select*from Citizen where village_name='lakshmipuram';

select c.full_name
from Citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id
where ct.certificate_name='income certificate'
INTERSECT -- AND c.citizen_id in()
 select c.full_name
from Citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id 
where ct.certificate_name='recidentialcertificate';

select citizen_id from certificate_application where year(application_date)=2025
INTERSECT
select citizen_id from certificate_application where year(application_date)=2026;
select c.full_name
from Citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id
where ct.certificate_name='income certificate' 
EXCEPT
select c.full_name
from Citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id 
where ct.certificate_name='recidentialcertificate';

select*from certificate_application where year(application_date)=2025
except  -- and year(certificare_date) not in()
select* from certificate_application where year(application_date)=2026;
-- level 2
select full_name
from citizen 
where citizen_id 
in(
select citizen_id 
from Certificate_application
where application_status='submitted');
select full_name
from citizen 
where citizen_id 
NOT IN(
select citizen_id 
from Certificate_application
where application_status='submitted');

select full_name
from Citizen c 
where exists(
select * from certificate_application ca
where ca.citizen_id=c.citizen_id);

select full_name
from Citizen c 
where not exists(
select * from certificate_application ca
where ca.citizen_id=c.citizen_id);

select full_name
from  citizen 
where TIMESTAMPDIFF(year,Dob,curdate())
>any(select TIMESTAMPDIFF(year,Dob,curdate())
from citizen 
where village_name='ramapuram');

select full_name
from  citizen 
where TIMESTAMPDIFF(year,Dob,curdate())
>all(select TIMESTAMPDIFF(year,Dob,curdate())
from citizen 
where village_name='ramapuram');



