use GramaPanchayath;
select * from Citizen;
select*from certificate_type;
select * from Certificate_application;
select* from panchayat_office;
set AUTOCOMMIT=0;
select @@autocommit;
start transaction;
update certificate_application set certificate_name="voter id" where application_id=1010;
commit;
start transaction;
update certificate_application set application_status="approved",
purpose=" sucessfully approved" where application_id=1002;
commit;
start transaction;
update certificate_application set application_status="under review",
purpose="  form is under review" where application_id=1002;
rollback;
start transaction;
insert into certificate_application values (
1025,102,"star certificate","2026-01-10","recoginisation as a star","approved","100000.0","gp20262024",3,6);
rollback;
-- it is work also for the ddl commands too 
start transaction;
delete from certificate_application where application_id=1024;
rollback;
-- working 
start transaction;
update certificate_application set citizen_id=105 where application_id=1002;
delete from certificate_application where application_id=1001;
commit;

-- part c
start transaction;
update certificate_application set application_date="2007-01-15" where application_id=1006;
savepoint s1;
update certificate_application set fee_paid=20000 where application_id=1004;
rollback to savepoint s1;
commit;
-- oonly the first updated data get remain
start transaction ;
insert into certificate_application values (
1234,101," mega star certificate","2026-01-15","recoginisation as a mega star","approved","900000.0","gp20262024",4,6);
savepoint s1;
update certificate_application set fee_paid=20000 where application_id=1009;
rollback to savepoint s1;
commit;

start transaction;
update certificate_application set fee_paid=400000 where application_id=1004;
savepoint s1;
update certificate_application set application_status="approved" where application_id=1009;
savepoint s2;
update certificate_application set reference_number="gp0262026" where application_id=1009;
rollback to savepoint s1;
commit;

start transaction;
insert into certificate_application values (
1233,105," filmstar certificate","2026-11-19","recoginisation as a filmstar","approved","70000.0","gp20262022",2,2);
savepoint s1;
update certificate_application set fee_paid=20000 where application_id=1009;
savepoint s2;
delete  from certificate_application where application_id=1002;
rollback to savepoint s2;
commit;
    
start transaction;
update certificate_application set fee_paid=20000 where application_id=1007;
savepoint s1;
release savepoint s1;
rollback to savepoint s1; -- savepoint doesnt exist.

start transaction;
update certificate_application set  certificate_name="nandini's certificate" where application_id=1234;
savepoint s1;
update certificate_application set application_date ="2026-06-06" where application_id=1234;
update certificate_application set application_date ="2026-06-06" where application_id=1233;
rollback; -- do entir transactions undo
rollback to savepoint s1; -- do till the savepoint
set AUTOCOMMIT=1;

-- DCL
-- part D
select current_user(); -- root@localhost
create user "clerk1"@"localhost"
identified by"clerk@123";

grant select on gramapanchayath.certificate_application to "clerk1"@"localhost";
show grants for "clerk1"@"localhost";
grant insert on gramapanchayath.certificate_application to "clerk1"@"localhost";
show full tables; -- aprove_app exist[
grant select on gramapanchayath.aprove_app to "clerk1"@"localhost";
revoke insert on gramapanchayath.certificate_application from "clerk1"@"localhost";
-- part e
create user "panchayat_clerk"@"localhost"
identified by "panchayat";
grant select ,insert on gramapanchayath.certificate_application to "panchayat_clerk"@"localhost";
create user "panchayat_officer"@"localhost" 
identified by "pan_of";
grant select ,update,insert on gramapanchayath.certificate_application to "panchayat_officer"@"localhost";

    





