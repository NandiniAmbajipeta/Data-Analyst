create database test_env
use test_env
select * from [dbo].[Test Environment Inventory Dataset]
select * from [dbo].[Products]

select a.Order_Date_DD_MM_YYYY,a.Product_ID,a.Availability,a.Demand,b.Product_Name,b.Unit_Price from [dbo].[Test Environment Inventory Dataset] as a
left join [dbo].[Products] as b on a.Product_ID=b.Product_ID

select * into new_table from(
select a.Order_Date_DD_MM_YYYY,a.Product_ID,a.Availability,a.Demand,b.Product_Name,b.Unit_Price from [dbo].[Test Environment Inventory Dataset] as a
left join [dbo].[Products] as b on a.Product_ID=b.Product_ID) x

select * from new_table

-------------------------------------------------------------------------------------------------------------------------------------


create database PROD
use PROD
select * from [dbo].[Prod+Env+Inventory+Dataset]
update [dbo].[Prod+Env+Inventory+Dataset]
set Product_ID=7 where Product_ID=21
update [dbo].[Prod+Env+Inventory+Dataset]
set Product_ID=11 where Product_ID=22

select * into new_table from(
select a.Order_Date_DD_MM_YYYY,a.Product_ID,a.Availability,a.Demand,b.Product_Name,b.Unit_Price 
from [dbo].[Prod+Env+Inventory+Dataset] as a 
left join [dbo].[Products+(1)] as b on a.Product_ID=b.Product_ID) x