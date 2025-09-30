create database test
use test
select * from [dbo].[data_season]
select Soil_type,count(*) [count] from data_season
group by Soil_type

update [dbo].[data_season]
set Soil_type='Unknown' where Soil_type is null

alter table [dbo].[data_season]
alter column Soil_type VARCHAR(MAX) NOT NULL

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like 'data_season'

update data_season
set Rainfall=1.1*Rainfall
update data_season
set area=0.9*area
