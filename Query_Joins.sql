SELECT c.nome_categoria, t.nome_cd FROM tb_categorias c JOIN tb_titulos t WHERE t.cod_categoria = c.cod_categoria;

SELECT p.numero_pedido, cli.nome_cliente FROM tb_pedidos p JOIN tb_clientes cli WHERE p.cod_cliente = cli.cod_cliente;

SELECT f.nome_funcionario AS NomeFuncionario, d.nome_dependente AS NomeDependente 
FROM tb_funcionarios f JOIN tb_dependentes d WHERE d.cod_funcionario = f.cod_funcionario;

SELECT f.nome_funcionario AS NomeFuncionario, p.valor_pedido AS ValorPedidos 
FROM tb_funcionarios f JOIN tb_pedidos p WHERE p.cod_funcionario = f.cod_funcionario;

SELECT cli.nome_cliente, cid.nome_cidade FROM tb_clientes cli JOIN tb_cidades cid 
ON cli.cod_cidade = cid.cod_cidade WHERE cli.genero_cliente ='F'; 

SELECT t.nome_cd, g.nome_gravadora FROM tb_titulos t JOIN tb_gravadoras g 
ON t.cod_gravadora = g.cod_gravadora WHERE t.nome_cd LIKE 'R%' OR t.nome_cd LIKE 'T%';

SELECT g.nome_gravadora, t.nome_cd, t.valor_cd, t.quantidade_estoque
FROM tb_titulos t JOIN tb_gravadoras g ON t.cod_gravadora = g.cod_gravadora WHERE t.quantidade_estoque < '500';

SELECT cli.nome_cliente, p.valor_pedido FROM tb_clientes cli JOIN tb_pedidos p ON p.cod_cliente = cli.cod_cliente 
WHERE cli.genero_cliente = 'F' AND YEAR (p.data_pedido) = 2002 AND MONTH (p.data_pedido) = 6;

SELECT p.numero_pedido, p.valor_pedido, p.data_pedido, f.nome_funcionario FROM tb_pedidos p JOIN tb_funcionarios f 
ON p.cod_funcionario = f.cod_funcionario WHERE YEAR (p.data_pedido) = 2003 AND f.nome_funcionario LIKE 'Paula%';

SELECT p.numero_pedido, cli.nome_cliente FROM tb_pedidos p JOIN tb_clientes cli ON p.cod_cliente = cli.cod_cliente
WHERE p.valor_pedido = (SELECT MAX(valor_pedido) FROM tb_pedidos);

SELECT DISTINCT a.nome_artista, c.nome_categoria FROM tb_artistas a 
JOIN tb_tituloartistas ta ON a.cod_artista = ta.cod_artista 
JOIN tb_titulos t ON ta.cod_titulo = t.cod_titulo
JOIN tb_categorias c ON t.cod_categoria = c.cod_categoria;

SELECT cli.nome_cliente, f.nome_funcionario FROM tb_clientes cli 
JOIN tb_pedidos p ON cli.cod_cliente = p.cod_cliente
JOIN tb_funcionarios f ON p.cod_funcionario = f.cod_funcionario;

SELECT cli.nome_cliente, t.nome_cd FROM tb_clientes cli
JOIN tb_pedidos p ON cli.cod_cliente = p.cod_cliente
JOIN tb_titulopedidos tp ON p.numero_pedido = tp.numero_pedido
JOIN tb_titulos t ON tp.cod_titulo = t.cod_titulo;

SELECT t.nome_cd, g.nome_gravadora, c.nome_categoria FROM tb_titulos t
JOIN tb_gravadoras g ON t.cod_gravadora = g.cod_gravadora
JOIN tb_categorias c ON t.cod_categoria = c.cod_categoria;

SELECT f.nome_funcionario, d.nome_dependente, cli.nome_cliente, con.nome_conjuge
FROM tb_funcionarios f JOIN tb_dependentes d ON f.cod_funcionario = d.cod_funcionario
JOIN tb_clientes cli ON f.cod_funcionario = cli.cod_cliente
JOIN tb_conjuges con ON cli.cod_cliente = con.cod_cliente;

SELECT cli.nome_cliente, f.nome_funcionario, t.nome_cd, c.nome_categoria, g.nome_gravadora
FROM tb_clientes cli 
JOIN tb_pedidos p ON cli.cod_cliente = p.cod_cliente
JOIN tb_funcionarios f ON p.cod_funcionario = f.cod_funcionario
JOIN tb_titulopedidos tp ON p.numero_pedido = tp.numero_pedido
JOIN tb_titulos t ON tp.cod_titulo = t.cod_titulo
JOIN tb_categorias c ON t.cod_categoria = c.cod_categoria
JOIN tb_gravadoras g ON t.cod_gravadora = g.cod_gravadora;