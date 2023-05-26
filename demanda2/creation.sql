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
    
    cargaHorariaDisciplina int NOT NULL,
    nomeDisciplina varchar(64) NOT NULL,
    
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
    
    inicioTurno DATETIME NOT NULL,
    finalTurno DATETIME NOT NULL,
    
    PRIMARY KEY (idTurno)
);

CREATE TABLE telefone (
	idTelefone int AUTO_INCREMENT,
    cnpjEscola varchar(18),
    matriculaProfessor int,
    matriculaAluno int,
    
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

ALTER TABLE telefone
ADD FOREIGN KEY (cnpjEscola) REFERENCES escola(cnpjEscola),
ADD FOREIGN KEY (matriculaProfessor) REFERENCES professor(matriculaProfessor),
ADD FOREIGN KEY (matriculaAluno) REFERENCES aluno(matriculaAluno);

ALTER TABLE disciplina_turma
ADD FOREIGN KEY (codigoTurma) REFERENCES turma(codigoTurma),
ADD FOREIGN KEY (codigoDisciplina) REFERENCES disciplina(codigoDisciplina);

ALTER TABLE disciplina_professor
ADD FOREIGN KEY (codigoDisciplina) REFERENCES disciplina(codigoDisciplina),
ADD FOREIGN KEY (matriculaProfessor) REFERENCES professor(matriculaProfessor);

ALTER TABLE escola_professor
ADD FOREIGN KEY (matriculaProfessor) REFERENCES professor(matriculaProfessor),
ADD FOREIGN KEY (cnpjEscola) REFERENCES escola(cnpjEscola);






