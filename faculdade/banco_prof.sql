/* script em SQL DDL */
Create Table Livro
(
   PK_liv 	Integer Not Null Primary key,
   Titulo 	Varchar (50), 
   Num_pag 	Smallint,
   Ano 		Smallint
); /*execute a query*/

  /* script em SQL DDL */
Create Table Produto
(
   	Cod_Prod 	Integer Not Null Primary key,
   	Desc_Prod 	Varchar (30) Not Null, 
 	Cor		 Varchar (20)
); /*execute a query*/

Create table Funcionarios(
  PkFunc 	integer not null  primary key 
			check (PkFunc >= 0),
  NomeFunc 	varchar(100) not null,
  Genero 		char(1) not null 
			constraint gen_M_F 
			check (genero in ('M','F')),
  DataNasc 	date not null
);

Create Table Livro(
    	Pkliv 	Integer Not Null,
    	Tituloliv 	Varchar(50), 
	Num_pag 	Smallint,
	Ano 	Smallint,
     	Editoraliv 	Varchar(20),
    	Assuntoliv 	Varchar(80) ,
    	Autorliv	Varchar(50),
    	Generoliv 	Varchar(50)
);

Create Domain Dm_Chaveprimaria 
	Integer Not Null 
	Check (Value > 0); 

Create Domain Dm_Nome 
	Varchar(40) Not Null; 

Create Domain Dm_Fone 
	Varchar(20);

Create Domain Dm_Renda 
	Numeric (9,2) 
	Default 0 Not Null 
	Check (Value >= 0);
	
Create Domain Dm_Gen 
	char(1) not null
	check (value in ('M', 'F'));  	
	
Create Domain  	 as 
	char(1) 
	check (value in ('S', 'C', 'D', 'V', 'U')); 

Create Table Cliente(
    PK_Cod 	DM_ChavePrimaria primary key,
	Nome 	DM_Nome,
    Fone 	DM_Fone,
    Fax 	DM_Fone,
	Renda 	DM_Renda,
    Est_civil 	Dm_EstCivil,
    Sexo 	Dm_Gen
); 

/* --------------- DML ------------------- */

Create Table FUNC(
   Codigo 	Integer Not Null Primary Key,
   Nome 	Varchar(30) Not Null,
   Salario 	Numeric(12,2),
   Genero 	char(1) not null
			constraint gen_M_F
			check (genero in ('M','F')),
   Idade 	Integer,
   Uf 		char (2),
   Cidade 		varchar (40) not null,
   Est_Civil 	char (1) not null
				check (Est_Civil in ('S', 'C', 'D', 'V', 'U')),
   data_nasc 	date
   );
   
Insert Into FUNC
(codigo, nome, salario, genero, idade, uf, cidade, est_civil, data_nasc)
Values
(1, 'Carla', 5.000, 'F', 19, 'PR', 'Pato Branco', 'S','11/11/1981');

Insert Into FUNC
Values
(2, 'Carla', 5.000, 'F', 19, 'PR', 'Pato Branco', 'S','11/11/1981');

Insert Into FUNC
Values
(2, 'Ze Violla', 10.000, 'M', 30, 'RS', 'Soledade', 'C','01/11/1990');
   
   
INSERT INTO FUNC
	VALUES (100, 'Dalessandro', 500000, 'M', 40, 'RS', 'Porto Alegre', 'C', '06/04/1981');
   
/* Exercicios */   
delete from func; 
   
INSERT INTO FUNC
	VALUES (1, 'Rodrigo Cardoso', 1588, 'M', 25, 'SC', 'Lages', 'S', '06/04/1991');

INSERT INTO FUNC
	VALUES (2, 'Maria Joaquina', 16556, 'F', 43, 'PR', 'Arapongas', 'C', '20/05/1978');

INSERT INTO FUNC
	VALUES (3, 'Bastianzinho Silva', 3500, 'M', 32, 'RS', 'Passo Fundo', 'D', '04/10/1986');

INSERT INTO FUNC
	VALUES (4, 'Ana Paula', 8550, 'F', 25, 'SC', 'Floripa', 'S', '01/12/1992');

INSERT INTO FUNC
	VALUES (5, 'Tonico Alves', 10550, 'M', 50, 'PR', 'Pato Branco', 'V', '25/12/1970');

INSERT INTO FUNC
	VALUES (6, 'Jose de Deus', 2300, 'M', 20, 'RS', 'Fontoura Xaxier', 'S', '30/11/1998');
   
/* Caso de auto-incremento em bases como firebird e interbase (e no PG, como é?) */   
      
CREATE GENERATOR CODLIVRO;

SET TERM ^ ;
CREATE TRIGGER Tri_CodLiv FOR LIVRO
	ACTIVE 
		BEFORE INSERT
	AS
	begin
  		NEW.PkLiv = GEN_ID(CODLIVRO, 1);
	end^
SET TERM ; ^

Insert Into Livro
	(TituloLiv, Num_Pag, Ano, EditoraLiv, AssuntoLiv, AutorLiv, GeneroLiv)
	Values
	('O homem que amava demais', 500, 2019, 'MT Edi  es', 'Relacionamentos amorosos', 'Dani Malvadezas', 'Romance');

DELETE FROM RDB$GENERATORS