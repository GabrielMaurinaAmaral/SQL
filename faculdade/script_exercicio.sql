Rode o script para a tabela Funcionário e implemente as seguintes consultas em SQL:

1)	Selecione todos os funcionários e todos os seus dados, com e sem *. Deu alguma diferença de tempo?
2) 	Tente selecionar o nome do funcionário junto com a média salarial. O que acontece e porque? 
3)	Implemente consultas para as quais as tuplas duplicadas são removidas 
4)	Seria de interesse manter as tuplas duplicadas? Quando? Pq? 
5)	Uma tupla em SQL corresponde a um conjunto de dados ou a um elemento de um conjunto de dados? Quem é elemento e quem é conjunto? Isso faz toda a diferença na hora de implementar operações sobre elemento ou sobre conjunto (UNION, NOT IN, etc.).
 
Retorne:
6)	O nome de todos os funcionários e seus respectivos salários;
7)	O maior, o menor  e a média dos salários de todos os funcionários (na mesma consulta);
8)	O maior, o menor  e a média dos salários de todos os funcionários H e depois repita para as M. Daria para apresentar os dois na mesma consulta? 
9)	O a média salarial de todos os funcionários que tenham Teixeira (ou varie conforme a base) no nome;
10)	 Um atributo MedSal com a média dos salários entre todos os funcionários, com arredondamento de 2 casas;
11)	 Um atributo SomaSal com a soma de todos os salários;
12)	 O salário do funcionário com o código = y (escolha conforma a base, aplique intervalos, OR, etc.); 
13)	 O nome dos funcionários que moram em Santa Catarina (com tratamento adequado de string);
14)	 Os funcionários com o código 1, 2 e 6 apresentados na ordem alfabética decrescente;
15)	 Um atributo QtdFuncMaster com a quantidade de funcionários que ganham entre 1000 e 2000 (faça com e sem o comando de intervalo);
16)	 Um atributo MedIdade com a média entre as idades dos funcionários;
17)	 Todos os funcionários cujo nome comece com a letra M e não terminem com Teixeira. Varie conforme a base. 
18)	 Atualize a tabela funcionários. Por merecimento, aumente em 10% o salário de todos os funcionários que contenham Marcelo (ou varie) em qualquer parte do nome. Não esqueça que não deve importar a forma como o termo Marcelo está escrito. 
19)	 Estenda a consulta anterior. Aumente em mais 10% o salário dos Marcelos (ou varie), caso o valor total, incluindo aquilo que vc já aumentou na consulta anterior, ainda não esteja na faixa entre 10.000 e 20.000.  
20)	 Retorne o atributo gênero e a quantidade de funcionários de cada gênero;
21)	 Retorne o campo gênero e a quantidade de funcionários de cada gênero. Restrinja a consulta aos funcionários do Paraná;
22)	 Retorne o campo gênero e a quantidade de funcionários de cada gênero. Restrinja a consulta aos funcionários do Paraná. Só mostre os dados dos casos em que a quantidade de funcionários seja maior que 10;
23)	 Retorne a média salarial, por estado;
24)	 Retorne a média salarial, por estado e por gênero;
25)	 Retorne a média salarial, por estado e por gênero, mas apenas para os funcionários com idade menor que 30 anos.
26)	 Retorne a média salarial, por estado e por gênero, mas apenas para os funcionários com idade menor que 30 anos e caso a média salarial seja menor que 10.000.
27)	 Adicione atributos na tabela Funcionário
28)	 Adicione atributos na tabela Funcionário utilizando o conceito de domain;
29)	 Adicione mais um atributo PK na tabela Funcionário. Faça isso na criação da tabela e via alter table;
30)	 Altere o domínio de algum atributo na tabela Funcionário 
31)	 Altere o nome de atributos na tabela Funcionário
32)	 Adicione um atributo date para armazenar a data da última progressão de cada funcionário na carreira. Após, execute as seguintes extrações para o funcionário Bilbo Sonaro: Ano de ingresso; mês dia, dia do ano, dia da semana. Quais outras extruturas podem ser extraídas?
33)	 Para cada extração da consulta anterior, concatene junto ao dado extraído um caracter ‘-‘ acompanhado do nome do funcionário. 


