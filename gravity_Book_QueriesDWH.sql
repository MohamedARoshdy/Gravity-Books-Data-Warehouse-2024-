--------------DDL For DHW (Gravity Books)----------------
--- author: Mohamed Ahmed Roshdy Mohamed 
--- Date : 12-29-2024
-----------------------------------------------------
-----------this design will be Snowflake schema -----
-- We have 2 relation many to many< it will be  Sub-dimension>
-- so that i will do it >>> Snowflake Schema <<<
-- breif about my design 
/*
Snowflake Schema Design:

						+---------------+
						|  Dimension 1  |
						+---------------+
								|
								|
+---------------+       +---------------+       +---------------+
|  Dimension 2  |<---->|  Fact Table     |<---->|  Dimension 3  |
+---------------+       +---------------+       +---------------+
        |
+---------------+			
|  Sub-dimension|
+---------------+

Description:
- Fact Table: Contains measurable metrics (Total Price, Quantity, ForigenKeys, PrderID_PK_BK(DD)).
- Dimension Tables: Contain descriptive attributes (Dim_Customer, Dim_order_line, Dim_shiping_method,
Dim_date, Dim_Order_history, Dim_Book)
- Sub-dimensions: Further normalize dimensions (>>> splitting Dim_customer <<< into Dim_customer_Address, Dim_Address)
>>>splitting Dim_Book into <<<  Dim_Book_Author ,Dim_Author).

Normalization Levels:
1. Dimensions are normalized (split into related sub-dimensions).
2. Focus on reducing redundancy and improving query performance.

*/

------------------------------ Dim_Order_History table creation ----------------------------
create table Dim_Order_History(
History_PK_SK int identity(1,1) primary key ,
History_PK_BK int,
Status_ID_PK_BK int,
Status_Value int,
status_date datetime,
St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int
);
--------------------------------------------------------------------------------------------
------------------------------ Dim_Order_History table creation ----------------------------1
create table Dim_Shipping_Method(
Method_PK_SK int identity(1,1) primary key ,
Method_PK_BK int,
Method_name varchar (100),
cost decimal (6, 2) NULL,
St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int
);
-------------------------------------------------------------------------------------------2
------------------------------ Dim_Order_Line table creation ----------------------------
create table Dim_Order_Line(
Line_PK_SK int identity(1,1) primary key ,
Line_PK_BK int,
Order_PK_BK int,
price decimal (5, 2) ,
St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int
);
--------------------------------------------------------------------------------------------3
------------------------------ Dim_Order_Line table creation ----------------------------
create table Dim_Book (
Book_PK_SK int identity(1,1) primary key ,
Book_PK_BK int,
--
title varchar(400) ,
isbn13 varchar(13) ,
Language_id_PK_BK int,

num_pages int,
publication_date date ,
publisher_id_PK_BK int,
--
publisher_name nvarchar(1000) NULL,
--
Language_code varchar(8) ,
Language_name varchar(50) ,
--
St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int
);
-------------------------------------------------------------------------------------------4
------------------------------ Dim_Author table creation ----------------------------
create table Dim_Author (
Author_PK_SK int identity(1,1) primary key ,
Author_PK_BK int,
Author_name varchar (400),
------------
St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int
);
-----------------------------------------------------------------------------------------
------------------------------ Dim_Book_Author table creation --------------------------5
create table Dim_Book_Author (
  FK_Book_PK_SK int,
  FK_Author_PK_SK int,

St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int,
foreign key (FK_Book_PK_SK) references Dim_Book(Book_PK_SK),
foreign key (FK_Author_PK_SK) references Dim_Author(Author_PK_SK)

);
------------------------------------------------------------------------------------------
------------------------------ Dim_Customer table creation ----------------------------6
create table Dim_Customer (
Customer_PK_SK int identity(1,1) primary key ,
Customer_PK_BK int,
--
first_name varchar(200) NULL,
last_name varchar(200) NULL,
email varchar(350) NULL,

--
St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int
);


--------------------------------------------------------------------------------------7
------------------------------ Dim_Address table creation ----------------------------
create table Dim_Address (
Address_id_PK_SK int identity(1,1) primary key ,
Address_PK_BK int,
--
--
street_number varchar(10) ,
street_name varchar (200) ,
city varchar(100) ,
country_id_BK int,
country_name varchar(200) ,
--
status_id_BK int,
address_status varchar(30),
--
St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int
);
-------------------------------------------------------------------------------------------8
------------------------------ Dim_Customer_Address table creation -------------------------
create table Dim_Customer_Address (
FK_Address_id_PK_SK int,
FK_Customer_PK_SK int,
foreign key (FK_Customer_PK_SK) references Dim_Customer(Customer_PK_SK),
foreign key	(FK_Address_id_PK_SK) references  Dim_Address(Address_id_PK_SK),

St_Date datetime,
End_Date datetime,
Is_Current TINYINT ,
ssc int
);

--------------------------------------------------------------------------------------------
------------------------------ FACT_Sales table creation ----------------------------
create table Fact_Sales (
-- fact priamary key
Fact_Sales_PK_SK int,
-- foreign keys
FK_Book_PK_SK int ,
FK_History_PK_SK int,
FK_Customer_PK_SK int,
FK_Line_PK_SK int,
FK_Method_PK_SK int,
FK_DateSK int,
foreign key (FK_Book_PK_SK) references Dim_Book(Book_PK_SK),
foreign key (FK_History_PK_SK) references Dim_Order_History(History_PK_SK),
foreign key (FK_Customer_PK_SK) references Dim_Customer(Customer_PK_SK),

foreign key (FK_Line_PK_SK) references Dim_Order_Line(Line_PK_SK),
foreign key (FK_Method_PK_SK) references Dim_Shipping_Method(Method_PK_SK),
foreign key (FK_DateSK)		references DimDate(DateSK), 
--------
order_id_PK_BK_DD int,
--
-- measured 
price decimal (9, 2) ,
quantity int
);
--------------------------------------------------------------------------------------------