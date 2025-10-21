SELECT
    -- Dados do aluno
    c.datahora AS data_da_matricula,
    f.data_pagto AS data_da_pagamento,
    f.valor_pagto AS valor_pago,
    c.parcelas,
    c.nome_fin AS nome,
    c.curso,
    c.nivel AS modalidade,
    c.email_fin,
    c.tel_fin AS telefone,

    -- Dados de quem matriculou
    p.tipo AS tipo_de_parceiro,
    p.nome AS parceiro

FROM
    curso_aluno c
INNER JOIN
    parceiros p
        ON c.parceiro_id = p.id
INNER JOIN
    financeiro f
        ON f.contrato =c.ref_id

WHERE
    c.datahora > '2017-01-01 14:40:19'
AND
    f.data_pagto < (CURRENT_DATE - INTERVAL 60 DAY)
AND
    c.tel_fin IS NOT NULL
AND
    c.tel_fin != ''
AND
    f.parcela = 1 #Somente matrículas
AND
    f.data_pagto IS NOT NULL
AND
    f.status != 1
AND
    f.descricao NOT LIKE '%Mensalidade 1/1%'  -- Exclui cursos de parcela única
AND NOT EXISTS (
    SELECT 1
    FROM financeiro f2
    WHERE f2.contrato = f.contrato
      AND f2.parcela > 1
      AND f2.data_pagto IS NOT NULL
)

#AND
    #p.tipo = 'Equipe Interna'

#AND
    #c.parceiro_id = 25745;

# Esta query busca alunos que pagaram a taxa de matrícula e não pagaram os outros boletos.
# Caso o curso do aluno possua somente 1 parcela e ela seja paga, este aluno não será mostrado pois já terá concluido o pagamento.