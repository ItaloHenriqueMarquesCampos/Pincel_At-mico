SELECT
    -- Dados do aluno
    c.nome_fin,
    c.curso,
    c.nivel,
    c.tel_fin,
    c.colacao,
    c.duracao,
    a.celular,
    c.contrato

FROM
    curso_aluno c

INNER JOIN
        parceiros p ON c.parceiro_id = p.id

INNER JOIN
        alunos a ON c.matricula = a.codigo

WHERE
    c.colacao > '2025-10-01'

AND
    c.nivel = 'Segunda Graduação'

#AND
    #c.duracao = 'Duração Mínima: 24 meses'