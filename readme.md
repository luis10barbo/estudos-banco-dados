
# USUARIO
|Atributo|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idUsuario|Numero identificador do usuario|Int|-|PK - PRIMARY KEY|AUTO_INCREMENT|
|apelidoUsuario|Apelido (nickname) indentificador do usuario|Varchar|16|NOT NULL|-
|senhaUsuario| Senha encriptada do usuário|Varchar|64|NOT NULL|-
|nomeUsuario| Nome real do usuario|Varchar|32|-|-|

# PRODUTO
|Atributo|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idProduto|Numero indentificador do produto|Int|-|PK - PRIMARY KEY| AUTO_INCREMENT
|idVendedor|Numero indentificador do vendedor (usuario) | Int | - | FK - FOREIGN KEY (usuario.idUsuario), NOT NULL| -
|nomeProduto|Nome do produto|Varchar|32|NOT NULL|-|
|precoProduto|Preco do produto|Float(5)|-|NOT NULL|-

# COMPRA
|Atributo|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idCompra|Numero indentificador da compra|Int|-|PK - PRIMARY KEY| AUTO_INCREMENT
|idComprador|Numero indentificador do comprador (usuario)|Int|-|FK - FOREIGN KEY (usuario.idUsuario)|-
|idProduto|Numero indentificador do produto (produto)|Int|-|FK - FOREIGN KEY (produto.idProduto)|-

# ENDERECO
|Atributo|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idEndereco|Numero indentificador do endereco|Int|-|PK - PRIMARY KEY| AUTO_INCREMENT
|idMorador|Numero indentificador do morador (usuario) do endereco|Int| -|NOT NULL|-
|estado|Estado do endereco|Varchar|32|-|-
|cidade|Cidade do endereco|Varchar|32|-|-
|rua|Rua do endereco|Varchar|64|-|-
|numero|Numero do endereco|Int|-|-|-
|complemento|Complemento do endereco|Varchar|128|-|-
