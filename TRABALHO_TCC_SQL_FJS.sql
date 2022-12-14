show tables;

/* QUESTÃO 3 TCC 
SELECT DATA_PUBLICACAO, TITULO_OBRA
FROM OBRA
ORDER BY DATA_PUBLICACAO;
*/

/* QUESTÃO 4 

SELECT SUM(NUMERO_PUBLICACAO) AS QTD_TOTAL_OBRAS 
FROM OBRA;
OU 
SELECT SUM(QUANTIDADE_LIVRO) AS QTD_TOTAL_OBRAS 
FROM ESTOQUE;
/*QTD_TOTAL_OBRA 
673 */

/* QUESTÃO 5 

SHOW TABLES;

SELECT * FROM emprestimo;

SELECT ID_EMPRESTIMO, DATA_EMPRESTIMO 
FROM EMPRESTIMO
GROUP BY ID_EMPRESTIMO;
*/

/*QUESTÃO 6

SELECT NOME_FUNCIONARIO, 

SELECT ID_FUNCIONARIO, ID_EMPRESTIMO, HORA_EMPRESTIMO 
FROM EMPRESTIMO 
WHERE ID_FUNCIONARIO = 8
AND 
HORA_EMPRESTIMO = '08:00';
*/

QUESTÃO 7


SELECT ID_DEVOLUCAO, DATA_DEVOLUCAO 
FROM DEVOLUCAO 
WHERE DATA_DEVOLUCAO BETWEEN '2012/03/29' AND '2013/02/02'; 


/* QUESTÃO 8 

SELECT * FROM RESERVA;

SELECT ID_RESERVA, DATA_RESERVA 
FROM RESERVA 
WHERE DATA_RESERVA >= '2011/08/18'; 
*/

/* QUESTÃO 9

SELECT DATA_DEVOLUCAO 
FROM DEVOLUCAO 
WHERE DATA_DEVOLUCAO < '2012/03/29';
*/

/* QUESTÃO 10´/

SELECT ID_OBRA, TITULO_OBRA 
FROM OBRA
WHERE TITULO_OBRA <> 'O Conde de Monte Cristo'
AND 
TITULO_OBRA <> 'Filhos e Amantes';
*/

/* QUESTÃO 11 

SELECT ID_OBRA, TITULO_OBRA, GENERO 
FROM OBRA
WHERE GENERO = 'Ficção';
*/

/* QUESTÃO 12

SELECT ID_OBRA, MAX(QUANTIDADE_LIVRO) AS 'MAIOR_QTD_ESTOQUE
FROM ESTOQUE;
*/

/* QUESTÃO 13 

SELECT ID_OBRA, MIN(QUANTIDADE_LIVRO) AS QUANTIDADE_MINIMA_DE_LIVROS
FROM ESTOQUE;
*/

/* QUESTÃO 14 

SELECT COUNT(ID_USUARIO) 'QUANTIDADE USUARIOS'
FROM USUARIO;
*/

/* QUESTÃO 15 

SELECT ID_OBRA, GENERO, SUM(NUMERO_PUBLICACAO) AS MAIOR_QTD_PUBLICACAO
FROM OBRA 
GROUP BY GENERO
HAVING MAX(NUMERO_PUBLICACAO)
ORDER BY NUMERO_PUBLICACAO; 
*/

/*QUESTÃO 16

UPDATE OBRA 
SET GENERO = 'Político'
WHERE TITULO_OBRA = 'Discurso do Método';
*/

/* QUESTÃO 17 

UPDATE USUARIO 
SET BAIRRO = 'Mooca'
WHERE NOME_USUARIO = 'Alberto Roberto';
*/

/* QUESTÃO 18 

UPDATE OBRA 
SET NUMERO_PUBLICACAO = 44
WHERE TITULO_OBRA = 'Filho Nativo';

UPDATE OBRA 
SET NUMERO_PUBLICACAO = 44
WHERE TITULO_OBRA = 'Vidas Secas';

UPDATE OBRA 
SET NUMERO_PUBLICACAO = 1
WHERE TITULO_OBRA = 'Dom Casmurro';

SELECT * FROM OBRA;
*/

/* QUESTÃO 19

ALTER TABLE USUARIO 
MODIFY CPF BIGINT;

INSERT INTO USUARIO 
VALUES 
(31, 'Alfredo Tenttoni','Rua Amazonas 58', 'Pirai', 65495491, 02170251, 29426487532);

INSERT INTO USUARIO (ID_Usuario, Nome_Usuario, Logradouro, Bairro, Telefone, CEP, CPF)
VALUES 
(32, 'Cindy Crall','Rua Ipiranga 123', 'Vila Cristal', 58466577, 02182637, 12214765549);

INSERT INTO USUARIO (ID_Usuario, Nome_Usuario, Logradouro, Bairro, Telefone, CEP, CPF)
VALUES 
(33, 'Rubens Prado','Avenida dos Monges 51', 'Campo Grande', 51848978, 52412365, 65458642798);

INSERT INTO USUARIO (ID_Usuario, Nome_Usuario, Logradouro, Bairro, Telefone, CEP, CPF)
VALUES 
(34, 'Carlos Pracidelli','Travessa dos Irmãos 48', 'Cotia', 89457986, 23124005, 34125165175);

INSERT INTO USUARIO (ID_Usuario, Nome_Usuario, Logradouro, Bairro, Telefone, CEP, CPF)
VALUES 
(35, 'Ernesto Coimbra','Avenida Amperé 414', 'Jardim Elvira', 5844-2654, 05728368, 19310721435);

*/

/* QUESTÃO 20 

SELECT NOME_USUARIO, COUNT(NOME_USUARIO) AS QTD_REPETICOES
FROM USUARIO 
GROUP BY NOME_USUARIO 
HAVING COUNT(*) > 1;

SELECT Nome_Usuario 
FROM Usuario 
GROUP BY Nome_Usuario
HAVING COUNT(Nome_Usuario) > 1;
*/

/* QUESTÃO 21

DELETE FROM USUARIO 
WHERE ID_USUARIO = 32;

DELETE FROM USUARIO 
WHERE ID_USUARIO = 35;
*/

/* QUESTÃO 22 REVISAR

ALTER TABLE OBRA 
ADD COLUMN Valor_livro FLOAT;
*/

/* QUESTÃO 23

ALTER TABLE DEVOLUCAO 
MODIFY Multa_Atraso ENUM(3);
*/

/* QUESTÃO 24 - REVISAR 

UPDATE DEVOLUCAO 
SET Multa_Atraso = 'NÃO'
WHERE Multa_Atraso = 0;

UPDATE DEVOLUCAO 
SET Multa_Atraso = 'SIM'
WHERE Multa_Atraso = (1);
*/

/* QUESTÃO 25

ALTER TABLE OBRA 
DROP COLUMN Valor_livro;
 */

 /* QUESTÃO 26 

SELECT ID_EMPRESTIMO, NOME_FUNCIONARIO, TITULO_OBRA
FROM EMPRESTIMO E
INNER JOIN FUNCIONARIO F
ON E.ID_FUNCIONARIO = F.ID_FUNCIONARIO
INNER JOIN OBRA O 
ON E.ID_OBRA = O.ID_OBRA;
*/

/* QUESTÃO 27 

SELECT ID_DEVOLUCAO, DATA_DEVOLUCAO, VALOR_UNITARIO, D.ID_OBRA
FROM DEVOLUCAO D
INNER JOIN ESTOQUE E
ON D.ID_OBRA = E.ID_OBRA
ORDER BY ID_DEVOLUCAO;
*/

/* QUESTÃO 28 

SELECT NOME_USUARIO, DATA_ENTREGA 
FROM USUARIO U
INNER JOIN EMPRESTIMO E
ON U.ID_USUARIO = E.ID_USUARIO
GROUP BY NOME_USUARIO
HAVING DATA_ENTREGA = '2011/08/21';
*/

/* QUESTÃO 29 

SELECT TITULO_OBRA, DATA_PUBLICACAO, QUANTIDADE_LIVRO, VALOR_UNITARIO
FROM OBRA O
INNER JOIN ESTOQUE E
ON O.ID_OBRA = E.ID_OBRA
HAVING DATA_PUBLICACAO < '2013/03/04';
*/

/* QUESTÃO 30

SELECT ID_FUNCIONARIO, NOME_FUNCIONARIO, NOME_CARGO, SALÁRIO 
FROM FUNCIONARIO F
INNER JOIN CARGO C
ON F.ID_CARGO = C.ID_CARGO;
*/

/* QUESTÃO 31

SELECT O.TITULO_OBRA, A.NOME_AUTOR, ED.NOME_EDITORA, ES.QUANTIDADE_LIVRO
FROM OBRA O
INNER JOIN AUTOR A
ON O.ID_AUTOR = A.ID_AUTOR
INNER JOIN EDITORA ED
ON O.ID_EDITORA = ED.ID_EDITORA
INNER JOIN ESTOQUE ES
ON O.ID_OBRA = ES.ID_OBRA;
*/

/* QUESTÃO 32 

SELECT NOME_FUNCIONARIO, NOME_DEPARTAMENTO
FROM FUNCIONARIO F
INNER JOIN DEPARTAMENTO D
ON F.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO;
*/

/* QUESTÃO 33

CREATE VIEW VALOR_LIVRO 
AS SELECT TITULO_OBRA, VALOR_UNITARIO
FROM OBRA O
INNER JOIN ESTOQUE E
ON O.ID_OBRA = E.ID_OBRA;
*/

/* QUESTÃO 34

SELECT O.ID_OBRA, O.TITULO_OBRA, E.VALOR_UNITARIO
FROM OBRA O
INNER JOIN ESTOQUE E
ON O.ID_OBRA = E.ID_OBRA
HAVING VALOR_UNITARIO > 90;
*/

/* QUESTÃO 35
UPDATE CARGO 
SET SALÁRIO = (12 / 100 * 1700) + 1700 
WHERE NOME_CARGO = 'Auxiliar Financeiro';

UPDATE CARGO
SET SALÁRIO = 20000
WHERE NOME_CARGO = 'Diretor';

UPDATE CARGO
SET SALÁRIO = 8000
WHERE NOME_CARGO = 'Gerente';

UPDATE CARGO
SET SALÁRIO = 7000
WHERE NOME_CARGO = 'Coordenador de Finanças';

UPDATE CARGO
SET SALÁRIO = 7000
WHERE NOME_CARGO = 'Coordenador Contabil';

UPDATE CARGO
SET SALÁRIO = 6000
WHERE NOME_CARGO = 'Coordenador de RH';

UPDATE CARGO
SET SALÁRIO = 7000
WHERE NOME_CARGO = 'Coordenador de TI';

UPDATE CARGO
SET SALÁRIO = 3000
WHERE NOME_CARGO = 'Analista de Sistemas';

UPDATE CARGO
SET SALÁRIO = 2500
WHERE NOME_CARGO = 'Analista de Suporte';

UPDATE CARGO
SET SALÁRIO = 1700
WHERE NOME_CARGO = 'Auxiliar Financeiro';

UPDATE CARGO
SET SALÁRIO = 1700
WHERE NOME_CARGO = 'Auxiliar Contábil';

UPDATE CARGO
SET SALÁRIO = 1300
WHERE NOME_CARGO = 'Auxiliar de RH';

UPDATE CARGO
SET SALÁRIO = 1000
WHERE NOME_CARGO = 'Recepcionista';


UPDATE Cargo
SET SALÁRIO = 7000
WHERE ID_CARGO = 3;

*/ 

/* QUESTÃO 36

UPDATE FUNCIONARIO 
SET DATA_ADMISSAO = '1966/10/31'
WHERE NOME_FUNCIONARIO = 'Alice Meire';
*/ 

/* QUESTÃO 37

SELECT * FROM OBRA;
*/

/* QUESTÃO 38

SELECT F.ID_FUNCIONARIO, F.NOME_FUNCIONARIO, D.NOME_DEPARTAMENTO
FROM FUNCIONARIO F
INNER JOIN DEPARTAMENTO D
ON F.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO
ORDER BY NOME_FUNCIONARIO;
*/ 

/* QUESTÃO 39 

SELECT COUNT(LOGRADOURO)
FROM USUARIO;

SELECT CEP, COUNT(LOGRADOURO)
FROM USUARIO
GROUP BY CEP; 
*/

/* QUESTÃO 40

SELECT NOME_USUARIO, COUNT(BAIRRO)
FROM USUARIO 
GROUP BY NOME_USUARIO;
*/ 

/* QUESTÃO 41 IMCOMPLETA

SELECT F.ID_FUNCIONARIO, F.NOME_FUNCIONARIO, D.ID_DEPARTAMENTO, D.NOME_DEPARTAMENTO 
FROM FUNCIONARIO F
INNER JOIN DEPARTAMENTO D
ON F.ID_DEPARTAMENTO = D.ID_DEPARTAMENTO
HAVING ID_DEPARTAMENTO = 7; 
*/ 

/* QUESTÃO 42

SELECT R.ID_OBRA, DATA_RESERVA, HORA_RESERVA 
FROM RESERVA R
WHERE HORA_RESERVA = '15:00:00';

SELECT F.NOME_FUNCIONARIO, R.DATA_RESERVA, R.HORA_RESERVA
FROM FUNCIONARIO F
INNER JOIN RESERVA R
ON F.ID_FUNCIONARIO = R.ID_FUNCIONARIO
HAVING HORA_RESERVA = '15:00:00';
*/

/* QUESTÃO 43 

SELECT E.DATA_EMPRESTIMO, U.NOME_USUARIO, O.TITULO_OBRA, DATA_EMPRESTIMO, VALOR_UNITARIO AS VALOR_TOTAL_OBRAS
FROM EMPRESTIMO E
INNER JOIN USUARIO U
ON E.ID_USUARIO = U.ID_USUARIO
INNER JOIN OBRA O
ON E.ID_OBRA = O.ID_OBRA
INNER JOIN ESTOQUE ES
ON ES.ID_OBRA = E.ID_OBRA
WHERE NOME_USUARIO = 'Whitney Cinse' OR NOME_USUARIO = 'Emily Mall';

*/ 

/* QUESTÃO 44

SELECT * FROM RESERVA; 

SELECT * FROM EMPRESTIMO
ORDER BY DATA_EMPRESTIMO;

SELECT * FROM RESERVA;

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
WHERE DATA_EMPRESTIMO = '2011/06/09' AND DATA_RESERVA = '2011/06/05';

/* QUESTÃO 45

SELECT O.ID_OBRA, O.TITULO_OBRA, E.NUMERO_PUBLICACAO, E.NOME_EDITORA 
FROM OBRA O
INNER JOIN EDITORA E
ON O.ID_EDITORA = E.ID_EDITORA
GROUP BY O.ID_EDITORA
HAVING COUNT(NOME_EDITORA);
*/

/* QUESTÃO 46 REVISAR

SELECT * FROM DEVOLUCAO;

*/

/* QUESTÃO 47 

SELECT ID_USUARIO, NOME_USUARIO, CPF, LOGRADOURO
FROM USUARIO 
WHERE LOGRADOURO LIKE 'Avenida%'
ORDER BY CPF;
*/ 

/* QUESTÃO 48 

SELECT O.ID_OBRA, O.TITULO_OBRA, COUNT(TITULO_OBRA) AS QUANTIDADE_EMPRESTIMO, DATA_EMPRESTIMO
FROM EMPRESTIMO E 
INNER JOIN OBRA O 
ON E.ID_OBRA = O.ID_OBRA
WHERE DATA_EMPRESTIMO LIKE '2013-%'
GROUP BY TITULO_OBRA  
HAVING COUNT(DATA_EMPRESTIMO) > 1 ;

SELECT E.ID_Obra, O.Titulo_Obra, COUNT(E.ID_Obra) AS 'Qdd_emprestimos'
FROM Obra O
INNER JOIN Emprestimo E
ON O.ID_Obra = E.ID_Obra
WHERE (E.Data_Emprestimo BETWEEN '2011-01-01' AND '2013-12-31')
GROUP BY O.Titulo_Obra
HAVING COUNT(E.ID_Obra) > 1;

*/ 

/* QUESTÃO 49

SELECT E.ID_EMPRESTIMO, AVG(VALOR_UNITARIO) AS VALOR_DA_MEDIA, UCASE(O.TITULO_OBRA) AS NOME_LIVRO
FROM EMPRESTIMO E
INNER JOIN ESTOQUE ES
ON E.ID_EMPRESTIMO = ES.ID_ESTOQUE
INNER JOIN OBRA O 
ON E.ID_EMPRESTIMO = O.ID_OBRA
GROUP BY TITULO_OBRA
HAVING AVG(VALOR_UNITARIO) >= (SELECT AVG(VALOR_UNITARIO)
                                      FROM ESTOQUE)
UNION
( SELECT ID_DEVOLUCAO, AVG(VALOR_UNITARIO), LCASE(TITULO_OBRA)
 FROM DEVOLUCAO D
 INNER JOIN ESTOQUE ES
 ON D.ID_DEVOLUCAO = ES.ID_ESTOQUE
 INNER JOIN OBRA O 
 ON D.ID_DEVOLUCAO = O.ID_OBRA
 GROUP BY TITULO_OBRA
 HAVING AVG(VALOR_UNITARIO) <= (SELECT AVG(VALOR_UNITARIO)
                                      FROM ESTOQUE));
*/

/* QUESTÃO 50

SELECT F.NOME_FUNCIONARIO, C.NOME_CARGO, AVG(SALÁRIO) AS MAIORES_SALÁRIOS
FROM FUNCIONARIO F
INNER JOIN CARGO C
ON F.ID_CARGO = C.ID_CARGO
GROUP BY NOME_FUNCIONARIO
HAVING AVG(SALÁRIO) >= (SELECT AVG(SALÁRIO)
                                      FROM CARGO);
*/

/* QUESTÃO 51

SELECT U.ID_USUARIO, UCASE(NOME_USUARIO) AS NOME_DO_USUARIO, LOGRADOURO, BAIRRO, CEP, CPF 
FROM EMPRESTIMO E
RIGHT JOIN USUARIO U 
ON E.ID_EMPRESTIMO = U.ID_USUARIO
WHERE U.ID_USUARIO > 30; /* REALIZANDO UMA ANALISE NA TABELA EMPRESTTIMO, DESCOBRI QUE OS 
USUARIOS COM OS ID´S DE 31 EM DIANTE NÃO POSSUEM NENHUM EMPRESTIMO*/
*/

/* QUESTÃO 52

SELECT DATA_EMPRESTIMO, HORA_EMPRESTIMO, NOME_USUARIO, LOGRADOURO, BAIRRO, CEP, CPF 
FROM EMPRESTIMO E
INNER JOIN USUARIO U
ON E.ID_EMPRESTIMO = U.ID_USUARIO 
ORDER BY CEP;
*/

/* QUESTÃO 53

SELECT TITULO_OBRA, GENERO, STATUS_LIVRO, DATA_EMPRESTIMO 
FROM OBRA O 
INNER JOIN RESERVA R 
ON O.ID_OBRA = R.ID_RESERVA 
INNER JOIN EMPRESTIMO E 
ON O.ID_OBRA = E.ID_EMPRESTIMO
WHERE STATUS_LIVRO = 'Disponível';
*/ 

QUESTÃO 54

SELECT HORA_DEVOLUCAO, HORA_EMPRESTIMO, HORA_RESERVA
FROM DEVOLUCAO D 
INNER JOIN EMPRESTIMO E 
ON D.ID_EMPRESTIMO = E.ID_EMPRESTIMO 
INNER JOIN RESERVA R 
ON E.ID_EMPRESTIMO = R.ID_RESERVA
HAVING COUNT(HORA_DEVOLUCAO) > 4 AND COUNT(HORA_EMPRESTIMO) > 4 AND COUNT(HORA_RESERVA) > 4;

/*
UNION 
SELECT HORA_DEVOLUCAO, HORA_EMPRESTIMO, HORA_RESERVA
FROM DEVOLUCAO D 
INNER JOIN EMPRESTIMO E 
ON D.ID_EMPRESTIMO = E.ID_EMPRESTIMO 
INNER JOIN RESERVA R 
ON E.ID_EMPRESTIMO = R.ID_RESERVA
HAVING COUNT(HORA_DEVOLUCAO) < 1 AND COUNT(HORA_EMPRESTIMO) < 1 AND COUNT(HORA_RESERVA) < 1; 
*/


SELECT HORA_DEVOLUCAO 
FROM DEVOLUCAO 
ORDER BY HORA_DEVOLUCAO;

SELECT HORA_EMPRESTIMO 
FROM EMPRESTIMO 
HAVING COUNT(HORA_EMPRESTIMO) > 4
ORDER BY HORA_EMPRESTIMO;


SELECT HORA_RESERVA 
FROM RESERVA 
HAVING COUNT(HORA_RESERVA) < 4
ORDER BY HORA_RESERVA;


/* QUESTÃO 55 

mysql> SELECT DATA_EMPRESTIMO, O.ID_AUTOR, COUNT(O.ID_AUTOR)
    -> FROM EMPRESTIMO E
    -> INNER JOIN OBRA O
    -> ON E.ID_OBRA = O.ID_OBRA
    -> WHERE DATA_EMPRESTIMO LIKE '2012%' OR DATA_EMPRESTIMO LIKE '2013%'
    -> GROUP BY ID_AUTOR;
+-----------------+----------+-------------------+
| DATA_EMPRESTIMO | ID_AUTOR | COUNT(O.ID_AUTOR) |
+-----------------+----------+-------------------+
| 2012-03-25      |        2 |                 2 |
| 2012-03-27      |       10 |                 3 |
| 2012-03-29      |        3 |                 3 |
| 2012-04-01      |       15 |                 1 |
| 2013-06-25      |        6 |                 1 |
| 2013-07-07      |       14 |                 1 |
| 2013-07-07      |        8 |                 3 |
| 2013-06-25      |       12 |                 1 |
| 2012-12-28      |        7 |                 1 |
| 2013-06-25      |        5 |                 1 |
| 2013-07-07      |       13 |                 1 |
+-----------------+----------+-------------------+
11 rows in set (0.00 sec)
*/

/* QUESTÃO 56

SELECT D.DATA_DEVOLUCAO, COUNT(DATA_DEVOLUCAO), E.DATA_EMPRESTIMO, COUNT(DATA_EMPRESTIMO), F.ID_FUNCIONARIO
FROM DEVOLUCAO D
INNER JOIN EMPRESTIMO E
ON D.ID_EMPRESTIMO = E.ID_EMPRESTIMO
INNER JOIN FUNCIONARIO F 
ON D.ID_FUNCIONARIO = F.ID_FUNCIONARIO;

*/

/* QUESTÃO 57 

SELECT U.NOME_USUARIO, U.TELEFONE, U.LOGRADOURO, E.NOME_EDITORA 
FROM USUARIO U
INNER JOIN EDITORA E
ON U.LOGRADOURO = E.LOGRADOURO
WHERE U.LOGRADOURO = E.LOGRADOURO; */

/* QUESTÃO 58

CREATE VIEW PRECO_LIVROS_LEYA
AS SELECT O.ID_OBRA, O.TITULO_OBRA, ES.VALOR_UNITARIO, E.NOME_EDITORA 
FROM ESTOQUE ES  
INNER JOIN OBRA O 
ON ES.ID_OBRA = O.ID_OBRA
INNER JOIN EDITORA E 
ON O.ID_EDITORA = E.ID_EDITORA
WHERE NOME_EDITORA = 'LEYA'; 

SELECT O.ID_OBRA, O.TITULO_OBRA, E.NOME_EDITORA 
FROM OBRA O 
INNER JOIN EDITORA E 
ON O.ID_EDITORA = E.ID_EDITORA;
*/ 

/* QUESTÃO 59 
UPDATE ESTOQUE E
INNER JOIN OBRA O  
ON E.ID_OBRA = O.ID_OBRA 
INNER JOIN EDITORA ED 
ON O.ID_EDITORA = ED.ID_EDITORA
SET VALOR_UNITARIO = VALOR_UNITARIO + VALOR_UNITARIO * 16 / 100
WHERE NOME_EDITORA = 'Saraiva';

SELECT O.ID_OBRA, O.TITULO_OBRA, ES.VALOR_UNITARIO, E.NOME_EDITORA 
FROM ESTOQUE ES  
INNER JOIN OBRA O 
ON ES.ID_OBRA = O.ID_OBRA
INNER JOIN EDITORA E 
ON O.ID_EDITORA = E.ID_EDITORA
WHERE NOME_EDITORA = 'Saraiva';

SELECT O.ID_OBRA, O.TITULO_OBRA, NOME_EDITORA 
FROM OBRA O 
INNER JOIN EDITORA E 
ON O.ID_EDITORA = E.ID_EDITORA
WHERE NOME_EDITORA = 'Saraiva';

mysql> SELECT O.ID_OBRA, O.TITULO_OBRA, ES.VALOR_UNITARIO, E.NOME_EDITORA
    -> FROM ESTOQUE ES
    -> INNER JOIN OBRA O
    -> ON ES.ID_OBRA = O.ID_OBRA
    -> INNER JOIN EDITORA E
    -> ON O.ID_EDITORA = E.ID_EDITORA
    -> WHERE NOME_EDITORA = 'Saraiva';
+---------+------------------+----------------+--------------+
| ID_OBRA | TITULO_OBRA      | VALOR_UNITARIO | NOME_EDITORA |
+---------+------------------+----------------+--------------+
|      14 | Falcão de Malta  |            113 | Saraiva      |
|      20 | Fluviais         |            109 | Saraiva      |
|      30 | Arte Da Guerra   |            104 | Saraiva      |
+---------+------------------+----------------+--------------+
3 rows in set (0.00 sec) 
*/ 

/* QUESTÃO 60
SELECT O.TITULO_OBRA, A.NOME_AUTOR, NOME_EDITORA, O.NUMERO_PUBLICACAO
FROM OBRA O
INNER JOIN AUTOR A
ON O.ID_AUTOR = A.ID_AUTOR 
INNER JOIN EDITORA E 
ON O.ID_EDITORA = E.ID_EDITORA
WHERE NUMERO_PUBLICACAO <= 8; 
*/

QUESTÃO 61 
/* SELECT ID_USUARIO, NOME_USUARIO, CONCAT(substr(CPF, 1, 4), '******',
                                       substr(CPF, 12, 14)) AS CPF
FROM USUARIO 
WHERE CPF LIKE '193%'; 
*/


/* ALTER TABLE USUARIO 
MODIFY CPF VARCHAR(25);

UPDATE USUARIO
SET CPF = '193.107.214-21' 
WHERE ID_USUARIO = 1;

UPDATE USUARIO
SET CPF = '122.147.655-47'
WHERE ID_USUARIO = 2;

UPDATE USUARIO
SET CPF = '193.107.214-22'
WHERE ID_USUARIO = 3;

UPDATE USUARIO
SET CPF = '122.147.655-48'
WHERE ID_USUARIO = 4;

UPDATE USUARIO
SET CPF = '193.107.214-23'
WHERE ID_USUARIO = 5;

UPDATE USUARIO
SET CPF = '122.147.655-49'
WHERE ID_USUARIO = 6;

UPDATE USUARIO
SET CPF = '193.107.214-24'
WHERE ID_USUARIO = 7;

UPDATE USUARIO
SET CPF = '122.147.655-50'
WHERE ID_USUARIO = 8;

UPDATE USUARIO
SET CPF = '193.107.214-25'
WHERE ID_USUARIO = 9;

UPDATE USUARIO
SET CPF = '122.147.655-51'
WHERE ID_USUARIO = 10;

UPDATE USUARIO
SET CPF = '193.107.214-26'
WHERE ID_USUARIO = 11;

UPDATE USUARIO
SET CPF = '122.147.655-52'
WHERE ID_USUARIO = 12;

UPDATE USUARIO
SET CPF = '193.107.214-27'
WHERE ID_USUARIO = 13;

UPDATE USUARIO
SET CPF = '122.147.655-53'
WHERE ID_USUARIO = 14;

UPDATE USUARIO
SET CPF = '193.107.214-28'
WHERE ID_USUARIO = 15;

UPDATE USUARIO
SET CPF = '122.147.655-54'
WHERE ID_USUARIO = 16;

UPDATE USUARIO
SET CPF = '193.107.214-29'
WHERE ID_USUARIO = 17;

UPDATE USUARIO
SET CPF = '122.147.655-55'
WHERE ID_USUARIO = 18;

UPDATE USUARIO
SET CPF = '193.107.214-30'
WHERE ID_USUARIO = 19;


UPDATE USUARIO
SET CPF = '122.147.655-56'
WHERE ID_USUARIO = 20;

UPDATE USUARIO
SET CPF = '193.107.214-31'
WHERE ID_USUARIO = 21;

UPDATE USUARIO
SET CPF = '122.147.655-57'
WHERE ID_USUARIO = 22;

UPDATE USUARIO
SET CPF = '193.107.214-32'
WHERE ID_USUARIO = 23;

UPDATE USUARIO
SET CPF = '122.147.655-58'
WHERE ID_USUARIO = 24;

UPDATE USUARIO
SET CPF = '193.107.214-33'
WHERE ID_USUARIO = 25;

UPDATE USUARIO
SET CPF = '122.147.655-59'
WHERE ID_USUARIO = 26;

UPDATE USUARIO
SET CPF = '193.107.214-34'
WHERE ID_USUARIO = 27;

UPDATE USUARIO
SET CPF = '122.147.655-60'
WHERE ID_USUARIO = 28;

UPDATE USUARIO
SET CPF = '193.107.214-35'
WHERE ID_USUARIO = 29;

UPDATE USUARIO
SET CPF = '122.147.655-61'
WHERE ID_USUARIO = 30;

UPDATE USUARIO
SET CPF = '294.264.875-32'
WHERE ID_USUARIO = 31;

UPDATE USUARIO
SET CPF = '654.586.427-98'
WHERE ID_USUARIO = 33;

UPDATE USUARIO
SET CPF = '341.251.651-75'
WHERE ID_USUARIO = 34; */

/* QUESTÃO 62 
SELECT AVG(ID_EMPRESTIMO)
FROM EMPRESTIMO
WHERE DATA_EMPRESTIMO LIKE '2013%';

SELECT E.ID_EMPRESTIMO, E.DATA_EMPRESTIMO, ID_AUTOR, NOME_AUTOR
FROM EMPRESTIMO E 
INNER JOIN AUTOR A 
ON E.ID_OBRA = A.ID_AUTOR;


CREATE TABLE MEDIA_EMPRESTIMO(
ID_MEDIA SMALLINT PRIMARY KEY AUTO_INCREMENT,
MEDIA_EMPRESTIMO SMALLINT NOT NULL,
MEDIA_AUTOR SMALLINT NOT NULL,
MEDIA_EDITORA SMALLINT NOT NULL, 
CALC_MEDIA_3_ANOS SMALLINT GENERATED ALWAYS AS (MEDIA_EMPRESTIMO + MEDIA_EMPRESTIMO * 20/100) VIRTUAL,
CALC_MEDIA_AUTOR SMALLINT GENERATED ALWAYS AS (MEDIA_AUTOR + MEDIA_AUTOR * 20/100) VIRTUAL,
CALC_MEDIA_EDITORA SMALLINT GENERATED ALWAYS AS (MEDIA_EDITORA + MEDIA_EDITORA * 20/100) VIRTUAL
);

INSERT INTO MEDIA_EMPRESTIMO (MEDIA_EMPRESTIMO, MEDIA_AUTOR, MEDIA_EDITORA) VALUES (15, 2, 2);
*/

QUESTÃO 63 

