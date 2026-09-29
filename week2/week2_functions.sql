use GramaPanchayath;
-- level 1
select UPPER(full_name) from citizen;
select lower(village_name) from citizen;
select length(full_name) from citizen;
select substr(reference_number,1,4)from Certificate_application;
select concat(full_name,' - ',village_name)from Citizen;

-- level 2
select replace(certificate_name,"certificate","cert.")from certificate_type;
select trim(certificate_name)from certificate_type;
select substring(full_name,1,5) from citizen;

-- level 3
-- select substring(full_name,1,1)from citizen;
select concat('Citizen:',full_name)as citizen_names from citizen;
select concat('village:',village_name) as vill_names from citizen;
select concat('GP2026 ',reference_number)as gp2026 from certificate_application;
-- part c
-- leverl 1
select round(fee_paid) from certificate_application;
select ABS(processing_days)from certificate_type;
select power(processing_days,2)from certificate_type;
-- level 2
select mod(processing_days,3)from certificate_type;
select round(fee_paid,1) from certificate_application;
select ceil(fee_paid) from certificate_application;
select floor(fee_paid) from certificate_application;
-- level 3
select floor(rand()*100);
select sqrt(processing_days)from certificate_type;
select (processing_days*2)from certificate_type;

-- part d
-- level 1
select curdate() as date;
select now();
select year(application_date) from certificate_application;
select month(application_date) from certificate_application;
select day(application_date) from certificate_application;
-- level 2

-- if two id of two tables get matched use data along with the commented data(join) otherwise ue only uncommmented data(cross join)
select   
-- t1.application_id,
t1.application_date,
t2.processing_days,
DATE_ADD(t1.application_date, interval t2.processing_days day )as new_date
from Certificate_application t1
 cross JOIN certificate_type t2;
-- on t1.application_id=t2.certificate_type_id ;
select DATE_ADD(application_date, interval 30 day )as after_30 from certificate_application;
select DATE_sub(application_date, interval 7 day )as before_7 from certificate_application;
-- level 3
select datediff(curdate(),application_date) from certificate_application;
select application_date from certificate_application where year(application_date)=year(curdate());
-- part e
-- level 1
select cast(fee_paid as signed)as int_fee from certificate_application;
select cast(processing_days as char) as char_processingdays from certificate_type;
-- level 2
select cast(application_date as datetime) as date_time_app_date from certificate_application;
select cast(processing_days as decimal(10,2)) as des_days from certificate_type;
-- level 3
select cast(fee_paid as char)as char_fee from certificate_application;
select cast(processing_days as decimal(10,2))*2 as double_des_days from certificate_type;



