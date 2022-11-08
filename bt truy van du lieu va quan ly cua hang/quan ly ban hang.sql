

-- hien thi hoa don trong bang order
select oID,cid,oTotalPrice
from orderproduct;

-- hien thi danh sach khach hang da mua va danh sach duoc mua boi khach hang

select  customer.cNamre, product.pName
from customer 
inner join orderproduct on Customer.cID= orderproduct.cID
inner join OrderDetal on orderproduct.oID = OrderDetal.oID
inner join Product on OrderDetal.pID = Product.pID;

-- Hien thi ten cua khach hang khong mua sp nao

select Customer.cName 
from Customer
where Customer.cID not in (select orderproduct.cID from orderproduct);

-- Hien thi ma don hang, ngay ban va gia tien cua tung hoa don

SET SQL_SAFE_UPDATES = 0;
update orderproduct, product, orderdetal
set oTotalPrice = 0;

select customer.cNamre, product.pName, orderdetal.odQTY, product.pPrice, orderproduct.oTotalPrice, (odQTY * pPrice)
from customer, orderproduct, OrderDetal, Product;
update orderproduct

set orderproduct.oTotalPrice = (select  sum(orderdetal.totalPrice)
from customer 
inner join orderproduct on Customer.cID= orderproduct.cID
inner join OrderDetal on orderproduct.oID = OrderDetal.oID
inner join Product on OrderDetal.pID = Product.pID
group by orderdetal.oID
)
where orderproduct.oID = OrderDetal.oID ;


select  customer.cNamre, product.pName, orderdetal.odQTY, product.pPrice, sum(orderdetal.totalPrice)
from customer 
inner join orderproduct on Customer.cID= orderproduct.cID
inner join OrderDetal on orderproduct.oID = OrderDetal.oID
inner join Product on OrderDetal.pID = Product.pID
group by orderdetal.oID;

select  customer.cNamre, product.pName, orderdetal.odQTY, product.pPrice, (odQTY * pPrice) oTotaPrice
from customer 
inner join orderproduct on Customer.cID= orderproduct.cID
inner join OrderDetal on orderproduct.oID = OrderDetal.oID
inner join Product on OrderDetal.pID = Product.pID;

update customer
inner join orderproduct on Customer.cID= orderproduct.cID
inner join OrderDetal on orderproduct.oID = OrderDetal.oID
inner join Product on OrderDetal.pID = Product.pID
set totalPrice =  odQTY * pPrice
where orderproduct.oID = OrderDetal.oID;

select  sum(orderdetal.totalPrice)
from customer 
inner join orderproduct on Customer.cID= orderproduct.cID
inner join OrderDetal on orderproduct.oID = OrderDetal.oID
inner join Product on OrderDetal.pID = Product.pID
group by orderdetal.oID;
