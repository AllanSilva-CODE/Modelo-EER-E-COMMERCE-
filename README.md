# Projeto Lógico de Banco de Dados Utilizando o MySQL
- Objetivo é Replicar a Modelagem de um Banco de Dados Para um Cenário de E-Commerce.
    - [Primeira versão do modelo modelo_EER_ecommerce.mwb](modelo_EER_ecommerce.mwb)
    - [Versão finalizada do modelo_EER_ecommerce.mwb](modelo_EER_ecommerce_finalizado.mwb)
---
# Descrição do Projeto Lógico
## Tema do E-commerce **"Instrumentos Musicais"**
- Este projeto implementa um sistema de cadastro e gerenciamento de vendas de instrumentos musicais, com foco em clientes, empresas, vendedores, produtos e pedidos. A estrutura do banco de dados foi projetada para suportar um modelo de e-commerce onde os clientes e empresas podem realizar compras, vendedores disponibilizam produtos para a venda no sistema, e fornecedores fornecem os produtos.

## Principais Tabelas:
- **Cliente**: Armazena as informações de clientes, como nome, CPF, endereço, data de nascimento, e outras informações pessoais essenciais para o cadastro e interações no sistema. Cada cliente tem um login único para acessar a plataforma.

- **Empresa**: Contém os dados cadastrais de empresas, incluindo o nome, CNPJ, endereço, e contato. Nesta tabela estão as empresas interessadas na compra dos produtos.

- **Login**: Registra as informações de login de clientes e empresas. Relaciona os usuários ao tipo de conta (cliente ou empresa), fornecendo uma autenticação única e protegida para acessar o sistema.

- **Pedidos**: Registra os pedidos feitos pelos clientes e empresas, com informações como data do pedido, status (pendente, pago, cancelado), preço total, valor do frete e código de rastreamento. Cada pedido está associado a um cliente ou a uma empresa.

- **Forma_pagamento**: Define as formas de pagamento disponíveis, como cartão de crédito, boleto ou pix, e está vinculada a um pedido específico.

- **Produtos**: Contém dados sobre os produtos disponíveis no sistema, incluindo nome, categoria, preço, avaliação e descrição. Esses produtos são adquiridos pelos fornecedores.

## Tabelas Relacionadas:
- **Pedido_Produto**: Relaciona os produtos aos pedidos realizados, registrando a quantidade de cada produto em um pedido específico.

- **Vendedor**: Armazena as informações sobre os vendedores, como razão social, nome fantasia, CNPJ, e dados de contato. Os vendedores podem disponibilizar produtos para venda no sistema.

- **Produtos_por_Vendedor**: Relaciona produtos aos vendedores e indica a quantidade disponível para venda de cada produto, além de seu status de disponibilidade.

- **Fornecedor**: Contém as informações sobre os fornecedores que fornecem os produtos para os vendedores, incluindo nome, CNPJ e dados de contato.

- **Disponibilizando_produto**: Relaciona fornecedores a produtos, indicando quais produtos estão sendo fornecidos por cada fornecedor.

- **Estoque**: Gerencia o estoque de produtos disponíveis, com status de disponibilidade e a quantidade em estoque, além de associar produtos a fornecedores e vendedores específicos.

## Funcionalidades e Fluxo:
- **Cadastro de Clientes e Empresas**: Clientes e empresas podem se registrar no sistema, fornecendo seus dados essenciais e criando um login para acessar a plataforma.

- **Gerenciamento de Pedidos**: Clientes e empresas podem fazer pedidos de produtos, a plataforma gerencia os status dos pedidos, como "pendente", "pago" ou "cancelado". Cada pedido pode ter diferentes formas de pagamento, como cartão, boleto ou pix.

- **Estoque e Fornecimento de Produtos**: Vendedores podem disponibilizar produtos para as vendas, e os fornecedores fornecem os produtos que ficam disponíveis para os vendedores. O estoque é gerido para indicar a quantidade disponível de cada produto.

