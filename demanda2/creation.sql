DROP TABLE IF EXISTS aluno, escola, endereco, professor, disciplina, turma, turno, telefone, disciplina_turma, disciplina_professor, escola_professor;

CREATE TABLE aluno (
	matriculaAluno int AUTO_INCREMENT,
    idEndereco int NOT NULL,
	cnpjEscola varchar(18) NOT NULL,
    codigoTurma int NOT NULL,
    
    nomeAluno varchar(64) NOT NULL,
    
    PRIMARY KEY (matriculaAluno)
);

CREATE TABLE escola (
	cnpjEscola varchar(18),
    idEndereco int NOT NULL,
    idTelefone int,
    
    nomeEscola varchar(64) NOT NULL,
    
    PRIMARY KEY (cnpjEscola)
);

CREATE TABLE endereco (
	idEndereco int AUTO_INCREMENT,
    
    estado varchar(2),
    cidade varchar(32),
    bairro varchar(32),
    rua varchar(64),
    numero int,
    complemento varchar(128),
    
    PRIMARY KEY (idEndereco)
);

CREATE TABLE professor (
	matriculaProfessor int AUTO_INCREMENT,
    cpfProfessor varchar(15) UNIQUE,
    nomeProfessor varchar(64),
    
    PRIMARY KEY (matriculaProfessor)
);

CREATE TABLE disciplina (
	codigoDisciplina int AUTO_INCREMENT,
    ementaDisciplina varchar(512),
    
    nomeDisciplina varchar(32) NOT NULL,
    
    PRIMARY KEY (codigoDisciplina)
);

CREATE TABLE turma (
	codigoTurma int AUTO_INCREMENT,
    cnpjEscola varchar(18) NOT NULL,
    idTurno int,
    
    sala varchar(2),
    
    PRIMARY KEY (codigoTurma)
);

CREATE TABLE turno (
	idTurno int AUTO_INCREMENT,
    nomeTurno varchar(32),
    
    horaInicio int NOT NULL,
    horaFinal int NOT NULL,
    
    PRIMARY KEY (idTurno)
);

CREATE TABLE telefone (
	idTelefone int AUTO_INCREMENT,
    dddTelefone int NOT NULL,
    numeroTelefone int NOT NULL,
    tipoTelefone varchar(32),
    
    PRIMARY KEY (idTelefone)
);

CREATE TABLE disciplina_turma (
	id int AUTO_INCREMENT,
    codigoTurma int NOT NULL,
    codigoDisciplina int NOT NULL,

	PRIMARY KEY (id)
);

CREATE TABLE disciplina_professor (
	id int AUTO_INCREMENT,
    codigoDisciplina int NOT NULL,
    matriculaProfessor int NOT NULL,
	
    PRIMARY KEY (id)
);

CREATE TABLE escola_professor (
	id int AUTO_INCREMENT,
    matriculaProfessor int NOT NULL,
    cnpjEscola varchar(18) NOT NULL,
    
    PRIMARY KEY (id)
);

ALTER TABLE aluno 
ADD FOREIGN KEY (idEndereco) REFERENCES endereco(idEndereco),
ADD FOREIGN KEY (cnpjEscola) REFERENCES escola(cnpjEscola),
ADD FOREIGN KEY (codigoTurma) REFERENCES turma(codigoTurma);

ALTER TABLE escola
ADD FOREIGN KEY (idEndereco) REFERENCES endereco(idEndereco),
ADD FOREIGN KEY (idTelefone) REFERENCES telefone(idTelefone);

ALTER TABLE turma
ADD FOREIGN KEY (cnpjEscola) REFERENCES escola(cnpjEscola),
ADD FOREIGN KEY (idTurno) REFERENCES turno(idTurno);

ALTER TABLE disciplina_turma
ADD FOREIGN KEY (codigoTurma) REFERENCES turma(codigoTurma),
ADD FOREIGN KEY (codigoDisciplina) REFERENCES disciplina(codigoDisciplina);

ALTER TABLE disciplina_professor
ADD FOREIGN KEY (codigoDisciplina) REFERENCES disciplina(codigoDisciplina),
ADD FOREIGN KEY (matriculaProfessor) REFERENCES professor(matriculaProfessor);

ALTER TABLE escola_professor
ADD FOREIGN KEY (matriculaProfessor) REFERENCES professor(matriculaProfessor),
ADD FOREIGN KEY (cnpjEscola) REFERENCES escola(cnpjEscola);

# INSERTS
# CRIAR TURNOS
INSERT INTO turno (nomeTurno, horaInicio, horaFinal) VALUES ("Manha", 7, 12);
INSERT INTO turno (nomeTurno, horaInicio, horaFinal) VALUES ("Tarde", 13, 17);
INSERT INTO turno (nomeTurno, horaInicio, horaFinal) VALUES ("Noite", 18, 23);

# CRIAR ESCOLA MUNI OSW LIM FIL
INSERT INTO endereco (estado, cidade, bairro, rua, numero) VALUES ("PE", "Recife", "Pina", "Av. Eng. Domingos Ferreira", 1040);
INSERT INTO escola (cnpjEscola, idEndereco, nomeEscola) VALUES ("11.815.372/0001-92", 1, "Escola Municipal Oswaldo Lima Filho");

# CRIA TURMA NA MANHA NA ESCOLA MUNI OSW LIM FIL
INSERT INTO turma (cnpjEscola, idTurno, sala) VALUES ("11.815.372/0001-92", 1, "A4");
INSERT INTO turma (cnpjEscola, idTurno, sala) VALUES ("11.815.372/0001-92", 2, "B8");

# CRIAR PROFESSOR MATEMATICA
INSERT INTO professor (cpfProfessor, nomeProfessor) VALUES ("124.523.752-50", "Marcelo Lima");
INSERT INTO disciplina (ementaDisciplina, nomeDisciplina) VALUES ("Ensino geral de aritimetica e outras operacoes com numeros", "Matematica");
INSERT INTO disciplina_professor (codigoDisciplina, matriculaProfessor) VALUES (1, 1);
INSERT INTO escola_professor (cnpjEscola, matriculaProfessor) VALUES ("11.815.372/0001-92", 1);
INSERT INTO disciplina_turma(codigoTurma, codigoDisciplina) VALUES (1, 1);

# CRIAR ALUNOS PARA ESTUDAR NA TURMA ACIMA
INSERT INTO endereco (estado, cidade, bairro, rua, numero) VALUES ("PE", "Recife", "Pina", "Av. Encanta Moça", 330);
INSERT INTO aluno (idEndereco, cnpjEscola, codigoTurma, nomeAluno) VALUES (2, "11.815.372/0001-92", 1, "Marcio");

INSERT INTO endereco (estado, cidade, bairro, rua, numero) VALUES ("PE", "Recife", "Brasilia Teimosa", "R. Armando Pina", 18);
INSERT INTO aluno (idEndereco, cnpjEscola, codigoTurma, nomeAluno) VALUES (3, "11.815.372/0001-92", 1, "Jorge Filho");

INSERT INTO endereco (estado, cidade, bairro, rua, numero) VALUES ("PE", "Recife", "Ilha Joana Bezerra", "R. Assembléia de Deus", 218);
INSERT INTO aluno (idEndereco, cnpjEscola, codigoTurma, nomeAluno) VALUES (4, "11.815.372/0001-92", 2, "Ana Beatriz");
# 17

# CRIAR PROFESSORA PORTUGUES
INSERT INTO professor (cpfProfessor, nomeProfessor) VALUES ("100.32.402-32", "Silvia Silva");
INSERT INTO disciplina (ementaDisciplina, nomeDisciplina) VALUES ("Ensino dos fundamentos da lingua portuguesa", "Portugues");
INSERT INTO disciplina_professor (codigoDisciplina, matriculaProfessor) VALUES (2, 2);
INSERT INTO escola_professor (cnpjEscola, matriculaProfessor) VALUES ("11.815.372/0001-92", 2);
INSERT INTO disciplina_turma(codigoTurma, codigoDisciplina) VALUES (1, 2);
INSERT INTO disciplina_turma(codigoTurma, codigoDisciplina) VALUES (2, 2);

# CRIAR PROFESSOR BIOLOGIA
INSERT INTO professor (cpfProfessor, nomeProfessor) VALUES ("153.18.200-01", "Luciano Baleia");
INSERT INTO disciplina (ementaDisciplina, nomeDisciplina) VALUES ("Exploracao dos fundamentos da vida", "Biologia");
INSERT INTO disciplina_professor (codigoDisciplina, matriculaProfessor) VALUES (3, 3);
INSERT INTO escola_professor (cnpjEscola, matriculaProfessor) VALUES ("11.815.372/0001-92", 3);
INSERT INTO disciplina_turma(codigoTurma, codigoDisciplina) VALUES (1, 3);

# Selecionar escolas c/ endereco
SELECT * FROM escola AS es INNER JOIN endereco AS en ON es.idEndereco = en.idEndereco;

# Alunos e suas turmas
SELECT * FROM turma AS t
JOIN aluno AS a
ON a.codigoTurma = t.codigoTurma;

# Turmas que professor leciona
WITH dt AS (
	SELECT 
		dt.codigoDisciplina, dt.codigoTurma, t.idTurno, t.sala, d.ementaDisciplina, d.nomeDisciplina
	FROM disciplina_turma as dt
	INNER JOIN turma as t
	ON dt.codigoTurma = t.codigoTurma
	INNER JOIN disciplina as d
	ON dt.codigoDisciplina = d.codigoDisciplina
),
dp AS (
	SELECT dp.codigoDisciplina, dp.matriculaProfessor, p.cpfProfessor, p.nomeProfessor, d.ementaDisciplina, d.nomeDisciplina
    FROM disciplina_professor AS dp
    INNER JOIN professor AS p
    ON dp.matriculaProfessor = p.matriculaProfessor
    INNER JOIN disciplina AS d
    ON dp.codigoDisciplina = d.codigoDisciplina
)
SELECT dp.nomeProfessor, dt.codigoTurma, dt.sala, dp.nomeDisciplina, dp.ementaDisciplina
FROM dp
INNER JOIN dt
ON dp.codigoDisciplina = dt.codigoDisciplina;


/* SELECT * FROM aluno;
SELECT * FROM disciplina;
SELECT * FROM disciplina_professor;
SELECT * FROM disciplina_turma;
SELECT * FROM endereco;
SELECT * FROM escola;
SELECT * FROM escola_professor;
SELECT * FROM professor;
SELECT * FROM telefone;
SELECT * FROM turma;
SELECT * FROM turno;*/

