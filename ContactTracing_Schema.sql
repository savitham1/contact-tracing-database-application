CREATE TABLE PERSON (
    userId    INT AUTO_INCREMENT,
    userType    VARCHAR(20),
    symptomsOnsetDate    DATE,
    firstTest    VARCHAR(10) ,
    employedInHealthCare    VARCHAR(10),
    symptoticAsSpecifiedByCDC    VARCHAR(10) ,
    hospitalized    VARCHAR(10) ,
    ICU    VARCHAR(10) ,
    residentInCongregateCareSetting    VARCHAR(10) ,
    pregnant    VARCHAR(10) ,
    dateContactedByTracingTeam    DATE,
    CONSTRAINT PRIMARY KEY( userId ),
    CONSTRAINT CHECK (userType IN ("Infected","Not-Infected","Recovered","Exposed")),
    CONSTRAINT CHECK (firstTest IN ("Yes","No","Unknown")),
    CONSTRAINT CHECK (employedInHealthCare IN ("Yes","No","Unknown")),
    CONSTRAINT CHECK (symptoticAsSpecifiedByCDC IN ("Yes","No","Unknown")),
    CONSTRAINT CHECK (hospitalized IN ("Yes","No","Unknown")),
    CONSTRAINT CHECK (residentInCongregateCareSetting IN ("Yes","No","Unknown")),
    CONSTRAINT CHECK (pregnant IN ("Yes","No","Unknown")),
    CONSTRAINT CHECK (ICU IN ("Yes","No","Unknown"))
);
CREATE TABLE AREA (
    areaId    INT AUTO_INCREMENT,
    zipCode VARCHAR(100),
    city    VARCHAR(100), 
    state    VARCHAR(100), 
    country    VARCHAR(100),
    contaminationLevel INT ,  
    PRIMARY KEY( areaId ),
    CONSTRAINT CHECK (contaminationLevel between 1 and 5)
);
CREATE TABLE TestFacility ( 
							testFacilityID Integer primary key,
                            facilityName Text,
                            licenseNumber varchar(100),
                            phoneNumber VARCHAR(100),
                            address Text,
                            zip VARCHAR(100));
CREATE TABLE ContactTracingTeam (
								empID Integer primary key,
                                employeeName varchar(100),
                                phoneNumber VARCHAR(100),
                                email varchar(100));
CREATE TABLE CaseLog (
						caseID Integer primary key,
                        currentStatus Text not null,
                        empID Integer,
                        foreign key FCL_CT (empID) references ContactTracingTeam(empID),
                        constraint chk_currentStatus check (currentStatus in ("Open", "Closed", "WorkInProgress", "Assigned")));
CREATE TABLE TestReport (
							testReportID Integer PRIMARY KEY,
                            userID Integer,
                            testFacilityID Integer,
                            testDate Date,
                            resultDate Date,
                            result Text NOT NULL,
                            caseID Integer,
                            device Text,
                            foreign key FTR_P (userID) references Person(userID),
                            foreign key FTR_TF (testFacilityID) references TestFacility(testFacilityID),
                            foreign key FTR_CL (caseID) references CaseLog(caseID),
                            constraint chk_result check (result in ("Positive", "Negative")));
CREATE TABLE CONTACT (
    contactID    INT AUTO_INCREMENT,
    user1Id    INT NOT NULL, 
    user2Id    INT NOT NULL,
    riskFactor    INT , 
    DateOfContact    DATE,
    PRIMARY KEY( contactID ),
    CONSTRAINT FC_P1 FOREIGN KEY(user1Id) REFERENCES PERSON(userId),
    CONSTRAINT FC_P2 FOREIGN KEY(user2Id) REFERENCES PERSON(userId),
    constraint CHECK (riskFactor>=0 and riskFactor<=5)
);

CREATE TABLE Investigation (
							investigationID Integer primary key,
                            contactID Integer,
                            caseID Integer,
                            foreign key FI_C (contactID) references Contact(contactID),
                            foreign key FI_CL (caseID) references CaseLog(caseID));


CREATE TABLE USERPROFILE (
    userId    INT AUTO_INCREMENT,
    firstName    VARCHAR(100), 
    lastName    VARCHAR(100),
    phoneNumber    VARCHAR(100), 
    DOB    DATE,
    sex VARCHAR(20) ,
    email VARCHAR(100),
    areaId INT,
    CONSTRAINT PK1 PRIMARY KEY( userId ),
    CONSTRAINT FUP_P FOREIGN KEY(userId) REFERENCES PERSON(userId),
    CONSTRAINT FUP_A FOREIGN KEY(areaId) REFERENCES AREA(areaId),
    CONSTRAINT CHECK (sex IN ("Female","Male","Transgender","Other"))
);


CREATE TABLE CASELOGAREA (
    caseLogAreaId    INT AUTO_INCREMENT,
    caseId    INT NOT NULL, 
    areaId    INT NOT NULL,
    PRIMARY KEY( caseLogAreaId ),
    CONSTRAINT FCLA_CL FOREIGN KEY(caseId) REFERENCES CASELOG(caseId),
    CONSTRAINT FCLA_A FOREIGN KEY(areaId) REFERENCES AREA(areaId)
);
                                

                        
                            
					
                            
                            
                            