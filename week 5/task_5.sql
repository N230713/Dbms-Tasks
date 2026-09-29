use GramaPanchayath;
select * from Citizen;
select*from certificate_type;
select * from Certificate_application;
select* from panchayat_office;

INSERT INTO certificate_application
(
    application_id,
    citizen_id,
    certificate_name,
    application_date,
    purpose,
    application_status,
    fee_paid,
    reference_number,
    certificate_id,
    office_id
    
)
VALUES-- Citizen 101
(1007, 101, "pancard",
 '2026-07-07', 'pancard Application',
 'Under Review', 30.00, 'GP20260007', 1,1),
(1008, 101,'house scheme Verification',
 '2026-07-08', 'house scheme Verification',
 'Submitted', 50.00, 'GP20260008', 5,5),
(1009, 101," citizencard",
 '2026-07-09', 'citizen card',
 'Rejected', 25.00, 'GP20260009', 6,6),-- Citizen 102
(1010, 102, 2,
 '2026-07-10', 'office scootiny',
 'Approved', 20.00, 'GP20260010',2, 2),
(1011, 102, 'Pension Scheme Application',
 '2026-07-11', 'Pension Scheme Application',
 'Under Review', 40.00, 'GP20260011',3, 3),
(1012, 102, 'Government Service Requirement',
 '2026-07-12', 'Government Service Requirement',
 'Submitted', 25.00, 'GP20260012', 6,6),-- Citizen 103
(1013, 103, 'Bank Loan Documentation',
 '2026-07-13', 'Bank Loan Documentation',
 'Approved', 30.00, 'GP20260013', 1,1),
(1014, 103,'Family Record Documentation',
 '2026-07-14', 'Family Record Documentation',
 'Under Review', 20.00, 'GP20260014',4, 4),
(1015, 103, 'Property Registration',
 '2026-07-15', 'Property Registration',
 'Submitted', 50.00, 'GP20260015', 5,5),-- Citizen 104
(1016, 104,  'College Scholarship',
 '2026-07-16', 'College Scholarship',
 'Submitted', 20.00, 'GP20260016',2, 2),
(1017, 104, 'Educational Benefits',
 '2026-07-17', 'Educational Benefits',
 'Approved', 40.00, 'GP20260017',4, 4),
(1018, 104,'Local Service Requirement',
 '2026-07-18', 'Local Service Requirement',
 'Rejected', 25.00, 'GP20260018',6, 6),-- Citizen 105
(1019, 105, 'Address Proof Requirement',
 '2026-07-19', 'Address Proof Requirement',
 'Under Review', 30.00, 'GP20260019',3, 3),
(1020, 105, 'Family Documentation',
 '2026-07-20', 'Family Documentation',
 'Submitted', 20.00, 'GP20260020',2, 2),
(1021, 105,'Property Loan Documentation',
 '2026-07-21', 'Property Loan Documentation',
 'Approved', 50.00, 'GP20260021', 5,5),-- Citizen 106
(1022, 106, 'Personal Documentation',
 '2026-07-22', 'Personal Documentation',
 'Rejected', 20.00, 'GP20260022',2, 1),
(1023, 106,'Family Welfare Scheme',
 '2026-07-23', 'Family Welfare Scheme',
 'Under Review', 40.00, 'GP20260023', 4,3),
(1024, 106, 'Property Record Update',
 '2026-07-24', 'Property Record Update',
 'Submitted', 50.00, 'GP20260024',4, 4);
SELECT COUNT(*) as No_of_Applications FROM certificate_application ;
SELECT COUNT(*) as No_of_Citizens FROM citizen ;
SELECT COUNT(*) as No_of_Certificates FROM certificate_type ;
SELECT application_id , citizen_id , application_date as earliest  
FROM certificate_application  
WHERE application_date = ( SELECT MIN(application_date) FROM certificate_application );-- Task 5 Display the latest application date recorded in the database.
SELECT application_id , citizen_id , application_date as latest  
FROM certificate_application  
WHERE application_date = ( SELECT MAX(application_date) FROM certificate_application );-- Level 2 – Application
-- Task 1 Display the number of certificate applications for each application status.
SELECT application_status , COUNT(application_status) 
FROM certificate_application 
GROUP BY application_status ;-- Task 2 Display the number of certificate applications for each certificate type.
SELECT ca.certificate_id , ct.certificate_name , COUNT(ca.certificate_id) as No_of_Applications
FROM certificate_application ca JOIN certificate_type ct 
ON ca.certificate_id = ct.certificate_type_id
GROUP BY ca.certificate_id ;-- Task 3 Display the number of certificate applications submitted at each Panchayat Office.
SELECT ca.office_id , po.office_name , COUNT(ca.office_id) as No_of_Applications
FROM certificate_application ca JOIN panchayat_office po 
ON ca.office_id = po.office_id
GROUP BY ca.office_id ;-- Task 4 Display the number of citizens in each village.
SELECT village_name , COUNT(village_name) as No_of_citizens 
FROM citizen 
GROUP BY village_name ;-- Task 5 Display the number of applications submitted on each application date.
SELECT application_date , COUNT(application_date) 
FROM certificate_application 
GROUP BY application_date ;