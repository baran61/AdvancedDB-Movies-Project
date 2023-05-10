


-- Service Provider Table
INSERT INTO [dbo].[Service Provider] VALUES('SP101' ,'Jhon','+353123454657' ,'jhon@expamle.com' ,'Ireland','m12345','Confirmed' ,'2024-01-01')
INSERT INTO [dbo].[Service Provider] VALUES('SP102' ,'Jenny','+353123456789' ,'jenny@example.com' ,'Cork','Q1234546','Confirmed' ,'2024-01-05')
INSERT INTO [dbo].[Service Provider] VALUES('SP103','Rob' ,'+353123456789'   ,'rob@example.com' ,'Galway' ,'Q12334556'  ,'Confirmed' ,'2024-01-05')		   
INSERT INTO [dbo].[Service Provider] VALUES ('SP104' ,'Laura','+353123456789','Laura@example.com' ,'Iceland','Q12345563' ,'Confirmed','2024-01-05')   
INSERT INTO [dbo].[Service Provider] VALUES ('SP105' ,'Tim' ,'+353123456789', 'rob@example.com' ,'German y','Q12348556' ,'Confirmed','2024-01-05')
GO


-- Customer Table
INSERT INTO [dbo].[Customer] VALUES ('C101','Baran',24,'+3531111111111','baran@example.com','confirmed','2022-11-11')
INSERT INTO [dbo].[Customer] VALUES ('C102','Annan',23,'+3531111111111','Annan@example.com','confirmed','2023-07-11')
INSERT INTO [dbo].[Customer] VALUES ('C103','Ananya',28,'+3531111111111','Ananya@example.com','confirmed','2023-04-15')
INSERT INTO [dbo].[Customer] VALUES ('C104','Victor',17,'+3531111111111','Victor@example.com','payment pending',null)
INSERT INTO [dbo].[Customer] VALUES ('C105','Sumit',29,'+3531111111111','Sumit@example.com','expired','2022-11-11')
GO



-- Service Table
INSERT INTO [dbo].[Service]VALUES('S101' ,'accomodate at ease','SP101' ,'accomodation','approved',300,3,'2023-05-07')
INSERT INTO [dbo].[Service]VALUES('S102' ,'activity at ease','SP103' ,'activity','approved',100,5,'2023-05-01')
INSERT INTO [dbo].[Service]VALUES('S103' ,'travel at ease','SP104' ,'transit','approved',500,3,'2023-05-04')
INSERT INTO [dbo].[Service]VALUES('S104' ,'travel the world','SP105' ,'transit','approved',200,5,'2023-05-02')
INSERT INTO [dbo].[Service]VALUES('S105' ,'accomodations for everyone','SP104' ,'accomodation','approved',600,3,'2023-04-07')
INSERT INTO [dbo].[Service]VALUES('S106' ,'accomodations in hostel','SP104' ,'accomodation','approved',600,3,'2023-04-07')
INSERT INTO [dbo].[Service]VALUES('S107' ,'accomodate with us','SP102' ,'accomodation','New',300,3,'2023-05-07')
INSERT INTO [dbo].[Service]VALUES('S108' ,'activity with us','SP103' ,'activity','New',100,5,'2023-05-01')
INSERT INTO [dbo].[Service]VALUES('S109' ,'travel with us','SP104' ,'transit','New',500,3,'2023-05-04')
INSERT INTO [dbo].[Service]VALUES('S110' ,'travel the world with us','SP105' ,'transit','New',200,5,'2023-05-02')
INSERT INTO [dbo].[Service]VALUES('S111' ,'accomodations for u','SP104' ,'accomodation','New',600,3,'2023-04-07')
GO

-- [Admin] Table

INSERT INTO [dbo].[Admin] VALUES ('A101','Divya')
INSERT INTO [dbo].[Admin] VALUES ('A102','Paul')
INSERT INTO [dbo].[Admin] VALUES ('A103','Paula')
INSERT INTO [dbo].[Admin] VALUES ('A104','Robert')
INSERT INTO [dbo].[Admin] VALUES ('A105','Mevis')
GO


-- Service Review Log Table
INSERT INTO [dbo].[Service Review Log]  VALUES  ('R101','S101' ,'A101' ,'2022-02-03')
INSERT INTO [dbo].[Service Review Log]  VALUES  ('R102','S101' ,'A101' ,'2022-02-05')
INSERT INTO [dbo].[Service Review Log]  VALUES  ('R103','S102' ,'A102' ,'2022-02-04')
INSERT INTO [dbo].[Service Review Log]  VALUES  ('R104','S103' ,'A103' ,'2022-02-07')
INSERT INTO [dbo].[Service Review Log]  VALUES  ('R105','S104' ,'A103' ,'2022-02-08')
INSERT INTO [dbo].[Service Review Log]  VALUES  ('R106','S105' ,'A104' ,'2022-02-09')
GO




-- Package Table
INSERT INTO [dbo].[Package] VALUES
           ('P101'
           ,'Default Package'
           ,'UK'
           ,null
           ,null
           ,null
           ,
'<?xml version="1.0" encoding="UTF-8"?>
<activities>
<activity>
<activityId>101</activityId>
<activityName>Surfing</activityName>
<activityTarrif>Euro 50</activityTarrif>
</activity>
<activity>
<activityId>102</activityId>
<activityName>Garden Visit</activityName>
<activityTarrif>Euro 5</activityTarrif>
</activity>
</activities>'
           ,500
           ,'System'
           ,5)
GO


INSERT INTO [dbo].[Package] VALUES
           ('P102'
           ,'Default Package 2'
           ,'Ireland'
           ,'<?xml version="1.0" encoding="UTF-8"?>
<accomodations>
<accomodation>
<accomodationName>hotel 1</accomodationName>
<accomodationAddress>address 1</accomodationAddress>
<accomodationType>Hostel</accomodationType>
<phoneNumber>1111111111</phoneNumber>
</accomodation>
</accomodations>'
           ,null
           ,null
           ,null
           ,500
           ,'System'
           ,5)

INSERT INTO [dbo].[Package] VALUES
           ('P103'
           ,'Default Package 3'
           ,'India'
		   ,null
           ,'<?xml version="1.0" encoding="UTF-8"?>
<transits>
<transit>
<transitType>1</transitType>
<transitMode>CAB</transitMode>
<transitSource>source</transitSource>
<transitDestination>destination</transitDestination>
</transit>
</transits>'
           ,null
           ,null
           ,500
           ,'System'
           ,5)



INSERT INTO [dbo].[Package] VALUES
           ('P104'
           ,'Default Package 4'
           ,'Australia'
		   ,null
           ,null
           ,'<?xml version="1.0" encoding="UTF-8"?>
<internalTransits>
<internalTransit>
<internalTransitservice>1</internalTransitservice>
<internalTransitType>CAB</internalTransitType>
<internalTransitDriversPlate>XXXXXX</internalTransitDriversPlate>
<contactNumber>1111111111</contactNumber>
</internalTransit>
</internalTransits>'
           ,null
           ,500
           ,'System'
           ,5)


 INSERT INTO [dbo].[Package] VALUES
           ('P105'
           ,'Default Package 5'
           ,'USA'
		   ,'<?xml version="1.0" encoding="UTF-8"?>
<accomodations>
<accomodation>
<accomodationName>hotel 1</accomodationName>
<accomodationAddress>address 1</accomodationAddress>
<accomodationType>Hostel</accomodationType>
<phoneNumber>1111111111</phoneNumber>
</accomodation>
</accomodations>'
           ,'<?xml version="1.0" encoding="UTF-8"?>
<transits>
<transit>
<transitType>1</transitType>
<transitMode>CAB</transitMode>
<transitSource>source</transitSource>
<transitDestination>destination</transitDestination>
</transit>
</transits>'
           ,'<?xml version="1.0" encoding="UTF-8"?>
<internalTransits>
<internalTransit>
<internalTransitservice>1</internalTransitservice>
<internalTransitType>CAB</internalTransitType>
<internalTransitDriversPlate>XXXXXX</internalTransitDriversPlate>
<contactNumber>1111111111</contactNumber>
</internalTransit>
</internalTransits>'
           ,'<?xml version="1.0" encoding="UTF-8"?>
<activities>
<activity>
<activityId>101</activityId>
<activityName>Surfing</activityName>
<activityTarrif>Euro 50</activityTarrif>
</activity>
<activity>
<activityId>102</activityId>
<activityName>Garden Visit</activityName>
<activityTarrif>Euro 5</activityTarrif>
</activity>
</activities>'
           ,500
           ,'System'
           ,5)
GO

-- Booking Table

INSERT INTO [dbo].[Booking] VALUES ('B101' ,'2023-04-05' ,'2023-04-15','C101','P105','Confirmed','Confirmed')
INSERT INTO [dbo].[Booking] VALUES ('B102' ,'2023-05-05' ,'2023-05-15','C101','P105','Confirmed','Confirmed')
INSERT INTO [dbo].[Booking] VALUES ('B103' ,'2023-07-07' ,'2023-07-15','C102','P101','Confirmed','Confirmed')
INSERT INTO [dbo].[Booking] VALUES ('B104' ,'2023-05-03' ,'2023-05-15','C103','P102','Confirmed','Confirmed')
INSERT INTO [dbo].[Booking] VALUES ('B105' ,'2023-09-08' ,'2023-09-15','C104','P104','Confirmed','Confirmed')
GO
