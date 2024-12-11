SELECT DISTINCT
  a.nome, -- Nome do aluno
  a.email,
  a.telefone,
  a.celular,
  c.nivel, -- Nível que o aluno escolheu
  c.curso,
  cc.tipo_ocorrencia,
  p.nome
  #LEFT (f.processamento, 10) AS processamento -- Data que foi matriculado

FROM
  alunos a
INNER JOIN
  curso_aluno c ON a.codigo = c.matricula
INNER JOIN
  financeiro f ON f.cliente_fornecedor = c.matricula
INNER JOIN
  cancelados cc ON a.codigo = cc.matricula
INNER JOIN
  parceiros p ON p.id = c.parceiro_id

WHERE
  f.processamento > '2017-01-01 00:00:00'
  AND f.processamento != '0000-00-00'
  AND f.processamento != '0000-00-00 00:00:00'
  AND f.processamento != ''
  AND a.cpf != ''
  AND f.parcela = 1
  AND cc.tipo_ocorrencia !=''
  AND p.nome = 'Caroline de Oliveira Silva'
  AND cc.data = (SELECT MAX(cc2.data)
                 FROM cancelados cc2
                 WHERE cc2.matricula = a.codigo)
ORDER BY
    f.processamento;