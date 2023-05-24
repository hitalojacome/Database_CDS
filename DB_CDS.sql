CREATE DATABASE db_CDS
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE db_CDS;

CREATE TABLE tb_artistas(
	cod_artista INT AUTO_INCREMENT,
    nome_artista VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Artistas PRIMARY KEY (cod_artista)
) DEFAULT CHARSET = utf8mb4;
    
CREATE TABLE tb_gravadoras(
	cod_gravadora INT AUTO_INCREMENT,
    nome_gravadora VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Gravadoras PRIMARY KEY (cod_gravadora)
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE tb_categorias(
	cod_categoria INT AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Categorias PRIMARY KEY (cod_categoria)
) DEFAULT CHARSET = utf8mb4;
    
CREATE TABLE tb_estados(
	sigla_estado CHAR(2) NOT NULL,
    nome_estado VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Estados PRIMARY KEY (sigla_estado)
) DEFAULT CHARSET = utf8mb4;
    
CREATE TABLE tb_cidades(
	cod_cidade INT AUTO_INCREMENT,
    sigla_estado CHAR(2) NOT NULL,
    nome_cidade VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Cidades PRIMARY KEY (cod_cidade),
    CONSTRAINT FK_Cidades_Estados FOREIGN KEY (sigla_estado)
		references tb_estados (sigla_estado)
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE tb_clientes(
	cod_cliente INT AUTO_INCREMENT,
    cod_cidade INT NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    end_cliente VARCHAR(200) NOT NULL,
    renda_cliente DECIMAL(10,2) NOT NULL,
    genero_cliente ENUM('M','F'),
	CONSTRAINT PK_Clientes PRIMARY KEY (cod_cliente),
    CONSTRAINT FK_Clientes_Cidades FOREIGN KEY (cod_cidade)
		REFERENCES tb_cidades (cod_cidade)
) DEFAULT CHARSET = utf8mb4;
    
CREATE TABLE tb_conjuges(
	cod_cliente INT NOT NULL PRIMARY KEY REFERENCES tb_clientes (cod_cliente),
    nome_conjuge VARCHAR(100) NOT NULL,
    renda_conjuge DECIMAL(10,2) NOT NULL,
    genero_conjuge ENUM('M','F')
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE tb_funcionarios(
	cod_funcionario INT AUTO_INCREMENT,
    nome_funcionario VARCHAR(100) NOT NULL,
    end_funcionario VARCHAR(200) NOT NULL,
    salario_funcionario DECIMAL(10,2) NOT NULL,
    genero_funcionario ENUM('M','F'),
    CONSTRAINT PK_Funcionarios primary key (cod_funcionario)
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE tb_dependentes(
	cod_dependente INT AUTO_INCREMENT,
    cod_funcionario INT NOT NULL,
    nome_dependente VARCHAR(100) NOT NULL,
    genero_dependente ENUM('M','F'),
    CONSTRAINT PK_Dependentes primary key (cod_dependente),
    CONSTRAINT FK_Dependentes_Funcionarios FOREIGN KEY (cod_funcionario)
		REFERENCES tb_funcionarios (cod_funcionario) 
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE tb_titulos(
	cod_titulo INT AUTO_INCREMENT,
    cod_categoria INT NOT NULL,
    cod_gravadora INT NOT NULL,
    nome_cd VARCHAR(100) NOT NULL,
    valor_cd DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    CONSTRAINT PK_Titulos PRIMARY KEY (cod_titulo),
    CONSTRAINT FK_Titulos_Categorias FOREIGN KEY (cod_categoria)
		REFERENCES tb_categorias (cod_categoria),
    CONSTRAINT FK_Titulos_Gravadoras FOREIGN KEY (cod_gravadora)
		REFERENCES tb_gravadoras (cod_gravadora)
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE tb_pedidos(
	numero_pedido INT AUTO_INCREMENT,
    cod_cliente INT NOT NULL,
    cod_funcionario INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    valor_pedido DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_Pedidos PRIMARY KEY (numero_pedido),
    CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (cod_cliente)
		REFERENCES tb_clientes (cod_cliente),
	CONSTRAINT FK_Pedidos_Funcionarios FOREIGN KEY (cod_funcionario)
		REFERENCES tb_funcionarios (cod_funcionario)
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE tb_tituloPedidos(
	numero_pedido INT NOT NULL,
    cod_titulo INT NOT NULL,
    quantidade_cd INT NOT NULL CHECK (quantidade_cd >= 1),
    valor_cd DECIMAL(10,2) NOT NULL CHECK (valor_cd > 0),
	CONSTRAINT PK_TitulosPedidos PRIMARY KEY (numero_pedido, cod_titulo),
	CONSTRAINT FK_TitulosPedidos_Pedidos FOREIGN KEY (numero_pedido)
		REFERENCES tb_pedidos (numero_pedido),
	CONSTRAINT FK_TitulosPedidos_Titulos FOREIGN KEY (cod_titulo)
		REFERENCES tb_titulos (cod_titulo)
) DEFAULT CHARSET = utf8mb4;

CREATE TABLE tb_tituloArtistas(
	cod_titulo INT NOT NULL,
    cod_artista INT NOT NULL,
    CONSTRAINT PK_TitulosArtistas PRIMARY KEY (cod_artista, cod_titulo),
	CONSTRAINT FK_TitulosArtistas_Titulos FOREIGN KEY (cod_titulo)
		REFERENCES tb_titulos (cod_titulo),
	CONSTRAINT FK_TitulosArtistas_Artistas FOREIGN KEY (cod_artista)
		REFERENCES tb_artistas (cod_artista)
) DEFAULT CHARSET = utf8mb4;

	
    