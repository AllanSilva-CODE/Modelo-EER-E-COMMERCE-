Create DATABASE Ecommerce_Instrumentos_musicais;
show DATABASES;
use ecommerce_Instrumentos_musicais;
commit;


# tabela de clientes 
CREATE TABLE Cliente (
    Idcliente INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15) NOT NULL,
    Lname VARCHAR(15) NOT NULL,
    CPF CHAR(11) NOT NULL,
    UF CHAR(2) NOT NULL,
    City VARCHAR(35) NOT NULL,
    Neighborhood VARCHAR(35),
    Road VARCHAR(50),
    Date_of_birth DATE,
    Phone CHAR(11) NOT NULL,
    Email VARCHAR(45),
    Gender ENUM('M','F', 'Outro') NOT NULL,
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF)
);
alter TABLE Cliente AUTO_INCREMENT=1; # para a inserçao dos dados nao dá erro

# tabela de cadastro para empresa
CREATE TABLE Empresa (
    Idcompany INT AUTO_INCREMENT PRIMARY KEY,
    Company_name VARCHAR(30) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    UF CHAR(2) NOT NULL,
    City VARCHAR(35) NOT NULL,
    Neighborhood VARCHAR(35) NOT NULL,
    Road VARCHAR(50),
    Phone CHAR(11) NOT NULL,
    Email VARCHAR(45),
    CONSTRAINT unique_cnpj_empresa UNIQUE (CNPJ)
);
alter TABLE Empresa AUTO_INCREMENT=1;

# tabela login para cliente ou empresa
CREATE TABLE Login (
    Idlogin INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_usuario ENUM('cliente','empresa') NOT NULL,
    Username VARCHAR(30) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL,
    Idcliente INT,
    Idempresa INT,
    FOREIGN KEY (Idcliente) REFERENCES Cliente(Idcliente) ON DELETE CASCADE,
    FOREIGN KEY (Idempresa) REFERENCES Empresa(Idcompany) ON DELETE CASCADE
);
alter TABLE Login AUTO_INCREMENT=1;
drop TABLE Pedidos;
# tabela pedidos
CREATE TABLE Pedidos (
    Idpedido INT AUTO_INCREMENT PRIMARY KEY,
    Data_pedido DATE NOT NULL,
    Status_pedido ENUM('pendente', 'pago', 'cancelado') DEFAULT 'pendente',
    Preço_total DECIMAL(10,2) NOT NULL,
    Valor_frete DECIMAL(10,2) NOT NULL,
    Codigo_rastreio VARCHAR(25) NOT NULL,
    Id_cliente INT,
    Id_empresa INT,
    FOREIGN KEY (Id_cliente) REFERENCES Cliente(Idcliente) ON DELETE CASCADE,
	FOREIGN KEY (Idempresa) REFERENCES Empresa(Idcompany) ON DELETE CASCADE
);
alter TABLE Pedidos AUTO_INCREMENT=1;

# # tabela modo de pagamento 
CREATE TABLE Forma_pagamento (
    idforma_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_pagamento ENUM('cartão', 'pix','boleto') NOT NULL,
    idpedido INT,
    FOREIGN KEY (idpedido) REFERENCES Pedidos(Idpedido)
);
alter TABLE Forma_pagamento AUTO_INCREMENT=1;

# tabela modo de pagamento 'cartao'
CREATE TABLE cartao_credito (
    idcartao INT AUTO_INCREMENT PRIMARY KEY,
    numero_cartao VARCHAR(16) NOT NULL,
    bandeira VARCHAR(20),
    idpedido INT,
    FOREIGN KEY (idpedido) REFERENCES Pedidos(Idpedido)
);
alter TABLE Cartao_credito AUTO_INCREMENT=1;

# tabela modo de pagamento 'pix'
CREATE TABLE Pix (
    idpix INT AUTO_INCREMENT PRIMARY KEY,
    Chave_pix VARCHAR(45) NOT NULL,
    idpedido INT,
    FOREIGN KEY (idpedido) REFERENCES Pedidos(Idpedido)
);
alter TABLE Pix AUTO_INCREMENT=1;

# tabela modo de pagamento 'boleto'
CREATE TABLE Boleto (
    idboleto INT AUTO_INCREMENT PRIMARY KEY,
    codigo_boleto VARCHAR(50) NOT NULL,
    data_vencimento DATE NOT NULL,
    idpedido INT,
    FOREIGN KEY (idpedido) REFERENCES Pedidos(Idpedido)
);
alter TABLE Boleto AUTO_INCREMENT=1;

# tabela produtos
CREATE TABLE Produtos ( 
    Idproduto INT AUTO_INCREMENT PRIMARY KEY,
    Nome_produto VARCHAR(50) NOT NULL,
    Categoria ENUM('corda','teclado','sopro','percussão') NOT NULL,
    Preço DECIMAL(10,2) NOT NULL,
    Avaliaçao ENUM('1', '2', '3', '4', '5'), # nota de 1 a 5
    Descricao VARCHAR(45) DEFAULT 'Sem descrição',
    Data_cadastro DATE NOT NULL
);
alter TABLE Produtos AUTO_INCREMENT=1;

# tabela de relaçao produtos/pedidos
CREATE TABLE Pedido_Produto (
    Idpedido INT,
    Idproduto INT,
    Quantidade INT DEFAULT 1,
    PRIMARY KEY (Idpedido, Idproduto),
    FOREIGN KEY (Idpedido) REFERENCES Pedidos(Idpedido) ON DELETE CASCADE,
    FOREIGN KEY (Idproduto) REFERENCES Produtos(Idproduto) ON DELETE CASCADE
);

# tabela vendedor
CREATE TABLE Vendedor (
    Idvendedor INT AUTO_INCREMENT PRIMARY KEY,
    Razao_social VARCHAR(45) NOT NULL UNIQUE,
    Nome_fantasia VARCHAR(44) NOT NULL,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    UF CHAR(2) NOT NULL,
    City VARCHAR(35) NOT NULL,
    Neighborhood VARCHAR(35),
    Road VARCHAR(50),
    Phone CHAR(11) NOT NULL,
    Email VARCHAR(45)
);
alter TABLE Vendedor AUTO_INCREMENT=1;

# tabela produtos/vendedor
CREATE TABLE Produtos_por_Vendedor (
    Status_quantidade ENUM('disponivel','sem Estoque') DEFAULT 'disponivel',
    Quantidade INT DEFAULT 1,
    Idproduto INT,
    Idvendedor INT,
    PRIMARY KEY(Idproduto, Idvendedor),
    FOREIGN KEY (Idproduto) REFERENCES Produtos(Idproduto),
    FOREIGN KEY (Idvendedor) REFERENCES Vendedor(Idvendedor)
);

# tabela fornecedor
CREATE TABLE Fornecedor (
    Idfornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome_fornecedor VARCHAR(50) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    UF CHAR(2) NOT NULL,
    City VARCHAR(35) NOT NULL,
    Neighborhood VARCHAR(35),
    Road VARCHAR(50),
    Phone CHAR(11) NOT NULL,
    Email VARCHAR(45),
    CONSTRAINT unique_cnpj_fornecedor UNIQUE (CNPJ)
);
alter TABLE Fornecedor AUTO_INCREMENT=1;

# tabela do produto/fornecedor
CREATE TABLE Disponibilizando_produto (
    Idproduto INT,
    Idfornecedor INT,
    PRIMARY KEY (Idproduto, Idfornecedor),
    FOREIGN KEY (Idproduto) REFERENCES Produtos(Idproduto),
    FOREIGN KEY (Idfornecedor) REFERENCES Fornecedor(Idfornecedor)
);

# tabela produto/estoque
CREATE TABLE Pedido_estoque (
    Localizaçao ENUM('bloco corda','bloco teclado','bloco sopro','bloco percussão') not null,
    PRIMARY KEY (Idpedido, Idproduto),
    Idpedido INT,
    Idproduto INT,
    FOREIGN KEY (Idpedido) REFERENCES Pedidos(Idpedido) ON DELETE CASCADE,
    FOREIGN KEY (Idproduto) REFERENCES Produtos(Idproduto) ON DELETE CASCADE
);

# tabela estoque
CREATE TABLE Estoque (
    Idestoque INT AUTO_INCREMENT PRIMARY KEY,
    Idproduto INT,
    estoque_status ENUM('disponivel','sem estoque','reservado','em transito') default 'disponivel',
    Quantidade_estoque INT NOT NULL,
    Idfornecedor INT,
    Idvendedor int,
    FOREIGN KEY (Idproduto) REFERENCES Produtos(Idproduto) ON DELETE CASCADE,
    FOREIGN KEY (Idfornecedor) REFERENCES Fornecedor(Idfornecedor),
    FOREIGN KEY (Idvendedor) REFERENCES Vendedor(Idvendedor)
);
alter TABLE Estoque AUTO_INCREMENT=1;