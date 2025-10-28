SELECT
    c.nome,
    c.tipo_ocorrencia,
    c.ocorrencia,
    c.data,
    ca.nivel,
    ca.curso,
    a.celular,
    a.telefone

FROM cancelados AS c
LEFT JOIN
    curso_aluno ca ON c.matricula = ca.matricula
LEFT JOIN
    alunos a ON ca.matricula = a.codigo
WHERE
    ca.parceiro_id = '24660' #código do Paulyran
ORDER BY
    c.data DESC
