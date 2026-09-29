select current_user();
use GramaPanchayath;
select * from Certificate_application;
insert into certificate_application values(
1029,102,"star pro certificate","2026-01-10","recoginisation as a star","approved","100000.0","gp20262029",3,6);
update certificate_application set application_status="wasted" where application_id=1006;
--  lack of permition no code get excuted.
select * from aprove_app;
