SELECT
    -- Dados do aluno
    c.nome_fin,
    c.curso,
    c.nivel,
    c.taxa_matricula,
    c.parcelas,
    c.valor_parcela,

    -- Dados de quem matriculou
    c.parceiro_id,
    p.id_equipe,
    p.tipo,
    p.nome

    FROM curso_aluno c
    INNER JOIN
        parceiros p ON c.parceiro_id = p.id

WHERE datahora> '2024-12-31 23:59:00'


-- AND c.parceiro_id = 25745;
