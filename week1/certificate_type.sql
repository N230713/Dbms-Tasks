 use GramaPanchayath;
 create table certificate_type(
certificate_type_id int primary key,
certificate_name varchar(100) unique not null,
description varchar(200) not null,
processing_days int not null,
application_fee decimal(8,2) not null,
is_available boolean not null
 );
insert into certificate_type(certificate_type_id,certificate_name ,description,processing_days,application_fee,is_available)
values (1,"recidentialcertificate","certifies the declear day of referance",7,30.00,TRUE),
(2,"birth record request","rrequest foe locally maintained birth record",5,20.00,TRUE),
(3,"death record request","request for locally maintained death record",5,20.00,TRUE),
(4,"family memeber certificate","records decleared family_memeber information",10,40.00,TRUE),
(5,"proprrty certificate","certificate related to locally maintained property records",15,50.00,TRUE),
(6,"non-dues certificate","indicates applicable local dues status",7,25.00,FALSE);

insert into certificate_type(certificate_type_id,certificate_name ,description,processing_days,application_fee,is_available)
values (7,"income certificate","certifies the declear anuual income",4,50.00,TRUE);

 update  Certificate_type set processing_days=15 where certificate_type_id=5;
update  Certificate_type set is_available=TRUE where certificate_type_id=6;
select*from certificate_type;
delete from certificate_type where certificate_type_id=7;












