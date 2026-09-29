 use GramaPanchayath;
create table Panchayat_office(
office_id int primary key,
office_name varchar(100) not null,
village_name varchar(50) not null,
pincode varchar(6) not null,
contact_number varchar(15) unique,
office_email varchar(100) unique,
opening_time time not null,
is_operational boolean not null);
insert into Panchayat_office(office_id,office_name,village_name,pincode,contact_number,office_email,opening_time,is_operational)
values (1,"ramapuram gramapanchayat","ramapuram",521101,0866000001,"ramapuram@gp.example","09:00:00",TRUE),
(2,"seethampeta gramapanchayat","seethampeta",521102,0866000002,"seethampeta@gp.example","09:00:00",TRUE),
(3,"lakshmipuram gramapanchayat","lakshmipuram",521103,0866000003,"lakshmipuram@gp.example","09:30:00",TRUE),
(4,"krishnapuram gramapanchayat","krishnapuram",521104,0866000004,"krishnapuram@gp.example","10:00:00",TRUE),
(5,"venkatapuram gramapanchayat","venkatapuram",521105,0866000005,"venkatapuram@gp.example","09:30:00",TRUE),
(6,"gopalapuram gramapanchayat","gopalapuram",521106,0866000006,"gopalapuram@gp.example","09:00:00",FALSE);

select* from panchayat_office;