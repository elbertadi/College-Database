--Elbert Adiwijanto / Sofyan Adrianto

--Create Database

CREATE DATABASE PROJEK_LAB
USE PROJEK_LAB

----------------------------


--Create a database system using DDL syntax that is relevant with transactions

CREATE TABLE Customer1(
	Customer_ID CHAR(5) PRIMARY KEY CHECK
	(Customer_ID LIKE 'CU[0-9][0-9][0-9]'),
	Customer_Name VARCHAR(255) NOT NULL
	CHECK(LEN(Customer_Name) > 2),
	Customer_Email VARCHAR(255) NOT NULL,
	Customer_Address VARCHAR(255) NOT NULL,
	Customer_DOB DATE NOT NULL,
	Customer_Gender VARCHAR(15) NOT NULL 
	CHECK (Customer_Gender = 'Male' OR Customer_Gender = 'Female'),
	Customer_PhoneNumber VARCHAR(15) NOT NULL
	CHECK(LEN(Customer_PhoneNumber) = 12),
	Customer_Password VARCHAR(15) NOT NULL,
	Customer_Balance INT NOT NULL
)

CREATE TABLE Cloud_Provider(
	CP_ID CHAR(5) PRIMARY KEY CHECK
	(CP_ID LIKE 'CP[0-9][0-9][0-9]'),
	CP_Name VARCHAR(255) NOT NULL,
	CP_Email VARCHAR(255) NOT NULL,
	CP_Region VARCHAR(255) NOT NULL,
	CP_Website_URL VARCHAR(255) NOT NULL
)

CREATE TABLE DBMS_Software(
	Software_ID CHAR(5) PRIMARY KEY CHECK
	(Software_ID LIKE 'DS[0-9][0-9][0-9]'),
	Software_Name VARCHAR(255) NOT NULL,
	Software_URL VARCHAR(255) NOT NULL
)

CREATE TABLE Processor(
	Pro_ID CHAR(5) PRIMARY KEY CHECK
	(Pro_ID LIKE 'PR[0-9][0-9][0-9]'),
	Pro_Name VARCHAR(255) NOT NULL,
	Pro_Cores INT NOT NULL,
	Pro_Base FLOAT NOT NULL,
	Pro_Boost FLOAT NOT NULL
) 

CREATE TABLE OS(
	OS_ID CHAR(5) PRIMARY KEY CHECK
	(OS_ID LIKE 'OS[0-9][0-9][0-9]'),
	OS_Name VARCHAR(255) NOT NULL,
	OS_Family VARCHAR(255) NOT NULL,
	OS_Price INT NOT NULL
	CHECK(OS_Price >= 500000 AND OS_Price <= 1500000)
) 

CREATE TABLE [Server](
	Server_ID CHAR(5) PRIMARY KEY CHECK
	(Server_ID LIKE 'SV[0-9][0-9][0-9]'),
	Pro_ID CHAR(5) NOT NULL
	REFERENCES Processor(Pro_ID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	OS_ID CHAR(5) NOT NULL
	REFERENCES OS(OS_ID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	Server_Name VARCHAR(255) NOT NULL,
	Server_Memory INT NOT NULL
	CHECK(Server_Memory % 2 = 0),
	Server_Price INT NOT NULL
	CHECK(Server_Price >= 10000 AND Server_Price <= 300000),
	Server_Storage INT NOT NULL
)

CREATE TABLE [Database](
	[DB_ID] CHAR(5) PRIMARY KEY CHECK
	([DB_ID] LIKE 'DB[0-9][0-9][0-9]'),
	Software_ID CHAR(5) NOT NULL
	REFERENCES DBMS_Software(Software_ID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	DB_Storage INT NOT NULL
	CHECK(DB_Storage > 0),
	DB_Price INT NOT NULL
)

CREATE TABLE Transaction_Header(
	T_ID CHAR(5) PRIMARY KEY CHECK
	(T_ID LIKE 'TR[0-9][0-9][0-9]'),
	Customer_ID CHAR(5) NOT NULL
	REFERENCES Customer1(Customer_ID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	CP_ID CHAR(5) NOT NULL
	REFERENCES Cloud_Provider(CP_ID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	T_History DATE NOT NULL
)

CREATE TABLE Transaction_Detail(
	T_ID CHAR(5) NOT NULL
	REFERENCES Transaction_Header([T_ID])
	ON UPDATE CASCADE ON DELETE CASCADE,
	[DB_ID] CHAR(5) NOT NULL
	REFERENCES [Database]([DB_ID])
	ON UPDATE CASCADE ON DELETE CASCADE,
	Server_ID CHAR(5) NOT NULL
	REFERENCES [Server](Server_ID)
	ON UPDATE CASCADE ON DELETE CASCADE
)

---------------------------------------------------

--Create query using DML syntax to fill the tables in the database system

--Insert Customer
INSERT INTO Customer1
VALUES('CU001','Tantri Rahayu','Tantri_Rahayu@yahoo.com','kebon sirih blok D1 no 2','1995-07-15','Female','081890563748','sdfiguhdf','0')

INSERT INTO Customer1
VALUES('CU002','Mariadi Iswahyudi','Mariadi_Iswahyudi@yahoo.com','kebon pisang blok C2 no 1','1995-09-27','Male','081637485611','qiousdfd','0')

INSERT INTO Customer1
VALUES('CU003','Maimunam Pratiwi','Maimunam_Pratiwi@yahoo.com','kebon sirih blok A3 no 2','1996-06-12','Female','081890563748','sdfiguhdf','0')

INSERT INTO Customer1
VALUES('CU004','Maryanto Halim','Maryanto_Halim@yahoo.com','kebon sirih blok Q1 no 22','1997-01-20','Male','087889927649','ppisdufhi','0')

INSERT INTO Customer1
VALUES('CU005','Caket Budiyanto','Caket_Budiyanto@yahoo.com','kebon mangga blok D2 no 2','1997-04-10','Male','081784936278','gjfijfijg','0')

INSERT INTO Customer1
VALUES('CU006','Emil Nababan','Emil_Nababan@yahoo.com','kebon mangga blok G10 no 5','1997-12-10','Male','087887589391','oobovbijv','0')

INSERT INTO Customer1
VALUES('CU007','Taswir Permadi','Taswir_Permadi@yahoo.com','kebon jeruk blok C7 no 20','1997-12-25','Male','081874644102','sdfifsdfsw','0')

INSERT INTO Customer1
VALUES('CU008','Kanda Situmorang','Kanda_Situmorang@yahoo.com','kebon sirih blok D3 no 10','1998-02-01','Male','083878865231','ibiuhgdui','0')

INSERT INTO Customer1
VALUES('CU009','Rosman Wijaya','Rosman_Wijaya@yahoo.com','kebon mangga blok G1 no 1','1998-03-26','Male','081874677890','aidufvhd','0')

INSERT INTO Customer1
VALUES('CU010','Genta Uyainah','Genta_Uyainah@yahoo.com','kebon pepaya blok M8 no 4','1998-05-29','Female','081987789231','eirughisdu','0')

INSERT INTO Customer1
VALUES('CU011','Dina Hastuti','Dina_Hastuti@yahoo.com','kebon apel blok M2 no 1','1998-09-12','Female','087889726520','cnnchhdu','0')

INSERT INTO Customer1
VALUES('CU012','Putri Laksita','Putri_Laksita@yahoo.com','kebon jeruk blok R2 no 12','1998-12-02','Female','088772653123','xcviuhdf','0')

INSERT INTO Customer1
VALUES('CU013','Ikin Pradipta','Ikin_Pradipta@yahoo.com','kebon anggrek blok P2 no 6','1999-01-18','Male','081766523910','pvbiihdd','0')

INSERT INTO Customer1
VALUES('CU014','Ian Marbun','Ian_Marbun@yahoo.com','kebon pisang blok A4 no 82','2000-08-28','Male','081876667892','sfhiuyhsd','0')

INSERT INTO Customer1
VALUES('CU015','Dono Januar','Dono_Januar@yahoo.com','kebon apel blok C4 no 2','2000-09-02','Male','087822736781','ivjbhvijgbd','0')


--Insert Cloud Provider
INSERT INTO Cloud_Provider
VALUES('CP001','Amazon Web Service','Amazon_Web_Service@yahoo.com','America','https://aws.amazon.com/')

INSERT INTO Cloud_Provider
VALUES('CP002','Server Space','Server_Space@yahoo.com','Eastern Europe','https://serverspace.io/')

INSERT INTO Cloud_Provider
VALUES('CP003','Microsoft Azure','Microsoft_Azur@yahoo.com','South East Asia','https://azure.microsoft.com/en-us/')

INSERT INTO Cloud_Provider
VALUES('CP004','Google Cloud Platform','Google_Cloud_Platform@yahoo.com','South East Asia','https://azure.microsoft.com/en-us/?cdn=disable')

INSERT INTO Cloud_Provider
VALUES('CP005','IBM Cloud Services','IBM_Cloud_Services@yahoo.com','Africa','https://www.ibm.com/cloud?cm_sp=Scheduler-_-CopyChng2-_-C')

INSERT INTO Cloud_Provider
VALUES('CP006','Adobe Creative Cloud','Adobe_Creative_Cloud@yahoo.com','South East Asia','https://www.adobe.com/creativecloud.html')

INSERT INTO Cloud_Provider
VALUES('CP007','Kamatera Cloud','Kamatera@yahoo.com','Middle East','https://www.kamatera.com/')

INSERT INTO Cloud_Provider
VALUES('CP008','VMware Cloud','VMware@yahoo.com','South East Asia','https://www.vmware.com/asean.html')

INSERT INTO Cloud_Provider
VALUES('CP009','Rackspace Cloud','Rackspace@yahoo.com','America','https://www.rackspace.com/cloud')

INSERT INTO Cloud_Provider
VALUES('CP010','Red Hat','Red_Hat@yahoo.com','Africa','https://www.redhat.com/en/technologies/cloud-computing/')

INSERT INTO Cloud_Provider
VALUES('CP011','Salesforce Cloud','Salesforce@yahoo.com','America','https://www.softwareadvice.com/crm/salesforce-profile/')

INSERT INTO Cloud_Provider
VALUES('CP012','Oracle Cloud','Oracle_Cloud@yahoo.com','Eastern Europe','https://www.oracle.com/cloud/')

INSERT INTO Cloud_Provider
VALUES('CP013','SAP Cloud','SAP@yahoo.com','South East Asia','https://www.sap.com/sea/products/cloud-platform.html')

INSERT INTO Cloud_Provider
VALUES('CP014','Verizon Cloud','Verizon_Cloud@yahoo.com','Middle East','https://www.verizon.com/support/how-to-use-verizon-cloud/')

INSERT INTO Cloud_Provider
VALUES('CP015','Navisite Cloud','Navisite@yahoo.com','Western europe','https://www.navisite.com/blog/')


--Insert DBMS_Software
INSERT INTO DBMS_Software
VALUES('DS001','SolarWinds Database Performance Analyzer','https://www.solarwinds.com/database-performance-analyzer')

INSERT INTO DBMS_Software
VALUES('DS002','DbVisualizer','https://www.dbvis.com/')

INSERT INTO DBMS_Software
VALUES('DS003','ManageEngine Applications Manager','https://www.manageengine.com/products/applications_manager/')

INSERT INTO DBMS_Software
VALUES('DS004','Oracle RDBMS','https://www.oracle.com/database/')

INSERT INTO DBMS_Software
VALUES('DS005','IBM DB2','https://www.ibm.com/analytics/db2')

INSERT INTO DBMS_Software
VALUES('DS006','Microsoft SQL Server','https://www.microsoft.com/en-us/sql-server/sql-server-downloads')

INSERT INTO DBMS_Software
VALUES('DS007','SAP Sybase ASE','https://www.sap.com/sea/products/sybase-ase.html')

INSERT INTO DBMS_Software
VALUES('DS008','Teradata','https://www.teradata.com/')

INSERT INTO DBMS_Software
VALUES('DS009','ADABAS','https://www.softwareag.com/en_corporate/platform/adabas-natural.html')

INSERT INTO DBMS_Software
VALUES('DS010','Informix','https://www.ibm.com/products/informix')

INSERT INTO DBMS_Software
VALUES('DS011','SQLite','https://www.sqlite.org/')

INSERT INTO DBMS_Software
VALUES('DS012','PostgresSQL','https://www.postgresql.org/')

INSERT INTO DBMS_Software
VALUES('DS013','MongoDB','https://www.mongodb.com/')

INSERT INTO DBMS_Software
VALUES('DS014','CouchDB','https://couchdb.apache.org/')

INSERT INTO DBMS_Software
VALUES('DS015','OrientDB','https://orientdb.org/')


--Insert Transaction_Header
INSERT INTO Transaction_Header
VALUES('TR001','CU001','CP001','2020-01-10')

INSERT INTO Transaction_Header
VALUES('TR002','CU002','CP002','2020-01-21')

INSERT INTO Transaction_Header
VALUES('TR003','CU003','CP003','2020-02-08')

INSERT INTO Transaction_Header
VALUES('TR004','CU004','CP004','2020-02-18')

INSERT INTO Transaction_Header
VALUES('TR005','CU005','CP005','2020-03-03')

INSERT INTO Transaction_Header
VALUES('TR006','CU006','CP006','2020-04-24')

INSERT INTO Transaction_Header
VALUES('TR007','CU007','CP007','2020-06-23')

INSERT INTO Transaction_Header
VALUES('TR008','CU008','CP008','2020-07-11')

INSERT INTO Transaction_Header
VALUES('TR009','CU009','CP009','2020-07-25')

INSERT INTO Transaction_Header
VALUES('TR010','CU010','CP010','2020-08-30')

INSERT INTO Transaction_Header
VALUES('TR011','CU011','CP011','2020-12-25')

INSERT INTO Transaction_Header
VALUES('TR012','CU012','CP012','2021-01-14')

INSERT INTO Transaction_Header
VALUES('TR013','CU013','CP013','2021-02-23')

INSERT INTO Transaction_Header
VALUES('TR014','CU014','CP014','2021-03-02')

INSERT INTO Transaction_Header
VALUES('TR015','CU015','CP015','2021-04-19')


--Insert Database
INSERT INTO [Database]
VALUES('DB001', 'DS001', '20', '20000')

INSERT INTO [Database]
VALUES('DB002', 'DS002', '50', '50000')

INSERT INTO [Database]
VALUES('DB003', 'DS003', '30', '30000')

INSERT INTO [Database]
VALUES('DB004', 'DS004', '70', '70000')

INSERT INTO [Database]
VALUES('DB005', 'DS005', '50', '55000')

INSERT INTO [Database]
VALUES('DB006', 'DS006', '40', '40000')

INSERT INTO [Database]
VALUES('DB007', 'DS007', '80', '80000')

INSERT INTO [Database]
VALUES('DB008', 'DS008', '50', '55500')

INSERT INTO [Database]
VALUES('DB009', 'DS009', '10', '10000')

INSERT INTO [Database]
VALUES('DB010', 'DS010', '90', '90000')

INSERT INTO [Database]
VALUES('DB011', 'DS011', '70', '77000')

INSERT INTO [Database]
VALUES('DB012', 'DS012', '50', '55550')

INSERT INTO [Database]
VALUES('DB013', 'DS013', '100', '100000')

INSERT INTO [Database]
VALUES('DB014', 'DS014', '40', '44000')

INSERT INTO [Database]
VALUES('DB015', 'DS015', '80', '88000')


--Insert Processor
INSERT INTO Processor
VALUES('PR001','AMD Ryzen 9 5950X','16','3.4','4.9')

INSERT INTO Processor
VALUES('PR002','Intel Core i9-10900K Processor','10','3.7','5.3')

INSERT INTO Processor
VALUES('PR003','Intel Core i9-10900KF Processor','10','3.7','5.3')

INSERT INTO Processor
VALUES('PR004','AMD Ryzen 9 3950X','16','3.5','4.7')

INSERT INTO Processor
VALUES('PR005','Intel Core i9-9960X Processor','16','3.1','4.4')

INSERT INTO Processor
VALUES('PR006','AMD Ryzen Threadripper 3960X','24','3.8','4.5')

INSERT INTO Processor
VALUES('PR007','Intel Core i9-10980XE Extreme Edition Processor','18','3.0','4.6')
--
INSERT INTO Processor
VALUES('PR008','AMD Ryzen 9 3900XT','12','3.8','4.7')

INSERT INTO Processor
VALUES('PR009','Intel Core i9-10900F Processor','10','2.8','5.2')

INSERT INTO Processor
VALUES('PR010','Intel Core i9-7980XE Processor','18','2.6','4.4')

INSERT INTO Processor
VALUES('PR011','Intel Core i9-9900KS Processor','8','4.0','5.0')

INSERT INTO Processor
VALUES('PR012','Intel Core i9-10920X X-series Processor','12','3.5','4.6')

INSERT INTO Processor
VALUES('PR013','AMD Ryzen 7 5800X','8','3.8','4.7')

INSERT INTO Processor
VALUES('PR014','Intel Core i9-9940X Processor','14','3.3','4.4')

INSERT INTO Processor
VALUES('PR015','Intel Core i9-7960X Processor','16','2.8','4.2')


--Insert OS
INSERT INTO OS
VALUES('OS001','Windows 10','Microsoft Corporation','585000')

INSERT INTO OS
VALUES('OS002','macOS','iOS','850000')

INSERT INTO OS
VALUES('OS003','Windows 7','Microsoft Corporation','785000')

INSERT INTO OS
VALUES('OS004','Ubuntu','Linux','700000')

INSERT INTO OS
VALUES('OS005','CentOS','Linux','700000')

INSERT INTO OS
VALUES('OS006','Apple OS X El Capitan','Unix','579000')

INSERT INTO OS
VALUES('OS007','Red Hat Enterprise Linux','Linux','1300000')

INSERT INTO OS
VALUES('OS008','macOS Sierra','iOS','750000')

INSERT INTO OS
VALUES('OS009','Debian','Linux','680000')

INSERT INTO OS
VALUES('OS010','Windows 8','Microsoft Corporation','550000')

INSERT INTO OS
VALUES('OS011','Xbox OS','Microsoft Corporation','1500000')

INSERT INTO OS
VALUES('OS012','Windows Vista','Microsoft Corporation','535000')

INSERT INTO OS
VALUES('OS013','Windows XP','Microsoft Corporation','570000')

INSERT INTO OS
VALUES('OS014','Windows 9x','Microsoft Corporation','512000')

INSERT INTO OS
VALUES('OS015','Windows 3.x','Microsoft Corporation','650000')


--Insert Server
INSERT INTO [Server]
VALUES('SV001','PR001','OS001','Aedronata','4','30000','32')

INSERT INTO [Server]
VALUES('SV002','PR002','OS002','Eriorus','16','200000','256')

INSERT INTO [Server]
VALUES('SV003','PR003','OS003','Teaddarat','8','100000','512')

INSERT INTO [Server]
VALUES('SV004','PR004','OS004','Laxecyre','32','300000','256')

INSERT INTO [Server]
VALUES('SV005','PR005','OS005','Chavothae','32','280000','128')

INSERT INTO [Server]
VALUES('SV006','PR006','OS006','Phiqiozan','4','35000','64')

INSERT INTO [Server]
VALUES('SV007','PR007','OS007','Ziggunys','8','57500','32')

INSERT INTO [Server]
VALUES('SV008','PR008','OS008','Gleavidolon','16','180000','64')

INSERT INTO [Server]
VALUES('SV009','PR009','OS009','Kleannioran','16','150000','32')

INSERT INTO [Server]
VALUES('SV010','PR010','OS010','Oddorant','8','80000','256')

INSERT INTO [Server]
VALUES('SV011','PR011','OS011','Waecreodell','8','75000','128')

INSERT INTO [Server]
VALUES('SV012','PR012','OS012','Seoglinica','8','70000','64')

INSERT INTO [Server]
VALUES('SV013','PR013','OS013','Blifaxath','32','250000','64')

INSERT INTO [Server]
VALUES('SV014','PR014','OS014','Preoppedore','16','190000','128')

INSERT INTO [Server]
VALUES('SV015','PR015','OS015','Glokkeriel','4','50000','128')


--Insert Transaction_Detail
INSERT INTO Transaction_Detail
VALUES('TR001','DB002','SV014')

INSERT INTO Transaction_Detail
VALUES('TR001','DB002','SV014')

INSERT INTO Transaction_Detail
VALUES('TR001','DB005','SV010')

INSERT INTO Transaction_Detail
VALUES('TR002','DB009','SV003')

INSERT INTO Transaction_Detail
VALUES('TR003','DB012','SV015')

INSERT INTO Transaction_Detail
VALUES('TR003','DB007','SV012')

INSERT INTO Transaction_Detail
VALUES('TR004','DB005','SV002')

INSERT INTO Transaction_Detail
VALUES('TR005','DB007','SV014')

INSERT INTO Transaction_Detail
VALUES('TR005','DB003','SV001')

INSERT INTO Transaction_Detail
VALUES('TR006','DB008','SV012')

INSERT INTO Transaction_Detail
VALUES('TR007','DB006','SV008')

INSERT INTO Transaction_Detail
VALUES('TR007','DB003','SV001')

INSERT INTO Transaction_Detail
VALUES('TR008','DB006','SV011')

INSERT INTO Transaction_Detail
VALUES('TR008','DB006','SV014')

INSERT INTO Transaction_Detail
VALUES('TR009','DB004','SV012')

INSERT INTO Transaction_Detail
VALUES('TR009','DB002','SV003')

INSERT INTO Transaction_Detail
VALUES('TR010','DB007','SV010')

INSERT INTO Transaction_Detail
VALUES('TR011','DB001','SV011')

INSERT INTO Transaction_Detail
VALUES('TR012','DB012','SV009')

INSERT INTO Transaction_Detail
VALUES('TR012','DB013','SV002')

INSERT INTO Transaction_Detail
VALUES('TR013','DB007','SV008')

INSERT INTO Transaction_Detail
VALUES('TR013','DB001','SV010')

INSERT INTO Transaction_Detail
VALUES('TR014','DB002','SV013')

INSERT INTO Transaction_Detail
VALUES('TR014','DB003','SV008')

INSERT INTO Transaction_Detail
VALUES('TR015','DB015','SV001')

INSERT INTO Transaction_Detail
VALUES('TR015','DB008','SV012')

-----------------------------------------------------------------


--To support management process in Cloud BRoker, you are tasked 
--to provide some query that produces important data

--NO 1
SELECT 
	Customer_Name,
	[Total Cloud Provider] = COUNT(th.CP_ID)
FROM 
	Customer1 cu JOIN Transaction_Header th ON cu.Customer_ID=th.Customer_ID
WHERE 
	Customer_Name LIKE '%e%'
	AND
	DAY(Customer_DOB) % 2 = 0
GROUP BY
	Customer_Name


--NO 2
SELECT
	se.Server_Name,
	[Total Price] = 'Rp' + CAST((se.Server_Price + db.DB_Price + os.OS_Price) AS VARCHAR) + ',-'
FROM
	OS os JOIN [Server] se ON se.OS_ID = os.OS_ID JOIN
	Transaction_Detail td ON td.Server_ID=se.Server_ID JOIN
	[Database] db ON db.[DB_ID]=td.[DB_ID]
WHERE
	se.Server_Memory > 2
	AND
	db.DB_Storage > 1


--NO 3
SELECT 
	[Initial] = LEFT(Customer_Name,1)+RIGHT(LEFT(Customer_Name,charindex(' ',Customer_Name)+1),1),
	[Database Price] = SUM(db.DB_Price),
	[Transaction Count] = COUNT(td.T_ID),
	td.T_ID
FROM
	Customer1 cu JOIN Transaction_Header th ON cu.Customer_ID=th.Customer_ID JOIN
	Transaction_Detail td ON td.T_ID=th.T_ID JOIN
	[Database] db ON db.[DB_ID] = td.[DB_ID]
WHERE
	db.DB_Storage > 2
	AND
	cu.Customer_Gender LIKE 'Female'
GROUP BY	
	Customer_Name, db.DB_Price, td.T_ID


--NO 4
SELECT 
	[Cloud Company] = SUBSTRING(cp.CP_Name, 1, CHARINDEX(' ', cp.CP_Name) - 1) + ' Company',
	[Total Transaction] = COUNT(th.CP_ID),
	[Average Account Balance] = x.rata
FROM 
	Cloud_Provider cp JOIN Transaction_Header th ON cp.CP_ID=th.CP_ID JOIN
	Customer1 cu ON cu.Customer_ID=th.Customer_ID,
	(
	SELECT
		AVG(Customer_Balance) AS rata
	FROM
		Customer1
	) x
WHERE
	cp.CP_Name LIKE '%Cloud%'
GROUP BY
	cp.CP_Name,x.rata
HAVING
	COUNT(th.CP_ID) > 1


--NO 5
SELECT 
	[Server Initial] = UPPER(SUBSTRING(Server_Name, 1, 5) + '-' + SUBSTRING(Server_ID, 3, 5)),
	pr.Pro_Name,
	se.Server_Storage
FROM
	[Server] se JOIN Processor pr ON se.Pro_ID=pr.Pro_ID,
	(
	SELECT
		MAX(DB_Storage) AS atas
	FROM 
		[Database]
	) x
WHERE
	se.Server_Storage > x.atas
	AND
	pr.Pro_Cores > 4


--NO 6
SELECT
	ds.Software_Name,
	db.DB_Price,
	[Database Storage] = CAST(db.DB_Storage AS VARCHAR) + 'GB',
	[DBMS software website URL] = REPLACE(ds.Software_URL,'https://' , '')
FROM
	DBMS_Software ds JOIN [Database] db ON ds.Software_ID=db.Software_ID,
	(
	SELECT
		AVG(DB_Price) AS rata
	FROM
		[Database]
	) x
WHERE
	db.DB_Price > x.rata
	AND
	ds.Software_Name LIKE '%DB%'


--NO 7
SELECT
	[Server Code] = UPPER(SUBSTRING(se.Server_Name, 1, 5) + '-' + SUBSTRING(se.Server_ID, 4, 5) + '-' + CAST(db.DB_Storage AS VARCHAR)),
	[Storage] = CAST(db.DB_Storage AS VARCHAR) + 'GB',
	[Price] = 'Rp' + CAST(db.DB_Price AS VARCHAR)
FROM
	[Server] se JOIN Transaction_Detail td ON se.Server_ID=td.Server_ID JOIN
	[Database] db ON db.[DB_ID]=td.[DB_ID],
	(
	SELECT 
		MAX(OS_Price) AS atas
	FROM
		OS
	) x,
	(
	SELECT 
		AVG(DB_Storage) AS rata
	FROM
		[Database]
	) y
WHERE
	Server_Price > x.atas
	AND
	Server_Storage > y.rata


--NO 8
SELECT
	[Database Code] = SUBSTRING(db.[DB_ID], 3, 5) + '-' + SUBSTRING(ds.Software_ID, 3, 5) + '-' + CAST(db.DB_Storage AS VARCHAR) + 'GB'
FROM
	[Database] db JOIN DBMS_Software ds ON db.Software_ID=ds.Software_ID,
	(
	SELECT 
		MIN(Server_Price) AS bawah
	FROM
		[Server]
	) x,
	(
	SELECT 
		AVG(OS_Price) AS rata
	FROM
		OS
	) y
WHERE
	DB_Price BETWEEN x.bawah AND y.rata
	AND
	ds.Software_ID LIKE 'DS006' 
	OR 
	ds.Software_ID LIKE 'DS007'


--NO 9
GO
CREATE VIEW [Affordable Server View] AS
SELECT 
	se.Server_Name,
	pr.Pro_Name,
	os.OS_Name,
	[Server Memory] = CAST(se.Server_Memory AS VARCHAR) + 'GB'
FROM
	[Server] se JOIN Processor pr ON se.Pro_ID=pr.Pro_ID JOIN
	OS os ON os.OS_ID=se.OS_ID,
	(
	SELECT
		MIN(Server_Price) AS bawah
	FROM
		[Server]
	) x,
	(
	SELECT
		AVG(Server_Price) AS rata
	FROM
		[Server]
	) y
WHERE
	se.Server_Price BETWEEN x.bawah AND y.rata
	AND
	se.Server_Memory >= 4
GO
SELECT * FROM [Affordable Server View]


--NO 10
GO
CREATE VIEW [Popular Cheap Databases View] AS
SELECT
	ds.Software_Name,
	ds.Software_URL,
	[Storage] = CAST(db.DB_Storage AS VARCHAR) + 'GB',
	[Transaction Count] = COUNT(td.[DB_ID])
FROM
	[Database] db JOIN Transaction_Detail td ON db.[DB_ID]=td.[DB_ID] JOIN
	DBMS_Software ds ON ds.Software_ID=db.Software_ID,
	(
	SELECT
		AVG(DB_Price) AS rata
	FROM
		[Database]
	) x
WHERE
	DB_Price <= x.rata
GROUP BY
	ds.Software_Name, ds.Software_URL, db.DB_Storage
HAVING
	COUNT(td.[DB_ID]) > 2
GO
SELECT * FROM [Popular Cheap Databases View]