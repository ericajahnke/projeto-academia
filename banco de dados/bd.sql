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
('5', 'Rafael Barboza Balleste', '2002-11-10', '55991027434', 'barbozaball@gmail.com', 'malphiteap'),
('6', 'Lucas Almeida', '2006-08-17', '53981173546', 'luscasalmeida@gmail.com', 'freefire'),
('7', 'Bianca Marino', '1999-08-01', '55923450124', 'bibimar@gmail.com', 'boatardeneyma'),
('8', 'Mariana Barboza Balleste', '2006-08-12', '55938467624', 'mariball@gmail.com', 'sabcarpenter'),
('9', 'Geovana da Silva', '2002-03-24', '55647829456', 'geodiva@gmail.com', 'paodebatata4592'),
('10', 'Gabriele Santos', '2005-09-30', '53982635184', 'bibimar@gmail.com', 'coxinha123');

select * from registro;

insert into acesso (matricula, email, senha) values
('1', 'ericajahnke@gmail.com', 'jhonson1'),
('2', 'lucasf@gmail.com', 'luqueta321'),
('3', 'poueylucas@gmail.com', 'aiaiopaigosta'),
('4', 'joaovpereira@gmail.com', 'joaoblunt'),
('5', 'barbozaball@gmail.com', 'malphiteap'),
('6', 'luscasalmeida@gmail.com', 'freefire'),
('7', 'bibimar@gmail.com', 'boatardeneyma'),
('8', 'mariball@gmail.com', 'sabcarpenter'),
('9', 'geodiva@gmail.com', 'paodebatata4592'),
('10', 'bibimar@gmail.com', 'coxinha123');

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
('5', 'Rafael Barboza Balleste', '-75%', '5', '507'),
('6', 'Lucas Almeida', '+75%', '3', '414'),
('7', 'Bianca Marino', '-75%', '2', '552'),
('8', 'Mariana Barboza Balleste', '-75%', '2', '504'),
('9', 'Geovana da Silva', '-75%', '1', '301'),
('10', 'Gabriele Santos', '+75%', '4', '383');

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
('1', '4', '1', 'Érica Jahnke Pires', 'Creatina 300g', '404', '2024-10-15'),
('2', '3', '2', 'Lucas Freitas', 'Creatina 150g', '533', '2024-09-30'),
('3', '5', '4', 'João Vitor Pereira', 'Creatina 500g', '645', '2024-10-03'), 
('4', '1', '5', 'Rafael Barboza Balleste', 'Whey 900g', '463', '2024-10-20'),
('5', '2', '3', 'Lucas Pouey', 'Whey 1kg', '507', '2024-09-13'),
('6', '7', '7', 'Bianca Marino', 'Munhequeira', '414', '2024-10-28'),
('7', '8', '6', 'Lucas Almeida', 'Strap', '552', '2024-10-24'),
('8', '3', '10', 'Gabriele Santos', 'Creatina 150g', '383', '2024-10-27'),
('9', '5', '9', 'Geovana da Silva', 'Creatina 500g', '301', '2024-10-16'),
('10', '4', '8', 'Mariana Barboza Balleste', 'Creatina 300g', '504', '2024-10-22');

select * from resgate;

-- Calcular pontos restantes do aluno.
	select a.nomecompleto, a.totalpontos, p.nome as nomeproduto,
	p.pontos, (a.totalpontos - p.pontos) as pontosrestantes
	from aluno a
	join resgate r on a.matricula = r.matricula
	join produtos p on r.idproduto = p.idproduto; 

-- Atualizar pontos restantes na tabela.
	update aluno a
	join resgate r on a.matricula = r.matricula
	join produtos p on r.idproduto = p.idproduto
	set a.totalpontos = a.totalpontos - p.pontos;


-- Calculadora TMB.
create table userinfo (
iduserinfo int primary key auto_increment,
matricula int,
idade int not null,
altura decimal(5, 2) not null,
peso decimal(5, 2) not null,
sexo enum('Feminino', 'Masculino') not null,
atividadefisica enum('Ativa', 'Regular', 'Nula') not null,
foreign key (matricula) references registro(matricula)
);

create table macros (
idmacros int primary key auto_increment,
matricula int,
proteina int not null,
carboidrato int not null, 
gorduras int not null,
foreign key (matricula) references registro(matricula)
);

insert into userinfo (matricula, idade, altura, peso, sexo, atividadefisica) values 
('1', '18', '155', '53', 'Feminino', 'Regular'),
('2', '18', '175', '61', 'Masculino', 'Ativa'),
('3', '29', '170', '55', 'Masculino', 'Nula'),
('4', '19', '160', '58', 'Masculino', 'Nula'),
('5', '21', '180', '70', 'Masculino', 'Regular'),
('6', '18', '170', '70', 'Masculino', 'Ativa'),
('7', '25', '178', '58', 'Feminino', 'Regular'),
('8', '18', '155', '48', 'Feminino', 'Regular'),
('9', '22', '169', '59', 'Feminino', 'Nula'),
('10', '19', '173', '54', 'Feminino', 'Ativa');

select * from userinfo;
