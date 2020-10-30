DROP DATABASE IF EXISTS marmoraria;
CREATE DATABASE marmoraria -- criando um banco de dados com o nome de marmoraria
DEFAULT CHARACTER SET utf8mb4; -- para permitir as acentuações e caracteres presentes na lingua portuguesa

USE marmoraria; 

CREATE TABLE clientes(
id INT NOT NULL AUTO_INCREMENT, 
nome VARCHAR(50) NOT NULL, -- um nome de até 50 caracteres
sexo enum("M", "F", "I") NOT NULL,
data_de_nascimento DATE, -- 2020-10-29
numero_para_contato VARCHAR(17), -- no formato +55 82 98765-4321 que tem no total 17 caracteres
PRIMARY KEY (id)
);

INSERT INTO clientes VALUES
(DEFAULT, 'dogiberto da silva gomes', 'I', '1984-06-25', '+55 82 98765-4321'),
(DEFAULT, 'cleberio santos vieira', 'M', '1973-06-25', '+55 82 96483-1347'),
(DEFAULT, 'glanderson de renexofedrin thaylmisson', 'M', '1999-12-24', '+55 82 92469-2070'),
(DEFAULT, 'doralgina freitas', 'F', '1935-05-02', '+55 82 93845-1337');

CREATE TABLE material(
id INT NOT NULL AUTO_INCREMENT, -- identificador do produto
nome VARCHAR(26), -- nome do produto com uma string de até 26 caracteres
e_natural BOOLEAN, -- um booleno que representa se o material é natural, caso contrário é artificial
lugar_de_origem VARCHAR(20), -- de onde é extraído ou de onde é produzido o material
preço_metro_quadrado decimal(9,2), -- valor por metro quadrado do material
PRIMARY KEY (id)
);

INSERT INTO material VALUES
(DEFAULT, 'verde ubatuba', FALSE, 'italia, veneza', '330.50'),
(DEFAULT, 'marta rocha', FALSE, 'brasil, ceara', '1500.73'),
(DEFAULT, 'roby fusion', FALSE, 'noruega, oslo', '9800.99'),
(DEFAULT, 'haku', TRUE, 'eua, california', '600.50');

CREATE TABLE vendas(
id int NOT NULL AUTO_INCREMENT,
id_material int,
id_cliente int,
situação enum("E", "A", "F"), -- em espera = e, em andamento = a, finalizado = f
valor_total decimal(18,2),
PRIMARY KEY (id),
FOREIGN KEY (id_cliente) REFERENCES clientes(id), 
FOREIGN KEY (id_material) REFERENCES material(id)
);

INSERT INTO vendas VALUES
(DEFAULT, 2, 1, 'F', '200.23'),
(DEFAULT, '3', 3, 'A', '2000.99'),
(DEFAULT, '1', 4, 'E', '50.20'),
(DEFAULT, '3', 2, 'F', '230000.00'),
(DEFAULT, '4', 1, 'A', '623.51');

SELECT *
FROM clientes
WHERE sexo = "M";

SELECT *, valor_total * 0.9 AS desconto_a_vista
FROM vendas
WHERE valor_total >= 1000.00;

SELECT *
FROM material
WHERE preço_metro_quadrado <= 500;
