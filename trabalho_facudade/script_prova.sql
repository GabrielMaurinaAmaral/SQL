/* 
-------------------------------------------------------------------------------------
--COMANDOS ÚTEIS

ALTER SEQUENCE cliente_codcliente_seq RESTART WITH 1

ALTER SEQUENCE pedido_codpedido_seq RESTART WITH 1
-------------------------------------------------------------------------------------
*/ 



/* 
-------------------------------------------------------------------------------------
SCRIPTS PARA A CRIAÇÃO DAS TABELAS.
-------------------------------------------------------------------------------------
*/

DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS pgto;
DROP TABLE IF EXISTS vendedor;
DROP TABLE IF EXISTS produto;
commit;

CREATE TABLE CLIENTE(
CODCLIENTE SERIAL PRIMARY KEY,
NOMECLIENTE VARCHAR(100),
IDADE SMALLINT,
GENERO CHAR(1) not null 
constraint gen_M_F check (genero in ('M','F'))
);
COMMIT;

CREATE TABLE PRODUTO(
CODPRODUTO SERIAL PRIMARY KEY,
NOMEPRODUTO VARCHAR(75));
COMMIT;

CREATE TABLE VENDEDOR(
CODVENDEDOR SERIAL PRIMARY KEY,
NOMEVENDEDOR VARCHAR(50));
COMMIT;

CREATE TABLE PGTO(
CODPGTO SERIAL PRIMARY KEY,
DESCRICAOPGTO VARCHAR(50));
COMMIT;

CREATE TABLE PEDIDO(
CODPEDIDO SERIAL PRIMARY KEY,
DATA TIMESTAMP,
VALOR NUMERIC(8,2),
REFVEND INTEGER NOT NULL,
REFCLI INTEGER NOT NULL,
REFPGTO INTEGER NOT NULL,
REFPROD INTEGER NOT NULL);
COMMIT;


/* 
-------------------------------------------------------------------------------------
SCRIPTS PARA A CRIAÇÃO DOS RELACIONAMENTOS.
-------------------------------------------------------------------------------------
*/


ALTER TABLE PEDIDO
ADD FOREIGN KEY(REFVEND) REFERENCES VENDEDOR(CODVENDEDOR);
COMMIT;

ALTER TABLE PEDIDO
ADD FOREIGN KEY(REFCLI) REFERENCES CLIENTE(CODCLIENTE);
COMMIT;

ALTER TABLE PEDIDO
ADD FOREIGN KEY(REFPGTO) REFERENCES PGTO(CODPGTO);
COMMIT; 

ALTER TABLE PEDIDO
ADD FOREIGN KEY(REFPROD) REFERENCES PRODUTO(CODPRODUTO);
COMMIT;



/* 
-------------------------------------------------------------------------------------
INSERÇÕES*/
-------------------------------------------------------------------------------------
/*
-- inserção de apenas 1 registro. Seleção aleatória de alguns atributos
INSERT INTO CLIENTE (NOMECLIENTE, IDADE, GENERO) VALUES (
(select distinct
('[0:14]={"Daniele","Debora","Mattia","Jake","Amy","Henry","Neil","Tim","John","George","Peter","Claus","Lili","Lara","Jacob"}'::text[])
	[floor(random()*15)] || ' ' || 
('[0:14]={"Rossi","Verdi","Gialli","Caponi","Gallini","Gatti","Ford","Daniel","Harrison","Macdonald","Nielson","Watson","Philips","Morison","White"}'::text[])
	[floor(random()*15)] as NOME
from generate_series(1, 1 * 1 * 1)),      
(SELECT floor(random() * (60-15+1) + 15)::int), 
(select distinct
('[0:1]={"M","F"}'::text[])
	[floor(random()*2)] as NOME
from generate_series(1, 1 * 1 * 1)
));
*/

DELIMITER $$

CREATE PROCEDURE InsertClientes()
BEGIN
  DECLARE r INT DEFAULT 0;
  DECLARE nome VARCHAR(255);
  DECLARE sobrenome VARCHAR(255);
  DECLARE idade INT;
  DECLARE genero CHAR(1);
  WHILE r < 1000 DO
    SET nome = ELT(FLOOR(1 + (RAND() * 15)), 'Daniele', 'Debora', 'Mattia', 'Jake', 'Amy', 'Henry', 'Neil', 'Tim', 'John', 'George', 'Peter', 'Claus', 'Lili', 'Lara', 'Jacob');
    SET sobrenome = ELT(FLOOR(1 + (RAND() * 15)), 'Rossi', 'Verdi', 'Gialli', 'Caponi', 'Gallini', 'Gatti', 'Ford', 'Daniel', 'Harrison', 'Macdonald', 'Nielson', 'Watson', 'Philips', 'Morison', 'White');
    SET idade = FLOOR(15 + (RAND() * (60 - 15 + 1)));
    SET genero = ELT(FLOOR(1 + (RAND() * 2)), 'M', 'F');
    INSERT INTO CLIENTE (NOMECLIENTE, IDADE, GENERO) VALUES (CONCAT(nome, ' ', sobrenome), idade, genero);
    SET r = r + 1;
  END WHILE;
END$$

DELIMITER ;

CALL InsertClientes();


INSERT INTO VENDEDOR (nomevendedor) VALUES ('MORO TORTO');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('ROLLE ALEATORIO');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('FACA NA BOTA');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('SNOOPY');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('RICO COSTA');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('JEREMIAS');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('MOTOR ROSA');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('LARA PESCOÇO');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('JUREMINHA DENDE');
INSERT INTO VENDEDOR (nomevendedor) VALUES ('ALINE POULKAI');
COMMIT;


INSERT INTO PGTO (descricaopgto) VALUES ('A VISTA');
INSERT INTO PGTO (descricaopgto) VALUES ('30 DIAS');
INSERT INTO PGTO (descricaopgto) VALUES ('60 DIAS');
INSERT INTO PGTO (descricaopgto) VALUES ('A PERDER DE VISTA');
COMMIT;


INSERT INTO PRODUTO (nomeproduto) VALUES ('MASCOTINHA');
INSERT INTO PRODUTO (nomeproduto) VALUES ('ENTREVEIRO');
INSERT INTO PRODUTO (nomeproduto) VALUES ('ENRROSCO');
INSERT INTO PRODUTO (nomeproduto) VALUES ('VASSOURA DE SOGRA');
INSERT INTO PRODUTO (nomeproduto) VALUES ('SONHO DE VALSA');
INSERT INTO PRODUTO (nomeproduto) VALUES ('LEPO LEPO');
INSERT INTO PRODUTO (nomeproduto) VALUES ('EXTASE');
INSERT INTO PRODUTO (nomeproduto) VALUES ('SACODE');
INSERT INTO PRODUTO (nomeproduto) VALUES ('BAILARINA');
INSERT INTO PRODUTO (nomeproduto) VALUES ('CASADINHOS');
INSERT INTO PRODUTO (nomeproduto) VALUES ('CONCHINHA');
INSERT INTO PRODUTO (nomeproduto) VALUES ('VUCO VUCO');
COMMIT;


DELIMITER $$

CREATE PROCEDURE InsertPedidos()
BEGIN
  DECLARE r INT DEFAULT 0;
  WHILE r < 500 DO
    INSERT INTO pedido (data, valor, refvend, refcli, refpgto, refprod) VALUES (
      DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * (DATEDIFF('2023-12-31', '2023-01-01')+1)) DAY), -- data
      ROUND(RAND() * 100, 2), -- valor
      FLOOR(RAND() * (10 - 1 + 1)) + 1, -- vendedor
      FLOOR(RAND() * (200 - 1 + 1)) + 1, -- cliente
      FLOOR(RAND() * (4 - 1 + 1)) + 1, -- pgto
      FLOOR(RAND() * (12 - 1 + 1)) + 1 -- produto
    );
    SET r = r + 1;
  END WHILE;
END$$

DELIMITER ;

-- Para executar o procedimento
CALL InsertPedidos();

/*QUESTÃO 1*/

SELECT
    C.NOMECLIENTE AS NOME_CLIENTE,
    V.NOMEVENDEDOR AS NOME_VENDEDOR,
    AVG(P.VALOR) AS VALOR_MEDIO_PEDIDO,
    AVG(EXTRACT(DAY FROM P.DATA)) AS MEDIA_DIA
FROM PEDIDO P
INNER JOIN CLIENTE C
    ON C.CODCLIENTE = P.REFCLI
INNER JOIN VENDEDOR V
    ON V.CODVENDEDOR = P.REFVEND
WHERE V.CODVENDEDOR IN (1, 4, 6) AND EXTRACT(MONTH FROM P.DATA) = 6
GROUP BY C.NOMECLIENTE, V.NOMEVENDEDOR;

/* QUESTÃO 2 */

/*com join*/
SELECT
    C.NOMECLIENTE AS NOME_CLIENTE,
    COUNT(*) AS QUANTIDADE_PEDIDOS,
    SUM(P.VALOR) AS TOTAL_PEDIDOS
FROM PEDIDO P
INNER JOIN CLIENTE C
    ON C.CODCLIENTE = P.REFCLI
INNER JOIN PGTO
    ON PGTO.CODPGTO = P.REFPGTO
WHERE EXTRACT(MONTH FROM P.DATA) = 6 AND PGTO.descricaopgto IN ('30 DIAS', '60 DIAS')
GROUP BY C.CODCLIENTE
HAVING TOTAL_PEDIDOS > 100
ORDER BY QUANTIDADE_PEDIDOS DESC;

/*sem join sksksk*/
SELECT
    (SELECT NOMECLIENTE 
        FROM CLIENTE 
        WHERE CODCLIENTE = P.REFCLI) AS NOME_CLIENTE,
    COUNT(*) AS QUANTIDADE_PEDIDOS,
    SUM(P.VALOR) AS TOTAL_PEDIDOS
FROM PEDIDO P
WHERE EXTRACT(MONTH FROM P.DATA) = 6
AND EXISTS (
    SELECT 1 
    FROM PGTO
    WHERE CODPGTO = P.REFPGTO AND descricaopgto IN ('30 DIAS', '60 DIAS')
)
AND P.REFCLI IN (
    SELECT CODCLIENTE 
    FROM CLIENTE
)
GROUP BY P.REFCLI
HAVING TOTAL_PEDIDOS > 100
ORDER BY QUANTIDADE_PEDIDOS DESC;

/* QUESTÃO 3 */

SELECT 
    C.CODCLIENTE AS CODIGO_CLIENTE,
    C.NOMECLIENTE AS NOME_CLIENTE,
    SUM(P.VALOR) AS TOTAL_PEDIDOS,
    MIN(EXTRACT(DAY FROM P.DATA)) AS PRIEIRO_DIA,
    AVG(EXTRACT(DAY FROM P.DATA)) AS DIA_MEDIO,
    MAX(EXTRACT(DAY FROM P.DATA)) AS ULTIMO_DIA 
FROM PEDIDO P
INNER JOIN CLIENTE C
    ON C.CODCLIENTE = P.REFCLI
WHERE EXTRACT(MONTH FROM P.DATA) = 6
GROUP BY C.CODCLIENTE
ORDER BY 3 DESC;

/*QUESTÃO 4*/
/*------------------------------------*/
WITH TABELA_ANO AS(
    SELECT
        PRODUTO.NOMEPRODUTO AS NOME_PRODUTO,
        COUNT(PRODUTO.CODPRODUTO) AS QUANTIDADE_PEDIDOS,
        SUM(PEDIDO.VALOR) AS VALOR_PEDIDO,
        "TOTAL_ANO"
    FROM PRODUTO
    LEFT JOIN PEDIDO
        ON PRODUTO.CODPRODUTO = PEDIDO.REFPROD
    GROUP BY PRODUTO.NOMEPRODUTO
    ORDER BY 1, 2 DESC, 3 DESC;
)

WITH TABELA_NAMO AS(
    SELECT
        PRODUTO.NOMEPRODUTO AS NOME_PRODUTO,
        COUNT(PRODUTO.CODPRODUTO) AS QUANTIDADE_PEDIDOS,
        SUM(PEDIDO.VALOR) AS VALOR_PEDIDO,
        'TOTAL_NAMO'
    FROM PRODUTO
    LEFT JOIN PEDIDO
        ON PRODUTO.CODPRODUTO = PEDIDO.REFPROD
    WHERE EXTRACT(MONTH FROM PEDIDO.DATA) = 6
    GROUP BY PRODUTO.NOMEPRODUTO
    ORDER BY 1, 2 DESC, 3 DESC;
)

SELECT * 
FROM TABELA 


/*------------------------------------*/
SELECT
    PRODUTO.NOMEPRODUTO AS NOME_PRODUTO,
    COUNT(*) AS QUANTIDADE_PEDIDOS,
    SUM(PEDIDO.VALOR) AS VALOR_PEDIDO,
    'TOTAL_ANO' AS PERIODO
FROM PRODUTO
LEFT JOIN PEDIDO 
    ON PRODUTO.CODPRODUTO = PEDIDO.REFPROD
GROUP BY PRODUTO.NOMEPRODUTO

UNION ALL

SELECT
    PRODUTO.NOMEPRODUTO AS NOME_PRODUTO,
    COUNT(*) AS QUANTIDADE_PEDIDOS,
    SUM(PEDIDO.VALOR) AS VALOR_PEDIDO,
    'TOTAL_NOMA' AS PERIODO
FROM PRODUTO
LEFT JOIN PEDIDO 
    ON PRODUTO.CODPRODUTO = PEDIDO.REFPROD
    AND EXTRACT(MONTH FROM PEDIDO.DATA) = 6
GROUP BY PRODUTO.NOMEPRODUTO
HAVING COUNT(PEDIDO.CODPEDIDO) > 0 AND COUNT(PEDIDO.CODPEDIDO) < (SELECT COUNT(P2.CODPEDIDO)
                                                                  FROM PEDIDO P2
                                                                  WHERE P2.REFPROD = PRODUTO.CODPRODUTO)
ORDER BY NOME_PRODUTO, PERIODO DESC;