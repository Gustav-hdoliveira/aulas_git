CREATE TABLE IF NOT EXISTS Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(100) not null,
    categoria varchar(40),
    preço decimal(10, 2) not null,
    validade date not null,
    marca varchar(100) NOT null,
    dataEstoque date
);

INSERT into Produtos (nome, marca, preço, categoria, validade ,data_estoque) VALUES
('bolacha Waffer', 'Bauduco', 4.50, 'alimento, não perecivel', '2025-09-23', '2024-06-10'),
('bolacha Waffer', 'Isabela', 3.25, 'alimento, não perecivel', '2025-12-30', '2023-08-12'),
('armário duas portas', 'Madessandri', 899.99, 'móvel', null, '2024-07-03'),
('pia de ceramica redonda', 'Madessandri', 450, 'móvel', null, '2023-02-09'),
('geladeira duas portas com refrigerador', 'Ponto-Frio', 1000, 'aparelho doméstico',  null, '2022-03-12'),
('pacote de bombom', 'Quibom', 26.50, 'alimento, não perecivel', '2025-04-12', '2024-05-23'),
('pacote de bolacha rosquinha com chocolate', 'Quibom',  12.75, 'alimento, não perecivel', '2025-12-30', '2024-04-19'),
('saco de parafuso longo de aço', 'Produtora Aleatória',  27.99,'ferramenta', null, '2022-09-11'),
('banco de corda e madeira acácia', 'Madessandri',  479.99,'móvel', null, '2023-11-23'),
('saco de batatas 3 Quilos', 'Fazenda Daniela', 28.00, 'alimento, perecivel', '2024-12-19', '2024-06-20');

DELETE FROM Produtos
WHERE id_produto IN (104, 107)

ALTER TABLE Produtos ADD sem_estoque boolean;

------------------------Pt 2---------------------------


ALTER TABLE Livros
CHANGE COLUMN data_cliação data_lançamento;

CREATE TABLE Autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(100),
    data_nascimento date,
    nascionalidade varchar(100),
    nome_da_mãe varchar(110),
    altura_cm decimal(10,2)
);

INSERT IGNORE INTO Autores (nome, data_nascimento, altura_cm, nascionalidade, nome_da_mãe) VALUES
('Neymar junior da Silva', '1995-12-12', 179, 'Brasileiro', 'Neymar da Silva'),
('J. R. R. Tolkien', '1899-02-13', 100, "Russo", 'J. R. R. Tolkien(pai)'),
("Antoine de Saint-Exupéry", '1910-10-18', 189, "Francesa", 'Jubiley de Saint-Exupéry'),
("Agatha Christie", '1980-05-07', 175, 'Estado-Unidense', 'Marie Christie'),
("Cao Xueqin",'1932-04-20', 138, 'Chinesa', 'Lao Senpin'),
("C.S. Lewis", '1390-05-30', 188, 'Reino-Unidense', 'Daniela Lewis'),
('J K Rolling', '1965-10-12', 182, 'Britanica', 'J. K. Mewing'),
('Lula Inácio da Silva', '1013-12-13', 152, 'Brasileiro', 'Zé pilantra'),
('Jesus Cristo', '0003-04-12', 185, 'Peruano', 'Ave Mária'),
('Gustavo Henrique de Oliveira', '2006-09-04', 172, 'Brasileiro', 'Silvia Leticia');

