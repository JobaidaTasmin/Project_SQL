create database InventoryDB
on 
(
name='InventoryDB_Data_1',
filename='C:\Users\LAB04-02\InventoryDB_Data_1.mdf',
size=25mb,
maxsize=100mb,
filegrowth=5%
)
log on
(
name='InventoryDB_log_1',
filename='C:\Users\LAB04-02\InventoryDB_log_1.ldf',
size=25mb,
maxsize=50mb,
filegrowth=1mb
)
go
exec sp_helpdb InventoryDB
go
use InventoryDB
go
create table item
(
itemid int primary key nonclustered,
itemname nvarchar(30) not null,
unitprice money not null,
vat float not null
)
go
create table color
(
colorid int not null primary key,
colorname nvarchar(30) not null
)
go
create table lot
(
lotid int not null primary key,
lotname nvarchar(30) not null,
quantity int not null,
itemid int not null references item(itemid)
)
go
create table itemcolor
(
itemid int not null references item(itemid),
colorid int not null references color(colorid)
)
go
insert into item values (1,	'Camp Shirt',800,.12),		 	 	 
(2,'T Shirt',600,.15)
go
insert into color values(1,'Red'),
(2,'Blue'),
(3,'Red'),
(4,'Green')
go
insert into lot values (1,'Lot 1',6,1),
 (2,'lot 2',12,2)
go
insert into itemcolor values (1,1),(1,2),(2,1),(2,2)
go
select *from item
go
select*from color
go
select*from lot
go
select*from itemcolor
 --23.clustered index
 create clustered index Ix_item_name
 on item(itemid)
 go
 exec sp_helpindex item
 go
 --4.join
  select i.itemid,i.itemname,i.unitprice,i.vat,l.lotid,l.lotname,l.quantity,c.colorid,c.colorname
 from item i
 inner join lot l on i.itemid=l.itemid
 inner join itemcolor ic on ic.itemid=l.itemid
 inner join color c on c.colorid=ic.colorid
 go
 --5.
 create view vitemdeails
 with encryption ,schemabinding
 as
 select i.itemid,i.itemname,i.unitprice,i.vat,l.lotname,l.quantity,c.colorname
 from color c
 inner join itemcolor ic on ic.colorid=c.colorid
 inner join lot l on ic.itemid=l.itemid
 inner join item i on i.itemid=l.itemid
 go
 select*from vitemdeails
 where colorname= 'Red'
go
--6.subquery
select i.itemid,l.lotid,count(i.itemid)as'count',sum(quantity*unitprice*(1+vat))as'Total'
from item i 
inner join lot l on l.itemid=i.itemid
inner join itemcolor ic on l.itemid=ic.itemid
inner join color c on ic.colorid=c.colorid
 group by l.lotid,i.itemid