/* CRIANDO A TABELA TIPO:*/

CREATE TABLE TIPO(COD_TIPO INT PRIMARY KEY,
TIPO VARCHAR(30));

/* CONFIRMANDO A CRIAÇÃO DA TABELA*/

SHOW TABLES;

/* INSERINDO DADOS NA TABELA TIPO*/

INSERT INTO TIPO 
VALUES
(1, 'Banco de Dados'), (2, 'Programação'), (3, 'Modelagem de Dados');


/* VERIFICANDO INFORMAÇÕES DA TABELA TIPO*/

DESCRIBE TIPO;

/* CRIANDO A TABELA INSTRUTOR:*/

CREATE TABLE INSTRUTOR(
    COD_INSTR INT PRIMARY KEY,
    INSTRUTOR VARCHAR(30),
    TELEFONE VARCHAR(30)
);

/* INSERINDO DADOS NA TABELA INSTRUTOR*/

INSERT INTO INSTRUTOR 
VALUES
(1, 'Fernando Dias', '1111-1111'),
(2, 'Carlos Emilio', '1212-1212');

/* CRIANDO A TABELA ALUNO:*/

CREATE TABLE ALUNO(
    COD_ALUNO INT PRIMARY KEY,
    ALUNO VARCHAR(30),
    ENDERECO VARCHAR(100),
    EMAIL VARCHAR(30)
    );

/* INSERINDO DADOS NA TABELA ALUNO*/

INSERT INTO ALUNO 
VALUES
(1, 'Frederico', 'Rua XV de Novembro,72', 'Fred@leega.com.br'),
(2, 'Wagner', 'Av Paulista', 'Wagner@leega.com.br'),
(3, 'Douglas', 'Lajes 103, ap: 701', 'Douglas@leega.com.br')
;

CREATE TABLE PEDIDO(
    COD_PEDIDO INT PRIMARY KEY,
    DATA_PEDIDO DATE,
    HORA TIME,
    COD_ALUNO INT,
    FOREIGN KEY (COD_ALUNO) REFERENCES ALUNO(COD_ALUNO)
);

INSERT INTO PEDIDO 
VALUES
(1, '2010/04/15', '11:23:32', 2),
(2, '2010/04/15', '14:36:21', 2),
(3, '2010/04/16', '11:17:45', 3);

CREATE TABLE PEDIDO_DETALHE(
COD_PEDIDO INT NOT NULL,
COD_CURSO INT NOT NULL,
VALOR INT,
FOREIGN KEY (COD_PEDIDO) REFERENCES PEDIDO(COD_PEDIDO),
FOREIGN KEY (COD_CURSO) REFERENCES CURSO(COD_CURSO)
);

INSERT INTO PEDIDO_DETALHE 
VALUES
(1, 1, 270),
(1, 2, 330),
(2, 1, 270),
(3, 4, 270);

CREATE TABLE CURSO(
    COD_CURSO INT PRIMARY KEY,
    CURSO VARCHAR(30) NOT NULL,
    VALOR INT,
    COD_TIPO INT NOT NULL,
    COD_INSTR INT NOT NULL,
    FOREIGN KEY (COD_TIPO) REFERENCES TIPO (COD_TIPO),
    FOREIGN KEY (COD_INSTR) REFERENCES INSTRUTOR(COD_INSTR)
);

INSERT INTO CURSO 
VALUES
(1, 'Java Fundations',270, 2,2),
(2, 'Java Avançado',330, 2,2),
(3, 'SQL Completo',170, 1,1),
(4, 'Php Básico',270, 2,1);
(5, 'Java Script', 250, 3, 3);


INSERT INTO TIPO 
VALUES 
(4, 'Designer Gráfico');

INSERT INTO INSTRUTOR 
VALUES 
(1,'Carlos Emilio', '2222-2222');

INSERT INTO ALUNO 
VALUES
(4, 'Alexandre', 'Rua Tauney 22', 'Ale@leega.com.br'),
(5, 'Mariana', 'Rua Salles 305', 'Mariana@leega.com.br'),
(6, 'Samuel', 'Av. Central 30', 'Samuel@leega.com.br'),
(7, 'Daniel', 'Alfredo Ometecidio 26', 'daniel@leega.com.br');


INSERT INTO CURSO 
VALUES
(5, 'Java Script', 250, 3, 3);

INSERT INTO PEDIDO 
VALUES
(4, '2010/04/17', '14:27:22', 4),
(6, '2010/04/19', '13:47:35', 6),
(7, '2010/04/20', '18:13:44', 6),
(8, '2012/07/25', '20:00:24', 4);

INSERT INTO PEDIDO_DETALHE 
VALUES 
(8, 1, 330),
(4, 2, 330),
(4, 4, 270),
(6, 3, 170),
(7, 4, 270);

/* SELECIONE OS CURSOS QUE TEM O VALOR MAIOR QUE 270*/ 

/* mysql> SELECT CURSO, VALOR FROM CURSO
    -> WHERE VALOR > 200;
+-----------------+-------+
| CURSO           | VALOR |
+-----------------+-------+
| Java Fundations |   270 |
| Java Avançado   |   330 |
| Php Básico      |   270 |
+-----------------+-------+
3 rows in set (0.00 sec)

/* SELECIONE O CURSO QUE ESTÁ REGISTRADO COM O CÓDIGO 3*/

/* mysql> SELECT COD_CURSO, CURSO FROM CURSO
    -> WHERE COD_CURSO = 3;
+-----------+--------------+
| COD_CURSO | CURSO        |
+-----------+--------------+
|         3 | SQL Completo |
+-----------+--------------+
1 row in set (0.00 sec) /* 

/* SELECIONE O NOME DO ALUNO DANIEL E MOSTRE SEU EMAIL E O ENDEREÇO. */


/* mysql> SELECT ALUNO, ENDERECO, EMAIL FROM ALUNO
    -> WHERE ALUNO = 'DANIEL';
+--------+-----------------------+---------------------+
| ALUNO  | ENDERECO              | EMAIL               |
+--------+-----------------------+---------------------+
| Daniel | Alfredo Ometecidio 26 | daniel@leega.com.br |
+--------+-----------------------+---------------------+
1 row in set (0.00 sec)

SELECT COD_CURSO, CURSO FROM CURSO
WHERE CURSO LIKE'Java';

/*MOSTRAR TODOS OS CURSOS QUE TENHAM A PALAVRA JAVA*/

/* mysql> SELECT CURSO FROM CURSO
    -> WHERE COD_CURSO <= 2; /* 
+-----------------+
| CURSO           |
+-----------------+
| Java Fundations |
| Java Avançado   |
+-----------------+
2 rows in set (0.00 sec)

/* MOSTRAR QUE CURSOS SÃO CONDUZIDOS PELO 
PROFESSOR FERNANDO E QUE TEM O TIPO DE BANCO DE DADOS*/

/* mysql> SELECT CURSO, COD_INSTR, COD_TIPO
    -> FROM CURSO
    -> WHERE COD_INSTR = 1 AND COD_TIPO = 1 ;
+--------------+-----------+----------+
| CURSO        | COD_INSTR | COD_TIPO |
+--------------+-----------+----------+
| SQL Completo |         1 |        1 |
+--------------+-----------+----------+
1 row in set (0.01 sec)

/* MOSTRE QUANTOS ALUNOS EXISTEM NOS CURSOS E A SAÍDA RENOMEIE PARA "QUANTIDADE_ALUNOS" */

/* mysql> SELECT COUNT(ALUNO) AS QUANTIDADE_ALUNOS FROM ALUNO;
+-------------------+
| QUANTIDADE_ALUNOS |
+-------------------+
|                 7 |
+-------------------+
1 row in set (0.00 sec)

/* MOSTRE O VALOR MÉDIO DOS CURSOS*/ 

/* mysql> SELECT AVG(VALOR) FROM CURSO;
+------------+
| AVG(VALOR) |
+------------+
|   260.0000 |
+------------+

/* MOSTRE O CURSO MAIS BARATO DA LEEGA*/

/* mysql> SELECT CURSO, MIN(VALOR) MENOR_VALOR FROM CURSO;
+-------------+
| MENOR_VALOR |
+-------------+
|         170 |
+-------------+

/* MOSTRAR O ULTIMO INSTRUTOR CADASTRADO*/

/* mysql> SELECT INSTRUTOR AS ULTIMO_CADASTRADO FROM INSTRUTOR
    -> ORDER BY INSTRUTOR DESC
    -> LIMIT 1;
+-------------------+
| ULTIMO_CADASTRADO |
+-------------------+
| Fernando Dias     |
+-------------------+

/* MOSTRE TODOS OS NOMES DOS ALUNOS COM LETRA MAIUSCULA E ORDENE PELO 
CÓDIGO DO MAIS NOVO ALUNO PARA O MAIS ANTIGO*/

/* mysql> SELECT UCASE (ALUNO) AS NOME_ALUNOS FROM ALUNO
    -> ORDER BY COD_ALUNO DESC;
+-------------+
| NOME_ALUNOS |
+-------------+
| DANIEL      |
| SAMUEL      |
| MARIANA     |
| ALEXANDRE   |
| DOUGLAS     |
| WAGNER      |
| FREDERICO   |
+-------------+
7 rows in set (0.00 sec)

/* MOSTRE AS INFORMAÇÕES DOS ALUNOS DA SEGUINTE FORMA COMO MOSTRA O EXEMPLO
Aluno: Dione Henrique
Email: D.Henri@gmail.com */ 


/* mysql> SELECT CONCAT ('Aluno: ', ALUNO, ' / Email: ' , EMAIL)
    -> AS NOME_EMAIL_ALUNOS FROM ALUNO;

+----------------------------------------------+
| NOME_EMAIL_ALUNOS                            |
+----------------------------------------------+
| Aluno: Frederico / Email: Fred@leega.com.br  |
| Aluno: Wagner / Email: Wagner@leega.com.br   |
| Aluno: Douglas / Email: Douglas@leega.com.br |
| Aluno: Alexandre / Email: Ale@leega.com.br   |
| Aluno: Mariana / Email: Mariana@leega.com.br |
| Aluno: Samuel / Email: Samuel@leega.com.br   |
| Aluno: Daniel / Email: daniel@leega.com.br   |
+----------------------------------------------+
7 rows in set (0.00 sec)

/* MOSTRE A DATA ATUAL QUE VOCÊ ESTÁ ESTUDANDO*/

/* mysql> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2021-09-27 18:50:29 |
+---------------------+
1 row in set (0.00 sec)

/* EXIBIR TODAS AS INFORMAÇÕES E TODOS SO ALUNOS */

SELECT * FROM ALUNO;

/* EXIBIR SOMENTE O TÍTULO DE CADA CURSO. */

SELECT CURSO FROM CURSO;

/* mysql> SELECT CURSO FROM CURSO;
+-----------------+
| CURSO           |
+-----------------+
| Java Fundations |
| Java Avançado   |
| SQL Completo    |
| Php Básico      |
+-----------------+
4 rows in set (0.00 sec)

/* EXIBIR SOMENTE O TÍTULO E VALOR DE CADA 
CURSO CUJO PREÇO SEJA MAIOR QUE 200. */

/* mysql> SELECT CURSO, VALOR FROM CURSO
    -> WHERE VALOR > 200;
+-----------------+-------+
| CURSO           | VALOR |
+-----------------+-------+
| Java Fundations |   270 |
| Java Avançado   |   330 |
| Php Básico      |   270 |
+-----------------+-------+
3 rows in set (0.00 sec)

/* EXIBIR SOMENTE O TÍTULO E VALOR DE CADA 
CURSO CUJO PREÇO SEJA MAIOR QUE 200 E MENOR QUE 300. */

/* mysql> SELECT CURSO, VALOR FROM CURSO
    -> WHERE (VALOR > 200 AND VALOR < 300);
+-----------------+-------+
| CURSO           | VALOR |
+-----------------+-------+
| Java Fundations |   270 |
| Php Básico      |   270 |
+-----------------+-------+
2 rows in set (0.00 sec)

/* EXIBIR AS INFORMAÇÕES DA TABELA PEDIDOS PARA OS PEDIDOS 
REALIZADOS ENTRE 15/04/2010 E 18/04/2010.*/

/* O RESULTADO MOSTRA APENAS OS PEDIDOS DA DATA DO DIA 15, POIS NA 
TABELA PEDIDO, NÃO EXISTE PEDIDOS DO DIA 18.*/


/* mysql> SELECT COD_PEDIDO, DATA_PEDIDO, HORA, COD_ALUNO
    -> FROM PEDIDO
    -> WHERE (DATA_PEDIDO = '2010/04/15' AND '2010/04/18');
+------------+-------------+----------+-----------+
| COD_PEDIDO | DATA_PEDIDO | HORA     | COD_ALUNO |
+------------+-------------+----------+-----------+
|          1 | 2010-04-15  | 11:23:32 |         2 |
|          2 | 2010-04-15  | 14:36:21 |         2 |
+------------+-------------+----------+-----------+
2 rows in set, 1 warning (0.00 sec)

mysql> SELECT * FROM PEDIDO;
+------------+-------------+----------+-----------+
| COD_PEDIDO | DATA_PEDIDO | HORA     | COD_ALUNO |
+------------+-------------+----------+-----------+
|          1 | 2010-04-15  | 11:23:32 |         2 |
|          2 | 2010-04-15  | 14:36:21 |         2 |
|          3 | 2010-04-16  | 11:17:45 |         3 |
|          4 | 2010-04-17  | 14:27:22 |         4 |
|          6 | 2010-04-19  | 13:47:35 |         6 |
|          7 | 2010-04-20  | 18:13:44 |         6 |
|          8 | 2012-07-25  | 20:00:24 |         4 |
+------------+-------------+----------+-----------+
7 rows in set (0.00 sec)

/* EXIBIR AS INFORMAÇÕES DA TABELA PEDIDOS PARA OS PEDIDOS 
REALIZADOS ENTRE 15/04/2010*/

/* mysql> SELECT COD_PEDIDO, DATA_PEDIDO, HORA, COD_ALUNO
    -> FROM PEDIDO
    -> WHERE DATA_PEDIDO = '2010/04/15';
+------------+-------------+----------+-----------+
| COD_PEDIDO | DATA_PEDIDO | HORA     | COD_ALUNO |
+------------+-------------+----------+-----------+
|          1 | 2010-04-15  | 11:23:32 |         2 |
|          2 | 2010-04-15  | 14:36:21 |         2 |
+------------+-------------+----------+-----------+
2 rows in set (0.00 sec)

/* AGRUPE OS PEDIDOS E MOSTRE TODOS OS VALORES DOS CURSOS
QUE SEJAM MAIS CAROS QUE 300 REAIS.*/

/* mysql> SELECT CURSO, (VALOR) AS VALOR_CURSO
    -> FROM CURSO
    -> GROUP BY VALOR
    -> HAVING (VALOR) > 300;
+----------------+-------------+
| CURSO          | VALOR_CURSO |
+----------------+-------------+
| Java Avançado  |         330 |
+----------------+-------------+
1 row in set (0.00 sec)

/* ALTERE O ENDEREÇO DO ALUNO FREDERICO PARA 'AV. BRASIL 778'.*/ 

/* mysql> UPDATE ALUNO
    -> SET ENDERECO = 'Av. Brasil 778'
    -> WHERE ALUNO = 'Frederico';
Query OK, 1 row affected (0.17 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT ALUNO, ENDERECO FROM ALUNO
    -> WHERE ALUNO = 'Frederico';
+-----------+----------------+
| ALUNO     | ENDERECO       |
+-----------+----------------+
| Frederico | Av. Brasil 778 |
+-----------+----------------+
1 row in set (0.00 sec)

mysql> SELECT ALUNO, ENDERECO FROM ALUNO
    -> WHERE ALUNO = 'Frederico';
+-----------+----------------+
| ALUNO     | ENDERECO       |
+-----------+----------------+
| Frederico | Av. Brasil 778 |
+-----------+----------------+
1 row in set (0.00 sec)

/* ANTERE O E-MAIL DO ALUNO ALEXANDRE PARA 'Alexandre@leega.com.br*/

/* mysql> UPDATE ALUNO
    -> SET EMAIL = 'Alexandre@leega.com.br'
    -> WHERE ALUNO = 'ALEXANDRE';
Query OK, 1 row affected (0.17 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT ALUNO, EMAIL FROM ALUNO
    -> WHERE ALUNO = 'Alexandre';
+-----------+------------------------+
| ALUNO     | EMAIL                  |
+-----------+------------------------+
| Alexandre | Alexandre@leega.com.br |
+-----------+------------------------+
1 row in set (0.01 sec)

/* AUMENTE EM 10% O CALOR DOS CURSOS ABAIXO DE 300. */

/* mysql> UPDATE CURSO
    -> SET VALOR = VALOR + (VALOR * 10.0/ 100.0)
    -> WHERE COD_CURSO = '3';
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE CURSO
    -> SET VALOR = VALOR + (VALOR * 10.0/ 100.0)
    -> WHERE COD_CURSO = '4';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM CURSO;
+-----------+-----------------+-------+----------+-----------+
| COD_CURSO | CURSO           | VALOR | COD_TIPO | COD_INSTR |
+-----------+-----------------+-------+----------+-----------+
|         1 | Java Fundations |   297 |        2 |         2 |
|         2 | Java Avançado   |   330 |        2 |         2 |
|         3 | SQL Completo    |   187 |        1 |         1 |
|         4 | Php Básico      |   297 |        2 |         1 |
+-----------+-----------------+-------+----------+-----------+
4 rows in set (0.00 sec)

/* ALTERE O NOME DO CURSO DE Php Básico para Php Fundamentos.*/
;/* mysql> UPDATE CURSO
    -> SET CURSO = 'Php Fundamentos'
    -> wHERE CURSO = 'Php Básico';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT CURSO FROM CURSO
    -> WHERE CURSO = 'Php Fundamentos';
+-----------------+
| CURSO           |
+-----------------+
| Php Fundamentos |
+-----------------+
1 row in set (0.00 sec)

/* EXCLUA O REGISTRO DA TABELA TIPO 
QUE CONTÉM O TIPO Designer Gráfico*/

/* mysql> DELETE FROM TIPO
    -> WHERE TIPO = 'Designer Gráfico';
Query OK, 1 row affected (0.20 sec)

mysql> SELECT * FROM TIPO;
+----------+--------------------+
| COD_TIPO | TIPO               |
+----------+--------------------+
|        1 | Banco de Dados     |
|        2 | Programação        |
|        3 | Modelagem de Dados |
+----------+--------------------+
3 rows in set (0.00 sec)

/* EXCLUA O REGISTRO DA TABELA ALUNO QUE CONTÉM O CÓDIGO 7. */

/* mysql> SELECT * FROM ALUNO;
+-----------+-----------+-----------------------+------------------------+
| COD_ALUNO | ALUNO     | ENDERECO              | EMAIL                  |
+-----------+-----------+-----------------------+------------------------+
|         1 | Frederico | Av. Brasil 778        | Fred@leega.com.br      |
|         2 | Wagner    | Av Paulista           | Wagner@leega.com.br    |
|         3 | Douglas   | Lajes 103, ap: 701    | Douglas@leega.com.br   |
|         4 | Alexandre | Rua Tauney 22         | Alexandre@leega.com.br |
|         5 | Mariana   | Rua Salles 305        | Mariana@leega.com.br   |
|         6 | Samuel    | Av. Central 30        | Samuel@leega.com.br    |
|         7 | Daniel    | Alfredo Ometecidio 26 | daniel@leega.com.br    |
+-----------+-----------+-----------------------+------------------------+
7 rows in set (0.01 sec)

mysql> DELETE FROM ALUNO
    -> WHERE COD_ALUNO = '7';
Query OK, 1 row affected (0.07 sec)

mysql> SELECT * FROM ALUNO;
+-----------+-----------+--------------------+------------------------+
| COD_ALUNO | ALUNO     | ENDERECO           | EMAIL                  |
+-----------+-----------+--------------------+------------------------+
|         1 | Frederico | Av. Brasil 778     | Fred@leega.com.br      |
|         2 | Wagner    | Av Paulista        | Wagner@leega.com.br    |
|         3 | Douglas   | Lajes 103, ap: 701 | Douglas@leega.com.br   |
|         4 | Alexandre | Rua Tauney 22      | Alexandre@leega.com.br |
|         5 | Mariana   | Rua Salles 305     | Mariana@leega.com.br   |
|         6 | Samuel    | Av. Central 30     | Samuel@leega.com.br    |
+-----------+-----------+--------------------+------------------------+
6 rows in set (0.00 sec)

/* EXCLUA O REGISTRO DA TABELA CURSO QUE CONTÉM O CÓDIGO 5 E O CURSO Java Script. */

/* mysql> select * from curso;
+-----------+-----------------+-------+----------+-----------+
| COD_CURSO | CURSO           | VALOR | COD_TIPO | COD_INSTR |
+-----------+-----------------+-------+----------+-----------+
|         1 | Java Fundations |   297 |        2 |         2 |
|         2 | Java Avançado   |   330 |        2 |         2 |
|         3 | SQL Completo    |   187 |        1 |         1 |
|         4 | Php Fundamentos |   297 |        2 |         1 |
|         5 | Java Script     |   275 |        2 |         2 |
+-----------+-----------------+-------+----------+-----------+
5 rows in set (0.00 sec)


mysql> DELETE FROM CURSO
    -> WHERE (COD_CURSO = 5 AND CURSO = 'Java Script');
Query OK, 1 row affected (0.09 sec)

mysql> select * from curso;
+-----------+-----------------+-------+----------+-----------+
| COD_CURSO | CURSO           | VALOR | COD_TIPO | COD_INSTR |
+-----------+-----------------+-------+----------+-----------+
|         1 | Java Fundations |   297 |        2 |         2 |
|         2 | Java Avançado   |   330 |        2 |         2 |
|         3 | SQL Completo    |   187 |        1 |         1 |
|         4 | Php Fundamentos |   297 |        2 |         1 |
+-----------+-----------------+-------+----------+-----------+
4 rows in set (0.00 sec)

/* INCLUA A COLUNA DATA_NASCIMENTO NA TABELA ALUNO DO TIPO STRING
DE TAMANHO 10 CARACTERS*/ 

/* mysql> ALTER TABLE ALUNO
    -> ADD DATA_NASCIMENTO VARCHAR(10);
Query OK, 0 rows affected (1.19 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM ALUNO;
+-----------+-----------+--------------------+------------------------+-----------------+
| COD_ALUNO | ALUNO     | ENDERECO           | EMAIL                  | DATA_NASCIMENTO |
+-----------+-----------+--------------------+------------------------+-----------------+
|         1 | Frederico | Av. Brasil 778     | Fred@leega.com.br      | NULL            |
|         2 | Wagner    | Av Paulista        | Wagner@leega.com.br    | NULL            |
|         3 | Douglas   | Lajes 103, ap: 701 | Douglas@leega.com.br   | NULL            |
|         4 | Alexandre | Rua Tauney 22      | Alexandre@leega.com.br | NULL            |
|         5 | Mariana   | Rua Salles 305     | Mariana@leega.com.br   | NULL            |
|         6 | Samuel    | Av. Central 30     | Samuel@leega.com.br    | NULL            |
+-----------+-----------+--------------------+------------------------+-----------------+
6 rows in set (0.00 sec)

/* ALTERE A COLUNA DATA_NASCIMENTO PARA 
NASCIMENTO E SEU TIPO DE DADO PARA DATE. */

/* mysql> ALTER TABLE ALUNO
    -> CHANGE DATA_NASCIMENTO NASCIMENTO DATE;
Query OK, 6 rows affected (2.19 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM ALUNO;
+-----------+-----------+--------------------+------------------------+------------+
| COD_ALUNO | ALUNO     | ENDERECO           | EMAIL                  | NASCIMENTO |
+-----------+-----------+--------------------+------------------------+------------+
|         1 | Frederico | Av. Brasil 778     | Fred@leega.com.br      | NULL       |
|         2 | Wagner    | Av Paulista        | Wagner@leega.com.br    | NULL       |
|         3 | Douglas   | Lajes 103, ap: 701 | Douglas@leega.com.br   | NULL       |
|         4 | Alexandre | Rua Tauney 22      | Alexandre@leega.com.br | NULL       |
|         5 | Mariana   | Rua Salles 305     | Mariana@leega.com.br   | NULL       |
|         6 | Samuel    | Av. Central 30     | Samuel@leega.com.br    | NULL       |
+-----------+-----------+--------------------+------------------------+------------+
6 rows in set (0.00 sec)

/* CRIE UM NOVO INDICE A TABELA ALUNO PARA O CAMPO ALUNO. */

/* mysql> ALTER TABLE ALUNO
    -> ADD INDEX ALUNO (ALUNO);
Query OK, 0 rows affected (0.49 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM ALUNO;
+-----------+-----------+--------------------+------------------------+------------+
| COD_ALUNO | ALUNO     | ENDERECO           | EMAIL                  | NASCIMENTO |
+-----------+-----------+--------------------+------------------------+------------+
|         1 | Frederico | Av. Brasil 778     | Fred@leega.com.br      | NULL       |
|         2 | Wagner    | Av Paulista        | Wagner@leega.com.br    | NULL       |
|         3 | Douglas   | Lajes 103, ap: 701 | Douglas@leega.com.br   | NULL       |
|         4 | Alexandre | Rua Tauney 22      | Alexandre@leega.com.br | NULL       |
|         5 | Mariana   | Rua Salles 305     | Mariana@leega.com.br   | NULL       |
|         6 | Samuel    | Av. Central 30     | Samuel@leega.com.br    | NULL       |
+-----------+-----------+--------------------+------------------------+------------+
6 rows in set (0.02 sec)

/* INCLUA O CAMPO EMAIL NA TABELA INSTRUTOR COM TAMANHO DE 100 CARACTERES. */

/* mysql> ALTER TABLE INSTRUTOR
    -> ADD EMAIL VARCHAR(100);
Query OK, 0 rows affected (0.93 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM INSTRUTOR;
+-----------+---------------+-----------+-------+
| COD_INSTR | INSTRUTOR     | TELEFONE  | EMAIL |
+-----------+---------------+-----------+-------+
|         1 | Fernando Dias | 1111-1111 | NULL  |
|         2 | Carlos Emilio | 1212-1212 | NULL  |
+-----------+---------------+-----------+-------+
2 rows in set (0.00 sec)

/* CRIE UM NOVO ÍNDICE NA TABELA CURSO PARA O CAMPO INSTRUTOR */

/* mysql> ALTER TABLE CURSO
    -> ADD INDEX COD_INSTR(COD_INSTR);
Query OK, 0 rows affected (0.95 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM CURSO;
+-----------+-----------------+-------+----------+-----------+
| COD_CURSO | CURSO           | VALOR | COD_TIPO | COD_INSTR |
+-----------+-----------------+-------+----------+-----------+
|         1 | Java Fundations |   297 |        2 |         2 |
|         2 | Java Avançado   |   330 |        2 |         2 |
|         3 | SQL Completo    |   187 |        1 |         1 |
|         4 | Php Fundamentos |   297 |        2 |         1 |
+-----------+-----------------+-------+----------+-----------+
4 rows in set (0.00 sec)

/* REMOVA O CAMPO EMAIL DA TABELA INSTRUTOR. */

/* mysql> ALTER TABLE INSTRUTOR
    -> DROP COLUMN EMAIL;
Query OK, 0 rows affected (1.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM INSTRUTOR;
+-----------+---------------+-----------+
| COD_INSTR | INSTRUTOR     | TELEFONE  |
+-----------+---------------+-----------+
|         1 | Fernando Dias | 1111-1111 |
|         2 | Carlos Emilio | 1212-1212 |
+-----------+---------------+-----------+
2 rows in set (0.00 sec)

/* REMOVA O CAMPO Nascimento DA TABELA ALUNO.*/

/* mysql> ALTER TABLE ALUNO
    -> DROP COLUMN NASCIMENTO;
Query OK, 0 rows affected (1.57 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM ALUNO;
+-----------+-----------+--------------------+------------------------+
| COD_ALUNO | ALUNO     | ENDERECO           | EMAIL                  |
+-----------+-----------+--------------------+------------------------+
|         1 | Frederico | Av. Brasil 778     | Fred@leega.com.br      |
|         2 | Wagner    | Av Paulista        | Wagner@leega.com.br    |
|         3 | Douglas   | Lajes 103, ap: 701 | Douglas@leega.com.br   |
|         4 | Alexandre | Rua Tauney 22      | Alexandre@leega.com.br |
|         5 | Mariana   | Rua Salles 305     | Mariana@leega.com.br   |
|         6 | Samuel    | Av. Central 30     | Samuel@leega.com.br    |
+-----------+-----------+--------------------+------------------------+
6 rows in set (0.00 sec)

/* EXIBA UMA LISTA COM OS TÍTULOS DOS CURSOS DA LEEGA E O TIPO 
DE CURSO AO LADO. */

/* mysql> SELECT CURSO, TIPO
    -> FROM CURSO
    -> INNER JOIN TIPO
    -> ON CURSO.COD_TIPO = TIPO.COD_TIPO;
+-----------------+----------------+
| CURSO           | TIPO           |
+-----------------+----------------+
| Java Fundations | Programação    |
| Java Avançado   | Programação    |
| SQL Completo    | Banco de Dados |
| Php Fundamentos | Programação    |
+-----------------+----------------+
4 rows in set (0.00 sec)

/* EXIBA UMA LISTA COM OS TÍTULOS DOS CURSOS DA LEEGA, TIPO DO CURSO, NOME DO 
INSTRUTOR RESPONSÁVEL PELO MESMO E TELEFONE. */

/* mysql> SELECT CURSO, INSTRUTOR, TELEFONE
    -> FROM CURSO
    -> INNER JOIN INSTRUTOR
    -> ON CURSO.COD_INSTR = INSTRUTOR.COD_INSTR;
+-----------------+---------------+-----------+
| CURSO           | INSTRUTOR     | TELEFONE  |
+-----------------+---------------+-----------+
| Java Fundations | Carlos Emilio | 1212-1212 |
| Java Avançado   | Carlos Emilio | 1212-1212 |
| SQL Completo    | Fernando Dias | 1111-1111 |
| Php Fundamentos | Fernando Dias | 1111-1111 |
+-----------------+---------------+-----------+
4 rows in set (0.00 sec)

/* EXIBA UMA LISTA COM O CÓDIGO E HORA DOS PEDIDOS, NOME DO ALUNO 
E OS TÍTULOS DOS CURSOS DE CADA PEDIDO. */

/* mysql> SELECT COD_PEDIDO, DATA_PEDIDO, HORA, ALUNO, CURSO
    -> FROM PEDIDO
    -> INNER JOIN ALUNO
    -> ON PEDIDO.FK_COD_ALUNO = ALUNO.COD_ALUNO
    -> INNER JOIN CURSO
    -> ON CURSO.COD_CURSO = PEDIDO.FK_COD_ALUNO;
+------------+-------------+----------+-----------+-----------------+
| COD_PEDIDO | DATA_PEDIDO | HORA     | ALUNO     | CURSO           |
+------------+-------------+----------+-----------+-----------------+
|          1 | 2010-04-15  | 11:23:32 | Wagner    | Java Avançado   |
|          2 | 2010-04-15  | 14:36:21 | Wagner    | Java Avançado   |
|          3 | 2010-04-16  | 11:17:45 | Douglas   | SQL Completo    |
|          4 | 2010-04-17  | 14:27:22 | Alexandre | Php Fundamentos |
|          8 | 2012-07-25  | 20:00:24 | Alexandre | Php Fundamentos |
+------------+-------------+----------+-----------+-----------------+
5 rows in set (0.00 sec)

/* EXIBA O NÚMERO DO PEDIDO, NOME DO ALUNO E VALOR PARA TODOS OS PEDIDOS
REALIZADOS NA LEEGA CUJO VALOR TOTAL SEJAM MAIORES QUE 500.*/

/* COMO NÃO EXISTE VALORES MAIORES DE 500, COLOQUEI ORDER BY MAIOR QUE 100 PARA 
RETORNAR UM RESULTADO COM DADOS. */

/* mysql> SELECT COD_PEDIDO, ALUNO, VALOR
    -> FROM PEDIDO
    -> INNER JOIN ALUNO
    -> ON PEDIDO.FK_COD_ALUNO = ALUNO.COD_ALUNO
    -> INNER JOIN PEDIDO_DETALHE
    -> ON PEDIDO_DETALHE.FK_COD_PEDIDO = ALUNO.COD_ALUNO
    -> ORDER BY VALOR > 100;
+------------+-----------+-------+
| COD_PEDIDO | ALUNO     | VALOR |
+------------+-----------+-------+
|          1 | Wagner    |   270 |
|          2 | Wagner    |   270 |
|          3 | Douglas   |   270 |
|          4 | Alexandre |   330 |
|          4 | Alexandre |   270 |
|          8 | Alexandre |   330 |
|          8 | Alexandre |   270 |
|          6 | Samuel    |   170 |
|          7 | Samuel    |   170 |
+------------+-----------+-------+
9 rows in set (0.02 sec)

/* EXIBA O NUMERO DO PEDIDO, NOME DO ALUNO E QUANTOS CURSOS FORAM
COMPRADOS PARA TODOS OS PEDIDOS REALIZADOS NA LEEGA QUE COMPRARAM 
DOIS OU MAIS CURSOS. */

/* mysql> SELECT FK_COD_PEDIDO AS 'NÚMERO DO PEDIDO', ALUNO AS 'NOME DO ALUNO', COUNT(FK_COD_PEDIDO) AS 'QUANTIDADE DE PEDIDOS'
    -> FROM PEDIDO_DETALHE
    -> INNER JOIN ALUNO
    -> ON PEDIDO_DETALHE.FK_COD_PEDIDO = ALUNO.COD_ALUNO
    -> GROUP BY FK_COD_PEDIDO
    -> HAVING COUNT(FK_COD_PEDIDO) >= 2;
+-------------------+---------------+-----------------------+
| NÚMERO DO PEDIDO  | NOME DO ALUNO | QUANTIDADE DE PEDIDOS |
+-------------------+---------------+-----------------------+
|                 4 | Alexandre     |                     2 |
|                 1 | Frederico     |                     2 |
+-------------------+---------------+-----------------------+
2 rows in set (0.00 sec)

/* EXIBA UMA LISTA COM A DATA, EMAIL, ENDEREÇO E NOME CORRESPONDENTE
AO PEDIDO. */

/* mysql> SELECT DATA_PEDIDO, HORA, EMAIL, ENDERECO, ALUNO
    -> FROM PEDIDO
    -> RIGHT JOIN ALUNO
    -> ON PEDIDO.COD_PEDIDO = ALUNO.COD_ALUNO;
+-------------+----------+------------------------+--------------------+-----------+
| DATA_PEDIDO | HORA     | EMAIL                  | ENDERECO           | ALUNO     |
+-------------+----------+------------------------+--------------------+-----------+
| 2010-04-15  | 11:23:32 | Fred@leega.com.br      | Av. Brasil 778     | Frederico |
| 2010-04-15  | 14:36:21 | Wagner@leega.com.br    | Av Paulista        | Wagner    |
| 2010-04-16  | 11:17:45 | Douglas@leega.com.br   | Lajes 103, ap: 701 | Douglas   |
| 2010-04-17  | 14:27:22 | Alexandre@leega.com.br | Rua Tauney 22      | Alexandre |
| NULL        | NULL     | Mariana@leega.com.br   | Rua Salles 305     | Mariana   |
| 2010-04-19  | 13:47:35 | Samuel@leega.com.br    | Av. Central 30     | Samuel    |
+-------------+----------+------------------------+--------------------+-----------+
6 rows in set (0.00 sec)

/* EXIBA TODOS OS CURSOS QUE CORRESPONDEM AO DETALHE DO PEDIDO. */

/* mysql> SELECT CURSO, FK_COD_PEDIDO
    -> FROM CURSO
    -> LEFT JOIN PEDIDO_DETALHE
    -> ON CURSO.COD_CURSO = PEDIDO_DETALHE.FK_COD_PEDIDO;
+-----------------+---------------+
| CURSO           | FK_COD_PEDIDO |
+-----------------+---------------+
| Java Fundations |             1 |
| Java Fundations |             1 |
| Java Avançado   |             2 |
| SQL Completo    |             3 |
| Php Fundamentos |             4 |
| Php Fundamentos |             4 |
+-----------------+---------------+
6 rows in set (0.02 sec)

/* EXIBA A LISTA DE TODOS OS DADOS DOS ALUNOS CORRESPONDENTE 
AO PEDIDO. */

/* mysql> SELECT * FROM ALUNO
    -> LEFT JOIN PEDIDO
    -> ON ALUNO.COD_ALUNO = PEDIDO.COD_PEDIDO
    -> UNION
    -> SELECT * FROM PEDIDO
    -> RIGHT JOIN ALUNO
    -> ON PEDIDO.COD_PEDIDO = ALUNO.COD_ALUNO;
+-----------+------------+--------------------+------------------------+------------+-------------+--------------------+------------------------+
| COD_ALUNO | ALUNO      | ENDERECO           | EMAIL                  | COD_PEDIDO | DATA_PEDIDO | HORA               | FK_COD_ALUNO           |
+-----------+------------+--------------------+------------------------+------------+-------------+--------------------+------------------------+
|         1 | Frederico  | Av. Brasil 778     | Fred@leega.com.br      |          1 | 2010-04-15  | 11:23:32           | 2                      |
|         2 | Wagner     | Av Paulista        | Wagner@leega.com.br    |          2 | 2010-04-15  | 14:36:21           | 2                      |
|         3 | Douglas    | Lajes 103, ap: 701 | Douglas@leega.com.br   |          3 | 2010-04-16  | 11:17:45           | 3                      |
|         4 | Alexandre  | Rua Tauney 22      | Alexandre@leega.com.br |          4 | 2010-04-17  | 14:27:22           | 4                      |
|         5 | Mariana    | Rua Salles 305     | Mariana@leega.com.br   |       NULL | NULL        | NULL               | NULL                   |
|         6 | Samuel     | Av. Central 30     | Samuel@leega.com.br    |          6 | 2010-04-19  | 13:47:35           | 6                      |
|         1 | 2010-04-15 | 11:23:32           | 2                      |          1 | Frederico   | Av. Brasil 778     | Fred@leega.com.br      |
|         2 | 2010-04-15 | 14:36:21           | 2                      |          2 | Wagner      | Av Paulista        | Wagner@leega.com.br    |
|         3 | 2010-04-16 | 11:17:45           | 3                      |          3 | Douglas     | Lajes 103, ap: 701 | Douglas@leega.com.br   |
|         4 | 2010-04-17 | 14:27:22           | 4                      |          4 | Alexandre   | Rua Tauney 22      | Alexandre@leega.com.br |
|      NULL | NULL       | NULL               | NULL                   |          5 | Mariana     | Rua Salles 305     | Mariana@leega.com.br   |
|         6 | 2010-04-19 | 13:47:35           | 6                      |          6 | Samuel      | Av. Central 30     | Samuel@leega.com.br    |
+-----------+------------+--------------------+------------------------+------------+-------------+--------------------+------------------------+
12 rows in set (0.02 sec)

/* CRIE UMA VISÃO QUE TRAGA O TITULO E PREÇO SOMENTE DOS CURSOS 
DE PROGRAMAÇÃO DA LEEGA. */

CREATE VIEW PRECO_PROGR
AS SELECT CURSO, TIPO, VALOR 
FROM CURSO
INNER JOIN TIPO 
ON CURSO.COD_TIPO = TIPO.COD_TIPO;

/* mysql> SELECT CURSO, TIPO, VALOR
    -> FROM PRECO_PROGR
    -> WHERE TIPO = 'PROGRAMAÇÃO';
+-----------------+---------------+-------+
| CURSO           | TIPO          | VALOR |
+-----------------+---------------+-------+
| Java Fundations | Programação   |   297 |
| Java Avançado   | Programação   |   330 |
| Php Fundamentos | Programação   |   297 |
+-----------------+---------------+-------+
3 rows in set (0.00 sec)

/* CRIE UMA VISÃO QUE TRAGA OS TITULOS DOS CURSOS, TIPO DO 
CURSO E NOME DO INSTRUTOR. */

CREATE VIEW TITULO_CURSO
AS SELECT CURSO, TIPO, INSTRUTOR 
FROM CURSO 
INNER JOIN TIPO 
ON CURSO.COD_TIPO = TIPO.COD_TIPO
INNER JOIN INSTRUTOR 
ON CURSO.COD_INSTR = INSTRUTOR.COD_INSTR;

/* mysql> SELECT CURSO, TIPO, INSTRUTOR
    -> FROM TITULO_CURSO;
+-----------------+----------------+---------------+
| CURSO           | TIPO           | INSTRUTOR     |
+-----------------+----------------+---------------+
| Java Fundations | Programação    | Carlos Emilio |
| Java Avançado   | Programação    | Carlos Emilio |
| SQL Completo    | Banco de Dados | Fernando Dias |
| Php Fundamentos | Programação    | Fernando Dias |
+-----------------+----------------+---------------+
4 rows in set (0.00 sec)

/* CRIE UMA VISÃO QUE EXIBA OS PEDIDOS REALIZADOS, INFORMANDO
O NOME DO ALUNO, DATA E CÓDIGO DO PEDIDO. */

CREATE VIEW PEDIDO_ALUNO
AS SELECT ALUNO, DATA_PEDIDO, COD_PEDIDO
FROM ALUNO
INNER JOIN PEDIDO 
ON ALUNO.COD_ALUNO = PEDIDO.FK_COD_ALUNO;

/* mysql> SELECT ALUNO, DATA_PEDIDO, COD_PEDIDO
    -> FROM PEDIDO_ALUNO;
+-----------+-------------+------------+
| ALUNO     | DATA_PEDIDO | COD_PEDIDO |
+-----------+-------------+------------+
| Alexandre | 2010-04-17  |          4 |
| Alexandre | 2012-07-25  |          8 |
| Douglas   | 2010-04-16  |          3 |
| Samuel    | 2010-04-19  |          6 |
| Samuel    | 2010-04-20  |          7 |
| Wagner    | 2010-04-15  |          1 |
| Wagner    | 2010-04-15  |          2 |
+-----------+-------------+------------+
7 rows in set (0.06 sec)

/* UTILIZANDO SUBQUERY, EXIBA UMA LISTA COM OS NOMES DOS CURSOS
DISPONIBILIZADOS PELA LEEGA INFORMANDO PARA CADA CURSO, QUAL
O SEU MENOR VALOR DE VENDA JÁ PRATICADO. */

/* mysql> SELECT CURSO, VALOR
    -> FROM CURSO
    -> WHERE VALOR IN (SELECT MIN(VALOR) FROM CURSO); /*
/*
+--------------+-------+
| CURSO        | VALOR |
+--------------+-------+
| SQL Completo |   187 |
+--------------+-------+
1 row in set (0.01 sec)
*/ 

/* UTILIZANDO SUBQUERY E O PARAMETRO IN, EXIBA OS NOMES DO 
CURSOS DISPONIBILIZADOS PELA LEEGA CUJO TIPO DE CURSO SEJA
'PROGRAMAÇÃO'. */

/* mysql> SELECT COD_CURSO, CURSO
    -> FROM CURSO
    -> WHERE COD_TIPO IN
    -> (SELECT COD_TIPO
    -> FROM TIPO
    -> WHERE TIPO = 'PROGRAMAÇÃO');
+-----------+-----------------+
| COD_CURSO | CURSO           |
+-----------+-----------------+
|         1 | Java Fundations |
|         2 | Java Avançado   |
|         4 | Php Fundamentos |
+-----------+-----------------+
3 rows in set (0.00 sec)

/* EXIBA UMA LISTA COM OS NOMES DOS INSTRUTORES DA LEEGA E
AO LADO O TOTAL ACUMULADO DAS VENDAS REFERENTE AOS CURSOS
PELO QUAL O INSTRUTOR É RESPONSÁVEL. */

SELECT TP.INSTRUTOR, SUM(VALOR) 'VALOR TOTAL PEDIDO_CURSO'
FROM PEDIDO_DETALHE 
INNER JOIN ( SELECT COD_CURSO, INSTRUTOR
FROM CURSO
INNER JOIN INSTRUTOR
WHERE CURSO.COD_INSTR = INSTRUTOR.COD_INSTR) AS TP
ON TP.COD_CURSO = PEDIDO_DETALHE.COD_CURSO
GROUP BY TP.INSTRUTOR;

/* CRIE UMA VISÃO QUE EXIBA OS NOMES DOS ALUNOS E QUANTO 
CADA UM JÁ COMPROU EM CURSOS. */

mysql> CREATE VIEW COMPRA_CURSOS
    -> AS SELECT ALUNO, SUM(VALOR) AS 'VALOR TOTAL COMPRAS'
    -> FROM CURSO
    -> INNER JOIN ALUNO
    -> ON ALUNO.COD_ALUNO = CURSO.COD_CURSO
    -> GROUP BY ALUNO, VALOR
    -> HAVING SUM(VALOR);
Query OK, 0 rows affected (0.07 sec)

mysql> SELECT * FROM COMPRA_CURSOS;
+-----------+---------------------+
| ALUNO     | VALOR TOTAL COMPRAS |
+-----------+---------------------+
| Alexandre |                 297 |
| Douglas   |                 187 |
| Frederico |                 297 |
| Wagner    |                 330 |
+-----------+---------------------+
4 rows in set (0.00 sec)




/* VERIFIQUE A MÉDIA DE PREÇOS DOS CURSOS, E OS CURSOS COM 
VALOR ACIMA DA MÉDIA E MOSTRAR COM O NOME MAIUSCULO, E OS 
QUE ESTIVEREM ABAIXO COM LETRA MINUSCULA. */

mysql> SELECT UCASE(CURSO) AS CURSO, AVG (PEDIDO_DETALHE.VALOR) AS 'MAIOR E MENOS MEDIA DE PREÇOS'
    -> FROM PEDIDO_DETALHE
    -> INNER JOIN CURSO
    -> ON PEDIDO_DETALHE.COD_CURSO = CURSO.COD_CURSO
    -> GROUP BY CURSO
    -> HAVING AVG(PEDIDO_DETALHE.VALOR) >= (SELECT AVG(PEDIDO_DETALHE.VALOR)
    ->                                      FROM PEDIDO_DETALHE)
    -> UNION
    -> ( SELECT LCASE(CURSO), AVG(PEDIDO_DETALHE.VALOR) AS MENOR_MEDIA_PRECO
    -> FROM PEDIDO_DETALHE
    -> INNER JOIN CURSO
    -> ON PEDIDO_DETALHE.COD_CURSO = CURSO.COD_CURSO
    -> GROUP BY CURSO
    -> HAVING AVG(PEDIDO_DETALHE.VALOR) <= (SELECT AVG(PEDIDO_DETALHE.VALOR)
    ->                                     FROM PEDIDO_DETALHE));
+-----------------+--------------------------------+
|  CURSO          | MAIOR E MENOS MEDIA DE PREÇOS  |
+-----------------+--------------------------------+
| JAVA FUNDATIONS |                       290.0000 |
| JAVA AVANÇADO   |                       330.0000 |
| sql completo    |                       170.0000 |
| php fundamentos |                       270.0000 |
+-----------------+--------------------------------+
4 rows in set (0.00 sec)

