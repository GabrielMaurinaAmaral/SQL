USE TRABALHO

DROP TABLE IF EXISTS Serie;
DROP TABLE IF EXISTS RotinaExercicio;
DROP TABLE IF EXISTS Exercicio;
DROP TABLE IF EXISTS Rotina;
DROP TABLE IF EXISTS Medida;
DROP TABLE IF EXISTS Usuario;

DROP PROCEDURE IF EXISTS InsertUsuarios;
DROP PROCEDURE IF EXISTS InsertMedidas;
DROP PROCEDURE IF EXISTS InsertRotinas;
DROP PROCEDURE IF EXISTS InsertRotinaExercicio;
DROP PROCEDURE IF EXISTS InsertSeriesForExercise;

CREATE TABLE Usuario (
    ID_user INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL UNIQUE,
    senha VARCHAR(45) NOT NULL
);
DESC Usuario;

CREATE TABLE Medida (
    ID_medida INT PRIMARY KEY AUTO_INCREMENT,
    altura FLOAT NULL,
    peso FLOAT NULL,
    sexo CHAR(1) CHECK (
      sexo IN ('M', 'F') OR sexo IS NULL),
    FK_user INT UNIQUE NOT NULL,
    FOREIGN KEY (FK_user) 
    REFERENCES Usuario(ID_user)
);
DESC Medida;

CREATE TABLE Rotina (
    ID_rotina INT PRIMARY KEY AUTO_INCREMENT,
    nome_rotina VARCHAR(100) NOT NULL,
    descricao_rotina VARCHAR(100) NULL,
    FK_user INT NOT NULL,
    FOREIGN KEY (FK_user) 
    REFERENCES Usuario(ID_user)
);
DESC Rotina;

CREATE TABLE Exercicio (
    ID_exercicio  INT PRIMARY KEY AUTO_INCREMENT,
    nome_exercicio VARCHAR(45) NOT NULL,
    equipamento_exercicio VARCHAR(45) NOT NULL,
    grupo_muscular_principal VARCHAR(45) NOT NULL,
    grupo_muscular_secundario VARCHAR(45) NULL
);
DESC Exercicio;

CREATE TABLE RotinaExercicio (
    ID_rotina_exercicio INT PRIMARY KEY AUTO_INCREMENT,
    tempo_descanso TIME NOT NULL,
    FK_rotina INT NOT NULL,
    FK_exercicio INT NOT NULL,
    FOREIGN KEY (FK_rotina) 
    REFERENCES Rotina(ID_rotina),
    FOREIGN KEY (FK_exercicio) 
    REFERENCES Exercicio(ID_exercicio)
);
DESC RotinaExercicio;

CREATE TABLE Serie (
    ID_serie INT PRIMARY KEY AUTO_INCREMENT,
    tipo_serie CHAR(1) CHECK (
      tipo_serie IN ('N', 'W', 'D', 'F') OR tipo_serie IS NULL),
    kg FLOAT NOT NULL,
    repeticoes INT NOT NULL,
    FK_rotina_exercicio INT NOT NULL,
    FOREIGN KEY (FK_rotina_exercicio) 
    REFERENCES RotinaExercicio(ID_rotina_exercicio)
);
DESC Serie;

DELIMITER $$
CREATE PROCEDURE InsertUsuarios()
BEGIN
  DECLARE r INT DEFAULT 0;
  DECLARE nome VARCHAR(20);
  DECLARE sobrenome VARCHAR(20);
  DECLARE email VARCHAR(45);
  DECLARE senha VARCHAR(45);

  WHILE r < 1000 DO
    SET nome = ELT(FLOOR(1 + (RAND() * 30)), 'Daniele', 'Debora', 'Mattia', 'Jake', 'Amy', 'Henry', 'Neil', 'Tim', 'John', 'George', 'Peter', 'Claus', 'Lili', 'Lara', 'Jacob', 'Sophia', 'Liam', 'Noah', 'Olivia', 'Emma', 'Ava', 'Isabella', 'Mia', 'Charlotte', 'Amelia', 'Harper', 'Evelyn', 'Abigail', 'Ella');
    SET sobrenome = ELT(FLOOR(1 + (RAND() * 30)), 'Rossi', 'Verdi', 'Gialli', 'Caponi', 'Gallini', 'Gatti', 'Ford', 'Daniel', 'Harrison', 'Macdonald', 'Nielson', 'Watson', 'Philips', 'Morison', 'White', 'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Martinez', 'Lee', 'Perez', 'Clark', 'Lewis', 'Robinson', 'Walker', 'Young');

    IF nome IS NOT NULL AND sobrenome IS NOT NULL THEN
      SET email = CONCAT(nome, '.', sobrenome, '.', FLOOR(1 + (RAND() * 100)), '@mail.com');
      SET senha = CONCAT('@', FLOOR(1000 + (RAND() * 9000)), '#', SUBSTR(MD5(RAND()), 1, 6));

      INSERT INTO Usuario (nome, email, senha) VALUES (CONCAT(nome, ' ', sobrenome), email, senha);
      
      SET r = r + 1;
    END IF;
  END WHILE;
END$$
DELIMITER ;

CALL InsertUsuarios();

DELIMITER $$
CREATE PROCEDURE InsertMedidas()
BEGIN
  DECLARE r INT DEFAULT 1;
  DECLARE max_users INT;
  DECLARE altura FLOAT;
  DECLARE peso FLOAT;
  DECLARE sexo CHAR(1);

  -- Obter o número máximo de usuários
  SELECT COUNT(*) INTO max_users FROM Usuario;

  WHILE r <= max_users DO
    SET sexo = ELT(FLOOR(1 + (RAND() * 3)), 'M', 'F', NULL);  -- Sexo M, F ou NULL

    -- Gerar altura e peso baseados no sexo
    IF sexo = 'M' THEN
      SET altura = ROUND(1.75 + (RAND() * 0.20 - 0.20), 2);  -- Média 1.75m, desvio padrão 0.10m
      SET peso = ROUND(78 + (RAND() * 24 - 20), 2);          -- Média 78kg, desvio padrão 12kg
    ELSEIF sexo = 'F' THEN
      SET altura = ROUND(1.62 + (RAND() * 0.18 - 0.10), 2);  -- Média 1.62m, desvio padrão 0.09m
      SET peso = ROUND(65 + (RAND() * 20 - 20), 2);          -- Média 65kg, desvio padrão 10kg
    ELSE
      SET altura = ROUND(1.68 + (RAND() * 0.30 - 0.15), 2);  -- Média 1.68m, desvio padrão maior
      SET peso = ROUND(72 + (RAND() * 30 - 15), 2);          -- Média 72kg, desvio padrão maior
    END IF;

    -- Verifique se o ID do usuário existe
    IF EXISTS (SELECT 1 FROM Usuario WHERE ID_user = r) THEN
      INSERT INTO Medida (altura, peso, sexo, FK_user) VALUES (altura, peso, sexo, r);
    END IF;

    SET r = r + 1;
  END WHILE;
END$$
DELIMITER ;

CALL InsertMedidas();


DELIMITER $$
CREATE PROCEDURE InsertRotinas()
BEGIN
  DECLARE r INT DEFAULT 1;
  DECLARE max_users INT;
  DECLARE num_rotinas INT;
  DECLARE randomPart INT;
  DECLARE parte_corpo1 VARCHAR(100);
  DECLARE parte_corpo2 VARCHAR(100);
  DECLARE nome_treino VARCHAR(100);

  SELECT COUNT(*) INTO max_users FROM Usuario;

  WHILE r <= max_users DO
    SET num_rotinas = FLOOR(2 + RAND() * (6 - 2 + 1)); -- Random number between 2 and 6

    WHILE num_rotinas > 0 DO
      -- Generate a random number for selecting the body part
      SET randomPart = FLOOR(1 + RAND() * 7); -- Random number between 1 and 7

      -- Use CASE to simulate array selection for the first body part
      SET parte_corpo1 = CASE randomPart
        WHEN 1 THEN 'Ombro'
        WHEN 2 THEN 'Bíceps'
        WHEN 3 THEN 'Tríceps'
        WHEN 4 THEN 'Peito'
        WHEN 5 THEN 'Costas'
        WHEN 6 THEN 'Perna'
        WHEN 7 THEN 'Abdômen'
      END;

      -- Decide if adding a second body part
      IF RAND() < 0.5 THEN
        SET nome_treino = CONCAT('Treino de ', parte_corpo1);
      ELSE
        -- Ensure the second part is different
        REPEAT
          SET randomPart = FLOOR(1 + RAND() * 7); -- Random number between 1 and 7
          SET parte_corpo2 = CASE randomPart
            WHEN 1 THEN 'Ombro'
            WHEN 2 THEN 'Bíceps'
            WHEN 3 THEN 'Tríceps'
            WHEN 4 THEN 'Peito'
            WHEN 5 THEN 'Costas'
            WHEN 6 THEN 'Perna'
            WHEN 7 THEN 'Abdômen'
          END;
        UNTIL parte_corpo1 <> parte_corpo2 END REPEAT;

        SET nome_treino = CONCAT('Treino de ', parte_corpo1, ' e ', parte_corpo2);
      END IF;

      -- Insert the routine into the Rotina table
      INSERT INTO Rotina(nome_rotina, FK_user) VALUES (nome_treino, r);

      SET num_rotinas = num_rotinas - 1;
    END WHILE;

    SET r = r + 1;
  END WHILE;
END$$
DELIMITER ;

CALL InsertRotinas();

INSERT INTO Exercicio (
  nome_exercicio, equipamento_exercicio, grupo_muscular_principal, grupo_muscular_secundario) 
VALUES
('Supino', 'Banco', 'Peito', 'Tríceps'),
('Rosca Direta', 'Barra', 'Bíceps', NULL),
('Agachamento', 'Barra', 'Pernas', 'Glúteos'),
('Puxada Frontal', 'Máquina', 'Costas', 'Bíceps'),
('Desenvolvimento', 'Halteres', 'Ombros', NULL),
('Leg Press', 'Máquina', 'Pernas', 'Glúteos'),
('Cadeira Extensora', 'Máquina', 'Quadríceps', NULL),
('Cadeira Flexora', 'Máquina', 'Posterior de Coxa', NULL),
('Crucifixo', 'Banco', 'Peito', NULL),
('Elevação Lateral', 'Halteres', 'Ombros', NULL),
('Remada Curvada', 'Barra', 'Costas', 'Bíceps'),
('Rosca Concentrada', 'Halteres', 'Bíceps', NULL),
('Tríceps Pulley', 'Máquina', 'Tríceps', NULL),
('Flexão de Braço', 'Corpo Livre', 'Peito', 'Tríceps'),
('Abdominal', 'Colchonete', 'Abdômen', NULL),
('Elevação de Quadril', 'Colchonete', 'Glúteos', 'Abdômen'),
('Stiff', 'Barra', 'Posterior de Coxa', 'Glúteos'),
('Remada Alta', 'Barra', 'Ombros', 'Trapézio'),
('Rosca Scott', 'Máquina', 'Bíceps', NULL),
('Tríceps Francês', 'Halteres', 'Tríceps', NULL),
('Flexão de Punho', 'Barra', 'Antebraço', NULL),
('Elevação de Panturrilha', 'Máquina', 'Panturrilhas', NULL),
('Abdução de Quadril', 'Máquina', 'Glúteos', NULL),
('Addução de Quadril', 'Máquina', 'Parte Interna da Coxa', NULL),
('Crucifixo Invertido', 'Máquina', 'Ombros', 'Costas'),
('Remada Cavalinho', 'Máquina', 'Costas', 'Bíceps'),
('Desenvolvimento Arnold', 'Halteres', 'Ombros', 'Tríceps'),
('Flexão de Braço Diamante', 'Corpo Livre', 'Peito', 'Tríceps'),
('Ponte', 'Colchonete', 'Glúteos', 'Lombar'),
('Afundo', 'Halteres', 'Pernas', 'Glúteos'),
('Kickback', 'Halteres', 'Tríceps', NULL),
('Remada Unilateral', 'Halteres', 'Costas', 'Bíceps'),
('Prancha', 'Corpo Livre', 'Abdômen', 'Costas'),
('Supino Inclinado', 'Banco', 'Peito', 'Ombros'),
('Pullover', 'Halteres', 'Peito', 'Costas'),
('Rosca Martelo', 'Halteres', 'Bíceps', 'Antebraço'),
('Desenvolvimento Militar', 'Barra', 'Ombros', 'Tríceps'),
('Stiff Unilateral', 'Halteres', 'Posterior de Coxa', 'Glúteos'),
('Elevação Frontal', 'Halteres', 'Ombros', NULL),
('Remada Alta com Halteres', 'Halteres', 'Ombros', 'Trapézio');

DELIMITER $$
CREATE PROCEDURE InsertRotinaExercicio()
BEGIN
  DECLARE r INT DEFAULT 1;
  DECLARE max_rotinas INT;
  DECLARE num_exercicios INT;
  DECLARE random_exercicio INT;
  DECLARE random_descanso TIME;
  DECLARE exercicio_ja_usado BOOLEAN;

  SELECT COUNT(*) INTO max_rotinas FROM Rotina;

  -- Criar tabela temporária para armazenar IDs de exercícios usados
  CREATE TEMPORARY TABLE IF NOT EXISTS TempExerciciosUsados (
    id_exercicio INT
  );

  WHILE r <= max_rotinas DO
    SET num_exercicios = FLOOR(3 + RAND() * (7 - 3 + 1)); -- Random number between 3 and 7

    WHILE num_exercicios > 0 DO
      SET exercicio_ja_usado = TRUE;

      WHILE exercicio_ja_usado = TRUE DO
        SET random_exercicio = FLOOR(1 + RAND() * (SELECT COUNT(*) FROM Exercicio)); -- Select a random exercise ID

        -- Verificar se o exercício já foi usado
        SELECT EXISTS(SELECT 1 FROM TempExerciciosUsados WHERE id_exercicio = random_exercicio) INTO exercicio_ja_usado;

        IF exercicio_ja_usado = FALSE THEN
          -- Generate random rest time in multiples of 15 seconds
          SET random_descanso = SEC_TO_TIME(15 * FLOOR(1 + RAND() * 12)); -- Random rest time between 15 seconds and 3 minutes

          -- Insert the RotinaExercicio entry
          INSERT INTO RotinaExercicio (tempo_descanso, FK_rotina, FK_exercicio)
          VALUES (random_descanso, r, random_exercicio);

          -- Adicionar o ID do exercício à tabela temporária
          INSERT INTO TempExerciciosUsados (id_exercicio) VALUES (random_exercicio);

          SET num_exercicios = num_exercicios - 1;
        END IF;
      END WHILE;
    END WHILE;

    -- Limpar a tabela temporária para a próxima rotina
    TRUNCATE TABLE TempExerciciosUsados;

    SET r = r + 1;
  END WHILE;

  -- Remover a tabela temporária no final
  DROP TEMPORARY TABLE IF EXISTS TempExerciciosUsados;
END$$
DELIMITER ;

Call InsertRotinaExercicio();

DELIMITER $$
CREATE PROCEDURE InsertSeriesForExercise()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE rotinaExercicioID INT;
    DECLARE numSeries INT; -- Corrigido para ser uma variável local
    DECLARE kg FLOAT; -- Corrigido para ser uma variável local
    DECLARE repeticoes INT; -- Corrigido para ser uma variável local
    DECLARE tipo_serie CHAR(1); -- Corrigido para ser uma variável local
    DECLARE cur CURSOR FOR SELECT ID_rotina_exercicio FROM RotinaExercicio;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO rotinaExercicioID;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Gera um número aleatório de séries entre 1 e 5
        SET numSeries = FLOOR(1 + RAND() * 5);

        WHILE numSeries > 0 DO
            -- Gera um valor aleatório para kg entre 1 e 100
            SET kg = FLOOR(1 + RAND() * 100);
            -- Gera um valor aleatório para repetições entre 2 e 20
            SET repeticoes = FLOOR(2 + RAND() * 19);
            -- Gera um tipo de série aleatório
            SET tipo_serie = ELT(FLOOR(1 + RAND() * 4), 'N', 'W', 'D', 'F');

            -- Insere a série na tabela
            INSERT INTO Serie(tipo_serie, kg, repeticoes, FK_rotina_exercicio) 
            VALUES (tipo_serie, kg, repeticoes, rotinaExercicioID);

            SET numSeries = numSeries - 1;
        END WHILE;
    END LOOP;

    CLOSE cur;
END$$
DELIMITER ;

CALL InsertSeriesForExercise();


SELECT * FROM Usuario LIMIT 10;
SELECT * FROM Medida LIMIT 10;
SELECT * FROM Rotina LIMIT 10;
SELECT * FROM Exercicio;
SELECT * FROM RotinaExercicio LIMIT 10;
SELECT * FROM Serie LIMIT 10;

SELECT * FROM Usuario LIMIT 1;

SELECT Usuario.nome, Medida.altura, Medida.peso, Medida.sexo
FROM Usuario
JOIN Medida ON Usuario.ID_user = Medida.FK_user
WHERE Usuario.ID_user = 1;

SELECT Usuario.nome, Rotina.nome_rotina
FROM Usuario
JOIN Rotina ON Usuario.ID_user = Rotina.FK_user
WHERE Usuario.ID_user = 1
GROUP BY Rotina.nome_rotina, Usuario.nome;

SELECT Rotina.nome_rotina, Exercicio.nome_exercicio, Exercicio.grupo_muscular_principal
FROM Rotina
JOIN RotinaExercicio ON Rotina.ID_rotina = RotinaExercicio.FK_rotina
JOIN Exercicio ON RotinaExercicio.FK_exercicio = Exercicio.ID_exercicio
WHERE Rotina.FK_user = 1 AND Rotina.nome_rotina = 'Treino de Abdômen e Bíceps';

SELECT
  Exercicio.nome_exercicio,
  RotinaExercicio.series
FROM Rotina
JOIN RotinaExercicio ON Rotina.ID_rotina = RotinaExercicio.FK_rotina
JOIN Exercicio ON RotinaExercicio.FK_exercicio = Exercicio.ID_exercicio
WHERE Rotina.FK_user = 1 AND Rotina.nome_rotina = 'Treino de Abdômen e Bíceps'
ORDER BY RotinaExercicio.ordem ASC
LIMIT 1;


Select * from RotinaExercicio
Inner Join Serie on RotinaExercicio.ID_rotina_exercicio = Serie.FK_rotina_exercicio
Where RotinaExercicio.ID_rotina_exercicio = 1;

SELECT 
  Usuario.nome AS 'Nome do Usuário', 
  Rotina.nome_rotina, 
  Exercicio.nome_exercicio, 
  Exercicio.equipamento_exercicio, 
  RotinaExercicio.tempo_descanso
FROM RotinaExercicio
JOIN Rotina ON RotinaExercicio.FK_rotina = Rotina.ID_rotina
JOIN Exercicio ON RotinaExercicio.FK_exercicio = Exercicio.ID_exercicio
JOIN Usuario ON Rotina.FK_user = Usuario.ID_user
WHERE Usuario.ID_user = 1 AND Rotina.ID_rotina = (
  SELECT ID_rotina 
  FROM Rotina 
  WHERE FK_user = 1 
  ORDER BY ID_rotina 
  LIMIT 1
); 
/*quantidade de usuarios*/
SELECT COUNT(*) AS 'Quantidade de Usuários' FROM Usuario;
/*mdia de rotinas que os usuarios tem*/
SELECT AVG(ContagemRotinas) AS MediaRotinasPorUsuario
FROM (
  SELECT COUNT(*) AS ContagemRotinas
  FROM Rotina
  GROUP BY FK_user
) AS Contagem;

USE TRABALHO;

SELECT e.nome_exercicio, COUNT(re.FK_exercicio) AS frequencia
FROM RotinaExercicio re
JOIN Exercicio e ON re.FK_exercicio = e.ID_exercicio
GROUP BY e.nome_exercicio
ORDER BY frequencia DESC
LIMIT 5;

SELECT
  u.nome AS NomeUsuario,
  AVG(s.kg) AS MediaKg,
  MIN(s.kg) AS MinimoKg,
  MAX(s.kg) AS MaximoKg
FROM
  RotinaExercicio re
JOIN
  Exercicio e ON re.FK_exercicio = e.ID_exercicio
JOIN
  Rotina r ON re.FK_rotina = r.ID_rotina
JOIN
  Usuario u ON r.FK_user = u.ID_user
JOIN
  Serie s ON re.ID_rotina_exercicio = s.FK_rotina_exercicio
WHERE
  e.nome_exercicio = 'Remada Alta'
GROUP BY
  u.ID_user, u.nome;

USE TRABALHO;

SELECT
  AVG(s.kg) AS MediaKg,
  MIN(s.kg) AS MinimoKg,
  MAX(s.kg) AS MaximoKg
FROM
  RotinaExercicio re
JOIN
  Exercicio e ON re.FK_exercicio = e.ID_exercicio
JOIN
  Serie s ON re.ID_rotina_exercicio = s.FK_rotina_exercicio
WHERE
  e.nome_exercicio = 'Remada Alta'
LIMIT 10;

SELECT
  u.nome AS Usuario_Maior_Media,
  AVG(s.kg) AS MediaKg,
  MIN(s.kg) AS MinimoKg,
  MAX(s.kg) AS MaximoKg
FROM
  RotinaExercicio re
JOIN
  Exercicio e ON re.FK_exercicio = e.ID_exercicio
JOIN
  Rotina r ON re.FK_rotina = r.ID_rotina
JOIN
  Usuario u ON r.FK_user = u.ID_user
JOIN
  Serie s ON re.ID_rotina_exercicio = s.FK_rotina_exercicio
WHERE
  e.nome_exercicio = 'Remada Alta'
GROUP BY
  u.ID_user, u.nome
ORDER BY
  MediaKg DESC
LIMIT 10;


USE TRABALHO;

SELECT
  u.nome AS Usuario_Pior_Media,
  AVG(s.kg) AS MediaKg,
  MIN(s.kg) AS MinimoKg,
  MAX(s.kg) AS MaximoKg
FROM
  RotinaExercicio re
JOIN
  Exercicio e ON re.FK_exercicio = e.ID_exercicio
JOIN
  Rotina r ON re.FK_rotina = r.ID_rotina
JOIN
  Usuario u ON r.FK_user = u.ID_user
JOIN
  Serie s ON re.ID_rotina_exercicio = s.FK_rotina_exercicio
WHERE
  e.nome_exercicio = 'Remada Alta'
GROUP BY
  u.ID_user, u.nome
ORDER BY
  MediaKg ASC
LIMIT 10;

-- Passo 1: Obter o ID da Rotina e o ID do Primeiro Exercício da Rotina 'Treino de Abdômen e Bíceps'
SELECT 
  r.ID_rotina, 
  e.ID_exercicio
FROM 
  Rotina r
JOIN 
  RotinaExercicio re ON r.ID_rotina = re.FK_rotina
JOIN 
  Exercicio e ON re.FK_exercicio = e.ID_exercicio
WHERE 
  r.FK_user = 1 
  AND r.nome_rotina = 'Treino de Abdômen e Bíceps'
ORDER BY 
  re.ID_rotina_exercicio
LIMIT 1;

-- Passo 2: Selecionar as Séries do Primeiro Exercício da Rotina 'Treino de Abdômen e Bíceps' para o usuário com ID 1
-- Substitua 'id_rotina' e 'id_exercicio' pelos valores obtidos no Passo 1
SELECT 
  s.tipo_serie,
  s.kg,
  s.repeticoes
FROM 
  Serie s
JOIN 
  RotinaExercicio re ON s.FK_rotina_exercicio = re.ID_rotina_exercicio
WHERE 
  re.FK_rotina = (SELECT r.ID_rotina FROM Rotina r WHERE r.FK_user = 1 AND r.nome_rotina = 'Treino de Abdômen e Bíceps' ORDER BY r.ID_rotina LIMIT 1)
ORDER BY 
  s.ID_serie
LIMIT 3;

SELECT 
  e.nome_exercicio as Exercícios_Maior_Frequencia,
  COUNT(*) AS frequencia  
FROM 
  Exercicio e
JOIN 
  RotinaExercicio re ON e.ID_exercicio = re.FK_exercicio
JOIN 
  Serie s ON re.ID_rotina_exercicio = s.FK_rotina_exercicio
JOIN 
  Rotina r ON re.FK_rotina = r.ID_rotina
WHERE 
  r.FK_user = 1
GROUP BY 
  e.nome_exercicio
ORDER BY 
  frequencia DESC
LIMIT 3;