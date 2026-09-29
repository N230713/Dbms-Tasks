-- part A
use GramaPanchayath;
select * from Citizen;
select*from certificate_type;
select * from Certificate_application;
select* from panchayat_office;
-- part b
select max(application_date) as latest  from Certificate_application;
select min(application_date) as earliest from Certificate_application;
select application_date as latest_by_sub from  Certificate_application where application_date=
(select max(application_date) from Certificate_application) ;
select application_date as earliest_by_sub from Certificate_application where application_date=
(select min(application_date)from Certificate_application);
select  * from Certificate_application where citizen_id in(
select citizen_id from  Certificate_application where application_status="submitted");
-- level 2
select * from  Certificate_application where  application_date >(
select min(application_date)from Certificate_application) and application_status="submitted";
select * from Certificate_application where application_date <(
select max(application_date) from Certificate_application) and application_status="submitted";
select full_name,citizen_id from Citizen where Citizen_id in(
select citizen_id from certificate_application where application_status="submitted");
select full_name,citizen_id from citizen where citizen_id not in(
select citizen_id  from certificate_application where application_status="submitted" or application_status="approved" or application_status="aproved");
select certificate_type_id,certificate_name from certificate_type where certificate_type_id in(
select certificate_id from certificate_application where application_status="approved" or application_status="aproved");
select certificate_type_id, certificate_name from certificate_type where certificate_type_id not in (
select certificate_id from  certificate_application where application_status="approved" or application_status="aproved");
select application_id,certificate_name,application_date from certificate_application where application_date >(
select min(application_date) from certificate_application);
select ct.certificate_name,ca.application_date from certificate_type ct
join certificate_application ca 
on ct.certificate_type_id=ca.certificate_id
where ca.application_date=(
select max(application_date) from certificate_application);
-- level 3
select	ct. certificate_name,ca.certificate_id, count(*) as cnt from certificate_type ct
join certificate_application ca
on ct.certificate_type_id=ca.certificate_id
where ca.certificate_id=(
select certificate_id as cnt from certificate_application 
group by certificate_id order by count(*) desc limit 1)
group by ca.certificate_id,ct.certificate_name;

select ca.office_id,o.office_name,count(*) from certificate_application ca
join panchayat_office o
on ca.office_id=o.office_id
where ca.office_id=(
select office_id from certificate_application 
group by office_id order by count(*) desc limit 1)
group by  ca.office_id,o.office_name;

-- select--  count(*) from certificate_application
-- where count(*) >(select avg(count(*)) from certificate_application group by certificate_id)
--  group by certificate_id 
select ct.certificate_name,ca.certificate_id,count(*) from certificate_application ca
join certificate_type ct
on ca.certificate_id=ct. certificate_type_id
group by ct.certificate_name,ca.certificate_id
having count(*)>(
select avg(cnt) from(
select count(*)as cnt  from certificate_application group by certificate_id) as counts);

select ca.office_id,o.office_name,count(*) from panchayat_office o
join certificate_application ca
on ca.office_id=o.office_id
group by o.office_id
having count(*) >Any(
-- select min(cnt) from(
select count(*) as cnt from certificate_application group by office_id);

select ca.office_id,o.office_name,count(*) from panchayat_office o
join certificate_application ca
on ca.office_id=o.office_id
group by o.office_id 
having count(*) >=All(
select count(*) as cnt from certificate_application group by office_id);
select ct.certificate_name,ca.application_date from certificate_application ca
join certificate_type ct
on ca.certificate_id=ct.certificate_type_id
where ca.application_date=(
select max(application_date) from certificate_application );

select c.full_name,ca.citizen_id,count(*) from certificate_application ca
join citizen c
on c.citizen_id=ca.citizen_id
group by ca.citizen_id
having count(*)>1;

select application_status,count(*)  from certificate_application 
group by application_status having count(*)=(
select max(cnt) from(
select count(*) as cnt from certificate_application 
 group by application_status )as counts);
 






