create database ecommerce;
-- drop database ecommerce;
use ecommerce;

create table clients(
idClient int auto_increment primary key,
Fname varchar(10),
Minit varchar(3),
Lname varchar(20),
CPF char(11) not null,
Adress varchar(100),
constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

insert into clients (Fname, Minit, Lname, CPF, Adress)
  values('Maria','M','Galo',12398774678,'rua Olivio 345, Mauá - Hamburgo'),
		('John','B','Pinto',12784987652,'rua Jacinto 10, Figueira - Ronda Alta'),
		('Pedro','T','Boulos',65436789076,'rua Três 567, Floresta - Criciúma'),
        ('Marcos','M','Janetti',12365478906,'av Maurício 10, Rondônia - Hamburgo'),
        ('Jessé','A','Foca',12478652456,'rua Zico 89, Sarandi - Porto'),
        ('Jeremias','','Luccarrelli',12374098567,'rua Silva Só 8764, Pedreira - Alvorada');
        
create table product(
idProduct int auto_increment primary key,
Pname varchar(10) not null,
Classification_kids bool default false,
Category ENUM('Eletrônicos','Têxtil','Brinquedos','Alimentos','Móveis') not null,
Avaliação float default 0,
Size varchar(11)
);

alter table product auto_increment=1;

insert into product (Pname, Classification_kids, Category, Avaliação, Size)
	values('Camiseta',false,'Têxtil','5',null),
		  ('Notebook',false,'Eletrônicos','4','30x20x3'),
          ('Arroz',false,'Alimentos','3',null),
          ('Cama King',false,'Móveis','4','200x180x80'),
          ('Pula Pula',true,'Brinquedos','4',null),
          ('Max Steel',true,'Brinquedos','4',null),
          ('Fone',false,'Eletrônicos','4',null);
          

create table payments(
idClient int,
idPayment int,
typePaymant ENUM('Boleto','Cartão','Dois Cartões'),
limitAvaliable float,
primary key (idClient, idPayment)
);

create table orders(
idOrder int auto_increment primary key,
idOrderClient int,
orderStatus ENUM('Cancelado','Confirmado','Em processamento') default 'Em Processamento',
orderDescription varchar(255),
sendValue float default 10,
paymantCash bool default false,
constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);

alter table orders auto_increment=1;

-- delete from orders where idOrderClient in (1,2,3,4);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymantCash) values
		(1,default,'compra via aplicativo',null,1),
        (2,default,'compra via aplicativo',15,0),
        (3,'Confirmado',null,null,1),
        (4,'Cancelado','cliente não deu motivos',0,0);
        
select * from orders;

-- desc orders;

create table productStorage(
idProdStorage int auto_increment primary key,
storageLocation varchar(255),
quantity int default 0
);

alter table productStorage auto_increment=1;

insert into productStorage (storageLocation, quantity) values
		('Rio de Janeiro', 100),
        ('São Paulo',10),
        ('Porto Alegre',56),
        ('Rio de Janeiro', 12),
        ('São Paulo',27),
        ('Porto Alegre',49);

create table supplier(
idSupplier int auto_increment primary key,
socialName varchar(100) not null,
CNPJ char(15) not null,
contact char(11) not null,
constraint unique_suplier unique (CNPJ)
);

alter table supplier auto_increment=1;

insert into supplier (socialName,CNPJ,contact) values
		('Almeida e Filhos',321678765432678,'51988445678'),
        ('SA Eletrônicos',321456765432678,'48988445578'),
        ('PlayToys',321678764567878,'51988449999');

create table seller(
idSeller int auto_increment primary key,
socialName varchar(100) not null,
abstName varchar(100),
CNPJ char(15),
CPF char(11),
location varchar(255),
contact char(11) not null,
constraint unique_cpf_seller unique (CPF),
constraint unique_cnpj_seller unique (CNPJ)
);

alter table seller auto_increment=1;

insert into seller (socialName, abstname, CNPJ, CPF, location, contact) values
		('Tech Eletronics',null,123674876354890, null, 'Rio de Janeiro', 21987654326),
        ('KidsKids','Kids', 627389876534987, null, 'Porto Alegre', 51987653479),
        ('Roger Guedes', null, null, 09876524567, 'São Paulo', 11567836567);

create table productSeller(
idPseller int,
idPproduct int,
prodQuantity int default 1,
primary key (idPseller, idPproduct),
constraint fk_producr_seller foreign key (idPseller) references seller(idSeller),
constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

insert into productseller (idPSeller, idPproduct, prodQuantity) values
		(1,6,80),
        (2,7,10);

create table productOrder (
idPOproduct int,
idPOorder int,
poQuantity int default 1,
poStatus ENUM('Disponível','Sem estoque') default 'Disponível',
primary key (idPOproduct, idPOorder),
constraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
constraint fk_productOrder_product foreign key (idPOorder) references orders(idOrder)
);

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
		(1,1,2,null),
        (2,1,1,null),
        (3,2,1,null);

create table storageLocation(
idLproduct int,
idLstorage int,
location varchar(255) not null,
primary key (idLproduct, idLstorage),
constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

insert into storageLocation (idLproduct,idLstorage,location) values
		(1,2,'RJ'),
        (2,6,'RS');

create table productSupplier(
idPsSupplier int,
idPsProduct int,
quantity int not null,
primary key (idPsSupplier, idPsProduct),
constraint fk_product_suplier_suplier foreign key (idPsSupplier) references supplier(idSupplier),
constraint fk_product_suplier_product foreign key (idPsProduct) references product(idProduct)
);

insert into productSupplier (IdPsSupplier, idPsProduct, quantity) values
		(1,1,500),
        (1,2,400),
        (2,4,633),
        (3,3,5),
        (2,5,10);
        
-- show tables;

-- show databases;
-- use information_schema;
-- show tables;
-- desc referential_constraints;
-- select * from referential_constraints where constraint_schema = 'ecommerce';

-- selecionando todo o conteúdo da tabela clients
select * from clients;

-- join entre clients e orders 
select * from clients as c
join orders on idClient = idOrderClient;

-- selecionando informações para saber qual o atual status dos pedidos
select idclient as 'Código Cliente', idorder as 'Nro Pedido', concat(Fname,' ',Lname) as Cliente, orderstatus as 'Status' from clients as c
join orders on idClient = idOrderClient;

-- selecionando quantidade de pedidos por status
select orderstatus, count(*) as quantidade from orders
group by orderstatus;

-- selecionando quantidade de pedidos por cliente
select c.idclient, Fname, count(*) as 'Número de Pedidos' from clients c
			inner join orders o on c.idCLient = o.idOrderClient
            inner join productOrder p on p.idpoorder = o.idOrder
		group by idCLient;
 
-- selecionando clientes com pedidos cancelados e sua quantidade usando where, join, count e group by
select concat(Fname,' ',Lname) as cliente, orderstatus as 'status', count(*) as Quantidade from clients
inner join orders as o on idClient = idOrderClient
where orderstatus = 'Cancelado'
group by orderstatus;

-- atualizando o valor do frete em 10% e filtrando quais os fretes a serem acrescidos usando having
select sendvalue as Frete, sendvalue*1.1 as 'Novo Valor' from orders
having sendvalue > 0;

