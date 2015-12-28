CREATE SCHEMA `employee_project` ;
# EMPLOYEE 
CREATE TABLE `employee_project`.`employee` (
  `Emp_Id` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  `Ssn` INT(10) NULL COMMENT '',
  `Date_of_Birth` VARCHAR(45) NULL COMMENT '',
  `Dept_Id` INT(10) NULL COMMENT '',
  `Designation` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Emp_Id`)  COMMENT '');

# EMP_ADDITIONAL_INFO 
CREATE TABLE `employee_project`.`employee_additional_info` (
  `Emp_Id` INT NOT NULL COMMENT '',
  `Address` VARCHAR(45) NULL COMMENT '',
  `Phone_Num` BIGINT(12) NULL COMMENT '',
  `Email_Id` VARCHAR(45) NULL COMMENT '',
  `Date_of_Joining` VARCHAR(45) NULL COMMENT '',
  `Salary` INT(10) NULL COMMENT '',
  `Manager_Id` INT(11) NULL COMMENT '',
  PRIMARY KEY (`Emp_Id`)  COMMENT '');

# EMPLOYEE_EXPERIENCE
CREATE TABLE `employee_project`.`employee_experience` (
  `Emp_Id` INT NOT NULL COMMENT '',
  `Previous_Company` VARCHAR(45) NULL COMMENT '',
  `Previous_Experience` INT(10) NULL COMMENT '',
  `Present_Experience` INT(10) NULL COMMENT '',
  `Total_Experience` INT(10) NULL COMMENT '',
  PRIMARY KEY (`Emp_Id`)  COMMENT '');



# EMPLOYEE_ANNUAL_LEAVES
CREATE TABLE `employee_project`.`employee_annual_leaves` (
  `Emp_Id` INT NOT NULL COMMENT '',
  `Sick_Leaves` INT(10) NULL COMMENT '',
  `Casual_Leaves` INT(10) NULL COMMENT '',
  `Paid_Leaves` INT(10) NULL COMMENT '',
  `Unpaid_Leaves` INT(10) NULL COMMENT '',
  PRIMARY KEY (`Emp_Id`)  COMMENT '');

# DEPARTMENT
CREATE TABLE `employee_project`.`department` (
  `Dept_Id` INT NOT NULL COMMENT '',
  `Dept_Name` VARCHAR(45) NULL COMMENT '',
  `Dept_Address` VARCHAR(45) NULL COMMENT '',
  `Dept_Phone_Num` INT(10) NULL COMMENT '' ,
  PRIMARY KEY (`Dept_Id`)  COMMENT '');

# EMPLOYEE_EVALUATION
CREATE TABLE `employee_project`.`employee_evaluation` (
  `Emp_Id` INT NOT NULL COMMENT '',
  `Manager_Id` INT(10) NULL COMMENT '',
  `Proactiveness` INT(10) NULL COMMENT '',
  `Communication` INT(10) NULL COMMENT '',
  `Leadership` VARCHAR(45) NULL COMMENT '',
  `Team_Work` INT(10) NULL COMMENT '',
  `Rating` INT(10) NULL COMMENT '',
  PRIMARY KEY (`Emp_Id`)  COMMENT '');

# TRAINING
CREATE TABLE `employee_project`.`training` (
  `Training_Id` INT NOT NULL COMMENT '',
  `Training_Conducted` VARCHAR(45) NULL COMMENT '',
  `Training_Conducted_Date` VARCHAR(45) NULL COMMENT '',
  `Training_Received` VARCHAR(45) NULL COMMENT '',
  `Training_Received_Date` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Training_Id`)  COMMENT '');
  
#	EMPLOYEE_TRAINING
CREATE TABLE `employee_project`.`employee_training` (
  `Training_Id` INT NOT NULL COMMENT '',
  `Emp_Id` INT NOT NULL COMMENT '',
    PRIMARY KEY (`Emp_Id`)  COMMENT '');

# EMPLOYEE_TRASFER
CREATE TABLE `employee_project`.`employee_trasfer` (
  `Emp_Id` INT(10) NOT NULL COMMENT '',
  `Dept_Worked` VARCHAR(45) NULL COMMENT '',
  `Dept_Transferred` VARCHAR(45) NULL COMMENT '',
  `New_Dept_Address` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Emp_Id`)  COMMENT '');

# PREVIOUS_EMPLOYEE
CREATE TABLE `employee_project`.`previous_employee` (
  `Emp_Id` INT(10) NULL COMMENT '',
    `Date_of_Leaving` VARCHAR(45) NULL COMMENT ''
  );


# inserting Values into the relations
# EMPLOYEE(Emp_Id, Name, Ssn, Date_of_Birth, Dept_Id, Designation)
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('312898', 'Peter', '998228833', '14 Jul 1983', '100', 'Associate 1');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('324098', 'Paul', '998228834', '12 Jan 1980', '200', 'Developer');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('339760', 'Robert', '998228835', '11 Feb 1989', '300', 'Assistant Manager');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('349876', 'John', '998228836', '05 Aug 1984', '400', 'Sales representative');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('359986', 'Robert', '998228837', '10 Dec 1987', '500', 'Associate 1 ');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('360906', 'Mary', '998228838', '16 Oct 1981', '100', 'Finance Manager');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('379996', 'John', '998228839', '17 Nov 1980', '500', 'Support Manager');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('386775', 'Lucy', '998228890', '16 Oct 1981', '400', 'Sales Manager');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('398770', 'Amy', '898228890', '15 Sep 1985', '300', 'HR manager');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('490091', 'James', '898228892', '18 Oct 1981', '100', 'Associate 2');
INSERT INTO `employee_project`.`employee` (`Emp_Id`, `Name`, `Ssn`, `Date_of_Birth`, `Dept_Id`, `Designation`) VALUES ('301237', 'Andrew', '898228891', '18 June 1986', '200', 'Dev Manager');

# EMP_ADDITIONAL_INFO(Emp_Id, Address, Phone_Num, Email_Id, Date_of_Joining, Dept_Id, Salary)
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('312898', '11702 98 AVE, Seattle', '246789651', 'peter1902@gmail.com', '14 Jul 2000', '60000','301237');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('324098', '11701 97 AVE, Seattle', '234287654', 'paul@gmail.com', '12 Jan 2005', '80000','301237');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('339760', '11702 96 AVE, Seattle', '425456123', 'robert123@yahoo.com', '11 Feb 2006', '130000','301237');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('349876', '535 Pointus Ave, Kirkland', '425456564', 'john12@gmail.com', '05 Aug 2007', '50000','301237');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('359986', '535 80th Ave, Bothell', '425456987', 'robert@gmail.com', '10 Dec 2013', '50000','301237');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('360906', '535 90th Ave, Bellevue', '252295676', 'mary@gmail.com', '14 Jul 2000', '150000','301237');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('379996', '567 120th Ave, Redmond', '252295679', 'john@yahoo.com', '12 Jan 2005', '140000','386775');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('386775', '20th Ave, Tacoma', '252295234', 'lucy@gmail.com', '11 Feb 2006', '120000','386775');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('398770', '167 16th Ave Auburn', '425456918', 'amy@yahoo.com', '05 Aug 2007', '130000','386775');
INSERT INTO `employee_project`.`employee_additional_info` (`Emp_Id`, `Address`, `Phone_Num`, `Email_Id`, `Date_of_Joining`, `Salary`,`Manager_Id`) VALUES ('301237', '1900 52th Ave, Renton', '425456918', 'andrew@gmail.com', '10 Dec 2013', '70000','386775');


# EMPLOYEE_EXPERIENCE
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('312898', 'Amazon', '2', '2', '4');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('324098', 'Google', '3', '3', '6');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('339760', 'Facebook', '4', '1', '5');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('301237', 'Group On', '5', '2', '7');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('349876', 'Group On', '6', '3', '9');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('359986', 'Facebook', '2', '5', '7');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('360906', 'Amazon', '3', '3', '6');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('379996', 'Google', '4', '4', '8');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('386775', 'Microsoft', '5', '3', '8');
INSERT INTO `employee_project`.`employee_experience` (`Emp_Id`, `Previous_Company`, `Previous_Experience`, `Present_Experience`, `Total_Experience`) VALUES ('398770', 'Group On', '6', '2', '8');


# EMPLOYEE_ANNUAL_LEAVES
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('312898', '2', '2', '1', '0');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('324098', '3', '3', '2', '1');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('339760', '4', '4', '1', '2');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('301237', '5', '5', '2', '3');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('349876', '6', '2', '3', '1');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('359986', '2', '3', '1', '3');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('360906', '3', '2', '2', '2');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('379996', '4', '2', '1', '3');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('386775', '3', '3', '3', '2');
INSERT INTO `employee_project`.`employee_annual_leaves` (`Emp_Id`, `Sick_Leaves`, `Casual_Leaves`, `Paid_Leaves`, `Unpaid_Leaves`) VALUES ('398770', '4', '4', '3', '0');



# Department
INSERT INTO `employee_project`.`department` (`Dept_Id`, `Dept_Name`,  `Dept_Address`, `Dept_Phone_Num`) VALUES ('100', 'Finance', ' Seattle', '252879988');
INSERT INTO `employee_project`.`department` (`Dept_Id`, `Dept_Name`,  `Dept_Address`, `Dept_Phone_Num`) VALUES ('200', 'Engineering', 'Seattle', '252879989');
INSERT INTO `employee_project`.`department` (`Dept_Id`, `Dept_Name`,  `Dept_Address`, `Dept_Phone_Num`) VALUES ('300', 'HR',' Seattle', '252879987');
INSERT INTO `employee_project`.`department` (`Dept_Id`, `Dept_Name`,  `Dept_Address`, `Dept_Phone_Num`) VALUES ('400', 'Marketing',  'Kirkland', '252879986');
INSERT INTO `employee_project`.`department` (`Dept_Id`, `Dept_Name`,  `Dept_Address`, `Dept_Phone_Num`) VALUES ('500', 'Support',  'Bothell', '242879988');



# EMPLOYEE_EVALUATION
INSERT INTO `employee_project`.`employee_evaluation` (`Emp_Id`, `Manager_Id`, `Proactiveness`, `Communication`, `Leadership`, `Team_Work`, `Rating`) VALUES ('312898', '360906', '2', '3', '4', '3', '3');
INSERT INTO `employee_project`.`employee_evaluation` (`Emp_Id`, `Manager_Id`, `Proactiveness`, `Communication`, `Leadership`, `Team_Work`, `Rating`) VALUES ('324098', '301237', '3', '5', '3', '5', '4');
INSERT INTO `employee_project`.`employee_evaluation` (`Emp_Id`, `Manager_Id`, `Proactiveness`, `Communication`, `Leadership`, `Team_Work`, `Rating`) VALUES ('349876', '386775', '4', '1', '4', '3', '3');
INSERT INTO `employee_project`.`employee_evaluation` (`Emp_Id`, `Manager_Id`, `Proactiveness`, `Communication`, `Leadership`, `Team_Work`, `Rating`) VALUES ('359986', '379996', '4', '5', '5', '5', '5');


# TRAINING
INSERT INTO `employee_project`.`TRAINING` (`Training_Id`, `Training_Conducted`, `Training_Conducted_Date`, `Training_Received`, `Training_Received_Date`) VALUES ('31', 'None', 'None', 'Soft Skills Training', '20 Jan 2009');
INSERT INTO `employee_project`.`TRAINING` (`Training_Id`, `Training_Conducted`, `Training_Conducted_Date`, `Training_Received`, `Training_Received_Date`) VALUES ('32', 'None', 'None', 'Soft Skills Training', '31 Jan 2010');
INSERT INTO `employee_project`.`TRAINING` (`Training_Id`, `Training_Conducted`, `Training_Conducted_Date`, `Training_Received`, `Training_Received_Date`) VALUES ('34', 'None', 'None', 'Technical Training', '20 Jul 2011');
INSERT INTO `employee_project`.`TRAINING` (`Training_Id`, `Training_Conducted`, `Training_Conducted_Date`, `Training_Received`, `Training_Received_Date`) VALUES ('35', 'None', 'None', 'Technical Training', '25 Jan 2013');
INSERT INTO `employee_project`.`TRAINING` (`Training_Id`, `Training_Conducted`, `Training_Conducted_Date`, `Training_Received`, `Training_Received_Date`) VALUES ('36', 'Soft Skills Training', '20 Jan 2009', 'Soft Skills Training', '20 Jul 2001');
INSERT INTO `employee_project`.`TRAINING` (`Training_Id`, `Training_Conducted`, `Training_Conducted_Date`, `Training_Received`, `Training_Received_Date`) VALUES ('30', 'Soft Skills Training', '31 Jan 2010', 'Technical Training', '02 Sep 2004');
INSERT INTO `employee_project`.`TRAINING` (`Training_Id`, `Training_Conducted`, `Training_Conducted_Date`, `Training_Received`, `Training_Received_Date`) VALUES ('38', 'Technical Training', '20 Jul 2011', 'Soft Skills Training', '03 Oct 2003');
INSERT INTO `employee_project`.`TRAINING` (`Training_Id`, `Training_Conducted`, `Training_Conducted_Date`, `Training_Received`, `Training_Received_Date`) VALUES ('37', 'Technical Training', '25 Jan 2013', 'Soft Skills Training', '01 Dec 2008');

#EMPLOYEE_TRAINING
INSERT INTO `employee_project`.`EMPLOYEE_TRAINING` (`Training_Id`, `Emp_Id` ) VALUES ('31', '312898');
INSERT INTO `employee_project`.`EMPLOYEE_TRAINING` (`Training_Id`, `Emp_Id`) VALUES ('32', '324098');
INSERT INTO `employee_project`.`EMPLOYEE_TRAINING` (`Training_Id`, `Emp_Id`) VALUES ('34', '349876');
INSERT INTO `employee_project`.`EMPLOYEE_TRAINING` (`Training_Id`, `Emp_Id`) VALUES ('35', '359986');
INSERT INTO `employee_project`.`EMPLOYEE_TRAINING` (`Training_Id`, `Emp_Id`) VALUES ('36', '360906');
INSERT INTO `employee_project`.`EMPLOYEE_TRAINING` (`Training_Id`, `Emp_Id`) VALUES ('30', '301237');
INSERT INTO `employee_project`.`EMPLOYEE_TRAINING` (`Training_Id`, `Emp_Id`) VALUES ('38', '386775');
INSERT INTO `employee_project`.`EMPLOYEE_TRAINING` (`Training_Id`, `Emp_Id`) VALUES ('37', '379996');


# EMPLOYEE_TRASFER
INSERT INTO `employee_project`.`EMPLOYEE_TRAsfer` (`Emp_Id`, `Dept_Worked`, `Dept_Transferred`, `New_Dept_Address`) VALUES ('112898', '100', '200', 'Tacoma');
INSERT INTO `employee_project`.`EMPLOYEE_TRAsfer` (`Emp_Id`, `Dept_Worked`, `Dept_Transferred`, `New_Dept_Address`) VALUES ('124098', '200', '200', 'Tacoma');
INSERT INTO `employee_project`.`EMPLOYEE_TRAsfer` (`Emp_Id`, `Dept_Worked`, `Dept_Transferred`, `New_Dept_Address`) VALUES ('139760', '300', '300', 'Tacoma');
INSERT INTO `employee_project`.`EMPLOYEE_TRAsfer` (`Emp_Id`, `Dept_Worked`, `Dept_Transferred`, `New_Dept_Address`) VALUES ('149876', '400', '400', 'Renton');
INSERT INTO `employee_project`.`EMPLOYEE_TRAsfer` (`Emp_Id`, `Dept_Worked`, `Dept_Transferred`, `New_Dept_Address`) VALUES ('159986', '500', '500', 'Renton');

#PREVIOUS_EMPLOYEE
INSERT INTO `employee_project`.`PREVIOUS_EMPLOYEE` (`Emp_Id`, `Date_of_Leaving`) VALUES ('112898', '20 Jan 2015');
INSERT INTO `employee_project`.`PREVIOUS_EMPLOYEE` (`Emp_Id`, `Date_of_Leaving`) VALUES ('160906', '13 Sep 2015');
INSERT INTO `employee_project`.`PREVIOUS_EMPLOYEE` (`Emp_Id`, `Date_of_Leaving`) VALUES ('179996', '31 Jan 2014');
INSERT INTO `employee_project`.`PREVIOUS_EMPLOYEE` (`Emp_Id`, `Date_of_Leaving`) VALUES ('186775', '14 Aug 2015');

#Delete Employee Trigger
USE `employee_project`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `Employee_DEL` AFTER DELETE ON `Employee` 
FOR EACH ROW
BEGIN
INSERT INTO previous_employee VALUES (old.emp_id, date_format(sysdate(), '%d %b %Y'));
END
