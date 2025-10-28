SELECT
    c.nome_fin,
    c.parceiro_id,
    c.curso,
    c.nivel

    FROM curso_aluno c

WHERE datahora> "2024-12-31 23:59:00"

AND c.parceiro_id = 25745;
