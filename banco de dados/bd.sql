create database academia;
use academia;

-- Cadastro/acesso.
create table registro (
matricula int primary key auto_increment,
nomecompleto varchar(100) not null,
nascimento date not null,
telefone varchar(15) not null,
email varchar(100) not null,
senha varchar(30) not null
);
 
create table acesso (
matricula int,
email varchar(100) not null,
senha varchar(30) not null,
foreign key (matricula) references registro(matricula)
);

insert into registro (matricula, nomecompleto, nascimento, telefone, email, senha) values
('1', 'Érica Jahnke Pires', '2006-07-22', '53981174146', 'ericajahnke@gmail.com', 'jhonson1'),
('2', 'Lucas Freitas', '2006-09-11', '53999102846', 'lucasf@gmail.com', 'luqueta321'),
('3', 'Lucas Pouey', '1995-05-13', '53991882736', 'poueylucas@gmail.com', 'aiaiopaigosta'),
('4', 'João Vitor Pereira', '2005-04-30', '51982736721', 'joaovpereira@gmail.com', 'joaoblunt'),
('5', 'Rafael Barboza Balleste', '2002-11-10', '55991027434', 'barbozaball@gmail.com', 'malphiteap');

select * from registro;

insert into acesso (matricula, email, senha) values
('1', 'ericajahnke@gmail.com', 'jhonson1'),
('2', 'lucasf@gmail.com', 'luqueta321'),
('3', 'poueylucas@gmail.com', 'aiaiopaigosta'),
('4', 'joaovpereira@gmail.com', 'joaoblunt'),
('5', 'barbozaball@gmail.com', 'malphiteap');

select * from acesso;


-- Sistema de recompensas.
create table aluno (
matricula int,
nomecompleto varchar(100) not null,
frequencia enum('+75%', '-75%') not null,
totalresgates int not null,
totalpontos int not null,
foreign key (matricula) references registro(matricula)
);

create table produtos (
idproduto int primary key auto_increment,
nome varchar(100) not null,
estoque int not null,
pontos int not null
);

create table resgate (
idresgate int primary key auto_increment,
idproduto int,
matricula int,
nomealuno varchar(100) not null,
nomeproduto varchar(100) not null,
pontosrestantes int not null,
dataresgate date not null,
foreign key (idproduto) references produtos(idproduto),
foreign key (matricula) references registro(matricula)
);

insert into aluno (matricula, nomecompleto, frequencia, totalresgates, totalpontos) values
('1', 'Érica Jahnke Pires', '+75%', '2', '404'),
('2', 'Lucas Freitas', '+75%', '3', '533'),
('3', 'Lucas Pouey', '-75%', '1', '645'),
('4', 'João Vitor Pereira', '-75%', '4', '463'),
('5', 'Rafael Barboza Balleste', '-75%', '5', '507');

select * from aluno;

insert into produtos (idproduto, nome, estoque, pontos) values
('1', 'Whey 900g', '36', '260'),
('2', 'Whey 1kg', '25', '300'),
('3', 'Creatina 150g', '33', '198'), 
('4', 'Creatina 300g', '18', '235'),
('5', 'Creatina 500g', '17', '300'),
('6', 'Roupas', '46', '211'), 
('7', 'Munhequeira', '13', '150'),
('8', 'Strap', '21', '100');

select * from produtos;

insert into resgate (idresgate, idproduto, matricula, nomealuno, nomeproduto, pontosrestantes, dataresgate) values
('1', '4', '1', 'Érica Jahnke Pires', 'Creatina 300g', '169', '2024-10-15'),
('2', '3', '2', 'Lucas Freitas', 'Creatina 150g', '335', '2024-09-30'),
('3', '5', '4', 'João Vitor Pereira', 'Creatina 500g', '163', '2024-10-03'), 
('4', '1', '5', 'Rafael Barboza Balleste', 'Whey 900g', '247', '2024-10-20'),
('5', '2', '3', 'Lucas Pouey', 'Whey 1kg', '345', '2024-09-13');

select * from resgate;


/* Calcular pontos restantes do aluno.
	select nomealuno, sum(pontosrestantes) as pontosrestantes
	from resgate
	where matricula = '1'
	group by nomealuno;

	select nomealuno, sum(pontosrestantes) as pontosrestantes
	from resgate
	where matricula = '2'
	group by nomealuno;

	select nomealuno, sum(pontosrestantes) as pontosrestantes
	from resgate
	where matricula = '3'
	group by nomealuno;

	select nomealuno, sum(pontosrestantes) as pontosrestantes
	from resgate
	where matricula = '4'
	group by nomealuno;

	select nomealuno, sum(pontosrestantes) as pontosrestantes
	from resgate
	where matricula = '5'
	group by nomealuno; */


/* Atualizar na tabela.
	update aluno
	set totalpontos = '169'
	where nomecompleto = 'Érica Jahnke Pires';

	update aluno
	set totalpontos = '335'
	where nomecompleto = 'Lucas Freitas';

	update aluno
	set totalpontos = '345'
	where nomecompleto = 'Lucas Pouey';

	update aluno
	set totalpontos = '163'
	where nomecompleto = 'João Vitor Pereira';

	update aluno
	set totalpontos = '247'
	where nomecompleto = 'Rafael Barboza Balleste'; */


-- Calculadora TMB.
create table userinfo (
matricula int,
idade int not null,
altura int not null,
peso int not null,
sexo enum('Feminino', 'Masculino') not null,
atividadefisica enum('Ativa', 'Regular', 'Nula') not null,
foreign key (matricula) references registro(matricula)
);

create table tmb (
idtmb int primary key auto_increment,
tmbativa decimal (10, 2) not null,
tmbregular decimal (10, 2) not null,
tmbnula decimal (10, 2) not null
);

create table macros (
matricula int,
proteina int not null,
carboidrato int not null, 
gorduras int not null,
foreign key (matricula) references registro(matricula)
);

insert into userinfo (matricula, idade, altura, peso, sexo, atividadefisica) values 
('1', '18', '155', '53', 'Feminino', 'Regular'),
('2', '18', '175', '61', 'Masculino', 'Ativa'),
('3', '19', '170', '55', 'Masculino', 'Nula'),
('4', '22', '160', '58', 'Masculino', 'Nula'),
('5', '29', '180', '70', 'Masculino', 'Regular');

insert into tmb (idtmb, tmbativa, tmbregular, tmbnula) values 
('1', '721.16', '540.87', '360.58'),
('2', '974.56', '757.99', '600');