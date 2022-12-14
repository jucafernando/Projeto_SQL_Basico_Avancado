show tables;

/* QUESTÃO 3 TCC 
SELECT DATA_PUBLICACAO, TITULO_OBRA
FROM OBRA
ORDER BY DATA_PUBLICACAO;
*/

/* QUESTÃO 5 

SELECT SUM(Numero_Publicacao) AS QTD_TOTAL_OBRAS 
FROM OBRA;
/*QTD_TOTAL_OBRA 
676 */

/* QUESTÃO 5 

SHOW TABLES;

SELECT * FROM emprestimo;

SELECT ID_EMPRESTIMO, DATA_EMPRESTIMO 
FROM EMPRESTIMO
ORDER BY ID_EMPRESTIMO;
*/

/*QUESTÃO 6*/

SELECT ID_EMPRESTIMO, HORA_EMPRESTIMO, NOME_FUNCIONARIO
FROM EMPRESTIMO 
INNER JOIN FUNCIONARIO
ON EMPRESTIMO.ID_EMPRESTIMO = FUNCIONARIO.ID_FUNCIONARIO;

 SHOW TABLES;
 
 select * from funcionario;
 
SELECT Id_Funcionario, Nome_Funcionario
FROM funcionario
where Nome_Funcionario = 'Alice Meire';

update funcionario 
set Nome_Funcionario = 'Alice Meire' 
where Id_Funcionario = 8;

SELECT * FROM RESERVA;
GROUP BY NOME_USUARIO;

SHOW TABLES;

SELECT ID_USUARIO, NOME_USUARIO, COUNT(NOME_USUARIO) 
FROM USUARIO 
GROUP BY NOME_USUARIO 
HAVING COUNT(*) > 1;

SELECT ID_OBRA, VALOR_UNITARIO 
FROM DEVOLUCAO D
INNER JOIN ESTOQUE E
ON D.ID_DEVOLUCAO = E.ID_ESTOQUE;

SELECT * FROM EDITORA;


SELECT * FROM OBRA;

UPDATE DEVOLUCAO 
SET Multa_Atraso = 'SIM'
WHERE Multa_Atraso = 1;

SELECT TITULO_OBRA, VALOR_UNITARIO 
FROM OBRA O
INNER JOIN ESTOQUE E
ON O.ID_OBRA = E.ID_ESTOQUE;

SELECT NOME_AUTOR, NOME_EDITORA, QUANTIDADE_LIVRO
FROM AUTOR A
INNER JOIN EDITORA E
ON A.ID_AUTOR = E.ID_EDITORA
INNER JOIN ESTOQUE ES
ON ES. ID_ESTOQUE = E.ID_EDITORA;

SELECT TITULO_OBRA, NOME_AUTOR, NOME_EDITORA, QUANTIDADE_LIVRO
FROM OBRA O
INNER JOIN AUTOR A
ON O.ID_OBRA = A.ID_AUTOR
INNER JOIN EDITORA E
ON E.ID_EDITORA = A.ID_AUTOR
INNER JOIN ESTOQUE ED
ON ED.ID_ESTOQUE = E.ID_EDITORA;

SELECT NOME_FUNCIONARIO, NOME_DEPARTAMENTO
FROM FUNCIONARIO F
INNER JOIN DEPARTAMENTO D
ON F.ID_FUNCIONARIO = D.ID_DEPARTAMENTO;

CREATE VIEW VALOR_LIVRO 
AS SELECT TITULO_OBRA, VALOR_UNITARIO
FROM OBRA O
INNER JOIN ESTOQUE E
ON O.ID_OBRA = E.ID_ESTOQUE;

SELECT * FROM RESERVA;

SELECT F. NOME_FUNCIONARIO, D.NOME_DEPARTAMENTO 
FROM FUNCIONARIO F
INNER JOIN DEPARTAMENTO D
ON F.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO; 

show tables;

SELECT U.NOME_USUARIO, 
U.LOGRADOURO, 
U.BAIRRO, 
U.TELEFONE, 
U.CEP, 
E.DATA_EMPRESTIMO, 
E.DATA_ENTREGA, 
R.DATA_RESERVA 
FROM USUARIO U
INNER JOIN EMPRESTIMO E
ON U.ID_USUARIO = E.ID_EMPRESTIMO
INNER JOIN RESERVA R
ON E.ID_EMPRESTIMO = R.ID_RESERVA;

SELECT U.NOME_USUARIO, 
U.LOGRADOURO, 
U.BAIRRO, 
U.TELEFONE, 
U.CEP, 
MIN(DATA_EMPRESTIMO), 
MIN(DATA_ENTREGA), 
MIN(DATA_RESERVA)
FROM USUARIO U
INNER JOIN EMPRESTIMO E
ON U.ID_USUARIO = E.ID_EMPRESTIMO
INNER JOIN RESERVA R
ON E.ID_EMPRESTIMO = R.ID_RESERVA;

SELECT U.NOME_USUARIO, 
U.LOGRADOURO, 
U.BAIRRO, 
U.TELEFONE, 
U.CEP, 
MIN(DATA_EMPRESTIMO), 
MIN(DATA_ENTREGA), 
MIN(DATA_RESERVA)
FROM USUARIO U
INNER JOIN EMPRESTIMO E
ON U.ID_USUARIO = E.ID_EMPRESTIMO
INNER JOIN RESERVA R
ON E.ID_EMPRESTIMO = R.ID_RESERVA
GROUP BY DATA_EMPRESTIMO;

SELECT DATA_EMPRESTIMO, 
MIN(DATA_ENTREGA),
MIN(NOME_USUARIO), 
MIN(LOGRADOURO), 
U.BAIRRO, 
U.TELEFONE, 
U.CEP, 
DATA_RESERVA
FROM EMPRESTIMO E
INNER JOIN USUARIO U
ON E.ID_EMPRESTIMO = U.ID_USUARIO
INNER JOIN RESERVA R
ON U.ID_USUARIO = R.ID_RESERVA;

SELECT * FROM AUTOR;

SELECT O.TITULO_OBRA, A.ID_AUTOR, A.NOME_AUTOR 
FROM OBRA O 
INNER JOIN AUTOR A 
ON O.ID_OBRA = A.ID_AUTOR;

SELECT O.TITULO_OBRA, COUNT(A.ID_AUTOR), A.NOME_AUTOR, DATA_EMPRESTIMO
FROM OBRA O 
INNER JOIN AUTOR A 
ON O.ID_OBRA = A.ID_AUTOR
INNER JOIN EMPRESTIMO E 
ON O.ID_OBRA = E.ID_EMPRESTIMO
HAVING COUNT(ID_AUTOR) > 2


SELECT * FROM AUTOR;


SELECT * FROM OBRA;

SELECT * FROM EMPRESTIMO;


SELECT * FROM RESERVA;


SELECT O.TITULO_OBRA, A.NOME_AUTOR, ED.NOME_EDITORA, ES.QUANTIDADE_LIVRO
FROM OBRA O
INNER JOIN AUTOR A
ON O.ID_AUTOR = A.ID_AUTOR
INNER JOIN EDITORA ED
ON O.ID_EDITORA = ED.ID_EDITORA
INNER JOIN ESTOQUE ES
ON O.ID_OBRA = ES.ID_OBRA;


SELECT DATA_EMPRESTIMO, DATA_RESERVA, DATA_DEVOLUCAO,
MIN(DATA_ENTREGA),
U.NOME_USUARIO, 
U.LOGRADOURO, 
U.BAIRRO, 
U.TELEFONE, 
U.CEP,
DATA_RESERVA
FROM EMPRESTIMO E
INNER JOIN USUARIO U
ON E.ID_USUARIO = U.ID_USUARIO
INNER JOIN RESERVA R 
ON U.ID_USUARIO = R.ID_RESERVA
INNER JOIN DEVOLUCAO D
ON E.ID_EMPRESTIMO = D.ID_EMPRESTIMO
WHERE DATA_EMPRESTIMO = '2011/06/09' AND  DATA_RESERVA = '2011/06/05';


SELECT HORA_EMPRESTIMO, HORA_DEVOLUCAO, HORA_RESERVA
FROM EMPRESTIMO E 
INNER JOIN DEVOLUCAO D 
ON E.ID_EMPRESTIMO = D.ID_DEVOLUCAO 
INNER JOIN RESERVA R 
ON E.ID_EMPRESTIMO = R.ID_RESERVA
WHERE HORA_EMPRESTIMO LIKE '08:%';

USE BIBLIOTECA;

SELECT DATA_EMPRESTIMO, COUNT(O.ID_AUTOR) AS 'ID DO AUTOR COM MAIS LEUTURAS', NOME_AUTOR
FROM EMPRESTIMO E 
INNER JOIN OBRA O
ON E.ID_OBRA = O.ID_OBRA
INNER JOIN AUTOR A 
ON O.ID_AUTOR = A.ID_AUTOR
WHERE DATA_EMPRESTIMO LIKE '2012%' and DATA_EMPRESTIMO LIKE '2013%' 
HAVING COUNT(O.ID_AUTOR) > 2;

SELECT * FROM AUTOR;

SELECT DATA_EMPRESTIMO, O.ID_AUTOR, NOME_AUTOR 
FROM EMPRESTIMO E
INNER JOIN OBRA O 
ON E.ID_OBRA = O.ID_OBRA
INNER JOIN AUTOR A 
ON O.ID_OBRA = A.ID_AUTOR;

SELECT DATA_EMPRESTIMO, O.ID_AUTOR, COUNT(O.ID_AUTOR), NOME_AUTOR
FROM EMPRESTIMO E 
INNER JOIN OBRA O 
ON E.ID_OBRA = O.ID_OBRA
INNER JOIN AUTOR A 
ON E.ID_EMPRESTIMO = A.ID_AUTOR
WHERE DATA_EMPRESTIMO LIKE '2012%' OR DATA_EMPRESTIMO LIKE '2013%'
GROUP BY ID_AUTOR;

SELECT * FROM DEVOLUCAO;

USE BIBLIOTECA;

SELECT O.ID_OBRA, O.TITULO_OBRA, A.NOME_AUTOR, NOME_EDITORA, O.NUMERO_PUBLICACAO
FROM OBRA O
INNER JOIN AUTOR A
ON O.ID_AUTOR = A.ID_AUTOR 
INNER JOIN EDITORA E 
ON O.ID_EDITORA = E.ID_EDITORA
WHERE NUMERO_PUBLICACAO <= 8
ORDER BY ID_OBRA; 

SELECT ID_USUARIO, NOME_USUARIO, CONCAT(substr(CPF, 1, 4), '******',
                                       substr(CPF, 12, 14)) AS CPF
FROM USUARIO 
WHERE CPF LIKE '193%'; 

SELECT ID_EMPRESTIMO, DATA_EMPRESTIMO
FROM EMPRESTIMO
WHERE DATA_EMPRESTIMO LIKE '2013%'
HAVING AVG(ID_EMPRESTIMO);

SELECT AVG(E.ID_EMPRESTIMO), E.DATA_EMPRESTIMO, O.ID_OBRA, O.TITULO_OBRA, A.ID_AUTOR, A.NOME_AUTOR, ED.ID_EDITORA, ED.NOME_EDITORA
FROM EMPRESTIMO E 
INNER JOIN OBRA O
ON E.ID_OBRA = O.ID_OBRA
INNER JOIN AUTOR A 
ON O.ID_AUTOR = A.ID_AUTOR
INNER JOIN EDITORA ED 
ON O.ID_EDITORA = ED.ID_EDITORA;

USE BIBLIOTECA;

SELECT * FROM AUTOR;

DROP TABLE MEDIA_EMPRESTIMO;

CREATE TABLE MEDIA_EMPRESTIMO(
ID_MEDIA SMALLINT PRIMARY KEY AUTO_INCREMENT,
MEDIA_EMPRESTIMO SMALLINT NOT NULL,
MEDIA_AUTOR SMALLINT NOT NULL,
MEDIA_EDITORA SMALLINT NOT NULL, 
CALC_MEDIA_3_ANOS SMALLINT GENERATED ALWAYS AS (MEDIA_EMPRESTIMO + MEDIA_EMPRESTIMO * 60/100) VIRTUAL,
CALC_MEDIA_AUTOR SMALLINT GENERATED ALWAYS AS (MEDIA_AUTOR + MEDIA_AUTOR * 60/100) VIRTUAL,
CALC_MEDIA_EDITORA SMALLINT GENERATED ALWAYS AS (MEDIA_EDITORA + MEDIA_EDITORA * 60/100) VIRTUAL);

INSERT INTO MEDIA_EMPRESTIMO (MEDIA_EMPRESTIMO) VALUES (15);
