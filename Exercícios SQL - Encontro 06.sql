USE DB_T2_EVERTON_SILVA;

CREATE TABLE PRODUCT (
    ID INT PRIMARY KEY AUTO_INCREMENT, -- Chave primária e auto incremento
    NAME VARCHAR(100),                -- Nome do doce
    CATEGORY VARCHAR(50),             -- Categoria
    PRICE DECIMAL(10,2),              -- Valor
    STOCK INT                         -- Quantidade em estoque
);

CREATE TABLE CUSTOMER (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100),
    AGE INT,
    CITY VARCHAR(50),
    EMAIL VARCHAR(100)
);

CREATE TABLE ORDER_TABLE (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_NAME VARCHAR(100),
    PRODUCT_NAME VARCHAR(100),
    QUANTITY INT,
    TOTAL_VALUE DECIMAL(10,2)
);

##INSERCAO DOS REGISTROS##

##PRODUCT##
-- 5 registros especificando campos
INSERT INTO PRODUCT (NAME, CATEGORY, PRICE, STOCK) VALUES 
('Brigadeiro Gourmet', 'Chocolate', 5.50, 100),
('Pudim de Leite', 'Sobremesa', 12.00, 20),
('Bala de Goma', 'Guloseima', 0.50, 500),
('Pirulito Psicodélico', 'Guloseima', 3.50, 150),
('Trufa de Maracujá', 'Chocolate', 4.00, 80);

-- Mais 5 registros sem especificar campos 
INSERT INTO PRODUCT VALUES 
(DEFAULT, 'Paçoca Especial', 'Amendoim', 2.50, 200),
(DEFAULT, 'Quindim', 'Sobremesa', 8.50, 15),
(DEFAULT, 'Algodão Doce', 'Açúcar', 7.00, 40),
(DEFAULT, 'Bombom de Morango', 'Chocolate', 6.00, 60),
(DEFAULT, 'Chiclete de Menta', 'Guloseima', 0.25, 1000);

##CUSTOMER##

INSERT INTO CUSTOMER (NAME, AGE, CITY, EMAIL) VALUES 
('Everton Silva', 38, 'Guarujá', 'everton@email.com'),
('Ana Souza', 25, 'Santos', 'ana@email.com'),
('Carlos Pereira', 17, 'São Vicente', 'carlos@email.com'),
('Mariana Costa', 42, 'Aracaju', 'mari@email.com'),
('João Santos', 15, 'Bela Vista', 'joao@email.com');

-- Sem especificar campos
INSERT INTO CUSTOMER VALUES 
(DEFAULT, 'Ricardo Lima', 30, 'Santos', 'ricardo@email.com'),
(DEFAULT, 'Beatriz Melo', 19, 'Guarujá', 'bia@email.com'),
(DEFAULT, 'Lucas Rocha', 12, 'São Paulo', 'lucas@email.com'),
(DEFAULT, 'Fernanda Alvez', 50, 'Aracaju', 'nanda@email.com'),
(DEFAULT, 'Gabriel Luz', 22, 'Santos', 'gabriel@email.com');

##COMANDOS##
SELECT * FROM PRODUCT;
SELECT * FROM CUSTOMER;

##CONSULTA BASICA##
SELECT * FROM PRODUCT;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDER_TABLE;

##COM WHERE##
-- Produtos com preço maior que 10.00
SELECT * FROM PRODUCT WHERE PRICE > 10.00;

-- Clientes com idade maior que 18
SELECT * FROM CUSTOMER WHERE AGE > 18;

-- Pedidos com quantidade maior que 2 (Crie alguns registros na ORDER_TABLE se ainda não o fez)
SELECT * FROM ORDER_TABLE WHERE QUANTITY > 2;

##ORDENACAO##
-- Produtos do mais caro para o mais barato
SELECT * FROM PRODUCT ORDER BY PRICE DESC;

-- Apenas os 5 primeiros clientes da lista
SELECT * FROM CUSTOMER LIMIT 5;

##APLICACAO DO LIKE##
-- Nomes que COMEÇAM com 'A'
SELECT * FROM CUSTOMER WHERE NAME LIKE 'A%';

-- Nomes que TERMINAM com 'a'
SELECT * FROM CUSTOMER WHERE NAME LIKE '%a';

-- Nomes que CONTÉM 'Silva' em qualquer lugar
SELECT * FROM CUSTOMER WHERE NAME LIKE '%Silva%';



##EXPORTAR CSV##
-- Ativa a permissão
SET GLOBAL local_infile = 1;

-- Verifica se ativou (deve aparecer ON na tabela de resposta)
SHOW VARIABLES LIKE 'local_infile';


##CREATE TABLE USERS##
CREATE TABLE USERS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100)
);


##EXPORTANDO CSV##
LOAD DATA LOCAL INFILE 'C:\\\\BD Workbench\\\\usuarios.csv'
INTO TABLE USERS
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;