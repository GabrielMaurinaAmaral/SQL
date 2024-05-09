drop table Func; 
commit; 

Create Table Func(
	CodFunc serial Not Null Primary Key, 
	NomeFunc 	Varchar(30) Not Null,
   	Salario 	Numeric(12,2),
   	Gen 	char(1),
   	Idade 	Integer,
   	Uf 		char (2),
   	Cidade 	varchar (40) not null,
   	EstCivil	char (10),
	DataAdm 	date
);


delete from func;
   

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Rodrigo Cardoso', 1588, 'm', 25, 'sc', 'Lages', 'Solteiro', '23/10/2005');

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Maria Marcela Joaquina', 2000, 'f', 23, 'pr', 'Pato Branco', 'Casado', '24/10/2005');

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Marcelo Bastianzinho Silva', 15000, 'M', 55, 'pr', 'Curitiba', 'Casado', '27/10/2005');

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Ana Paula Barcelos', 4500, 'f', 34, 'sc', 'Florian�polis', 'Casado', '27/10/2005');

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Tonico Alves', 1500, 'm', 25, 'sc', 'Sao Paulo', 'Solteiro', '01/11/2005');

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Jose de Deus', 6000, 'm', 35, 'ba', 'Savador', 'Casado', '02/11/2005'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Jose Geraldo da Silva', 12000, 'M', 24, 'AC', 'Rio Alerta', 'Solteiro', '16/11/2005'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Jose Talino Sbares', 15000, 'M', 40, 'rs', 'Soledade', 'CASADO', '23/11/2005'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Mariana Prestes', 15000, 'f', 18, 'AM', 'Manaus', 'Casada', '10/12/2005'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Jacira dos Patos', 8000, 'F', 23, 'sp', 'Carai', 'CasadA', '25/12/2005'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Juvenal Rigo', 9000, 'M', 30, 'SP', 'S�o Paulo', 'SolteiRO', '05/01/2006'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Juracico Trancoso', 8000, 'm', 44, 'pr', 'Rolandia', 'Solteiro', '15/02/2006'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Luciel Almeida', 5000, 'f', 48, 'RS', 'N�o Me Toque', 'Casada', '10/08/2006'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Luciel Almeida', 5000, 'm', 48, 'RS', 'N�o Me Toque', 'Solteiro', '13/10/2006');

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Amadiel Tor�', 10000, 'm', 35, 'RS', 'N�o Me Toque', 'Casado', '13/10/2006');	
		
INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Lorencina Alvarrenga', 20000, 'f', 59, 'TO', 'Palmas', 'Solteira', '23/12/2006'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Eduardo La Rosa', 10000, 'm', 45, 'SC', 'Blumenau', 'Casado', '23/01/2007'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Zeduardo La Rosa', 1000, 'm', 25, 'SC', 'Blumenau', 'Solteira', '18/02/2007'); 

INSERT INTO FUNC
(NomeFunc, Salario, Gen, Idade, Uf, Cidade, EstCivil, DataAdm)
VALUES ('Zeduarda La Rosa', 1000.55, 'f', 25, 'SC', 'Blumenau', 'Solteira', '25/03/2007'); 