-- panchayat_clerk
select current_user();
use GramaPanchayath;
select * from Certificate_application;
insert into certificate_application values(
1033,104," indication certificate","2026-11-11","recoginisation as a indicator","submitted","10.0","gp20262033",1,3);
update certificate_application set application_status="under_review" where application_id=1033; -- error no access

insert into certificate_application values (
1110,102,"laptop certificate","2022-11-10","made in india","submitted","144.0","gp20261112",1,1); 
select * from certificate_application;

