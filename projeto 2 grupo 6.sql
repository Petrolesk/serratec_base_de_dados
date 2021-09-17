create table usuario(
id_usuario integer primary key not null,
nome text unique,
nome_usuario text unique,
endereco text,
telefone integer unique,
email text unique,
cpf integer unique,
nascimento integer
)

create table cadastro_prod (
id_prod integer primary key not null,
nome text unique,
descricao text unique,
data_fabricacao integer,
valor_unit integer,
id_categoria integer,
id_usuario integer
)

create table estoque (
id_estoque integer primary key not null,
quant_estoque integer,
fk_prod integer
);

create table carrinho (
id_carrinho integer primary key not null,
quant_comprada integer,
fk_venda integer
);

create table faturamento (
id_faturamento integer primary key not null,
data_compra integer,
fk_carrinho integer
);

create table categoria (
id_categoria integer primary key not null,
desc_cat text
);

create table venda (
id_venda integer primary key not null,
fk_estoque integer,
fk_usuario integer
);

alter table cadastro_prod 
add foreign key (id_categoria) 
references categoria(id_categoria)

alter table estoque 
add foreign key (fk_prod) 
references cadastro_prod(id_prod)

alter table estoque 
add foreign key (id_estoque) 
references estoque(id_estoque)

alter table cadastro_prod 
add foreign key (id_usuario) 
references usuario(id_usuario)

alter table venda 
add foreign key (fk_usuario) 
references usuario(id_usuario)

alter table venda 
add foreign key (fk_estoque) 
references estoque(id_estoque)

alter table carrinho 
add foreign key (fk_venda) 
references venda(id_venda)

alter table faturamento 
add foreign key (fk_carrinho) 
references carrinho(id_carrinho)

