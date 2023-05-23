
# ALUNO

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|matriculaAluno|Numero da matricula do aluno|Int|-|PK|AUTO_INCREMENT
|idEndereco| Numero indentificador endereco | Int | - | FK (endereco.idEndereco), NOT NULL | AUTO_INCREMENT
|cnpjEscola| CNPJ da escola|Varchar|18|FK (escola.cnpjEscola),NOT NULL|-
|nomeAluno|Nome do aluno|Varchar|64|NOT NULL|-
Utilizado para salvar dados de aluno

  

# ESCOLA

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|cnpjEscola|CNPJ da escola|Varchar|18|PK|-
|idEndereco|Numero indentificador endereco|Int|-|FK(endereco.idEndereco), NOT NULL|-
Utilizado para salvar dados de escolas

# ENDERECO

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idEndereco|Numero indentificador endereco|Int|-|PK|AUTO_INCREMENT
|estado|Sigla do estado|Varchar|2|-|-
|cidade|Nome da cidade|Varchar|32|-|-
|bairro|Nome do bairro|Varchar|32|-|-
|rua|Nome do rua|Varchar|64|-|-
|numero|Numero do endereco|Int|-|-|-
|complemento|Complemento do endereco|Varchar|128|-|-
Utilizado para salvar dados de endereco. Pode ser ligado com Aluno, Escola e Professora.


# PROFESSOR

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|matriculaProfessor|Numero da matricula do professor|Int|-|PK|AUTO_INCREMENT
|cpfProfessor|CPF do professor|Varchar|15|UNIQUE|-
|nomeProfessor|Nome do professor|Varchar|64|-|-
Utilizado para salvar dados de professores

# DISCIPLINA

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|codigoDisciplina|Numero indentificador da disciplina|Int|-|PK|AUTO_INCREMENT
|ementaDisciplina|Descricao das atividades da disciplina|Varchar|512|-|-
|nomeDisciplina|Nome da disciplina|Varchar|32|NOT NULL|-
Utilizado para salvar dados de disciplinas da escola

# TURMA

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|codigoTurma|Numero indentificador da turma|Int|-|PK|AUTO_INCREMENT
|cnpjEscola|CNPJ da Escola da turma|Varchar|18|FK, NOT NULL|-
|idTurno|Numero indentificador do turno da turma|Int|-|FK|-
|sala|Sala da turma, consiste em 2 caracteres| Varchar|2|-|-
Utilizado para salvar dados de turmas da escola

# TURNO

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idTurno|Numero indentificador do turno|Int|-|PK|AUTO_INCREMENT
|nomeTurno|Nome do turno|Varchar|32|-|-
|horaInicio|Valor da hora(h) que comeca o turno|Int|-|NOT NULL|-
|horaFinal|Valor da hora(h) que finaliza o turno|Int|-|NOT NULL|-
Utilizado para salvar diversos turnos de aula da escola

# TELEFONE

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|idTelefone|Numero indentificador do telefone|Int|-|PK|AUTO_INCREMENT
|dddTelefone|DDD do telefone|Int|-|NOT_NULL|-
|numeroTelefone|Numero do telefone|Int|-|NOT_NULL|-
|tipoTelefone|Tipo do telefone, ex: Celular, Interfone|Varchar|32|-|-
Utilizado para salvar telefones de professores, alunos e da escola


# DISCIPLINA_TURMA

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|id|Numero indentificador da interface disciplina_turma|Int|-|PK|AUTO_INCREMENT
|codigoTurma|Numero indentificador da turma|Int|-|FK(turma.codigoTurma), NOT NULL|-
|codigoDisciplina|Numero indentificador da disciplina|Int|-|FK(disciplina.codigoDisciplina), NOT NULL|-

Utilizado para ligar varias turmas com varias disciplinas

# DISCIPLINA_PROFESSOR

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|id|Numero indentificador da interface disciplina_turma|Int|-|PK|AUTO_INCREMENT
|matriculaProfessor|Numero de matricula do professor|Int|-|FK(professor.matriculaProfessor), NOT NULL|-
|codigoDisciplina|Numero indentificador da disciplina|Int|-|FK(disciplina.codigoDisciplina), NOT NULL|-
Utilizado para ligar varios professores com varias disciplinas

# ESCOLA_PROFESSOR

|Nome|Descricao|Tipo|Tamanho|Restricao|ATRIBUTOS|
|:-:|:-:|:-:|:-:|:-:|:-:|
|id|Numero indentificador da interface escola_professor|Int|-|PK|AUTO_INCREMENT
|matriculaProfessor|Numero de matricula do professor|Int|-|FK(professor.matriculaProfessor), NOT NULL|-
|cnpjEscola|CNPJ da escola|Varchar|18|FK(escola.cnpjEscola), NOT NULL|-
Utilizado para ligar varios professores com varias escolas

