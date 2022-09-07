create database oficina;
-- drop database oficina;

use oficina;

create table clientes(
		idCliente int auto_increment primary key,
        nome varchar (15) not null,
        sobrenome varchar (15) not null,
        nascimento date not null,
        CPF char(11) not null,
        contato char(11) not null,
        constraint unique_cpf unique (CPF)
        );

alter table clientes auto_increment=1;

insert into clientes (nome, sobrenome, nascimento, CPF, contato) values
		('João', 'Silvassauro','1990-08-23', 12345676543, 51976534567),
        ('Pedro', 'Silvassauro','2000-06-13', 12387676543, 48976534567),
		('Timótio', 'Guedes','1997-08-17', 09863546789, 54761235497);
        
        
create table pedidos(
		idPedido int auto_increment primary key,
        servico ENUM('Chapeação', 'Pintura', 'Mecânica', 'Revisão') default 'Revisão',
        descricao varchar(255),
        solicitacao date,
        conclusaoPrevista date,
        idCliente int,
        statusPedido ENUM('Liberado','Cancelado','Em Análise', 'Concluído','Em Processamento') default 'Em Análise',
        constraint fk_idcliente foreign key (idCliente) references clientes(idCliente)
);

alter table pedidos auto_increment = 1;
-- drop table pedido;

insert into pedidos (servico, descricao, solicitacao, conclusaoPrevista, idCliente, statusPedido) values
		('Pintura', 'Cor vermelha', '2022-09-06', '2022-10-10', 2, 'Em Processamento'),
        ('Chapeação' , 'Capô e portas', '2022-09-06', '2022-10-06', 2, 'Concluído'),
        ('Mecânica', 'Motor e Amortecedor', '2022-09-16', '2022-09-22', 1, 'Liberado'),
        ('Revisão', 'Sem scanner', '2022-10-01', '2022-10-02', 3, 'Em Processamento');


create table equipes(
		idEquipe int auto_increment primary key,
        nomeEquipe varchar(10) not null,
        especialidade ENUM('Chapeação', 'Pintura', 'Mecânica', 'Revisão') not null
);

alter table equipes auto_increment=1;

insert into equipes (nomeEquipe, especialidade) values
		('XPro','Pintura'),
        ('JustWoman','Revisão'),
        ('Alpha', 'Mecânica');


create table analise_pedido(
		idEquipe int,
		idPedido int,
		constraint fk_idEquipe foreign key (idEquipe) references equipes(idEquipe),
		constraint fk_idPedido foreign key (idPedido) references pedidos(idPedido)
);

create table ordem_servico(
		idOrdem int primary key auto_increment,
        statusOrdem ENUM('Aguardando Equipe', 'Iniciada', 'Concluída'),
        idPedido int not null,
        idCliente int not null,
        idEquipe int not null,
        constraint fk_idpedido_ordem foreign key (idPedido) references pedidos(idPedido),
        constraint fk_idEquipe_ordem foreign key (idEquipe) references equipes(idEquipe),
        constraint fk_idCliente_ordem foreign key (idCLiente) references clientes(idCliente)
);

alter table ordem_servico auto_increment=1;

insert into ordem_servico (statusordem, idPedido, idCliente, Idequipe) values 
		('Aguardando Equipe', 3, 2,3),
        ('Iniciada',1,1,1),
        ('Iniciada', 4, 3, 2),
        ('Concluída', 2,1,1);

show tables;

SELECT * FROM pedidos;

SELECT * FROM clientes;

-- filtrando ordens de serviço mais recentes
SELECT * FROM ordem_servico
	ORDER BY idOrdem DESC;

-- filtrando cliente específico com where
SELECT * FROM ordem_servico
	WHERE idcliente = 2;
    
-- criando coluna IDADE derivada da info de NASCIMENTO e filtrando com idades menores que 30 anos com having  
SELECT idCliente AS Código, concat(nome,' ',sobrenome) AS Nome, timestampdiff(YEAR, nascimento, curdate()) AS Idade
	FROM clientes
    HAVING idade < 30;

-- Filtrando previsão de conclusão de OS já iniciadas mas não concluídas, juntando as informações de 3 tabelas usando FK 
SELECT DISTINCT c.idCliente as Código, concat(nome,' ',sobrenome) AS Nome, statusordem as 'Status', p.conclusaoprevista as Conclusão
	FROM clientes c
	JOIN pedidos p ON c.idCliente = p.idCliente
	JOIN ordem_servico os on p.idPedido = os.idPedido
    WHERE statusordem = 'Iniciada';
    
