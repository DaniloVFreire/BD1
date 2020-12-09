USE hospital;
-- Questão 1
SELECT paciente.*
FROM paciente
INNER JOIN consulta ON consulta.rg = paciente.rg
INNER JOIN doenca ON doenca.coddoenca = consulta.coddoenca
WHERE doenca.nome = "Sarampo";

-- Questão 2
SELECT medico.*
FROM medico
INNER JOIN especialidade ON especialidade.codesp = medico.especialidade
WHERE especialidade.nome = "ortopedia" AND medico.idade > 40;

-- Questão 3
SELECT especialidade.nome AS `Especialidade`, count(medico.crm) AS `Quantidade de médicos`
FROM medico
INNER JOIN especialidade ON especialidade.codesp = medico.especialidade
GROUP BY especialidade.nome;

-- Questão 4
SELECT medico.nome
FROM medico
LEFT JOIN consulta ON consulta.crm = medico.crm
GROUP BY medico.nome
HAVING count(consulta.crm) = 0
;

-- Questão 5
SELECT *
FROM consulta
WHERE crm != 46 AND crm!= 79
;

-- Questão 6
SELECT *
FROM ambulatorio
WHERE andar = 4 AND (numeroA > 10 OR capacidade = 50)
;

-- Questão 7
SELECT medico.nome, consulta.`data`
FROM medico
INNER JOIN consulta ON consulta.crm = medico.crm
ORDER BY nome;

-- Questão 8
SELECT crm, data
FROM consulta
WHERE rg = 22 OR rg = 25;

-- Questão 9
SELECT *
FROM ambulatorio
WHERE NOT((andar = 4 OR andar = 2) AND capacidade > 50);

-- Questão 10
SELECT ambulatorio.numeroA AS `numero da ala`, ambulatorio.capacidade, medico.nome AS `medicos que atende o andar`
FROM ambulatorio
INNER JOIN medico ON ambulatorio.numeroA = medico.numeroA
WHERE andar = 5
;
-- Questão 11
SELECT paciente.nome AS`nome do paciente`, medico.nome AS `nome do medico`, consulta.data AS `data da consulta`
FROM consulta
INNER JOIN paciente ON consulta.rg = paciente.rg
INNER JOIN medico ON consulta.crm = medico.crm;

-- Questão 12
SELECT paciente.nome
FROM consulta
INNER JOIN medico ON medico.crm = consulta.crm
INNER JOIN paciente ON paciente.rg = consulta.rg
INNER JOIN doenca ON doenca.coddoenca = consulta.coddoenca
WHERE doenca.nome = "pneumonia" AND (medico.nome = "maria souza" OR medico.nome = "joão carlos santos");

-- Questão 13

SELECT medico.nome, medico.idade
FROM cidade, medico
WHERE cidade.nome = "florianopolis" AND cidade.codcidade = medico.codcidade
UNION
SELECT funcionario.nome, funcionario.idade
FROM cidade, funcionario
WHERE cidade.nome = "florianopolis" AND funcionario.codcidade = cidade.codcidade
UNION
SELECT paciente.nome, paciente.idade
FROM cidade, paciente
WHERE cidade.nome = "florianopolis" AND paciente.codcidade = cidade.codcidade 
;
-- Questão 14
SELECT funcionario.nome, funcionario.rg
FROM funcionario
LEFT JOIN paciente ON funcionario.rg = paciente.rg
WHERE salario < 5300 AND paciente.rg IS NULL;

-- Questão 15
SELECT ambulatorio.numeroA
FROM ambulatorio
LEFT JOIN medico ON ambulatorio.numeroA = medico.numeroA
WHERE medico.numeroA IS NULL;

-- Questão 16
SELECT funcionario.nome, funcionario.rg
FROM funcionario
LEFT JOIN paciente ON funcionario.rg = paciente.rg
WHERE NOT paciente.rg IS NULL;

-- Questão 17
SELECT funcionario.nome
FROM funcionario
LEFT JOIN consulta ON funcionario.rg = consulta.rg
WHERE consulta.rg IS NULL;

-- Questão 18
SELECT cidade.nome, sum(salario)
FROM cidade
INNER JOIN funcionario ON funcionario.codcidade = cidade.codcidade
GROUP BY cidade.nome
HAVING sum(salario) > 17000;

-- Questão 19
SELECT DISTINCT medico.nome, cidade.nome
FROM cidade
INNER JOIN medico ON medico.codcidade = cidade.codcidade
UNION
SELECT DISTINCT paciente.nome, cidade.nome
FROM cidade
INNER JOIN paciente ON paciente.codcidade = cidade.codcidade
;

-- Questão 20
SELECT especialidade.nome, count(medico.crm)
FROM especialidade
INNER JOIN medico ON especialidade.codesp = medico.especialidade
GROUP BY especialidade.nome;