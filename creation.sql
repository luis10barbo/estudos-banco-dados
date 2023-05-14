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
    
    PRIMARY KEY (idCompra)
);

ALTER TABLE usuario
ADD FOREIGN KEY (idEndereco) REFERENCES endereco(idEndereco);

ALTER TABLE produto
ADD FOREIGN KEY (idVendedor) REFERENCES usuario(idUsuario);

ALTER TABLE endereco
ADD FOREIGN KEY (idMorador) REFERENCES usuario(idUsuario);

ALTER TABLE compra
ADD FOREIGN KEY (idComprador) REFERENCES usuario(idUsuario),
ADD FOREIGN KEY (idProduto) REFERENCES produto(idProduto);


# INSERTS
# USUARIO
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("luis10barbo", "algumasenhaaqui", "Luisusuario");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Miguel52", "3734329721", "Miguel");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Arthur56", "4245316934", "Arthur");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Heitor18", "2995576518", "Heitor");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Helena47", "2630309513", "Helena");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Alice62", "3692792903", "Alice");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Theo1", "211654162", "Theo");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Davi55", "1314365787", "Davi");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Laura43", "765783112", "Laura");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Gabriel57", "1771785690", "Gabriel");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Gael14", "2510890275", "Gael");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Bernardo26", "1064661659", "Bernardo");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Samuel19", "2424053827", "Samuel");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Valentina23", "2838496572", "Valentina");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Joao25", "3140275278", "Joao");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Enzo23", "1742573154", "Enzo");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Heloisa24", "1579826639", "Heloisa");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Pedro37", "3950412910", "Pedro");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Lorenzo60", "2366171742", "Lorenzo");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Sophia1", "3983918613", "Sophia");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Maria49", "1326434087", "Maria");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Maria19", "2208853252", "Maria");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Maria53", "56902735", "Maria");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Lorena4", "180604824", "Lorena");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Lucas28", "3429673822", "Lucas");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Manuela62", "2466367924", "Manuela");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Cecilia40", "394705415", "Cecilia");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Maria44", "782508116", "Maria");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Benicio32", "3913643117", "Benicio");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Julia31", "3257346563", "Julia");
INSERT INTO usuario (apelidoUsuario, senhaUsuario, nomeUsuario) VALUES ("Isabella51", "1465867092", "Isabella");

#ENDERECO
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (1, "AC", "Rio Branco", "Rua Nelson Mesquita", 3138);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (2, "AC", "Rio Branco", "Rua Tiao Natureza", 1796);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (3, "AC", "Rio Branco", "Rua Aquarios", 4029);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (4, "AC", "Rio Branco", "Rua Londrina", 3764);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (5, "AC", "Rio Branco", "Avenida Adalberto Sena", 2457);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (6, "AC", "Rio Branco", "Rua Alagoas", 1331);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (7, "AC", "Rio Branco", "Rua da Alegria", 1585);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (8, "AC", "Rio Branco", "Rua Alercio Dias", 3966);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (9, "AC", "Rio Branco", "Rua Alexandre Leitao", 547);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (10, "AC", "Rio Branco", "Rua Aluizio Bezerra", 4084);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (11, "AC", "Rio Branco", "Rua Alvaro Dantas", 3155);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (12, "AC", "Rio Branco", "Travessa Amapa", 253);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (13, "AC", "Rio Branco", "Rua Amazonas", 2596);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (14, "AC", "Rio Branco", "Rua Ana Nery", 92);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (15, "AC", "Rio Branco", "Travessa Antimari", 2387);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (16, "AC", "Rio Branco", "Rua Antonio Boto", 81);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (17, "AC", "Rio Branco", "Rua Antonio Camelo", 2041);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (18, "AC", "Rio Branco", "Rua Antonio Jose Nogueira", 1477);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (19, "AC", "Rio Branco", "Rua Antunes de Alencar", 2360);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (20, "AC", "Rio Branco", "Alameda Araras", 2840);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (21, "AC", "Rio Branco", "Rua Ari Rodrigues", 234);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (22, "AC", "Rio Branco", "Rua Ari Rodrigues", 2967);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (23, "AC", "Rio Branco", "Rua Arlindo Porto Leal", 1602);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (24, "AC", "Rio Branco", "Alameda Atenas", 577);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (25, "AC", "Rio Branco", "Alameda Australia", 431);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (26, "AC", "Rio Branco", "Alameda Azaleas", 2686);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (27, "AC", "Rio Branco", "Rua B", 2129);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (28, "AC", "Rio Branco", "Travessa Baguari", 307);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (29, "AC", "Rio Branco", "Rua Barao do Rio Branco", 1147);
INSERT INTO endereco (idMorador, estado, cidade, rua, numero) VALUES (30, "AC", "Rio Branco", "Rua Barbosa Lima", 2931);
