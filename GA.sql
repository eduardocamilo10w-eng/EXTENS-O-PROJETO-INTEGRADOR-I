create database GA;

use GA;
/*========================= Sprint 1 ==================================*/
/* Tableas Clientes*/
Create table cliente(
	idcliente int primary key auto_increment,
	nome varchar (50) not null,
	CNPJ char (14) unique,
	nicho varchar (50) not null,
	status varchar (10) not null
);

Create table cliente_endereco(
	idendereco int primary key auto_increment,
	cep int not null,
	estado char (2) not null,
	cidade varchar (60) not null,
	barrio varchar (50) not null, 
	rua varchar (50) not null,
	numeracao int not null,
	id_cliente int ,
		
	foreign key (id_cliente)
	references cliente(idcliente)
);

Create table cliente_contato(
	idcontato int primary key auto_increment,
	tipo_telefone varchar (50) not null,
	telefone varchar (15) not null,
	telefone_2 varchar (15),
	email varchar (50) not null,
	email_2 varchar (50),
	id_cliente int,
	

	foreign key(id_cliente)
	references cliente(idcliente)	
);

/*Tabelas Vendedor*/

Create table vendedor(
	idvendedor int primary key auto_increment,
	nome varchar (50) not null,
	sexo char (1) not null,
	cpf char (11) unique,
	status varchar (10) not null,
	comissao float not null
);

Create table vendedor_contato(
	idvendedorcontato int primary key auto_increment,
	tipo_telefone varchar (15) not null,
	telefone varchar (15) not null,
	email varchar (50) not null,
	id_vendedor int,

	foreign key(id_vendedor)
	references vendedor(idvendedor)
);


/*======================== Sprint 2 ================================*/

/*tabelas produtos, preço e estoque */

Create table produto(
	idproduto int primary key auto_increment,
	nome varchar (50) not null,
	tipo varchar (20) not null,
	descricao varchar (250) not null,
	marca varchar (40) not null,
	modelo varchar (40) not null,
	composicao varchar (50) not null,
	peso varchar (50) not null,
	status varchar (10) not null
);

Create table preco(
	idpreco int primary key auto_increment,
	valor float not null,
	data_inicio date,
	data_fim date,
	id_produto int,

	foreign key(id_produto)
	references produto(idproduto)
);

Create table estoque(
	idestoque int primary key auto_increment,
	quantidade int not null,
	estoque_minimo int not null,
	estoque_maximo int not null,
	id_produto int,

	foreign key(id_produto)
	references produto(idproduto)
);

/*========================= Sprint 3 =======================*/

/* tabelas de pedidos e orçamentos */

Create table pedido(
	idpedido int primary key auto_increment,
	data_pedido date not null,
	status varchar (10) not null,
	valor_total float not null,
	forma_pagamento varchar (15),
	observacao varchar (200),
	data_entrega date not null,
	id_cliente int,
	id_vendedor int,

	foreign key(id_cliente)
	references cliente(idcliente),

	foreign key(id_vendedor)
	references vendedor(idvendedor)
);

Create table pedido_item(
	idpedido_item int primary key auto_increment,
	quantidade int not null,
	valor_unitario float not null,
	desconto float not null,
	subtotal float not null,
	id_produto int,
	id_pedido int,

	foreign key(id_produto)
	references produto(idproduto),

	foreign key(id_pedido)
	references pedido(idpedido)
);


Create table orcamento(
	idorcamento int primary key auto_increment,
	data_orcamento date not null,
	validade date not null,
	status varchar (10) not null,
	valor_total float not null,
	observacao varchar (200),
	id_vendedor int,
	id_cliente int,

	foreign key(id_vendedor)
	references vendedor(idvendedor),

	foreign key(id_cliente)
	references cliente(idcliente)
);

Create table orcamento_item(
	idorcamentoitem int primary key auto_increment,
	quantidade int not null,
	valor_unitario float not null,
	subtotal float not null,
	id_orcamento int,
	id_produto int,

	foreign key(id_orcamento)
	references orcamento(idorcamento),

	foreign key(id_produto)
	references produto(idproduto)
);
