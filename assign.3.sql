
/* Antony Ross, CSCI 226, Assignment 3 */

select model, speed, hd
from PC
where price < 1000
INTO OUTFILE "/tmp/assign.3.1.a.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select model, speed as gigahertz, hd as gigabytes
from PC
where price < 1000
INTO OUTFILE "/tmp/assign.3.1.b.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';




select distinct maker
from Printer, Product
where Printer.model = Product.model
INTO OUTFILE "/tmp/assign.3.1.c.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';





select model, ram, speed
from Laptop
where price > 1000
INTO OUTFILE "/tmp/assign.3.1.d.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';




select *
from Printer
where color = 'true'
INTO OUTFILE "/tmp/assign.3.1.e.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';





select model, hd
from PC
where speed like 3.2
and price < 2000
INTO OUTFILE "/tmp/assign.3.1.f.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';




select maker as manufacturer, speed
from Product P, Laptop L
where P.model = L.model and hd >= 30
INTO OUTFILE "/tmp/assign.3.2.a.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';




select P.model, price
from Product P, PC
where P.model = PC.model and maker = "B"

union

select P.model, price
from Product P, Laptop
where P.model = Laptop.model and maker = "B"

union

select P.model, price
from Product P, Printer
where P.model = Printer.model and maker = "B"
INTO OUTFILE "/tmp/assign.3.2.b.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select P.maker
from Product P natural join Laptop
where P.maker NOT IN (select maker from Product natural join PC)
INTO OUTFILE "/tmp/assign.3.2.c.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select hd
from PC
group by hd
having count(hd) > 1
INTO OUTFILE "/tmp/assign.3.2.d.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select P1.model, P2.model
from PC P1, PC P2
where P1.speed = P2.speed 
	and P1.ram = P2.ram
	and P1.model < P2.model
	INTO OUTFILE "/tmp/assign.3.2.e.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
	LINES TERMINATED BY '\n';


select maker
from Product natural join PC
where PC.speed >= 3
	and maker in (select maker from Product natural join Laptop where Laptop.speed >= 3)
		INTO OUTFILE "/tmp/assign.3.2.f.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
		LINES TERMINATED BY '\n';
		
		
		
		
select distinct maker
from Product natural join PC
where PC.speed >= 3
INTO OUTFILE "/tmp/assign.3.3.a.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';		
		
		

select Product.model
from Product, Printer
where Product.model = Printer.model
and Printer.price >= all (select price from Printer)
INTO OUTFILE "/tmp/assign.3.3.b.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';		
		



select model, speed
from Laptop
where Laptop.speed < all (select speed from PC)
INTO OUTFILE "/tmp/assign.3.3.c.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';		




select model
from (select P1.model, price
from Product P1, PC
where P1.model = PC.model

union

select P2.model, price
from Product P2, Laptop
where P2.model = Laptop.model

union

select P3.model, price
from Product P3, Printer
where P3.model = Printer.model) M

where price =

 (select max(price)
from (select price
from Product P1, PC
where P1.model = PC.model

union

select price
from Product P2, Laptop
where P2.model = Laptop.model

union

select price
from Product P3, Printer
where P3.model = Printer.model) M2)
INTO OUTFILE "/tmp/assign.3.3.d.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';




select maker
from Product, Printer
where Product.model = Printer.model
and price <= all (select price from Printer where color = "true")
INTO OUTFILE "/tmp/assign.3.3.e.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';




select model
from (select Product.model, ram, speed
from  Product, PC
where Product.model = PC.model
and ram = (select min(ram)
from PC)) M
where speed >= all (

select speed
from (select Product.model, ram, speed
from  Product, PC
where Product.model = PC.model
and ram = (select min(ram)
from PC)) M)
INTO OUTFILE "/tmp/assign.3.3.f.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select avg(speed)
from PC
INTO OUTFILE "/tmp/assign.3.4.a.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';




select avg(speed)
from Laptop
where price > 1000
INTO OUTFILE "/tmp/assign.3.4.b.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';	
		
		
		
select avg(price)
from Product P, PC
where P.model = PC.model
and P.maker = "A"
INTO OUTFILE "/tmp/assign.3.4.c.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';		
		


select avg(price)
from (select price, P.maker, P.type
from Product P, PC
where P.model = PC.model
and P.maker = "B"

union

select price, P.maker, P.type
from Product P, Laptop
where P.model = Laptop.model
and P.maker = "B") T
INTO OUTFILE "/tmp/assign.3.4.d.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';		
		



select speed, avg(price)
from PC
group by speed
INTO OUTFILE "/tmp/assign.3.4.e.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';		
		
		
		
select maker, avg(screen)
from Product, Laptop
where Product.model = Laptop.model
group by maker
INTO OUTFILE "/tmp/assign.3.4.f.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select maker
from Product P natural join PC
group by maker
having count(P.model) > 2
INTO OUTFILE "/tmp/assign.3.4.g.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select maker, max(price)
from Product P natural join PC
group by maker
INTO OUTFILE "/tmp/assign.3.4.h.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select speed, avg(price)
from PC
group by speed
having speed > 2
INTO OUTFILE "/tmp/assign.3.4.i.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select maker, avg(hd)
from(
select maker, hd
from Product P, PC
where P.model = PC.model and maker in 
(select maker from Product, Printer where Product.model = Printer.model)
) T
group by maker
INTO OUTFILE "/tmp/assign.3.4.j.csv" FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY '\n';




/* assign.3.5.a1.csv  */
insert into PC
values (1100, 3.2, 1024, 180, 2400);



/* assign.3.5.a2.csv  */
insert into Product
values("C", 1100, "pc");



/* assign.3.5.b1.csv  */
insert into Laptop (model, speed, ram, hd, screen, price)
select model + 100, speed, ram, hd, 17, price + 500
from PC;


/* assign.3.5.b2.csv  */
insert into Product (maker, model, type)
select maker, Product.model + 100, "laptop" as type
from Product, PC
where Product.model = PC.model;



/* assign.3.5.c.csv  */
delete from PC
where hd < 100;



/* assign.3.5.d1.csv  */
delete from Laptop
where model in (select model
from Product 
where maker not in (select maker from Product where type = "printer"));
	

/* assign.3.5.d2.csv  */
delete from Product
where type = "laptop"
and model not in (select model from Laptop);



/* assign.3.5.e.csv  */
update Product
set maker = "A"
where maker = "B";



/* assign.3.5.f.csv  */
update PC
set ram = ram * 2, hd = hd + 60;



/* assign.3.5.g.csv  */
update Laptop
set screen = screen + 1, price = price - 100
where model in (select model 
from Product
where maker = "B"
and type = "laptop");


