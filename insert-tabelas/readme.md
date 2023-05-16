
# USUARIO
|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idUsuario|Numero identificador do usuario|Int|-|PK - PRIMARY KEY|AUTO_INCREMENT|
|idEndereco|Numero indentificador do endereco usuario|Int|-|FK - FOREIGN KEY (endereco.enderecoId)| -
|apelidoUsuario|Apelido (nickname) indentificador do usuario|Varchar|16|NOT NULL, UNIQUE|-
|senhaUsuario| Senha encriptada do usuário|Varchar|64|NOT NULL|-
|nomeUsuario| Nome real do usuario|Varchar|32|-|-|

# PRODUTO
|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idProduto|Numero indentificador do produto|Int|-|PK - PRIMARY KEY| AUTO_INCREMENT
|idVendedor|Numero indentificador do vendedor (usuario) | Int | - | FK - FOREIGN KEY (usuario.idUsuario), NOT NULL| -
|nomeProduto|Nome do produto|Varchar|32|NOT NULL|-|
|precoProduto|Preco do produto|Float(5)|-|NOT NULL|-
|estoqueProduto|Quantidade do produto disponivel para compra|Int|-|-|-|

# COMPRA
|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idCompra|Numero indentificador da compra|Int|-|PK - PRIMARY KEY| AUTO_INCREMENT
|idComprador|Numero indentificador do comprador (usuario)|Int|-|FK - FOREIGN KEY (usuario.idUsuario)| NOT NULL
|idProduto|Numero indentificador do produto (produto)|Int|-|FK - FOREIGN KEY (produto.idProduto)|NOT NULL
|quantidade|Quantidade de produtos comprados|Int|-|-|NOT NULL

# ENDERECO
|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idEndereco|Numero indentificador do endereco|Int|-|PK - PRIMARY KEY| AUTO_INCREMENT
|idMorador|Numero indentificador do morador (usuario) do endereco|Int| -|NOT NULL|-
|estado|Estado do endereco|Varchar|32|-|-
|cidade|Cidade do endereco|Varchar|32|-|-
|rua|Rua do endereco|Varchar|64|-|-
|numero|Numero do endereco|Int|-|-|-
|complemento|Complemento do endereco|Varchar|128|-|-
