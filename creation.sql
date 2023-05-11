# Deletar todas as tabelas para modifica-las sem precisar usar o ALTER. OBS: TODOS DADOS SERAM DELETADOS
DROP TABLE IF EXISTS usuario, produto, endereco, compra;

CREATE TABLE usuario (
	idUsuario int AUTO_INCREMENT,
    idEndereco int,
    
    apelidoUsuario varchar(32) UNIQUE NOT NULL,
    senhaUsuario varchar(64) NOT NULL,
    nomeUsuario varchar(32),
    
    PRIMARY KEY (idUsuario)
);

CREATE TABLE produto (
	idProduto int AUTO_INCREMENT,
    idVendedor int NOT NULL,
    idCompra int,
    
    nomeProduto varchar(32) NOT NULL,
    precoProduto float(5) NOT NULL,
    
    PRIMARY KEY (idProduto)
);

CREATE TABLE endereco (
	idEndereco int AUTO_INCREMENT,
    idMorador int NOT NULL,
    
    estado varchar(32),
    cidade varchar(32),
    logradouro varchar(64),
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
ADD FOREIGN KEY (idCompra) REFERENCES compra(idCompra),
ADD FOREIGN KEY (idVendedor) REFERENCES usuario(idUsuario);

ALTER TABLE endereco
ADD FOREIGN KEY (idMorador) REFERENCES usuario(idUsuario);

ALTER TABLE compra
ADD FOREIGN KEY (idComprador) REFERENCES usuario(idUsuario),
ADD FOREIGN KEY (idProduto) REFERENCES produto(idProduto);
