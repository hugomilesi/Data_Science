

use ecommerce;

insert into client_type(clientType)
	values("PF"),
		  ("PJ"),
          ("PF"),
          ("PJ"),
          ("PJ"),
          ("PF"),
          ("PJ");
          

insert into clients (idClientType, Fname, Minit, Lname, CPF, Address)
	values (1, 'Maria', 'M', 'Silva', '123456789', 'rua silva de prata 29, carangola - cidade das flores'),
		   (2, 'Hugo', 'M', 'Penco', '264985682', 'rua alameda 289, centro - cidade das flores'),
           (3, 'Matheus', 'O', 'Pimentel', '325216468', 'avenida alameda vinha 1009, centro - cidade das flores'),
           (4, 'Julia', 'S', 'França', '569872656', 'rua laranjeiras 961, Centro - cidade das flores'),
           (5, 'Roberta', 'G', 'Assis', '583175963', 'Avenida coller, centro - cidade das flores'),
           (6, 'Isabela', 'M', 'Cruz', '459812698', 'rua silva de prata 29, carangola - cidade das flores'),
           (7, 'Julio', 'A', 'Queiroz', '459871256', 'rua das rosas 267, valqueire - cidade das flores');

insert into product (Fname, classification_kids, category, rating, size)
	values ('Fone de Ouvido', false, 'Eletronics', '4', null),
		   ('Barbie elsa', true, 'Toys', '3', null),
           ('Body Carters', true, 'Clothing', '5', null),
           ('Microfone vedo - Youtuber', false, 'Eletronics', '4', null),
           ('Sofá retrátil', false, 'Furnitures', '3', '3x57x80'),
           ('Farinha de Arroz', false, 'Food', '2', null),
           ('Fire Stick Amazon', false, 'Eletronics', '3', null);

insert into orders(idOrderClient, orderStatus, orderDescription, shipping_value)
	values(1, default, 'Compra via aplicativo', 20.0),
		  (2, default, 'Compra via aplicativo', 115.0),
          (3, default, 'Compra via aplicativo', 52.5),
          (4, "Confirmed", 'Compra via aplicativo', 300.0),
          (5, "Canceled", 'Compra via aplicativo', 40.78),
          (6, default, 'Compra via aplicativo', 220.35),
          (7, default, 'Compra via aplicativo', 20.60);
          
insert into delivery(idOrder, deliveryStatus, trackingCode) values
	(1, 'Shipped', 'ABC123'),
	(2, 'Delivered', 'XYZ456'),
	(3, 'Shipped', '123XYZ'),
	(4, 'Out for Delivery', '789ABC'),
	(5, 'Shipped', 'DEF456'),
	(6, 'Out for Delivery', 'GHI789'),
	(7, 'Delivered', 'JKL012');


insert into payments(idClient, idOrder, paymentMethod, ammountPaid)
	values (1, 1, 'Credit card', 125.20),
		   (2, 2, 'Pix', 200.40),
           (3, 3, 'Credit card', 80.35),
           (4, 4, 'Cash', 55.20),
           (5, 5, 'Credit card', 360.70),
           (6, 6, 'Pix', 12.20),
           (7, 7, 'Credit card', 30.80);
           
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus)
	values (1, 1, 2, 'Available'),
		   (2, 2, 1, default),
           (3, 3, 1, "Available"),
           (4, 4, 1, default),
           (5, 5, 1, "Available"),
           (6, 6, 1, "Available"),
           (7, 7, 1, "Out of Stock");
           
insert into productStorage(storageLocation, quantity)
	values('Rio de Janeiro', 500),
		  ('São Paulo', 10),
          ('São Paulo', 100),
          ('São Paulo', 10),
          ('Brasília', 60);
          
-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						 (1, 1,'RJ'),
                         (2, 2,'GO');

          
insert into supplier(socialName, CNPJ, contact)
	values ('Almeida e filhos', 123456789123456,'21985474'),
		   ('Eletrônicos Silva',854519649143457,'21985484'),
		   ('Eletrônicos Valma', 934567893934695,'21975474');

insert into productSupplier (idPsSupplier, idPsProduct, quantity) 
	values (1,1,500),
		   (1,2,400),
		   (2,4,633),
           (3,3,5),
           (2,5,10);
           
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,null,'São Paulo', 1198657484);
                        

insert into productSeller (idPseller, idProduct, prodQuantity) values 
						 (1,6,80),
                         (2,7,10);



							-- Criando Algumas Queries --
use ecommerce;

# 1) recuperando o numero total de pedidos para cada tipo de cliente(PJ ou PF) tendo mais de 2 pedidos.
SELECT ct.clientType, COUNT(o.idOrder) AS TotalOrders
FROM client_type ct
JOIN clients c ON ct.idClientType = c.idClientType
JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY ct.clientType
HAVING COUNT(o.idOrder) > 2;

# 2) Coletando informações dos produtos e dos seus fornecedores
SELECT o.idOrder, p.Fname AS ProductName, p.category, s.socialName AS SupplierName, o.orderStatus, o.shipping_value
FROM orders o
JOIN productOrder po ON o.idOrder = po.idPOorder
JOIN product p ON po.idPOproduct = p.idProduct
JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN supplier s ON ps.idPsSupplier = s.idSupplier;

# 3) Recuperando informações de um cliente especifico com base no seu CPF:
SELECT * FROM clients WHERE CPF = '264985682';

# 4) Recuperando produtos apenas da categoria "Eletronics"
SELECT * FROM product WHERE category = 'Eletronics';

# 5) calculando o valor total (valorpago + taxa de entrega) para cara ordem.
SELECT o.idOrder, o.orderDescription, p.paymentMethod, p.ammountPaid,
       (p.ammountPaid + o.shipping_value) AS totalPaid
FROM orders o
JOIN payments p ON o.idOrder = p.idOrder;

# 6) Recuperando o primeiro e ultimo nome dos clientes a seus pedidos baseado na ordem do status.
SELECT c.Fname, c.Lname, o.idOrder, o.orderStatus
FROM clients c
JOIN orders o ON c.idClient = o.idOrderClient
ORDER BY o.orderStatus;

