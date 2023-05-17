# Deletar todas as tabelas para modifica-las sem precisar usar o ALTER. OBS: TODOS DADOS SERAM DELETADOS
DROP TABLE IF EXISTS usuario, produto, endereco, compra;

CREATE TABLE usuario (
	idUsuario int AUTO_INCREMENT,
    idEndereco int,
    
    apelidoUsuario varchar(16) UNIQUE NOT NULL,
    senhaUsuario varchar(64) NOT NULL,
    nomeUsuario varchar(32),
    
    PRIMARY KEY (idUsuario)
);

CREATE TABLE produto (
	idProduto int AUTO_INCREMENT,
    idVendedor int NOT NULL,
    
    nomeProduto varchar(32) NOT NULL,
    precoProduto float(5) NOT NULL,
    estoqueProduto int NOT NULL,
    
    PRIMARY KEY (idProduto)
);

CREATE TABLE endereco (
	idEndereco int AUTO_INCREMENT,
    
    estado varchar(32),
    cidade varchar(32),
    rua varchar(64),
    numero int,
    complemento varchar(128),
    
    PRIMARY KEY (idEndereco)
);

CREATE TABLE compra (
	idCompra int AUTO_INCREMENT,
    idComprador int NOT NULL,
    idProduto int NOT NULL,
    quantidade int NOT NULL,
    
    PRIMARY KEY (idCompra)
);

ALTER TABLE usuario
ADD FOREIGN KEY (idEndereco) REFERENCES endereco(idEndereco);

ALTER TABLE produto
ADD FOREIGN KEY (idVendedor) REFERENCES usuario(idUsuario);

ALTER TABLE compra
ADD FOREIGN KEY (idComprador) REFERENCES usuario(idUsuario),
ADD FOREIGN KEY (idProduto) REFERENCES produto(idProduto);


# INSERTS
#ENDERECO
-- title: waga
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("PE", "Recife", "Uma rua legal aqui", 290); # Insere endereco em Pernambuco Recife, rua legal 290
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua Nelson Mesquita", 1466); 
INSERT INTO endereco (estado, cidade, rua, numero, complemento) VALUES ("AC", "Rio Branco", "Rua Tiao Natureza", 2585, "Perto do supermercado"); # Endereco AC, rio branco, rua tiao natureza 2585 perto de um supermercado
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua Aquarios", 1931);
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua Londrina", 404);
INSERT INTO endereco (estado, cidade, rua, numero, complemento) VALUES ("AC", "Rio Branco", "Avenida Adalberto Sena", 1409, "Ao lado de um banco");
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua Alagoas", 1450);
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua da Alegria", 1846);
INSERT INTO endereco (estado, cidade, rua, numero, complemento) VALUES ("AC", "Rio Branco", "Rua Alercio Dias", 2520, "Casa amarela");

# USUARIO
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("luis10barbo", "SenhaIndecifravelEncriptada", "Luis", 1);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, idEndereco) VALUES ("Miguel52", "1547406254",  2);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, idEndereco) VALUES ("Arthur14", "3075323201", 3);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Heitor36", "4000582786", "Heitor", 4);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Helena18", "2039936761", "Helena", 5);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Alice25", "2481533379", "Alice", 6);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Theo63", "705002875", "Theo", 7);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Davi21", "2366450506", "Davi", 8);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, idEndereco) VALUES ("Laura29", "2021704977", 9);

#PRODUTOS
INSERT INTO produto (idVendedor, nomeProduto, precoProduto, estoqueProduto) VALUES (1, "Pasta Termica", 30.99, 10);
INSERT INTO produto (idVendedor, nomeProduto, precoProduto, estoqueProduto) VALUES (6, "Bala 7-bello rara", 9040.30, 1);
INSERT INTO produto (idVendedor, nomeProduto, precoProduto, estoqueProduto) VALUES (7, "Caderno do Davi", 1.99, 1);
INSERT INTO produto (idVendedor, nomeProduto, precoProduto, estoqueProduto) VALUES (1, "Mouse usado", 100.99, 1);
INSERT INTO produto (idVendedor, nomeProduto, precoProduto, estoqueProduto) VALUES (5, "Vestido Rosa", 60.99, 1);
INSERT INTO produto (idVendedor, nomeProduto, precoProduto, estoqueProduto) VALUES (9, "Notebook HP 7a geracao", 735.00, 1);
INSERT INTO produto (idVendedor, nomeProduto, precoProduto, estoqueProduto) VALUES (1, "Mousepad antigo", 12.00, 1);

#COMPRAS
INSERT INTO compra (idComprador, idProduto, quantidade) VALUES (2, 6, 1); # compra de um notebook por miguel
INSERT INTO compra (idComprador, idProduto, quantidade) VALUES (2, 4, 1); # compra de um mouse usado por miguel
INSERT INTO compra (idComprador, idProduto, quantidade) VALUES (2, 7, 1); # compra de um mousepad por miguel
INSERT INTO compra (idComprador, idProduto, quantidade) VALUES (9, 5, 1); # compra de um vestido por laura
INSERT INTO compra (idComprador, idProduto, quantidade) VALUES (2, 1, 2); # miguel compra duas pastas termica


SELECT * FROM produto;
SELECT * FROM usuario;
SELECT * FROM endereco;
SELECT * FROM compra;

# Items vendidos por usuarios
SELECT uv.apelidoUsuario AS apelidoVendedor, uv.nomeUsuario AS nomeVendedor, p.nomeProduto, p.precoProduto
FROM usuario AS uv
INNER JOIN produto AS p
ON uv.idUsuario = p.idVendedor;

# Items comprados
SELECT uc.apelidoUsuario AS apelidoComprador, uc.nomeUsuario AS nomeComprador, uv.apelidoUsuario AS apelidoVendedor, uv.nomeUsuario AS nomeVendedor,  p.nomeProduto, p.precoProduto, c.quantidade
FROM compra AS c
	INNER JOIN usuario AS uc
	ON c.idComprador = uc.idUsuario
    INNER JOIN produto AS p
    ON c.idProduto = p.idProduto
    INNER JOIN usuario AS uv
    ON p.idVendedor = uv.idUsuario;

# usuarios e onde elas moram
SELECT u.apelidoUsuario, u.nomeUsuario, e.* 
FROM endereco AS e
INNER JOIN usuario as u
ON u.idEndereco = e.idEndereco


