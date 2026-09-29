-- part A

use GramaPanchayath;
select * from Citizen;
select*from certificate_type;
select * from Certificate_application;
select* from panchayat_office;
-- part b
create view dis_certificate_applications as
select* from certificate_application;
select * from dis_certificate_applications;

create view app_status as
select application_id, citizen_id,application_status from certificate_application;
select * from app_status;

create view aprove_app as
select application_id,application_status from app_status
where application_status="approved" or application_status="aproved";
select *  from aprove_app;

show full tables from GramaPanchayath where table_type='view';
show create view app_status;
-- level 2
create view join_data as
select ca.application_date ,ct.certificate_name from certificate_application ca
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id;
select * from join_data;
create view citizen_details as
select c.full_name,ca.application_status from certificate_application ca
join citizen c on 
c.citizen_id=ca.citizen_id;
select * from  citizen_details;

create view office_details as
select ca.application_status,o.office_name
from certificate_application ca  join panchayat_office o
on o.office_id=ca.office_id
where ca.application_status="submitted";
select * from office_details;

create view certificates_cnt as
select ca.certificate_id,ct.certificate_name,count(*) from certificate_application ca
join certificate_type ct on ct.certificate_type_id= ca.certificate_id
group by ca.certificate_id;
select * from certificates_cnt;

create view panchayat_cnt as
select  ca.office_id ,o.office_name ,count(*) from certificate_application ca
join panchayat_office o on ca.office_id= o.office_id
group by ca.office_id;
select * from panchayat_cnt;

create view pending_applications as
select certificate_name,application_status from certificate_application 
where application_status="under review";
select * from pending_applications where application_status="under review";
show create view pending_applications;
-- level 3

create view certificate_app as
select ct.certificate_name ,count(*) from certificate_type ct
join certificate_application ca
on ca.certificate_id=ct.certificate_type_id 
group by ca.certificate_id;

create view office_app as
select o.office_name ,count(*) from panchayat_office o 
join certificate_application ca 
on o.office_id=ca.office_id
where ca.office_id in (
select office_id from certificate_application group by  office_id having count(*)>1)
group by ca.office_id;
select * from office_app;
-- based on certificate ifd group them and have earliest and latest dates a0 re 
create view  TASK3 AS
select ca.certificate_id,ct.certificate_name,min(ca.application_date) as latest ,max(ca.application_date) as earliest 
from certificate_application ca
join certificate_type ct 
on ca.certificate_id=ct.certificate_type_id group by certificate_id;
select * from task3;

create view count_datails as
select  c.full_name,ca.citizen_id ,count(*) from certificate_application ca
join citizen c
on c.citizen_id=ca.citizen_id group by ca.citizen_id;
select *from count_datails;

create view join_3_tables as
select c.full_name, c.citizen_id,ca.application_id,ca.certificate_name as app_certificate_name,ct.certificate_type_id,ct.certificate_name
from certificate_application ca
join certificate_type  ct
on ct.certificate_type_id=ca.certificate_id
join citizen c
on c.citizen_id=ca.citizen_id;
select * from join_3_tables;

create view approved_details as
select c.full_name ,ct.certificate_name ,ca.certificate_name as cert_name ,ca. application_status from certificate_application ca
join certificate_type ct
on ct.certificate_type_id=ca.certificate_id
join citizen c
on c.citizen_id=ca.citizen_id
where ca.application_status="approved" or ca.application_status="aproved";
select * from approved_details;

select full_name,citizen_id from join_3_tables where citizen_id>103 group by citizen_id order by citizen_id;

drop view  approved_details;












