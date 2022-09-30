CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monica', 'Aurora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Carla', 'Werner', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Hans', 'Holzel', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Rino', 'Gaetano', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Franco', 'Battiato', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Rafael', 'Muller', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Sabrina', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Luana', 'Cruz', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 /*1. Escreva uma consulta SQL para buscar “FIRST_NAME” da tabela Worker usando o nome do alias como <WORKER_NAME>. */
 
 SELECT first_name AS WORKER_NAME FROM worker; 
 
 /*2. Escreva uma consulta SQL para buscar “FIRST_NAME” da tabela Worker em maiúsculas. [Dica: use a função UPPER]*/
 
 SELECT UPPER(first_name) WORKER_NAME FROM worker;
 
 /*3. Escreva uma consulta SQL para buscar valores exclusivos de DEPARTMENT da tabela Worker.*/
 
 SELECT DEPARTMENT FROM WORKER;
 
 /*4. Escreva uma consulta SQL para imprimir os três primeiros caracteres de FIRST_NAME da tabela Worker. [Dica: use a função SUBSTRING]*/
 
 SELECT SUBSTRING(FIRST_NAME, 1, 3) FROM WORKER;
 
 /*5. Escreva uma consulta SQL para imprimir o FIRST_NAME da tabela Worker após remover os espaços em branco do lado direito. [Dica: use a função RTRIM]*/
 
 SELECT RTRIM(FIRST_NAME)TRIM_NAME FROM WORKER;
 
 /*6. Escreva uma consulta SQL para imprimir a tabela DEPARTMENT from Worker após remover os espaços em branco do lado esquerdo. [Dica: use a função LTRIM] */
 
 SELECT LTRIM(DEPARTMENT)TRIM_NAME FROM WORKER;
 
 /*7. Escreva uma consulta SQL que busque os valores exclusivos de DEPARTMENT da tabela Worker e imprima seu comprimento. [Dica: use a função LENGHT associada com a função de distinção]*/
 
SELECT LENGTH(DEPARTMENT) LENGHT_NAME FROM WORKER;

/*8. Escreva uma consulta SQL para selecionar o FIRST_NAME da tabela Worker após substituir 'a' por 'A'.*/

SELECT REPLACE(FIRST_NAME, 'a', 'A') FIRST_NAME FROM WORKER;

/*9. Faça uma consulta SQL para selecionar o FIRST_NAME e LAST_NAME da tabela Worker em uma única coluna chamada COMPLETE_NAME. Um caractere de espaço deve separá-los. [Dica: use a função CONCAT]*/

SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS COMPLETE_NAME FROM WORKER;

/*10. Escreva uma consulta SQL para imprimir todos os detalhes do Worker da ordem da tabela Worker por FIRST_NAME ascendente.*/

SELECT * FROM WORKER
ORDER BY FIRST_NAME ASC;

/*11. Escreva uma consulta SQL para imprimir todos os detalhes do Worker da tabela Worker ordenados por FIRST_NAME ascendente e DEPARTMENT descendente na mesma query.*/

SELECT * FROM WORKER
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

/*12. Escreva uma consulta SQL para trazer detalhes de trabalhadores com nome de departamento como “Admin”.*/

SELECT * FROM
WORKER WHERE DEPARTMENT LIKE 'ADMIN';

/*13. Escreva uma consulta SQL para imprimir detalhes dos trabalhadores cujo FIRST_NAME contém 'a'. */

SELECT * FROM
WORKER WHERE FIRST_NAME LIKE '%a%';

/*14. Escreva uma consulta SQL para imprimir detalhes dos trabalhadores cujo FIRST_NAME termina com 'a'.*/

SELECT * FROM
WORKER WHERE FIRST_NAME LIKE '%a';

/*15. Escreva uma consulta SQL para imprimir detalhes dos trabalhadores cujo salário esteja entre 100.000 e 500.000.*/

SELECT * FROM
WORKER WHERE SALARY BETWEEN 100000 AND 500000;

 /*16. Escreva uma consulta SQL para selecionar detalhes dos trabalhadores que ingressaram em fevereiro de 2014.*/
 
 SELECT * FROM
 WORKER WHERE JOINING_DATE LIKE '2014-02-%';
 
 /*17. Escreva uma consulta SQL para buscar a contagem de funcionários que trabalham no departamento 'Admin'*/
 
 SELECT COUNT('ADMIN') FROM
 WORKER;
 
 /*18. Escreva uma consulta SQL para buscar nomes de trabalhadores com salários >= 50.000 e <= 100.000.*/
 
 SELECT FIRST_NAME FROM 
 WORKER WHERE SALARY BETWEEN 50000 AND 100000;
 
 /*19. Escreva uma consulta SQL para buscar o número de trabalhadores para cada departamento em ordem decrescente.*/
 
 SELECT COUNT(DEPARTMENT)DEPARTMENT, DEPARTMENT FROM
 WORKER 
 GROUP BY DEPARTMENT
 ORDER BY DEPARTMENT DESC;
 
 /*20. Escreva uma consulta SQL para imprimir detalhes dos trabalhadores que também são gerentes (managers).*/
 
 SELECT * FROM WORKER
 INNER JOIN TITLE ON TITLE.WORKER_REF_ID = WORKER.WORKER_ID
 WHERE WORKER_TITLE LIKE 'MANAGER';

/*21. Escreva uma consulta SQL para buscar registros duplicados com dados correspondentes em alguns campos de uma tabela.*/

SELECT DEPARTMENT, COUNT(*)FROM WORKER
GROUP BY DEPARTMENT HAVING COUNT(*)>1;

/*22. Escreva uma consulta SQL para mostrar a data e hora atuais [Dica: use a função CURDATE]*/

SELECT CURDATE(), CURTIME();

/*23. Escreva uma consulta SQL para buscar os departamentos que têm menos de cinco pessoas.*/

SELECT DEPARTMENT, COUNT(WORKER_ID)FROM WORKER
GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID)<5;

/*24. Escreva uma consulta SQL para imprimir o nome dos funcionários com o salário mais alto em cada departamento.*/
SELECT FIRST_NAME FROM WORKER
