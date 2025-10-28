SELECT
    #c.nome_fin AS nome,
    #c.cpf_fin,
    #c.curso,
    #c.nivel AS modalidade,
    p.tipo AS tipo_de_parceiro,
    #p.nome AS parceiro,
    ROUND(SUM(f.valor), 2) AS total_pago_ate_parcela_6

FROM
    curso_aluno c
INNER JOIN
    parceiros p ON c.parceiro_id = p.id
INNER JOIN
    financeiro f ON f.contrato = c.ref_id
WHERE
    c.datahora BETWEEN '2025-01-01 00:00:00' AND '2025-01-31 23:59:00'
    AND f.status != 1
    AND f.parcela BETWEEN 1 AND 6
    #AND p.tipo = 'Equipe Interna'
    #AND c.parceiro_id = 25745

GROUP BY
    #c.nome_fin, c.curso, c.nivel, p.tipo, p.nome;
p.tipo
