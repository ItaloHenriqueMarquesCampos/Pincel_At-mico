SELECT
    a.nome,
    a.email,
    a.telefone,
    a.celular,
    c.curso,
    c.nivel,
    c.polo
FROM curso_aluno c
LEFT JOIN
    alunos a ON c.matricula = a.codigo
LEFT JOIN
    parceiros p ON c.parceiro_id = p.id

WHERE c.parceiro_id = '24660' #código do Paulyran