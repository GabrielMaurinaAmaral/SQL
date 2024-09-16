/*Compile isso primeiro*/
drop table Cliente cascade;
drop table Produto cascade;
drop table Fabricante cascade;
drop table NotaFiscal cascade;
drop table Itens cascade;


create table cliente(
	PKCli	Integer not null Primary Key,
	NomeCli		Varchar(40) not null,
	EndCli		Varchar(40) not null	
);

create table fabricante(
	PKFab		Integer not null Primary Key,
	NomeFab		Varchar(40) not null,
	EndFab	Varchar(40) not null,
	FoneFab	Varchar(14) not null,
	CNPJ		char(17) not null
);

	commit;
	
create table produto(
	PKProd	Integer not null Primary Key,
	NomeProd		Varchar(40) not null,
	Cor		Varchar(14) not null,
	Voltagem	Integer,
	FKFab Integer not null,
	Foreign Key(FKFab) REFERENCES Fabricante (PKFab)
);
	
create table NotaFiscal(
	PKNota	Integer not null Primary Key,
	data 	date,
	ValorTotal 	numeric(8,2),
	FKCli 		Integer not null,
	Foreign Key(FKCli) REFERENCES Cliente (PKCli)
);
	
create table Itens(
	QuantItens 	integer,
	Desconto 		numeric(6,2),
	ValorUnitario numeric(6,2),
	FKNota 		Integer not null,
	FKProd 		Integer not null,
	Foreign Key(FKNota) REFERENCES NotaFiscal (PKNota),	
	Foreign Key(FKProd) REFERENCES Produto (PKProd)
);



 insert into cliente values (1,'Mary da Penha','Rua das Caetanas 527');
 insert into cliente values (2,'Malu La Vie','Rua das Ostras 237');
 insert into cliente values (3,'Louvamir De Los Libres','Av Ginete 1527');
 insert into cliente values (4,'Jakson La Febre','Alameda do mel 113');
 insert into cliente values (5,'Juraci Le Pierre','Boqueirao do Tigre 266');
commit;

insert into fabricante values (1,'Toyota','Rua das aves de pena','14239878',2342642394);
insert into fabricante values (2,'Morgota','Rua facas','14239878',3523543);
insert into fabricante values (3,'Bergamota','Rua dos Bois com as Cordas','14239878',2365764745);
insert into fabricante values (4,'Jota','Rua Ja Sinto Pena','14239878',12423645856);
insert into fabricante values (5,'Kokota','Visolino','14239878',697879564536);
insert into fabricante values (6,'Dakota','Rua das Ventanias','14239878',45746853568);
commit;

insert into produto values (1,'Amortecedor','Preto',110,2);
insert into produto values (2,'Borracha de bicicleta','Preto',220,1);
insert into produto values (3,'Cordao de veludo','Amarelo',110,2);
insert into produto values (4,'Pino central traseiro','Azul',110,4);
insert into produto values (5,'Jalapuxa da alavanca','Verde',220,4);
insert into produto values (6,'Larapemba de Jangada','Roxa',220,1);
commit;
 
insert into NotaFiscal values (1,null, 550,3);
insert into NotaFiscal values (2,null, 1324.00,2);
insert into NotaFiscal values (3,null, 2423.15,2);
insert into NotaFiscal values (4,null, 34334.88,4);
insert into NotaFiscal values (5,null, 9837.79,1);
commit;

 insert into Itens values (1, 45, 502.00, 2, 3);
 insert into Itens values (2, 345, 2238.00,  1, 1);
 insert into Itens values (3, 775, 2092.00, 1, 2);
 insert into Itens values (4, 34, 3338.00,  3, 1);
 insert into Itens values (5, 57, 333.00,  4, 5);
 insert into Itens values (6, 47, 560,  2, 4);
 insert into Itens values (7, 88, 5066.45,  1, 3);
 insert into Itens values (8, 233, 9383.64,  4, 2);
 insert into Itens values (9, 663, 9322.57,  5, 3);
 commit;

SELECT * 
FROM CLIENTE;

SELECT * 
FROM NOTAFISCAL;

/*RETORNE TODOS OS CLIENTES QUE NUNCA COMPARAM*/
SELECT * 
FROM CLIENTE
LEFT JOIN NOTAFISCAL 
    ON CLIENTE.PKCLI = NOTAFISCAL.FKCLI
WHERE PKNota IS NULL;

SELECT *
FROM CLIENTE
WHERE NOT EXISTS (
    SELECT *
    FROM NOTAFISCAL
    WHERE CLIENTE.PKCLI = NOTAFISCAL.FKCLI
);

/*RETORNE OS CLIENTES E SEUS PEDIDOS FEITOS NO ULTIMO MES*/
SELECT *
FROM CLIENTE
WHERE EXISTS (
	SELECT *
	FROM NOTAFISCAL
	WHERE CLIENTE.PKCLI = NOTAFISCAL.FKCLI
	AND DATA > CURRENT_DATE - INTERVAL '1 MONTH'
);

/**RETORNE OS CLIENTES QUE POSSUEM PEDIDOS COM VALOR INFERIOR A 1000 E COM VALOR SUPERIOR A 10000*/
SELECT * 
FROM CLIENTE
WHERE EXISTS (
	SELECT *
	FROM NOTAFISCAL
	WHERE CLIENTE.PKCLI = NOTAFISCAL.FKCLI
	    AND NotaFiscal.ValorTotal < 1000 
	    OR  NotaFiscal.ValorTotal > 10000
);

/*RETORNE TODOS OS ITENS QUE FAZEM PARTE DO PEDIDO 1234*/

/*RETORNE A LISTA DE ITENS DO DEDIDO1234, CUJO ESTOQUE ESTA MENOR DO QUE 100 ITENS*/