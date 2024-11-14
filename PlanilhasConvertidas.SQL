
	USE Loja_Trevin;
    
    CREATE TABLE IF NOT EXISTS clientes (    
        id_cliente INT PRIMARY KEY,    
        nome VARCHAR(100),
        email VARCHAR(100)
    );
    
        CREATE TABLE IF NOT EXISTS pedidos (    
        id_pedido INT PRIMARY KEY,    
        descricao VARCHAR(200),
        valor DECIMAL(10,2),
        id_cliente INT,
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    );

    Use loja_Trevin
	INSERT IGNORE INTO clientes (id_cliente, nome, email) VALUES
    (1, 'João Silva', 'joao@bitchass.com'),
    (2, 'Maria Oliveira', 'maria@bitchass.com'),
    (3, 'Pedro Santos', 'pedro@bichass.com'),
    (4, 'Gustavo Henrique',  'gustavo.traimo@gmail.com');
    
    INSERT IGNORE INTO pedidos (id_pedido, descricao, valor, id_cliente) VALUES
    (101, 'Compra de móveis', 1500.00, 1),
    (102, 'Pedido de eletrônicos', 2500.50, 2),
    (103, 'Serviços de instalação', 500.75, 3),
    (105, 'Incomenda de sapatos', 225, 4)



-- altera uma tabela para adicionar uma coluna
ALTER TABLE lojaClientes
ADD COLUMN telefone varchar(15);



INSERT IGNORE INTO clientes (id_cliente, Nome, Endereço, Telefone) VALUES 
(1, 'Ana Silva', 'Rua Almires, 123', '99218-2749'),
(2, 'Bruno Souza', 'Rua Barbados, 456', '94738-7473'),
(3, 'Carlos Pereira', 'Rua Cascapos, 789', '94820-5824'),
(4, 'Daniel Frigueredo', 'Rua Damires Alto, 914', '9483-8343');

INSERT IGNORE INTO Emprestimos (idLivro, id_cliente, data_emprestimo, data_devolução,) VALUES
(1, 2, 2019/02/12, 2023/30/10),
(2, 4, 2023/29/06, 2022/12/09),
(3, 1, 2022/19/02, 2023/12/12),
(4, 1, 2024/22/03, 2022/19/09);

INSERT IGNORE INTO livros (titulo, genero, autorId, anopublicaçao) VALUES
('Teorias Politicas são Histórias de Fantasia', 'politica', 2, 2002),
('A Evolução Humana', 'sciencia', 3, 2020),
('Definição e Realidade', 'filosofia', 4, 2023),
('O Reino Dourado', 'fantasia', 1, 2019);


ALTER TABLE clientes RENAME TO Clientes;

SELECT email_cliente from Clientes where id_cliente 2
SELECT email_cliente from Clientes where id_cliente IN (1,3,4)
SELECT id_cliente, nome, email_cliente from Clientes order by nome asc; -- ou desc

SELECT nome
from Clientes
where

-- consulta com limite de resultados
SELECT id_cliente, nome, email_cliente
from Clientes
limit 3;

--consulta de valores unicos
SELECT distinct email_cliente
from Clientes;

-- consulta de varios valores
SELECT Pedidos.id_pedido, Pedidos.id_cliente AS id_clientesdosPedidos, Clientes.id_cliente, Clientes.nome AS nome_cliente, Pedidos.data_pedido, Pedidos.status_pedido
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente;

SELECT Itens_pedido.id_item, Itens_pedido.id_pedido, Itens_pedido.id_produto,Pedidos.data_pedido, Pedidos.status_pedido, Produtos.nome, Produtos.descricao
FROM Itens_pedido
JOIN Pedidos ON Itens_pedido.id_pedido = Pedidos.id_pedido
JOIN Produtos ON Itens_pedido.id_produto = Produtos.id_produto;

CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    numeroPedido varchar(50),
    valorTotal DECIMAL(10, 2),
    dataPedido date,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);



SELECT sum() -- faz a soma dos itens da coluna
SELECT med() -- calcula a media "    '     "
SELECT max() -- encontra o iten com o numero mais alto em ordem alfabética
SELECT min() -- encontra o pedido mais baixo em ordem alfabética

--CONSULTA COM JUNÇÃO DE TABELAS

SELECT Clientes.id_cliente, Clientes.nnome, Clientes.email, Pedidos.numeroPedido
from Clientes
inner join Pedidos on Clientes.id_cliente = Pedidos.id_cliente;

SELECT Clientes.id_cliente, Clientes.nome, Pedidos.numeroPedido, Pedidos.valorTotal
from Clientes
inner join Pedidos on Clientes.id_cliente = Pedidos.id_cliente
where Pedidos.valorTotal > 200;

-- SELECIONA CLIENTES E SEUS PEDIDOS APENAS SE O VALOR TOTAL DO PEDIDO
SELECT Clientes.nome, count(Pedidos.idPedido) AS total_pedidos from Clientes inner join Pedidos on Clientes.id_cliente = Pedidos.id_cliente GROUP BY Clientes.nome;
-- Separa e conta todos os pedidos feitos, o GROUP BY separa os nomes




-- EMPRESA
CREATE TABLE departamentos(
    departamento_id int AUTO_INCREMENT PRIMARY KEY,
    nome varchar(50) NOT null
);
CREATE TABLE empregados(
    empregados_id int AUTO_INCREMENT PRIMARY KEY,
    nome varchar(50) not null,
    salario decimal(10, 2) not null,
    departamento_id int,
    FOREIGN KEY(departamento_id) REFERENCES departamentos
    (departamento_id)
);

SELECT nome, salario
from empregados
where salario > (SELECT AVG(salario) from empregados); -- calcula o salario externo e sapara aqueles com os salaríos acima da média

ALTER TABLE departamentos ADD localizacao VARCHAR(50); 

update departamentos set localizacao = 'São Paulo' WHERE nome = 'Vendas';
update departamentos set localizacao = 'Rio de Janeiro' WHERE nome = 'Marketing';
update departamentos set localizacao = 'São Paulo' WHERE nome = 'TI';
update departamentos set localizacao = 'Belo Horizonte' WHERE nome = 'Recursos Humanos';


SELECT departamentos.departamento_id SUM(cargos.salario)
FROM departamentos


-- Procedures

delimiter //

CREATE Procedure AumentarSalario(
    in dep_id INT,
    in percentual decimal(5,2)
)
begin
    update cargos
    Set salario = salario + (salario * (percentual / 100))
    Where departamento_id = dep_id;
end //

delimiter ;

call AumentarSalario(2, 10.99)

-- AT 1
delimiter //

CREATE Procedure addFuncionario(
    in nom varchar(50),
    in departament_id int,
    in titul varchar(50)
)
begin
    INSERT IGNORE into empregados (nome, departamento_id, titulo) VALUES
    (nom, departament_id, titul);
end //

delimiter ;

call addFuncionario('Lucas Nunes', 3, 'Estágiario')

-- AT 2
DELIMITER //

CREATE Procedure removeFuncionário(
    in id_empreg int
)
begin
    delete from empregados
    where empregados_id = id_empreg;
END //

DELIMITER ; 

call removeFuncionário(5)

-- AT 3

DELIMITER //

CREATE Procedure alterarTitulo(
    in id_empreg INT
    in titul varchar(50)
)
BEGIN
    update empregados
    Set titulo = titul
    Where empregados_id = id_empreg;
end //

DELIMITER ;

call alterarTitulo(2, 'Assistente')


SELECT Itens_pedido.id_item, Itens_pedido.id_pedido, sum(Itens_pedido.preco_unitario * Itens_pedido.quantidade) AS preco_total , Produtos.nome
FROM Itens_pedido
JOIN Produtos on Itens_pedido.id_produto = Produtos.id_produto
GROUP BY Produtos.nome;

SELECT Clientes.id_cliente, Clientes.nome, Clientes.data_cadastro
FROM Clientes
WHERE Clientes.data_cadastro >= '2024-07-01';


delimiter //

CREATE Procedure addCliente(
    in nom varchar(50),
    in emai varchar(100),
    in telefon varchar(50),
    in cadastro date
)
begin
    INSERT IGNORE into empregados (nome, email, telefone, data_cadastro) VALUES
    (nom, emai, telefon, cadastro);
end //

delimiter ;