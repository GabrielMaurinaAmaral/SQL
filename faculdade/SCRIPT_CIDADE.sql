-- Criando as tabelas 

--drop table cidade cascade; 
--drop table estado cascade; 
--drop table pais cascade; 
--drop table continente cascade; 

Create Table Continente(
  		PkCont Integer Not Null,
		NomeCont Varchar(25),
		Caracteristicas Varchar(200),
		Constraint Const_PkCont Primary Key (PkCont));
	
Create Table Pais(
	PkPais Integer Not Null,
	NomePais	Varchar(25) Not Null,
 	FKCont Integer Not Null,
   Habitantes integer,
	Constraint Const_PkPais Primary Key (PkPais),
	Constraint Const_FkCont Foreign Key (FkCont) References Continente (PkCont));

Create Table Estado (
	PkEst Integer Not Null,
	NomeEst	Varchar(25) Not Null,
	Regiao Varchar(25) Not Null,
	FkPais Integer Not Null,
	Constraint Const_PkEst Primary Key (PkEst),
	Constraint Const_FkPais Foreign Key (FkPais) References Pais (PkPais));


Create Table Cidade (
	PkCid Integer Not Null,
	FkEst Integer Not Null,
	Populacao Integer Not Null,
	NomeCid	Varchar(25) Not Null,
	Constraint Const_PkCid Primary Key (PkCid),
	Constraint Const_FkEst Foreign Key (FkEst) References Estado (PkEst));

--Populando as tabelas do arquivo de BD mapa.gdb com os seguintes valores:

INSERT INTO CONTINENTE (PKCONT, CARACTERISTICAS, NOMECont) 
VALUES (1, 'A America do Sul abriga 12 paises em desenvolvimento e uma populacao total de 348 milhoes de habitantes, representando 6% da populacao mundial', 'America do Sul');

INSERT INTO CONTINENTE (PKCONT, CARACTERISTICAS, NOMECont) 
VALUES (2, 'Estao localizados 3 paises independentes (Estados Unidos, Canada e Mexico), alem das Bermudas (uma colonia do Reino Unido), da Groenlandia (uma regiao dinamarquesa), e Saint-Pierre et Miquelo', 'America do Norte');

INSERT INTO CONTINENTE (PKCONT, CARACTERISTICAS, NOMECont) 
VALUES (3, 'A America Central ou Mesoamerica e um istmo que faz a ligacao entre a America do Sul e a America do Norte. Nesta parte, abriga sete paises e possui uma area com cerca de 540.000 km2', 'America Central');

INSERT INTO CONTINENTE (PKCONT, CARACTERISTICAS, NOMECont) 
VALUES (4, 'A Africa e um continente de grandes contrastes. Foi nele que, segundo as evidencias cientificas de que dispomos hoje, surgiu a especie humana. Sua populacao beira 1 bilhao', 'Africa');

INSERT INTO CONTINENTE (PKCONT, CARACTERISTICAS, NOMECont) 
VALUES (5, 'A Europa destaca-se como centro comercial do mundo e é o continente mais desenvolvido dentre todos', 'Europa');

INSERT INTO CONTINENTE (PKCONT, CARACTERISTICAS, NOMECont) 
VALUES (6, 'A Asia destaca-se como maior mais populoso continente dentre todos', 'Asia');

INSERT INTO CONTINENTE (PKCONT, CARACTERISTICAS, NOMECont) 
VALUES (7, 'A Oceania destaca-se como o menor continente dentre todos, mas um dos melhores para se viver', 'Oceania');

Commit;

INSERT INTO PAIS (PKPAIS, NOMEPais, HABITANTES, FKCONT) VALUES (1, 'Brasil', 5000000, 1);
INSERT INTO PAIS (PKPAIS, NOMEPais, HABITANTES, FKCONT) VALUES (2, 'Argentina', 200000, 1);
INSERT INTO PAIS (PKPAIS, NOMEPais, HABITANTES, FKCONT) VALUES (3, 'Uruguai', 300000, 1);
INSERT INTO PAIS (PKPAIS, NOMEPais, HABITANTES, FKCONT) VALUES (4, 'Mexico', 1000000, 2);
INSERT INTO PAIS (PKPAIS, NOMEPais, HABITANTES, FKCONT) VALUES (5, 'Gana', 400000, 4);
INSERT INTO PAIS (PKPAIS, NOMEPais, HABITANTES, FKCONT) VALUES (6, 'Sidney', 550000, 7);
INSERT INTO PAIS (PKPAIS, NOMEPais, HABITANTES, FKCONT) VALUES (7, 'New Zealand', 230000, 7);

Commit;

INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (1, 'Santa Catarina', 'Sul', 1);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (2, 'Parana', 'Sul', 1);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (3, 'Bahia', 'Nordeste', 1);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (4, 'Campo Grande', 'Centro Oeste', 1);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (5, 'Amazonas', 'Norte', 1);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (6, 'Missiones', 'Sul', 2);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (7, 'Tocantins', 'Norte', 1);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (8, 'Waikato', 'Centro', 7);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (9, 'Otago', 'Sul', 7);
INSERT INTO ESTADO (PKEST, NOMEEst, REGIAO, FKPAIS) VALUES (10, 'Weelington', 'Centro', 7);

Commit;

INSERT INTO CIDADE (PKCID, FKEST, POPULACAO, NOMECid) VALUES (1, 1, 400000, 'Joinville');
INSERT INTO CIDADE (PKCID, FKEST, POPULACAO, NOMECid) VALUES (2, 2, 70000, 'Pato Branco');
INSERT INTO CIDADE (PKCID, FKEST, POPULACAO, NOMECid) VALUES (3, 2, 50000, 'Francisco Beltrao');
INSERT INTO CIDADE (PKCID, FKEST, POPULACAO, NOMECid) VALUES (4, 2, 2000000, 'Curitiba');
INSERT INTO CIDADE (PKCID, FKEST, POPULACAO, NOMECid) VALUES (5, 3, 400000, 'Salvador');
INSERT INTO CIDADE (PKCID, FKEST, POPULACAO, NOMECid) VALUES (6, 8, 220000, 'Hamilton');
INSERT INTO CIDADE (PKCID, FKEST, POPULACAO, NOMECid) VALUES (7, 9, 100000, 'Nelson');
INSERT INTO CIDADE (PKCID, FKEST, POPULACAO, NOMECid) VALUES (8, 10, 750000, 'Wellington');

Commit;

SELECT * FROM CONTINENTE;
SELECT * FROM PAIS;
SELECT * FROM ESTADO;
SELECT * FROM CIDADE;
SELECT * FROM CONTINENTE, PAIS, ESTADO, CIDADE;

SELECT * 
FROM PAIS P
INNER JOIN ESTADO E
    ON P.PKPAIS = E.FKPAIS
INNER JOIN CIDADE C
     ON E.PKEST = C.FKEST
WHERE E.REGIAO = 'Sul';

SELECT 
    P.NomePais,
    COUNT(E.NomeEst) AS QANTIDADE_ESTADOS
FROM PAIS P
INNER JOIN ESTADO E
    ON P.PKPAIS = E.FKPAIS
GROUP BY P.NomePais;

SELECT P.NomePais AS Paises_Cidades
FROM PAIS P
union
SELECT C.NomeCid
FROM CIDADE C;

SELECT E.NomeEst AS Estados_Cidades
FROM ESTADO E
UNION
ALL
SELECT C.NomeCid
FROM CIDADE C;	

SELECT C.NomeCont 
FROM CONTINENTE C, PAIS PAIS
WHERE C.PKCONT = PAIS.FKCONT


SELECT E.NAME