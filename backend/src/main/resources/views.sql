-- View: Ranking Turmas
CREATE OR REPLACE VIEW turmas_melhores_avaliadas AS
SELECT t.id, t.periodo, d.nome AS nome_disciplina, p.nome as nome_professor, AVG(a.nota) AS media_avaliacoes
FROM turmas t
         INNER JOIN avaliacoes_turmas a ON t.id = a.id_turma
         INNER JOIN disciplinas d ON d.id = t.disciplina_id
         INNER JOIN professores p ON p.id = t.professor_id
GROUP BY t.id, t.periodo, t.disciplina_id, d.nome, t.professor_id, p.nome
ORDER BY media_avaliacoes DESC;