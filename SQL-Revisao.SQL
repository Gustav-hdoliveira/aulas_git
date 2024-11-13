
SELECT Pedidos.id_pedido, Pedidos.id_cliente AS id_clientesdosPedidos, Clientes.id_cliente, Clientes.nome AS nome_cliente, Pedidos.data_pedido, Pedidos.status_pedido
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente;

SELECT Itens_pedido.id_item, Itens_pedido.id_pedido, Itens_pedido.id_produto,Pedidos.data_pedido, Pedidos.status_pedido, Produtos.nome, Produtos.descricao
FROM Itens_pedido
JOIN Pedidos ON Itens_pedido.id_pedido = Pedidos.id_pedido
JOIN Produtos ON Itens_pedido.id_produto = Produtos.id_produto;

---- Consultas Avançadas

SELECT Clientes.nome, count(Pedidos.id_pedido) AS total_pedidos from Clientes inner join Pedidos on Clientes.id_cliente = Pedidos.id_cliente WHERE Clientes.id_cliente = 5;

SELECT Itens_pedido.id_item, Itens_pedido.id_pedido, sum(Itens_pedido.preco_unitario * Itens_pedido.quantidade) AS preco_total , Produtos.nome
FROM Itens_pedido
JOIN Produtos on Itens_pedido.id_produto = Produtos.id_produto
GROUP BY Produtos.nome;

-- Marquei o estoque como true ou false ;P

SELECT Clientes.id_cliente, Clientes.nome, Clientes.data_cadastro
FROM Clientes
WHERE Clientes.data_cadastro >= '2024-07-01';

-- Atualização

update Produtos
set preco = 99999.00
where id_produto = 1;

update Pedidos
set status_pedido = "Concluido"
where id_pedido = 1;

update Clientes
set telefone = '98323-0230'
where id_cliente = 1;

--

delete from Clientes
where id_cliente = 1;

--

CREATE Procedure addCliente(
    in nom varchar(50),
    in emai varchar(100),
    in telefon varchar(50),
    in cadastro date
)
begin
    INSERT IGNORE into Clientes (nome, email, telefone, data_cadastro) VALUES
    (nom, emai, telefon, cadastro);
end;

DELIMITER//

CREATE Procedure atualizar_preco_produto(
    in idproduto int,
    in new_value decimal(10, 2)
)
begin
    update Produtos
    set preco = new_value
    where id_produto = idproduto;
end;

DELIMITER ;

CREATE PROCEDURE ADDpedido(
    in idClien INT,
    in dataDoPedido date,
    in statusPedido varchar(50)
)
begin
    INSERT IGNORE into Pedidos (id_cliente, data_pedido, status_pedido) VALUES
    (idClien, dataDoPedido, statusPedido);
end;

--FUNÇÕES   

CREATE FUNCTION CalcularTotalPedido(
    ITEM INT
)
RETURNS DECIMAL(10,2)
BEGIN
	DECLARE ITEMvall DECIMAL(10,2);
    
	SELECT Itens_pedido.preco_unitario * Itens_pedido.quantidade
    INTO ITEMvall
	FROM Itens_pedido
	WHERE Itens_pedido.id_item = ITEM;
    RETURN ITEMvall;
end;



BEGIN
	DECLARE ValorEstoque Boolean;
    
    SELECT Produtos.estoque
    INTO ValorEstoque
    FROM Produtos
    WHERE Produtos.id_produto = ID_Ite;
    
    RETURN ValorEstoque;
END