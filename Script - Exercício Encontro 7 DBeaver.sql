USE DB_T2_EVERTON_SILVA;

--Parte 1 e 2
-- Criando a tabela de Times
CREATE TABLE TEAM (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    FOUNDATION_YEAR INT
);

-- Criando a tabela de Jogadores
CREATE TABLE PLAYER (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    AGE INT,
    SALARY DECIMAL(10,2),
    TEAM_ID INT,
    CONSTRAINT FK_TEAM FOREIGN KEY (TEAM_ID) REFERENCES TEAM(ID)
);
------------------------------------------------------------------------------------------------
--Parte 3
-- Inserindo Times (Anos maiores e menores que 1900)
INSERT INTO TEAM (NAME, FOUNDATION_YEAR) VALUES 
('Santos FC', 1912),
('Ponte Preta', 1900),
('Sport Club Rio Grande', 1900);

-- Inserindo Jogadores (Testando faixas de idade e salário)
INSERT INTO PLAYER (NAME, AGE, SALARY, TEAM_ID) VALUES 
('Neymar Jr', 32, 500000.00, 1),      -- > 25 anos e > 100k
('Rodrigo', 23, 120000.00, 1),        -- < 25 anos e > 100k
('Paulo Baier', 45, 80000.00, 2),     -- > 25 anos e < 100k
('Menino da Vila', 18, 5000.00, 1),   -- < 25 anos e < 100k
('Gabigol', 27, 300000.00, 1);
----------------------------------------------------------------------------------
--Parte 4
USE DB_T2_EVERTON_SILVA;

UPDATE PLAYER 
SET SALARY = 155000.00 
WHERE NAME = 'Rodrigo';

-- 1. Adiciona a coluna que falta
ALTER TABLE TEAM ADD COLUMN CITY VARCHAR(100);

-- 2. Atualiza a cidade (Manipulação)
UPDATE TEAM SET CITY = 'Santos' WHERE NAME = 'Santos FC';

-- 3. Remove um registro (Manipulação)
DELETE FROM PLAYER WHERE AGE < 18;
------------------------------------------------------------------------------------

--Parte 5
USE DB_T2_EVERTON_SILVA;

-- 1. Filtrar jogadores com salário entre 100k e 500k
SELECT * FROM PLAYER WHERE SALARY BETWEEN 100000 AND 500000;

-- 2. Buscar jogadores dos times 1 ou 2 (IN)
SELECT * FROM PLAYER WHERE TEAM_ID IN (1, 2);

-- 3. Buscar jogadores que tenham 'Neymar' no nome (LIKE)
SELECT * FROM PLAYER WHERE NAME LIKE '%Neymar%';

-- 4. Listar times que ainda não possuem cidade definida (NULL)
SELECT * FROM TEAM WHERE CITY IS NULL;
--------------------------------------------------------------------------

--Parte 6 e 7
-- Criar o seu usuário (ajuste com seu nome e uma senha)
CREATE USER 'everton_silva'@'%' IDENTIFIED BY 'Everton123!';

-- Dar permissão total no seu banco de dados
GRANT ALL PRIVILEGES ON DB_T2_EVERTON_SILVA.* TO 'everton_silva'@'%';

--------------------------------------------------------------------------
--Parte 8

-- Aplicar as permissões imediatamente
FLUSH PRIVILEGES;

--------------------------------------------------------------------------

--Parte 9

-- Testando o ROLLBACK (Cancelando a alteração)
START TRANSACTION;

UPDATE PLAYER SET SALARY = 999999.99 WHERE ID = 1;

ROLLBACK;

-- Verifique que o salário NÃO mudou após o rollback
SELECT * FROM PLAYER WHERE ID = 1;

-- Testando o COMMIT (Confirmando a alteração)
START TRANSACTION;

UPDATE PLAYER SET SALARY = 600000.00 WHERE ID = 1;

COMMIT;
-- Agora a alteração é permanente

---------------------------------------------------------------------------

--Parte 10
-- Relatório: Top 5 jogadores com mais de 25 anos e salário > 100k
SELECT * FROM PLAYER 
WHERE SALARY > 100000 AND AGE > 25 
ORDER BY SALARY DESC 
LIMIT 5;

---------------------------------------------------------------------------

--Ajustes pontuais:
-- Parte 5: Novas consultas de comparação
SELECT * FROM PLAYER WHERE AGE > 25;
SELECT * FROM PLAYER WHERE SALARY < 100000;
SELECT * FROM TEAM WHERE FOUNDATION_YEAR > 1900;

-- Parte 10: O combo final solicitado
SELECT * FROM PLAYER 
WHERE AGE > 20 AND SALARY > 50000 
ORDER BY SALARY DESC 
LIMIT 5;

--Criando a tabela MATCHES

USE DB_T2_EVERTON_SILVA;

CREATE TABLE MATCHES (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TEAM_HOME_ID INT,
    TEAM_AWAY_ID INT,
    MATCH_DATE DATE,
    STADIUM VARCHAR(100),
    FOREIGN KEY (TEAM_HOME_ID) REFERENCES TEAM(ID),
    FOREIGN KEY (TEAM_AWAY_ID) REFERENCES TEAM(ID)
);

--Partida de teste
INSERT INTO MATCHES (TEAM_HOME_ID, TEAM_AWAY_ID, MATCH_DATE, STADIUM) 
VALUES (1, 2, '2026-04-01', 'Vila Belmiro');

---------------------------------------------------------------------------
--Complemento parte 5

-- Listar todas as partidas (Agora com o nome MATCHES)
SELECT * FROM MATCHES;

-- Filtros de comparação simples pedidos no novo PDF
SELECT * FROM PLAYER WHERE AGE > 25;
SELECT * FROM PLAYER WHERE SALARY < 100000;
SELECT * FROM TEAM WHERE FOUNDATION_YEAR > 1900;





