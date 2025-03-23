SHOW DATABASES;
USE ecommerce_instrumentos_musicais;
SHOW TABLES;


# Quais os nomes dos clientes
SELECT * FROM Cliente;

# Quais os nomes das empresas
SELECT * from Empresa;

# Quais são os produtos cadastrados
SELECT * from Produtos;

# Quais produtos são maior que R$200,00
SELECT * from Produtos
where Preço > 200;

# Produtos com maior avaliação
SELECT Idproduto,Nome_produto, round((AVG(CAST(Avaliaçao AS DECIMAL(3,2)))),2) AS Media_Avaliacao
FROM Produtos
GROUP BY Idproduto
HAVING AVG(CAST(Avaliaçao AS DECIMAL(3,2))) > 4;

# Clientes com status 'Pago'
SELECT concat(Fname,' ',Lname) as Nome, Status_pedido
from Cliente 
join Pedidos a on Id_cliente = Idcliente
where Status_pedido = 'pago';

# localizar as informaçoes da compra dos clientes (usando 3 joins)
SELECT concat(Fname,' ',Lname) as Nome ,Status_pedido,Nome_produto,Preço_total,Valor_frete,(Preço_total + Valor_frete) as Valor_final
from Cliente 
JOIN Pedidos o on Id_cliente = Idcliente 
join Pedido_Produto a on o.Idpedido = a.Idpedido 
join Produtos l on a.Idproduto = l.Idproduto;

# localizar as informaçoes da compra das empresas (usando 3 joins)
SELECT Company_name as empresas,Status_pedido,Nome_produto,Preço_total,Valor_frete,(Preço_total + Valor_frete) as Valor_final
from Empresa
JOIN Pedidos o on Idcompany = Idempresa
join Pedido_Produto a on o.Idpedido = a.Idpedido 
join Produtos l on a.Idproduto = l.Idproduto;

# Informaçoes completa do cliente
select concat(Fname,' ',Lname) as Nome, Tipo_pagamento, Status_pedido,e.Nome_produto,
Preço_total,Valor_frete,(Preço_total + Valor_frete) as Valor_final
from Cliente a
join Pedidos b ON Id_cliente = Idcliente
join Forma_pagamento c on b.Idpedido = c.Idpedido
join pedido_produto d on b.Idpedido = d.Idpedido
join Produtos e on d.Idproduto = e.Idproduto;

# Informaçoes completa das empresas
select Company_name, Tipo_pagamento, Status_pedido,e.Nome_produto,
Preço_total,Valor_frete,(Preço_total + Valor_frete) as Valor_final
from Empresa a
join Pedidos b on Idcompany = Idempresa
join Forma_pagamento c on b.Idpedido = c.Idpedido
join pedido_produto d on b.Idpedido = d.Idpedido
join Produtos e on d.Idproduto = e.Idproduto;

# Quantos Produtos os clientes compraram
SELECT Username, Tipo_usuario, Quantidade,Nome_produto,Preço,Preço_total
from Login a
join Pedidos b on a.Idcliente = b.Id_cliente
join Pedido_produto c on b.Idpedido = c.Idpedido
join Produtos d on c.Idproduto = d.Idproduto;

# Produtos que os fornecedores fornecem
SELECT a.Nome_produto,f.Nome_fornecedor,f.CNPJ,f.City,f.UF
FROM Produtos a
JOIN Disponibilizando_produto b ON a.Idproduto = b.Idproduto
JOIN Fornecedor f ON b.Idfornecedor = f.Idfornecedor;

# Produtos disponíveis por vendedores
SELECT p.Nome_produto, v.Nome_fantasia AS Vendedor_Nome, v.CNPJ AS Vendedor_CNPJ, pv.Quantidade AS Quantidade_Disponível, pv.Status_quantidade
FROM Produtos p
JOIN Produtos_por_Vendedor pv ON p.Idproduto = pv.Idproduto
JOIN Vendedor v ON pv.Idvendedor = v.Idvendedor
WHERE pv.Status_quantidade = 'disponivel';
