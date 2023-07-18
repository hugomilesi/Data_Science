#drop database ecommerce;

create database ecommerce;
use ecommerce;



-- Tabela para representar o tipo de cliente (PJ ou PF)
create table client_type (
    idClientType int auto_increment primary key,
    clientType enum('PJ', 'PF') not null
);

-- Tabela cliente
create table clients(
	idClient int auto_increment primary key,
    idClientType int,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF),
    constraint fk_client_type foreign key(idClientType) references client_type(idClientType)
    );


-- Tabela Produto
-- size = products dimensions
create table product(
	idProduct int auto_increment primary key,
    Fname varchar(255),
    classification_kids bool default false,
    category enum('Eletronics', 'Clothing', 'Toys', 'Food', 'Furnitures') not null,
    rating float default 0,
	size varchar(10)
);

-- Tabela Pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Canceled', 'Confirmed', 'Processing') default "Processing",
    orderDescription varchar(255),
    shipping_value float default 0,
    constraint fk_orders_client foreign key(idOrderClient) references clients(idClient)
		on update cascade
);
alter table orders auto_increment=1;
desc orders;

-- Tabela Entrega
create table delivery (
    idDelivery int auto_increment primary key,
    idOrder int,
    deliveryStatus enum('Shipped', 'Delivered', 'Out for Delivery') default "Shipped",
    trackingCode varchar(50),
    constraint fk_delivery_order foreign key (idOrder) references orders (idOrder)
);


-- Tabela Pagamentos
create table payments(
	idClient int,
    idOrder int,
    paymentMethod enum('Cash', 'Credit card', 'Pix') not null,
    ammountPaid float,
    primary key(idClient, idOrder),
    constraint fk_client_payment foreign key (idClient) references clients(idClient),
    constraint fk_order_payment foreign key (idOrder) references orders(idOrder)
);

-- Tabela produto_em_estoque
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Available', 'Out of Stock') default 'Available',
    primary key (idPOproduct, idPOorder),
    constraint fk_productOrder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productOrder_product foreign key (idPOorder) references orders(idOrder)
);

-- Tabela Estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- Tabela Fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact varchar(11) not null,
    constraint unique_supplier unique(CNPJ)
);

-- Tabela Vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact varchar(11) not null,
    constraint unique_CNPJ_supplier unique(CNPJ),
    constraint unique_CPF_supplier unique(CPF)
);

-- Tabela produtos_vendedor
create table productSeller(
	idPseller int,
    idProduct int,
    prodQuantity  int not null,
    primary key(idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

-- 
create table storageLocation(
	idLproduct int, 
    idLstorage int,
    location varchar(255) not null,
    primary key(idLproduct, idLstorage),
    constraint fk_productStorage_seller foreign key(idLproduct) references product(idProduct),
    constraint fk_productStorage_product foreign key(idLstorage) references productStorage(idProdStorage)
    );

create table productSupplier(
	idPsSupplier int, 
    idPsProduct int,
    quantity int not null,
    primary key(idPsSupplier, idPsProduct),
    constraint fk_product_supplier_seller foreign key(idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)
);

show databases;

use information_schema;
show tables;
desc table_constraints;


