USE DB_T2_EVERTON_SILVA;

-- Parte 3: Especificando campos
INSERT INTO BROADCASTER (ID, NAME, FOUNDATION_YEAR) VALUES 
(1, 'Globo', 1965),
(2, 'SBT', 1981),
(3, 'Record', 1953),
(4, 'Band', 1967),
(5, 'Cultura', 1960);

INSERT INTO BROADCASTER VALUES 
(6, 'Manchete', 'Brasil', 1983),
(7, 'Tupi', 'Brasil', 1950),
(8, 'MTV', 'EUA', 1990),
(9, 'Viva', 'Brasil', 2010),
(10, 'GNT', 'Brasil', 1991);


INSERT INTO ACTOR VALUES 
(6, 'Adriana Esteves', 54, 'Carminha', 50000.00),
(7, 'Wagner Moura', 47, 'Capitão Nascimento', 80000.00),
(8, 'Alice Braga', 40, 'Angélica', 100000.00),
(9, 'Rodrigo Santoro', 48, 'Diogo', 90000.00),
(10, 'Paolla Oliveira', 41, 'Vivi Guedes', 70000.00);

INSERT INTO NOVELA VALUES 
(6, 'Tieta', 1989, 'Drama', 60),
(7, 'Senhora do Destino', 2004, 'Drama', 50),
(8, 'Caminho das Índias', 2009, 'Romance', 45),
(9, 'Cordel Encantado', 2011, 'Fábula', 35),
(10, 'Renascer', 1993, 'Drama', 55);






USE DB_T2_EVERTON_SILVA;

-- ### Consultas Básicas (Trazer tudo) ###

SELECT * FROM NOVELA;
SELECT * FROM ACTOR;
SELECT * FROM BROADCASTER;


-- ### Consultas Específicas (Filtrar colunas) ###

-- Exiba apenas NAME e YEAR da tabela NOVELA
SELECT NAME, YEAR FROM NOVELA;

-- Exiba apenas NAME e GENRE da tabela NOVELA
SELECT NAME, GENRE FROM NOVELA;

-- Exiba apenas NAME e AGE da tabela ACTOR
SELECT NAME, AGE FROM ACTOR;

-- Exiba apenas NAME e SALARY da tabela ACTOR
SELECT NAME, SALARY FROM ACTOR;

-- Exiba apenas o campo NAME da tabela BROADCASTER
SELECT NAME FROM BROADCASTER;


-- ### Ordenação de dados (ORDER BY) ###

-- Liste as novelas ordenadas por YEAR
SELECT * FROM NOVELA ORDER BY YEAR;

-- Liste os atores ordenados por AGE
SELECT * FROM ACTOR ORDER BY AGE;

-- Liste as emissoras ordenadas por FOUNDATION_YEAR
SELECT * FROM BROADCASTER ORDER BY FOUNDATION_YEAR;


##EXERCICIO DE FIXACAO###

USE DB_T2_EVERTON_SILVA;

-- ### 1. Insira um registro com dados criativos ###

INSERT INTO ACTOR (ID, NAME, AGE, CHARACTER_NAME, SALARY) 
VALUES (11, 'Everton Silva', 38, 'O Engenheiro de Dados', 15000.00);

-- ### 2. Tente inserir dados com erro (Tipo ou Quantidade) ###

INSERT INTO ACTOR (ID, NAME, AGE, CHARACTER_NAME, SALARY) 
VALUES (12, 'Erro de Teste', 30, 'Vilão do SQL', 'MIL REAIS'); 

INSERT INTO ACTOR (ID, NAME, AGE, CHARACTER_NAME) 
VALUES (13, 'Erro de Coluna', 25, 'Coadjuvante');

-- ### 3. Execute consultas para validar os dados ###

SELECT * FROM ACTOR WHERE NAME = 'Everton Silva';

-- Ver a lista completa atualizada e ordenada
SELECT * FROM ACTOR ORDER BY ID;