-- Criando a base de dados
create database vendas_bd

--Tabela Produtos
create table produtos (
	id serial primary key,
  nome varchar(100),
  descricao text,
  preco int,
  quantidade_em_estoque int, 
  categoria_id int references categorias(id)
)

--Tabela categorias
create table categorias(
	id serial primary key,
  nome varchar(50)
)

--Tabela itens_do_pedido
create table itens_do_pedido(
	id serial primary key,
  pedido_id int references pedidos(id),
  quantidade int,
  produto_id int references produtos(id)
)

-- Pedidos
create table pedidos(
	id serial primary key,
  valor int, 
  cliente_cpf char(11) references clientes(cpf),
  vendedor_cpf char(11) references vendedores(cpf)
)

-- Clientes
create table clientes(
	cpf char(11) unique,
  nome varchar(150)
)

-- Vendedores
create table vendedores(
	cpf char(11) unique,
  nome varchar(150)
)

-- Alimentando a tabela categorias
insert into categorias (nome) values ('frutas'), ('verduras'), ('massas'), ('bebidas'), ('utilidades')

-- Alimentando a tabela produtos
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Mamão', 'Rico em vitamina A, potássio e vitamina C', 300, 123, 1)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Maça', 'Fonte de potássio e fibras.', 90, 34, 1)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Abacate', 'NÃO CONTÉM GLÚTEN.', 150, 64, 1)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 2)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Acelga', 'NÃO CONTÉM GLÚTEN.', 235, 13, 2)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Macarrão parafuso', 'Uma reunião de família precisa ter comida boa e muita alegria', 875, 19, 3)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria.', 690, 5, 3)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Refrigerante coca cola', 'Sabor original', 350, 189, 4)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Refrigerante pepsi 2l', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.', 700, 12, 4)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 3, 5)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 9, 5)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Escova para dentes', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000, 44, 5)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290, 55, 5)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198, 176, 1)
insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values ('Uva', 'NÃO CONTÉM GLÚTEN.', 420, 90, 1)

-- Alimentando a categoria clientes
insert into clientes (cpf, nome) values ('80371350042', 'José Augusto Silva')
insert into clientes (cpf, nome) values ('67642869061', 'Antônio Oliveira')
insert into clientes (cpf, nome) values ('63193310034', 'Ana Rodrigues')
insert into clientes (cpf, nome) values ('75670505018', 'Maria da Conceição')

-- Alimentando a categoria
insert into vendedores (cpf, nome) values ('82539841031', 'Rodrigo Sampaio')
insert into vendedores (cpf, nome) values ('23262546003', 'Beatriz Souza Santos')
insert into vendedores (cpf, nome) values ('28007155023', 'Carlos Eduardo')

-- Realizando Operações com as Querys criadas:

-- Cliente José Augusto:
insert into pedidos (cliente_cpf, vendedor_cpf) values (80371350042, 28007155023)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (1, 1, 10)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (1, 1, 1)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (1, 6, 11)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (1, 5, 2)

-- Cliente Ana Rodrigues:
insert into pedidos (cliente_cpf, vendedor_cpf) values (63193310034, 23262546003)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (2, 10, 17)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (2, 3, 18)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (2, 5, 1)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (2, 10, 5)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (2, 2, 6)

-- Cliente Maria da Conceição:
insert into pedidos (cliente_cpf, vendedor_cpf) values (75670505018, 82539841031)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (3, 1, 16)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (3, 6, 18)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (3, 1, 7)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (3, 3, 1)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (3, 20, 5)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (3, 2, 6)

-- Cliente Maria da conceição:
insert into pedidos (cliente_cpf, vendedor_cpf) values (75670505018, 23262546003)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (4, 1, 13)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (4, 6, 12)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (4, 5, 17)

-- Cliente Antonio Oliveira:
insert into pedidos (cliente_cpf, vendedor_cpf) values (67642869061, 82539841031)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (5, 1, 8)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (5, 3, 17)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (5, 8, 5)
insert into itens_do_pedido (pedido_id, quantidade, produto_id) values (5, 2, 11)