SELECT
    r.tipo_nome,
    r.matricula,
    r.tipo,
    r.andamento,
    r.usuario_responsavel_atual,
    r.setor_atual,
    r.setor_abertura,
    r.data_solicitacao,
    ca.matricula,
    ca.ref_id,
    ca.nivel,
    ca.curso,
    ca.cpf_fin,
    ca.datahora,
    ca.parceiro_id,
    p.nome,
    p.cpf,
    p.tipo,
    f.valor,
    f.valor_pagto,
    f.matricula,
    f.descricao,
    a.nome

    FROM requerimentos r

    LEFT JOIN
        curso_aluno ca ON r.matricula = ca.matricula
    LEFT JOIN
        parceiros p ON ca.parceiro_id = p.id
    LEFT JOIN
        financeiro f ON ca.ref_id = f.contrato
    LEFT JOIN
        alunos a ON ca.matricula = a.codigo

WHERE
    (
    r.tipo_nome = 'Retorno de Curso (acima de 12 meses)'
OR
    r.tipo_nome = 'Retorno de Curso | Alunos com pendências financeiras (acima de 12 meses)'
)
AND
    f.matricula > 0
AND
    r.data_solicitacao > '2025-09-01'
AND
    r.data_solicitacao < '2025-10-01'
AND
    p.tipo = 'Equipe Interna'
AND
    f.valor_pagto IS NOT NULL

#LIMIT 10


