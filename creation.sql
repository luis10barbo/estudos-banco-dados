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
    idComprador int,
    idProduto int,
    quantidade int,
    
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
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("PE", "Recife", "Uma rua legal aqui", 290);
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua Nelson Mesquita", 1466);
INSERT INTO endereco (estado, cidade, rua, numero, complemento) VALUES ("AC", "Rio Branco", "Rua Tiao Natureza", 2585, "Perto do supermercado");
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua Aquarios", 1931);
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua Londrina", 404);
INSERT INTO endereco (estado, cidade, rua, numero, complemento) VALUES ("AC", "Rio Branco", "Avenida Adalberto Sena", 1409, "Ao lado de um banco");
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua Alagoas", 1450);
INSERT INTO endereco (estado, cidade, rua, numero) VALUES ("AC", "Rio Branco", "Rua da Alegria", 1846);
INSERT INTO endereco (estado, cidade, rua, numero, complemento) VALUES ("AC", "Rio Branco", "Rua Alercio Dias", 2520, "Casa amarela");

# USUARIO
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("luis10barbo", "SenhaIndecifravelEncriptada", "Luis", 1);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Miguel52", "1547406254", "Miguel", 2);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Arthur14", "3075323201", "Arthur", 3);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Heitor36", "4000582786", "Heitor", 4);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Helena18", "2039936761", "Helena", 5);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Alice25", "2481533379", "Alice", 6);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Theo63", "705002875", "Theo", 7);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Davi21", "2366450506", "Davi", 8);
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario, idEndereco) VALUES ("Laura29", "2021704977", "Laura", 9);

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

