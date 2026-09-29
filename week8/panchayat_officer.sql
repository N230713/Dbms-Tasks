-- panchayat_officer
select current_user();
use GramaPanchayath;
select * from Certificate_application;
insert into certificate_application values(
1034,103," indication  req certificate","2026-01-11"," req for recoginisation as a indicator","submitted","100.0","gp20262034",1,3);
update certificate_application set application_status="under_review" where application_id=1033;
delete from certificate_application where application_id=1034 ;-- denied

select*from certificate_type;
update certificate_type  set certificate_name="aadhar card" where certificate_type_id=2;
delete from certificate_type where certificate_type_id=1; -- unable to access it is denied 
insert into  certificate_type values(7,"tax_card","it is used for tax calculation",5,40,1);




