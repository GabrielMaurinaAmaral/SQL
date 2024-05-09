drop table Fabricante cascade; 
drop table Produto cascade;  

CREATE TABLE Fabricante(
	id_Fabricante       INTEGER NOT NULL PRIMARY KEY,
	nome_Fabricante	    VARCHAR(40) NOT NULL,
	endereco_Fabricante	VARCHAR(40) NOT NULL,
	fone_Fabricante	    VARCHAR(14) NOT NULL,
	CNPJ		        CHAR(17) NOT NULL);
COMMIT;

CREATE TABLE Produto(
	id_Produto	     INTEGER NOT NULL PRIMARY KEY,
	nome_Produto     VARCHAR(40) NOT NULL,
	cor_Produto		 VARCHAR(14) NOT NULL,
	contagem_Produto INTEGER);
COMMIT;
/* Agora implemente o relacionamento por chaves */
ALTER TABLE Produto
	ADD FK_Fabricante INTEGER NOT NULL;

ALTER TABLE Produto
	ADD FOREIGN KEY(FK_Fabricante) 
	REFERENCES 
	Fabricante (id_Fabricante);

/* OU */		
CREATE TABLE Produto(
    id_Produto INTEGER NOT NULL PRIMARY KEY,
	Nome	   VARCHAR(40) NOT NULL,
	Cor		   VARCHAR(14) NOT NULL,
	Voltagem   INTEGER,
 	FK_Fabricante      INTEGER NOT NULL,
    FOREIGN KEY (FK_Fabricante) References Fabricante (id_Fabricante)
);

		
		
/* Agora insira dados */		
INSERT INTO Fabricante (id_Fabricante, nome_Fabricante, endereco_Fabricante, fone_Fabricante, CNPJ)
	VALUES(1, 'Brastemp', 'Av. Manaus', '0800-123765', '988.189.099/0001');
	COMMIT; 

INSERT INTO Produto (id_Produto, nome_Produto, Cor, Voltagem, FK_Fabricante)
	VALUES(1, 'Fogao', 'BR', 110, 2);
	COMMIT;
/* Erro!!! Pq? */
INSERT INTO Fabricante (id_Fabricante, nome_Fabricante, endereco_Fabricante, fone_Fabricante, CNPJ)
	VALUES(2, 'Brit nia', 'Av. Anhanguera', '0800-456378', '999.189.212/0001');
	COMMIT;

INSERT INTO Produto (id_Produto, nome_Produto, Cor, Voltagem, FK_Fabricante)
	VALUES(2, 'Cafeteira', 'BR', 220, 2);
	COMMIT;

SELECT * FROM Produto;
SELECT * FROM Fabricante;