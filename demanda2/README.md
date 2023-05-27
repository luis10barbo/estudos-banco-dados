# listas de alunos e quantidade
![image](https://github.com/luis10barbo/estudos-banco-dados/assets/89195562/9573df0c-b7f4-4294-8135-247252446ce4)
![image](https://github.com/luis10barbo/estudos-banco-dados/assets/89195562/086d7599-07d5-4fe8-8d45-590a819a0cd2)


# lista de professores e quantidade e suas disciplinas
(Coloquei com as salas que eles lecionam como extra, por isso tem varios repetidos)
![image](https://github.com/luis10barbo/estudos-banco-dados/assets/89195562/373df4f2-05d3-49df-91b1-2ac3fd0ff246)
![image](https://github.com/luis10barbo/estudos-banco-dados/assets/89195562/18d6ff60-9594-415d-944d-97bf9cc23313)

# disciplinas com a carga horária maior e a menor
![image](https://github.com/luis10barbo/estudos-banco-dados/assets/89195562/bf93b882-ece2-4f34-9726-1f95dfec05db)
![image](https://github.com/luis10barbo/estudos-banco-dados/assets/89195562/cd7ed719-b2ba-469d-b22e-24a05d4ad3c5)

# turmas com datas que vai acabar em ordem decrescente
![image](https://github.com/luis10barbo/estudos-banco-dados/assets/89195562/74895685-8421-4473-b970-7ea02a181363)

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
|cnpjEscola|Numero intentificador da escola a que o telefone pertence|Int|-|FK(escola.cnpjEscola)|-
|matriculaProfessor|Numero intentificador do professor a quem o telefone pertence|Int|-|FK(professor.matriculaProfessor)|-
|matriculaAluno|Numero intentificador do aluno a quem o telefone pertence|Int|-|FK(aluno.matriculaAluno)|-
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

