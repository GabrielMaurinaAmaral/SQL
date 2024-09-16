CREATE DATABASE EXERCICIOS;
USE EXERCICIOS;

/*CRIEANDO AS TABELAS*/
CREATE TABLE Marcas(
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    marca_marca VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE Carros(
    id_carro INT PRIMARY KEY AUTO_INCREMENT,
    modelo_carro VARCHAR(30) NOT NULL,
    placa_carro VARCHAR(30)  NOT NULL UNIQUE,
    id__marca INT
);

CREATE TABLE Cores(
    id_cor INT PRIMARY KEY AUTO_INCREMENT,
    cor_cor VARCHAR(30) UNIQUE
);

CREATE TABLE Clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(30) NOT NULL UNIQUE,
    sexo_cliente ENUM('F', 'M') NOT NULL,
    id__carro INT UNIQUE
);

CREATE TABLE Telefones(
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    tipo_telefone ENUM('RES','COM','CEL') NOT NULL,
    numero_telefone VARCHAR(10) NOT NULL UNIQUE,
    id__cliente INT
);

CREATE TABLE Carro_Cor(
    id__carro INT,
    id__cor INT,
    PRIMARY KEY (id__carro, id__cor)
);

/*CRIANDO AS CONSTRAINTS*/
ALTER TABLE Carros
ADD CONSTRAINT fk_carros_marcas
FOREIGN KEY (id__marca) REFERENCES Marcas(id_marca);

ALTER TABLE Clientes
ADD CONSTRAINT fk_clientes_carros
FOREIGN KEY (id__carro) REFERENCES Carro(id_carro);

ALTER TABLE Telefones 
ADD CONSTRAINT fk_telefones_clientes
FOREIGN KEY (id__cliente) REFERENCES Clientes(id_cliente);

ALTER TABLE Carro_Cor
ADD CONSTRAINT fk_cor
FOREIGN KEY (id__cor) REFERENCES Cores(id_cor);

ALTER TABLE Carro_Cor
ADD CONSTRAINT fk_carro
FOREIGN KEY (id__carro) REFERENCES Carro(id_carro);

/* INSIRA 5 MARCAS */
INSERT INTO Marcas VALUES(NULL, 'FORD');
INSERT INTO Marcas VALUES(NULL, 'HONDA');
INSERT INTO Marcas VALUES (NULL, 'TOYOTA');
INSERT INTO Marcas VALUES (NULL, 'CHEVROLET');
INSERT INTO Marcas VALUES (NULL, 'NISSAN');
INSERT INTO Marcas VALUES (NULL, 'VOLKSWAGEN');
INSERT INTO Marcas VALUES (NULL, 'BMW');
INSERT INTO Marcas VALUES (NULL, 'AUDI');
INSERT INTO Marcas VALUES (NULL, 'HYUNDAI');

/* INSERINDO 10 CARROS */
INSERT INTO Carros VALUES(NULL, 'Gol', '13GY-14J1', 6);
INSERT INTO Carros VALUES (NULL, 'Civic 2020', 'ABC1234', 2);
INSERT INTO Carros VALUES (NULL, 'Corolla 2019', 'XYZ5678', 3);
INSERT INTO Carros VALUES (NULL, 'Cruze 2018', 'MNO4321', 4);
INSERT INTO Carros VALUES (NULL, 'Sentra 2022', 'PQR9876', 5);
INSERT INTO Carros VALUES (NULL, 'Jetta 2021', 'JKL3456', 6);
INSERT INTO Carros VALUES (NULL, 'Focus 2017', 'DEF7890', 1);
INSERT INTO Carros VALUES (NULL, 'Fusion 2020', 'GHI2345', 1);
INSERT INTO Carros VALUES (NULL, 'A3 2019', 'UVW6789', 7);
INSERT INTO Carros VALUES (NULL, 'Elantra 2022', 'STU0123', 8);
INSERT INTO Carros VALUES (NULL, 'i30 2021', 'QWE4567', 8);

/* INSIRA 10 CORES */
INSERT INTO Cores VALUES(NULL, 'AMARELO');
INSERT INTO Cores VALUES(NULL, 'AZUL');
INSERT INTO Cores VALUES(NULL, 'VERMELHO');
INSERT INTO Cores VALUES(NULL, 'VERDE');
INSERT INTO Cores VALUES(NULL, 'BRANCO');
INSERT INTO Cores VALUES(NULL, 'PRETO');
INSERT INTO Cores VALUES(NULL, 'CINZA');
INSERT INTO Cores VALUES(NULL, 'PRATA');
INSERT INTO Cores VALUES(NULL, 'ROSA');
INSERT INTO Cores VALUES(NULL, 'LARANJA');

/* INSERA 10 CLIENTES */
INSERT INTO Clientes VALUES(NULL, 'Gabriel Maurina', 'M', 1);
INSERT INTO Clientes VALUES(NULL, 'Ana Silva', 'F', 2);
INSERT INTO Clientes VALUES(NULL, 'Carlos Souza', 'M', 3);
INSERT INTO Clientes VALUES(NULL, 'Fernanda Oliveira', 'F', 4);
INSERT INTO Clientes VALUES(NULL, 'Roberto Santos', 'M', 5);
INSERT INTO Clientes VALUES(NULL, 'Mariana Lima', 'F', 6);
INSERT INTO Clientes VALUES(NULL, 'Lucas Pereira', 'M', 7);
INSERT INTO Clientes VALUES(NULL, 'Juliana Martins', 'F', 8);
INSERT INTO Clientes VALUES(NULL, 'Ricardo Almeida', 'M', 9);
INSERT INTO Clientes VALUES(NULL, 'Amanda Costa', 'F', 10);

/* INSIRA 10 TELEFONES */
INSERT INTO Telefones VALUES(NULL, 'COM', '99873291', 1);
INSERT INTO Telefones VALUES(NULL, 'CEL', '99328176', 2);
INSERT INTO Telefones VALUES(NULL, 'RES', '99242120', 3);
INSERT INTO Telefones VALUES(NULL, 'CEL', '99763145', 4);
INSERT INTO Telefones VALUES(NULL, 'RES', '99852367', 5);
INSERT INTO Telefones VALUES(NULL, 'COM', '99463218', 6);
INSERT INTO Telefones VALUES(NULL, 'CEL', '99517623', 7);
INSERT INTO Telefones VALUES(NULL, 'RES', '99123456', 8);
INSERT INTO Telefones VALUES(NULL, 'COM', '99654321', 9);
INSERT INTO Telefones VALUES(NULL, 'CEL', '99987654', 10);
INSERT INTO Telefones VALUES(NULL, 'CEL', '99887766', 3);
INSERT INTO Telefones VALUES(NULL, 'RES', '99112233', 4);
INSERT INTO Telefones VALUES(NULL, 'COM', '99665544', 6);
INSERT INTO Telefones VALUES(NULL, 'CEL', '99334455', 7);
INSERT INTO Telefones VALUES(NULL, 'RES', '99221100', 9);
INSERT INTO Telefones VALUES(NULL, 'COM', '99446688', 10);

/* INSERIR CORES EM UMA CORRO, POR EXEMPLO*/
INSERT INTO Carro_Cor VALUES(1, 2);
INSERT INTO Carro_Cor VALUES(1, 3);
INSERT INTO Carro_Cor VALUES(1, 5);
INSERT INTO Carro_Cor VALUES(2, 8);
INSERT INTO Carro_Cor VALUES(2, 1);
INSERT INTO Carro_Cor VALUES(3, 10);
INSERT INTO Carro_Cor VALUES(4, 4);
INSERT INTO Carro_Cor VALUES(4, 7);
INSERT INTO Carro_Cor VALUES(4, 9);
INSERT INTO Carro_Cor VALUES(5, 2);
INSERT INTO Carro_Cor VALUES(5, 6);
INSERT INTO Carro_Cor VALUES(6, 3);
INSERT INTO Carro_Cor VALUES(6, 8);
INSERT INTO Carro_Cor VALUES(7, 1);
INSERT INTO Carro_Cor VALUES(7, 5);
INSERT INTO Carro_Cor VALUES(8, 4);

/* VER TODOS OS DADOS */
SELECT * FROM Marcas;
SELECT * FROM Carros;
SELECT * FROM Clientes;
SELECT * FROM Cores;
SELECT * FROM Telefones;
SELECT * FROM Carro_Cor;
