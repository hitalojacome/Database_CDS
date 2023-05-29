INSERT INTO tb_artistas VALUES 
(NULL, '2pac'),
(NULL, 'Michael Jackson'),
(NULL, 'Snoop Dogg'),
(NULL, 'Eminem'),
(NULL, 'Gorillaz'),
(NULL, 'NWA'),
(NULL, 'Sabotage'),
(NULL, 'Queen'),
(NULL, 'John Lennon'),
(NULL, 'Racionais');

INSERT INTO tb_gravadoras VALUES 
(NULL, 'Death Row Records'),
(NULL, 'The Jackson 5'),
(NULL, 'Doggystyle Records'),
(NULL, 'Shady Records'),
(NULL, 'Parlophone Records'),
(NULL, 'Ruthless Records'),
(NULL, 'Casa Nostra Fonográfica'),
(NULL, 'Capitol Records');

INSERT INTO tb_categorias VALUES 
(NULL, 'Rap'),
(NULL, 'Pop'),
(NULL, 'Hip-hop'),
(NULL, 'Shady Records'),
(NULL, 'Indie'),
(NULL, 'Boombap'),
(NULL, 'Rock');

INSERT INTO tb_estados VALUES 
('NY', 'New York'),
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro'),
('MG', 'Minas Gerais'),
('BA', 'Bahia'),
('FL', 'Florida'),
('CA', 'California');

INSERT INTO tb_cidades VALUES 
(NULL, 'NY', 'New York'),
(NULL, 'SP', 'São Paulo'),
(NULL, 'RJ', 'Rio de Janeiro'),
(NULL, 'MG', 'Belo Horizonte'),
(NULL, 'FL', 'Orlando'),
(NULL, 'CA', 'Los Angeles');

INSERT INTO tb_clientes VALUES
(NULL, 1, 'Beatriz Palermo', 'Franklin ST, 78', '8000', 'F'),
(NULL, 2, 'Hitalo Jacome', 'Rua Piauiense, 346', '10000', 'M'),
(NULL, 3, 'Rafael Vega', 'Avenida Atlântica, 1366', '3600', 'M'),
(NULL, 4, 'Gisele Fagundes', 'Avenida Antonio CARLOS, 765', '15000', 'F'),
(NULL, 5, 'Pedro Domingues', 'Rua A, 666', '4356', 'M'),
(NULL, 6, 'Samantha dos Santos', 'Rua B, 653', '2345', 'F');

INSERT INTO tb_conjuges VALUES
(2, 'Helena Jacome', '2700', 'F'),
(3, 'Brenda Vega', '3600', 'F'),
(6, 'Frederico dos Santos', '2300', 'M');

INSERT INTO tb_funcionarios VALUES
(NULL, 'Paula Palermo', 'Rod. Raposo Tavarez, 1760', '8000', 'F'),
(NULL, 'Kevin Almeida', 'Rua das Palmas, 211', '3400', 'M'),
(NULL, 'Thiago Veigh', 'Avenida dos Predios, 777', '5876', 'M'),
(NULL, 'Guilherme Aparecido Dantas', 'Avenida Antonio Agu, 1992', '15000', 'M'),
(NULL, 'Thays Oliveira', 'Rua 3, 782', '1546', 'F'),
(NULL, 'Blenda da Silva', 'Rua 6, 6653', '7300', 'F');

INSERT INTO tb_dependentes VALUES
(NULL, 1, 'Raquel Palermo', 'F'),
(NULL, 3, 'Ryan Veigh', 'M'),
(NULL, 5, 'Guilherme Junior', 'M'),
(NULL, 6, 'Lorena da Silva', 'F');

INSERT INTO tb_titulos VALUES
(NULL, 1, 1, 'Album 1', 13.99, 30),
(NULL, 5, 2, 'Album 2', 16.99, 100),
(NULL, 3, 5, 'Album 3', 20.99, 78),
(NULL, 6, 3, 'Album 4', 10.77, 20),
(NULL, 4, 4, 'Album 5', 200, 8000);

INSERT INTO tb_pedidos VALUES
(NULL, 2, 5, '2023-05-24', 65.99),
(NULL, 1, 4, '2022-12-25', 77.70),
(NULL, 5, 2, '2020-08-12', 123.76),
(NULL, 1, 1, '2002-05-28', 360.87),
(NULL, 4, 2, '2002-12-08', 720.80);

INSERT INTO tb_tituloPedidos VALUES
(3, 6, 6, 32.55),
(2, 8, 7, 18.99),
(1, 5, 3, 26.70);

INSERT INTO tb_tituloArtistas VALUES
(7, 3),
(6, 4),
(8, 1),
(5, 6);