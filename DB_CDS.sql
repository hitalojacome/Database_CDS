create database db_CDS;
use db_CDS;

create table tb_artistas(
	idartista int auto_increment not null,
    desnome varchar(100) not null,
    constraint PK_artistas primary key (idartista)
    );
    
create table tb_gravadoras(
	idgravadora int auto_increment not null,
    desnome varchar(50) not null,
    constraint PK_gravadora primary key (idgravadora)
    );

create table tb_categorias(
	idcategoria int auto_increment not null,
    desnome varchar(50) not null,
    constraint PK_categoria primary key (idcategoria)
    );
    
create table tb_estados(
	siglaestado varchar(2) not null,
    desnome varchar(50) not null,
    constraint PK_estado primary key (siglaestado)
    );
    
create table tb_cidades(
	idcidade int auto_increment not null,
    siglaestado varchar(2) not null,
    desnome varchar(100) not null,
    constraint PK_cidades primary key (idcidade),
    constraint FK_cidades_estado foreign key (siglaestado)
		references tb_estados (siglaestado)
    );

create table tb_clientes(
	idcliente int auto_increment not null,
    idcidade int not null,
    desnome varchar(100) not null,
    desendereco varchar(200) not null,
    vlrenda decimal(10,2) not null,
    desgenero enum('M','F'),
	constraint PK_clientes primary key (idcliente),
    constraint FK_clientes_cidade foreign key (idcidade)
		references tb_cidades (idcidade)
    );
    
create table tb_conjuges();

create table tb_funcionarios(
	idfuncionario int auto_increment not null,
    desnome varchar(100) not null,
    desendereco varchar(200) not null,
    vlsalario decimal(10,2) not null,
    desgenero enum('M','F'),
    constraint PK_funcionarios primary key (idfuncionario)
);

create table tb_dependentes(
	iddependente int auto_increment not null,
    idfuncionario int not null,
    desnome varchar(100) not null,
    desgenero enum('M','F'),
    constraint PK_dependentes primary key (iddependente),
    constraint FK_dependentes_funcionario foreign key (idfuncionario)
		references tb_funcionarios (idfuncionario) 
);

create table tb_titulos(
	idtitulo int auto_increment not null,
    idgravadora int not null,
    idcategoria int not null,
    desnome varchar(100) not null,
    vlcd decimal(10,2) not null,
    desQuantidadeEstoque int not null,
    constraint PK_titulos primary key (idtitulo),
    constraint FK_titulos_gravadora foreign key (idgravadora)
		references tb_gravadoras (idgravadora),
    constraint FK_titulos_categoria foreign key (idcategoria)
		references tb_categorias (idcategoria)
);

create table tb_pedidos(
	idpedido int auto_increment not null,
    idcliente int not null,
    idfuncionario int not null,
    dtabertura date not null,
    vlpedido decimal(10,2) not null,
    constraint PK_pedidos primary key (idpedido),
    constraint FK_pedidos_cliente foreign key (idcliente)
		references tb_clientes (idcliente),
	constraint FK_pedidos_funcionario foreign key (idfuncionario)
		references tb_funcionarios (idfuncionario)
);

create table tb_TituloPedidos();

create table tb_TituloArtistas();
	
    