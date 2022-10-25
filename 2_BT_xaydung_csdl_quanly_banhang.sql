create table customer(
cID int primary key auto_increment,
cNamre varchar(50),
cAge int, check (cAge>0 and cAge<100)
);
create table orderProduct(
oID int primary key auto_increment,
cID int ,
oDate date,
oTotalPrice double,
foreign key (cID) references customer(cID)
);
create table product(
pID int primary key auto_increment,
pName varchar(50),
pPrice int , check (pPrice> 0)
);
create table orderDetal(
oID int,
pID int,
odQTY int, check (odQTY >0),
 primary key(oID,pID),
foreign key (oID) references orderProduct(oID),
foreign key (pID) references product(pID)
);