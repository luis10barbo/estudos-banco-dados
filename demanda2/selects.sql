# listas de alunos e quantidade,
SELECT * FROM aluno;
SELECT COUNT(*) as contagemAlunos FROM aluno;
# lista de professores e quantidade e suas disciplinas,
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
SELECT dp.nomeProfessor, dp.matriculaProfessor, dt.codigoTurma, dt.sala, dp.nomeDisciplina, dp.ementaDisciplina
FROM dp
INNER JOIN dt
ON dp.codigoDisciplina = dt.codigoDisciplina
ORDER BY dp.matriculaProfessor; 
SELECT COUNT(*) as contagemProfessores FROM professor;

# disciplinas com a carga horária maior e a menor,
SELECT * FROM disciplina ORDER BY cargaHorariaDisciplina DESC LIMIT 1;
SELECT * FROM disciplina ORDER BY cargaHorariaDisciplina ASC LIMIT 1;
# turmas com datas que vai acabar em ordem decrescente, 
SELECT tm.codigoTurma, tm.sala, tn.finalTurno FROM turma as tm
INNER JOIN turno as tn
ON tm.idTurno = tn.idTurno
ORDER BY tn.finalTurno DESC;

# dá um drop na tabela aluno e por fim um deleta no id 15 de aluno.
ALTER TABLE telefone
DROP FOREIGN KEY telefone_ibfk_3; # tirar foreign key q referencia matriculaAluno

DROP TABLE aluno;
# Nao e possivel deletar aluno de id 15 pq a tabela q guardava os alunos foi deletada acima.