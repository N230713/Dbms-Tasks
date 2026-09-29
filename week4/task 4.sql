use gramaPanchayath;
-- level 1
select c.full_name,ce.certificate_name
from certificate_application ca
inner join  Citizen c on ca.citizen_id= c.citizen_id
inner join certificate_type ce on ca.certificate_id= ce.certificate_type_id ;
select c.full_name,p.office_name
from certificate_application ca
join  Citizen c on ca.citizen_id= c.citizen_id
join  panchayat_office p on ca.office_id= p.office_id;
select ca.application_id, c.citizen_id,ca.application_status
from certificate_application ca
inner join citizen c on ca.citizen_id=c.citizen_id;
select c.full_name,ct.certificate_name,ca.application_date
from certificate_application ca
join  Citizen c on ca.citizen_id= c.citizen_id
join certificate_type ct on ca.certificate_id= ct.certificate_type_id ;
select ca.*,c.full_name,ct.certificate_name,p.office_name
from certificate_application ca
join  Citizen c on ca.citizen_id= c.citizen_id
join certificate_type ct on ca.certificate_id= ct.certificate_type_id 
join  panchayat_office p on ca.office_id= p.office_id;
-- level 2
select c.full_name,ct.certificate_name,p.office_name
from certificate_application ca
join  Citizen c on ca.citizen_id= c.citizen_id
join  panchayat_office p on ca.office_id= p.office_id
join certificate_type ct  on ca.certificate_id= ct.certificate_type_id  where ct.certificate_name="non-dues certificate";
-- my table doesnt contain income certificate so i use it
select c.* ,ca.application_status ,p.office_name
from certificate_application ca
join  Citizen c on ca.citizen_id= c.citizen_id
join  panchayat_office p on ca.office_id= p.office_id where ca.application_status="submitted" and p.office_name="venkatapuram gramapanchayat";
-- no any nuzvid panchayat exist so i use it for better results
select ca.certificate_name,ct.description,ca.application_status
from certificate_application ca
join certificate_type ct  on ca.certificate_id= ct.certificate_type_id;
select c.full_name,c.village_name,ct.certificate_name,p.office_name ,ca.application_date
from certificate_application ca
join  Citizen c on ca.citizen_id= c.citizen_id
join certificate_type ct  on ca.certificate_id= ct.certificate_type_id 
join  panchayat_office p on ca.office_id= p.office_id;
select p.*,ca.*,ct.*,c.*
from certificate_application ca
inner join  Citizen c on ca.citizen_id= c.citizen_id
inner join certificate_type ct  on ca.certificate_id= ct.certificate_type_id 
inner join  panchayat_office p on ca.office_id= p.office_id;
-- level 3
select c.full_name,ca.application_status
from certificate_application ca
left outer join  Citizen c on ca.citizen_id= c.citizen_id where ca.application_status!="submitted";
select ct.certificate_type_id,ct.certificate_name
from certificate_application ca
right outer join certificate_type ct on ca.certificate_id= ct.certificate_type_id where ca.certificate_id is null;
select c.full_name,ca.reference_number,ca.application_status
from certificate_application ca
left outer join Citizen c on ca.citizen_id= c.citizen_id
union 
select c.full_name,ca.reference_number,ca.application_status
from certificate_application ca
right outer join Citizen c on ca.citizen_id= c.citizen_id;
select*from Panchayat_office;
select c1.full_name as Citizen1,
c2.full_name as citizen2,
c1.village_name
from citizen c1
inner join citizen c2 on c1.village_name=c2.village_name and c1.citizen_id < c2.citizen_id;
show tables
 




