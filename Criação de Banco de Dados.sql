CREATE DATABASE Empresa;

USE Empresa;

-- Criando a tabela de Departamentos 
CREATE TABLE Departamentos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL 
    );

-- Criando a tabela de Cargos 
CREATE TABLE Cargos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    nivel VARCHAR(50) NOT NULL 
    );
    
    -- Criando a tabela de Funcionários 
CREATE TABLE Funcionarios ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    data_nascimento DATE NOT NULL, 
    salario DECIMAL(10,2) NOT NULL, 
    departamento_id INT NOT NULL, 
    cargo_id INT NOT NULL, 
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id), 
    FOREIGN KEY (cargo_id) REFERENCES Cargos(id) 
);
-- Inserindo dados na tabela Departamentos 
INSERT INTO Departamentos (nome) VALUES ('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

-- Inserindo dados na tabela Cargos 
INSERT INTO Cargos (nome, nivel) VALUES 
('Analista', 'Pleno'), 
('Gerente', 'Sênior'), 
('Assistente', 'Júnior'), 
('Coordenador', 'Sênior'), 
('Desenvolvedor', 'Pleno');

-- Inserindo dados na tabela Funcionarios 
INSERT INTO Funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id) VALUES 
('Ana Silva', '1985-06-15', 5500.00, 1, 5), 
('Carlos Santos', '1990-03-22', 4800.00, 2, 1), 
('Bruna Costa', '1987-12-10', 6000.00, 3, 2), 
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5), 
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2), 
('Helena Martins', '1983-11-17', 5300.00, 1, 4), 
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1), 
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2), 
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);
 
-- Questão 1 - Encontre o maior salario:
-- 7000
SELECT MAX(salario) FROM Funcionarios;

-- Questão 2 - Encontre o menor salario:
-- 4500
SELECT MIN(salario) FROM Funcionarios;

-- Questão 3 - Qual a quantidade de Funcionarios?
-- 10
SELECT count(nome) FROM Funcionarios;

-- Questão 4 - Filtre os funcionarios nascidos a partir de 1990:
-- 1985-06-15
-- 1990-03-22
-- 1987-12-10
-- 1992-08-05
-- 1995-09-30
-- 1980-01-25
-- 1983-11-17
-- 1991-07-08
-- 1989-04-19
-- 1993-06-23
SELECT data_nascimento FROM Funcionarios WHERE data_nascimento >= 'data_nascimento'; 

-- Questão 5 - Encontre a média salarial:
-- 5390.000000
SELECT AVG(salario) AS Salariomedia FROM Funcionarios;  


-- Questão 6 - Extraia os 3 primeiros caracteres do nome:
-- Hel
-- Igo
-- Jul
-- Luc
SELECT SUBSTRING(nome,1,3) FROM Funcionarios;

-- Questão 7 - Contar quantos funcionarios por departamento:
-- 3	Financeiro
-- 3	RH
-- 4	TI
SELECT count(*) as qt_Func, d.nome as dep 
FROM Funcionarios f 
JOIN Departamentos d ON f.Departamento_Id = d.Id
GROUP BY d.nome; 


-- Questão 8 - Contar qaunto funcionarios existem cargo:
-- 1	Financeiro
-- 1	Marketing
-- 3	RH
-- 2	TI
-- 3	Vendas
SELECT count(*) as qt_Func, d.nome as dep 
FROM Funcionarios f 
JOIN Departamentos d ON f.cargo_id = d.Id
GROUP BY d.nome;
