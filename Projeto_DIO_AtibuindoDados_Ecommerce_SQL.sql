show DATABASES;
use ecommerce_instrumentos_musicais;
show tables;

# Tabela Cliente
desc Cliente;
SELECT * from Cliente;
INSERT INTO Cliente (Fname, Lname, CPF, UF, City, Neighborhood, Road, Date_of_birth, Phone, Email, Gender) VALUES
('Gustavo', 'Lima', '12345678901', 'SP', 'São Paulo', 'Centro', 'Rua 1', '1990-01-01', '11987654321', 'Lima@email.com', 'M'),
('Eduardo', 'Costa', '98765432109', 'RJ', 'Rio de Janeiro', 'Flamengo', 'Rua 2', '1985-02-15', '21987654321', 'Educosta@email.com', 'M'),
('Marcos', 'Costa', '56789012345', 'MG', 'Belo Horizonte', 'Savassi', 'Rua 3', '1992-03-20', '31987654321', '', 'M'),
('Lia', 'Pereira', '87654321098', 'BA', 'Salvador', 'Pelourinho', 'Rua 4', '1988-04-10', '71987654321', 'ana.pereira@email.com', 'F'),
('Francisco', 'Santos', '65432109876', 'Ce', 'Fortaleza', 'Barroso', 'Rua 5', '1995-05-25', '41987654321', '', 'M'),
('Mayara', 'Teresa', '65432137853', 'Ce', 'Fortaleza', 'Aldeota', 'Rua 23', '2000-05-25', '41987881321', 'M@gmail.com', 'F'),
('Leonardo', 'zuzu', '21109109876', 'BA', 'Salvador', 'Pelourinho', 'Rua 5', '1997-01-30', '11187654321', 'ZU@email.com', 'M'),
('Alencar', 'Dutra', '65432109996', 'BA', 'Salvador', 'Xiquexique', 'Rua Alagada', '2001-12-15', '41987320765', '', 'F');

# Tabela Empresa
desc Empresa;
SELECT * from Empresa;
INSERT INTO Empresa (Company_name, CNPJ, UF, City, Neighborhood, Road, Phone, Email) VALUES
('TocaumapraMim', '12345678000199', 'SP', 'São Paulo', 'Pinheiros', 'Rua Tech', '11345678901', 'Tocaumapramim@email.com'),
('BandaBrasil', '23456789000188', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Rua Logística', '21987654322', 'Bandabrasil@email.com'),
('sua musica', '34567890000177', 'MG', 'Belo Horizonte', 'Centro', 'Rua Móveis', '31987654322', 'suamusica@email.com'),
('Distribuidorasong', '45678901234566', 'BA', 'Salvador', 'Rio Vermelho', 'Rua Norte', '71987654322', 'distribuidorasong@email.com'),
('music São João', '56789012345655', 'CE', 'Fortaleza', 'Água Verde', 'Rua barao', '41987654322', '');

-- Tabela Login
desc Login;
SELECT * from Login;
INSERT INTO Login (Tipo_usuario, Username, Senha, Idcliente, Idempresa) VALUES
('cliente','gustavo lima','senha123',1, NULL),
('cliente', 'eduardo costa', 'senha456',2, NULL),
('cliente', 'marcos costa', 'senha789',3, NULL),
('cliente', 'lia pereira', 'senha101',4, NULL),
('cliente', 'francisco santos', 'senha202',5, NULL),
('empresa','TocaumapraMim','senha888',NULL,1),
('empresa','BandaBrasil','senha765',NULL,2),
('empresa','sua musica','senha322',NULL,3),
('empresa','Distribuidorasong','senha719',NULL,4),
('empresa','music São João','senha874',NULL,5),
('cliente','mayara tereza','senha999',6,NULL),
('cliente','leonardo zuzu','senha777',7, NULL),
('cliente','alencar dutra','senha100',8, NULL);

-- Tabela Pedidos
desc Pedidos;
SELECT * from Pedidos;
INSERT INTO Pedidos (Data_pedido, Status_pedido, Preço_total, Valor_frete, Codigo_rastreio, Id_cliente,Idempresa) VALUES
('2025-03-01', 'pendente', 100.50, 15.00, 'AB123456789', 1,NULL),
('2025-03-02', 'pago', 150.75, 20.00, 'CD987654321', 2,NULL),
('2025-03-03', 'cancelado', 75.30, 10.00, 'EF123487653', 3,NULL),
('2025-03-04', 'pendente', 200.00, 30.00, 'GH563478902', 4,NULL),
('2025-03-05', 'pago', 120.20, 25.00, 'IJ876543210', 5,NULL),
('2025-03-02','pago',200.00,50.00,'JJ3645478902',NULL,1),
('2025-03-03','pago',500.00,150.00,'PO1927365578902',NULL,2),
('2025-03-03','pago',350.00,130.00,'MM5919101902',NULL,3),
('2025-03-04','pendente',2000.00,500.00,'GH564236472',NULL,4);

-- Tabela Forma_pagamento
desc Forma_pagamento;
SELECT * from Forma_pagamento;
INSERT INTO Forma_pagamento (Tipo_pagamento, idpedido) VALUES
('cartão', 1),
('pix', 2),
('boleto', 3),
('cartão', 4),
('pix', 5),
('boleto', 6),
('boleto', 7),
('boleto', 8),
('cartao', 9);

-- Tabela cartao_credito
desc cartao_credito;
SELECT * from cartao_credito;
INSERT INTO cartao_credito (numero_cartao, bandeira, idpedido) VALUES
('1234123412341234', 'VISA', 1),
('5678567856785678', 'Mastercard', 4),
('6789678967896789', 'Mastercard', 9);

-- Tabela Pix
desc Pix;
SELECT * from Pix;
INSERT INTO Pix (Chave_pix, idpedido) VALUES
('12345678901', 2),
('98765432109', 5);

# Tabela Boleto
desc Boleto;
SELECT * from Boleto;
INSERT INTO Boleto (codigo_boleto, data_vencimento, idpedido) VALUES
('BOL123456789', '2025-04-01', 3),
('BOL987654321', '2025-04-02', 6),
('BOL112233445', '2025-04-05', 7),
('BOL223344556', '2025-04-10', 8);

# Tabela Produtos
desc Produtos;
select * from Produtos;
INSERT INTO Produtos (Nome_produto, Categoria, Preço, Avaliaçao, Descricao, Data_cadastro) VALUES
('Violao', 'corda', 100.50, '5', 'Violao para criança', '2025-01-01'),
('Teclado', 'teclado', 500.00, '4', 'Teclado digital', '2025-01-01'),
('Flauta', 'sopro', 75.30, '4', 'iniciantes', '2025-01-01'),
('Guitarra', 'corda', 500.00, '3', '', '2025-01-02'),
('Corda para baixo', 'corda', 150.75, '5', 'alta resisstencia e antiferrugem', '2025-01-03'),
('Corda', 'corda', 60.10, '5', 'Corda para guitarra elétrica', '2025-01-03'),
('Piano', 'teclado', 2000.00, '4', 'Piano de cauda', '2025-01-03'),
('Tronpete', 'sopro', 350.00, '5', 'Alta performance', '2025-01-03'),
('Pandeiro infantil', 'percussão', 90.00, '4', 'Pandeiro', '2025-01-09'),
('Pandeiro', 'percussão', 200.00, '5', '', '2025-01-10'),
('Corda 5', 'corda', 65.00, '5', 'Corda para violão acústico', '2025-02-05'),
('Teclado 3', 'teclado', 120.00, '4', 'Teclado portátil', '2025-02-10'),
('Sopro 3', 'sopro', 220.00, '3', 'Flauta transversal', '2025-02-12'),
('Percussão 3', 'percussão', 80.00, '2', 'Bombo', '2025-02-15'),
('Corda 6', 'corda', 50.00, '5', 'Corda para guitarra clássica', '2025-02-18');

# Tabela Pedido_Produto
desc Pedido_Produto;
SELECT * from Pedido_Produto;
INSERT INTO Pedido_Produto (Idpedido, Idproduto, Quantidade) VALUES
(1, 1, 1),
(2, 5, 1),
(3, 3, 1),
(4, 10, 1),
(5, 5, 2),--
(6,10,1),
(7,4,1),
(8,8,1),
(9,7,1);

# Mudei o Idproduto de 5 para 6, pela imconpatilibidade nos preços com a compra do cliente
UPDATE Pedido_Produto
SET Idproduto = 6
WHERE Idproduto = 5 AND Idpedido = 5;

# Tabela Vendedor
desc Vendedor;
SELECT * from Vendedor;
INSERT INTO Vendedor (Razao_social, Nome_fantasia, CNPJ, UF, City, Neighborhood, Road, Phone, Email) VALUES
('Vendas Musicais Ltda', 'Vendas Musicais', '12345678000199', 'SP', 'São Paulo', 'Pinheiros', 'Rua Vendas', '11345678901', 'contato@vendasmusicais.com'),
('Distribuidora Som', 'Som Distribuidor', '23456789000188', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Rua Som', '21987654322', 'som@distribuidora.com'),
('Músicas e Sons', 'Músicas Sons', '34567890000177', 'MG', 'Belo Horizonte', 'Centro', 'Rua Sons', '31987654322', 'musicas@sonsmg.com'),
('Sons do Nordeste', 'Nordeste Sons', '45678901234566', 'BA', 'Salvador', 'Rio Vermelho', 'Rua Nordeste', '71987654322', 'sons@nordeste.com'),
('Acessórios Musicais', 'Acessórios Música', '56789012345655', 'PR', 'Curitiba', 'Água Verde', 'Rua Acessórios', '41987654322', 'acessorios@musical.com');

# Tabela Produtos_por_Vendedor
desc Produtos_por_Vendedor;
SELECT * from Produtos_por_Vendedor;
INSERT INTO Produtos_por_Vendedor (Status_quantidade, Quantidade, Idproduto, Idvendedor) VALUES
('disponivel', 10, 1, 1),
('disponivel', 20, 7, 2),
('disponivel', 2, 4, 3),
('disponivel', 15, 3, 4),
('disponivel', 10, 15, 4),
('disponivel', 10, 10, 5),
('disponivel', 30, 11, 1),
('disponivel', 7, 12, 1),
('disponivel', 30, 6, 5),
('disponivel', 8,2, 5),
('disponivel', 30, 5, 5),
('disponivel', 30, 8, 5),
('disponivel', 30, 9, 5),
('disponivel', 30, 13, 5),
('disponivel', 30, 14, 5);

# Tabela Fornecedor
desc Fornecedor;
SELECT * from Fornecedor;
INSERT INTO Fornecedor (Nome_fornecedor, CNPJ, UF, City, Neighborhood, Road, Phone, Email) VALUES
('Fornecedor A', '12345678000199', 'SP', 'São Paulo', 'Bela Vista', 'Rua Fornecedor A', '11345678901', 'fornecedorA@empresa.com'),
('Fornecedor B', '23456789000188', 'RJ', 'Rio de Janeiro', 'Centro', 'Rua Fornecedor B', '21987654321', 'fornecedorB@empresa.com'),
('Fornecedor C', '34567890000177', 'MG', 'Belo Horizonte', 'Savassi', 'Rua Fornecedor C', '31987654321', 'fornecedorC@empresa.com'),
('Fornecedor D', '45678901234566', 'BA', 'Salvador', 'Barra', 'Rua Fornecedor D', '71987654321', 'fornecedorD@empresa.com'),
('Fornecedor E', '56789012345655', 'PR', 'Curitiba', 'Água Verde', 'Rua Fornecedor E', '41987654321', 'fornecedorE@empresa.com');

# Tabela Disponibilizando_produto
desc Disponibilizando_produto;
SELECT * from Disponibilizando_produto;
INSERT INTO Disponibilizando_produto (Idproduto, Idfornecedor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6,2),
(7,5),
(8,5),
(9,1),
(10,2),
(11,2),
(12,2),
(13,1),
(14,2),
(15,5);

# Tabela Pedido_estoque
desc Pedido_estoque;
SELECT * from Pedido_estoque;
INSERT INTO Pedido_estoque (Idpedido, Idproduto, Localizaçao) VALUES
(1, 1, 'bloco corda'),
(2, 5, 'bloco corda'),
(3, 3, 'bloco sopro'),
(4, 10, 'bloco percussão'),
(5, 5, 'bloco corda'),--
(6, 10, 'bloco percussão'),
(7, 4, 'bloco corda'),
(8, 8, 'bloco sopro'),
(9, 7, 'bloco teclado');

#  Tabela Estoque
desc Estoque;
SELECT * from Estoque;
INSERT INTO Estoque (Idproduto, estoque_status, Quantidade_estoque, Idfornecedor, Idvendedor) VALUES
(1, 'disponivel', 10, 1, 1),
(2, 'disponivel', 20, 2, 2),
(3, 'disponivel', 3, 3, 3),
(4, 'disponivel', 23, 4, 4),
(5, 'disponivel', 19, 5, 5),
(6, 'disponivel', 11, 1, 1),
(7, 'disponivel', 6, 5, 3),
(8, 'disponivel', 9, 1, 1),
(9, 'disponivel', 8, 1, 1),
(10, 'disponivel', 6, 5, 2),
(11, 'disponivel', 12, 2, 5),
(12, 'disponivel', 12, 5, 1),
(13, 'disponivel', 25, 2, 2),
(14, 'disponivel', 7, 3, 1),
(15, 'disponivel', 21, 1, 2);