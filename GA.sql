create database GA;

use GA;

Create table cliente(
idclinete int primary key auto_increment,
nome varchar (50) not null,
CNPJ char (14) unique
);

Create table cliente_endereco(
idendereco int primary key auto_increment,
pais varchar (15) not null,
estado char (2) not null,
cidade varchar (60) not null,
barrio varchar (50) not null, 
rua varchar (50) not null,
numeracao int not null;
id_cliente int unique,

foreign key (id_cliente)
references cliente(idcliente)
);

Create table cliente_contato(
idcontato int primary key auto_increment,
tipo_telefone varchar (50) not null,
telefone int not null,
telefone_2 int,
telefone_3 int,
email varchar (50) not null,
email_2 varchar (50),
email_3 varchar (50),
id_cliente

foreign key(id_cliente)
references cliente(idcliente)
);

//Falta terminar//
