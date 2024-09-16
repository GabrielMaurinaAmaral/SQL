SELECT  C.nome_cliente, 
		C.sexo_cliente, 
		IFNULL(C.email_cliente,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.tipo_telefone, 
		T.numero_telefone, 
		E.bairro_endereco, 
		E.cidade_endereco, 
		E.estado_endereco
FROM Clientes C 
INNER JOIN Telefone T 
ON C.id_cliente = T.id_cliente 
INNER JOIN Endereco E 
ON C.id_cliente = E.id_cliente
ORDER BY 1;

/*DELIMITER- > COMANDO QUE MUDA O DELIMITADOR*/
DELIMITER $
DELIMITER ;

/**STORED PROCEDURE ->  BLOCOS DE PROGRAMAÇÃO QUE 
FICAM ARMAZENADOS NO BANCO PARA ALGUMA ALTOMAÇÃO*/
DELIMITER $

CREATE PROCEDURE Nome_Empresa()
BEGIN
    SELECT 'UNIVERSIDADE DOS DADOS' AS empresa;
END
$

/*CHAMA UM PROCEDURE*/
CALL Nome_Empresa()$
DELIMITER ;
CALL Nome_Empresa();

/*PROCEDURES COM PARAMETROS*/
SELECT 10+10 AS Conta;

DELIMITER $
CREATE PROCEDURE Conta()
BEGIN
    SELECT 10+10 AS Conta;
END
$

DELIMITER ;
CALL Conta();
DROP PROCEDURE Conta;

/*REDORÇAR OQUE ENTENDI*/
DELIMITER $
CREATE PROCEDURE Conta(num_1 INT, num_2 INT)
BEGIN
    SELECT num_1+num_2 AS Conta;
END
$

CALL Conta(10,20)$ 
DELIMITER ;
CALL Conta(15,25);

/* PROCEDURES */
CREATE TABLE Cursos(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
	nome_curso VARCHAR(30) NOT NULL,
	horas_curso INT NOT NULL,
	valor_curso FLOAT(10,2) NOT NULL
);

INSERT INTO Cursos VALUES(NULL, 'JAVA', 30, 500.00);
INSERT INTO Cursos VALUES(NULL, 'FUNDAMENTOS DE BANCOS DE DADOS', 40, 700.00);
INSERT INTO Cursos VALUES(NULL, 'PYTHON', 25, 450.00);
INSERT INTO Cursos VALUES(NULL, 'WEB DEVELOPMENT', 50, 800.00);
INSERT INTO Cursos VALUES(NULL, 'DATA SCIENCE', 35, 600.00);
INSERT INTO Cursos VALUES(NULL, 'NETWORKING FUNDAMENTALS', 30, 550.00);
INSERT INTO Cursos VALUES(NULL, 'CLOUD COMPUTING', 45, 750.00);
INSERT INTO Cursos VALUES(NULL, 'C# PROGRAMMING', 35, 600.00);
INSERT INTO Cursos VALUES(NULL, 'MOBILE APP DEVELOPMENT', 40, 700.00);
INSERT INTO Cursos VALUES(NULL, 'LINUX ADMINISTRATION', 30, 550.00);
INSERT INTO Cursos VALUES(NULL, 'ARTIFICIAL INTELLIGENCE', 45, 750.00);
INSERT INTO Cursos VALUES(NULL, 'DATABASE ADMINISTRATION', 35, 600.00);
INSERT INTO Cursos VALUES(NULL, 'WEB DESIGN', 25, 450.00);
INSERT INTO Cursos VALUES(NULL, 'SECURITY FUNDAMENTALS', 30, 550.00);
INSERT INTO Cursos VALUES(NULL, 'AGILE METHODOLOGIES', 20, 400.00);
INSERT INTO Cursos VALUES(NULL, 'BIG DATA ANALYTICS', 40, 700.00);
INSERT INTO Cursos VALUES(NULL, 'PROJECT MANAGEMENT', 35, 600.00);

STATUS

/* CRIANDO UMA 'FUNÇÃO' */
DELIMITER #
CREATE PROCEDURE Cadastrar_Curso(nome VARCHAR(30), horas INT, preco FLOAT(10,2))
BEGIN
    INSERT INTO Cursos VALUES(NULL, nome, horas, preco);
END#
DELIMITER ;
/* CRIANDO UMA 'FUNÇÃO' */
DELIMITER #
CREATE PROCEDURE Encontrar_Curso(p_id_curso INT)
BEGIN
    SELECT * FROM Cursos WHERE id_curso = p_id_curso;
END#
DELIMITER ;
/* CRIANDO UMA 'FUNÇÃO' */
DELIMITER #
CREATE PROCEDURE Encontrar_Curso(p_id_curso INT)
BEGIN
    SELECT * FROM Cursos WHERE id_curso = p_id_curso;
END#
DELIMITER ;

/* FUNCOES DE AGREGACAO NUMERICAS */
CREATE TABLE Vendedores(
	id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
	nome_vendedor VARCHAR(30) NOT NULL,
	sexo_vendedor CHAR(1) NOT NULL,
	janeiro_vendedor FLOAT(10,2),
	fevereiro_vendedor FLOAT(10,2),
	marco_vendedor FLOAT(10,2)
);

INSERT INTO Vendedores VALUES(NULL,'CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO Vendedores VALUES(NULL,'MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO Vendedores VALUES(NULL,'ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO Vendedores VALUES(NULL,'CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO Vendedores VALUES(NULL,'ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO Vendedores VALUES(NULL,'IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO Vendedores VALUES(NULL,'JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO Vendedores VALUES(NULL,'CELIA','F',89667.78,57654.87,5755.90);
INSERT INTO Vendedores VALUES(NULL, 'FERNANDO', 'M', 5432.12, 6789.34, 9876.56);
INSERT INTO Vendedores VALUES(NULL, 'RAQUEL', 'F', 12345.67, 8765.43, 4567.89);
INSERT INTO Vendedores VALUES(NULL, 'ROBERTO', 'M', 9876.54, 2345.67, 8765.43);
INSERT INTO Vendedores VALUES(NULL, 'SANDRA', 'F', 3456.78, 5678.90, 7890.12);
INSERT INTO Vendedores VALUES(NULL, 'GUSTAVO', 'M', 6543.21, 7890.12, 9012.34);
INSERT INTO Vendedores VALUES(NULL, 'LUCIA', 'F', 98765.43, 8765.43, 98765.43);
INSERT INTO Vendedores VALUES(NULL, 'FELIPE', 'M', 5432.10, 98765.43, 1234.56);
INSERT INTO Vendedores VALUES(NULL, 'ANA', 'F', 87654.32, 1234.56, 87654.32);
INSERT INTO Vendedores VALUES(NULL, 'RICARDO', 'M', 9876.54, 87654.32, 5432.10);
INSERT INTO Vendedores VALUES(NULL, 'ISABELA', 'F', 8765.43, 4321.09, 7654.32);
INSERT INTO Vendedores VALUES(NULL, 'MARCIO', 'M', 2345.67, 7654.32, 6543.21);
INSERT INTO Vendedores VALUES(NULL, 'LARISSA', 'F', 5678.90, 5432.10, 4321.09);
INSERT INTO Vendedores VALUES(NULL, 'GABRIEL', 'M', 5432.10, 4321.09, 7654.32);
INSERT INTO Vendedores VALUES(NULL, 'RAFAELA', 'F', 87654.32, 6543.21, 8765.43);
INSERT INTO Vendedores VALUES(NULL, 'BRUNO', 'M', 1234.56, 8765.43, 5432.10);
INSERT INTO Vendedores VALUES(NULL, 'CAROLINA', 'F', 12000.00, 15000.00, NULL);
INSERT INTO Vendedores VALUES(NULL, 'PEDRO', 'M', 8000.00, NULL, 10000.00);
INSERT INTO Vendedores VALUES(NULL, 'FABIANA', 'F', 9500.00, 8800.00, 7000.00);
INSERT INTO Vendedores VALUES(NULL, 'RAUL', 'M', 12000.00, 13000.00, 11000.00);
INSERT INTO Vendedores VALUES(NULL, 'GISELE', 'F', NULL, 9500.00, 12000.00);
INSERT INTO Vendedores VALUES(NULL, 'FERNANDO', 'M', 8500.00, 7000.00, 8000.00);
INSERT INTO Vendedores VALUES(NULL, 'THAIS', 'F', 10000.00, NULL, 9000.00);
INSERT INTO Vendedores VALUES(NULL, 'RAFAEL', 'M', 11000.00, 10500.00, 10000.00);
INSERT INTO Vendedores VALUES(NULL, 'MONICA', 'F', 8500.00, 9500.00, 9000.00);
INSERT INTO Vendedores VALUES(NULL, 'WILLIAM', 'M', 10500.00, 11000.00, 11500.00);

/* MAXIMO */
SELECT MAX(janeiro_vendedor) AS 'Maior de Janeiro' FROM Vendedores; 
/* MINIMO */
SELECT MIN(marco_vendedor) AS 'Menor de Março' FROM Vendedores; 
/* MÉDIA */
SELECT AVG(fevereiro_vendedor) AS 'Média de Fevereiro' FROM Vendedores; 
/* TRUNCATE -> arruma as casas decimais */
SELECT TRUNCATE(AVG(fevereiro_vendedor),2) AS 'Média de Fevereiro COM 2 CASAS DECIMAIS' FROM Vendedores; 
/*Vendas por sexo*/
SELECT sexo_vendedor, SUM(marco_vendedor) as 'Total de Marco'
FROM Vendedores
GROUP By sexo_vendedor;

/* VENDEDOR QUE VENDEU MENOS EM MARCO E SEU NOME*/
SELECT id_vendedor, nome_vendedor, marco_vendedor AS 'Menor de Março'
FROM Vendedores
WHERE marco_vendedor=(SELECT MIN(marco_vendedor) FROM Vendedores);

/* VENDEDOR QUE VENDEU MAIS EM MARCO E SEU NOME COM SEXO FEMINENIP*/
SELECT id_vendedor, nome_vendedor, marco_vendedor AS 'Maior de Março'
FROM Vendedores
WHERE marco_vendedor=(SELECT MAX(marco_vendedor) FROM Vendedores WHERE sexo_vendedor='F')

/*VENDEDORES HOMENS QUE VENDERAS MAIS QUE A MEDIA TOTAL EM FEVEREIRO*/
SELECT nome_vendedor, fevereiro_vendedor
FROM Vendedores
WHERE sexo_vendedor = 'M'
    AND fevereiro_vendedor > (SELECT AVG(fevereiro_vendedor) FROM Vendedores);

/* A32 - OPERACOES EM LINHA */
SELECT nome_vendedor, janeiro_vendedor, fevereiro_vendedor, marco_vendedor,
	   (janeiro_vendedor+fevereiro_vendedor+marco_vendedor) AS "TOTAL",
	   TRUNCATE((janeiro_vendedor+fevereiro_vendedor+marco_vendedor)/3,2) AS "MEDIA"
	   FROM Vendedores;
	   
/* APLICANDO UM % */
SELECT NOME, janeiro_vendedor, fevereiro_vendedor, marco_vendedor,
	   (janeiro_vendedor+fevereiro_vendedor+marco_vendedor) AS "TOTAL",
	   (janeiro_vendedor+fevereiro_vendedor+marco_vendedor) * .25 AS "DESCONTO",
	   TRUNCATE((janeiro_vendedor+fevereiro_vendedor+marco_vendedor)/3, 2) AS "MEDIA"
	   FROM Vendedores;
	   
/* ALTERANDO TABELAS */
CREATE TABLE TABELA(
	COLUNA_1 VARCHAR(30),
	COLUNA_2 VARCHAR(30),
	COLUNA_3 VARCHAR(30)
);
/* ADICIONANDO UMA PK*/
ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA_1);
/* ADICIONANDO COLUNA SEM POSIÇÃO -> ULTIMA POSIÇÃO */
ALTER TABLE TABELA
ADD COLUNA_4 VARCHAR(30);
/* ADICIONANDO COLUNA EM UMA POSIÇÃO ESPECIFICA -> AFTERMDEPOIS DE CERTA COLUNA*/
ALTER TABLE TABELA
ADD COLUMN COLUNA_5 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA_2;
/* MODIFICANDO O TIPO DE UM CAMPO */
ALTER TABLE TABELA 
MODIFY COLUNA_4 DATE NOT NULL;


/* RENOMEANDO O NOME DA TABELA */
ALTER TABLE PESSOA 
RENAME Pessoa;

CREATE TABLE Time(
    id_time INT PRIMARY KEY AUTO_INCREMENT,
    nome_time VARCHAR(30) NOT NULL,
    id_pessoa INT NOT NULL
);

ALTER TABLE Time
MODIFY id_pessoa varchar(30) NOT NULL;

ALTER TABLE Time
ADD FOREIGN KEY (id_pessoa)
REFERENCES Pessoa(COLUNA_1);

/* VEREFICAR AS CHAVES */
SHOW CREATE TABLE Time;

/* ORGANIZAÇÃO DE CHAVES - CONSTRAINT  */
CREATE TABLE Jogador(
    id_jogador INT PRIMARY KEY AUTO_INCREMENT,
	nome_jogador VARCHAR(30)
);

CREATE TABLE Time(
	id_time INT PRIMARY KEY AUTO_INCREMENT,
	nome_time VARCHAR(30),
	id__jogador INT,
	FOREIGN KEY (id__jogador),
	REFERENCES jogador(id_jogador)
);

SHOW CREATE TABLE Jogador;
SHOW CREATE TABLE Time;

/**/
CREATE TABLE Cliente(
    id_cliente INT,
	nome_cliente VARCHAR(30) NOT NULL
);

CREATE TABLE Telefone(
    id_telefone INT,
	tipo_telefone CHAR(3) NOT NULL,
    numero_telefone VARCHAR(10) NOT NULL,
	id__cliente INT
);

ALTER TABLE Cliente 
ADD CONSTRAINT pk_cliente 
PRIMARY KEY(id_cliente);

ALTER TABLE Telefone 
ADD CONSTRAINT fk_cliente_telefone
FOREIGN KEY(id__cliente) 
REFERENCES cliente(id_cliente); 

/* DICIONARIO DE DADOS */
SHOW DATABASES;

USE INFORMATION_SCHEMA;
SHOW TABLES;
DESC TABLE_CONSTRAINTS; 

SELECT CONSTRAINT_SCHEMA AS 'BANCO',
       TABLE_NAME AS 'TABELA',
	   CONSTRAINT_NAME AS 'NOME REGRA',
	   CONSTRAINT_TYPE AS 'TIPO'
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'projeto';
/* |projeto|telefone|fk_cliente_telefone|FOREIGN KEY| */
/* APAGAR A CONSTRAINDTS*/
USE Comercio; 

ALTER TABLE Telefone
DROP FOREIGN KEY fk_cliente_telefone;
ALTER TABLE Telefone
DROP INDEX fk_cliente_telefone,

/**/