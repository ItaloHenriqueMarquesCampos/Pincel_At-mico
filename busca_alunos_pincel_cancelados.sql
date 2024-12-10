SELECT DISTINCT
  a.nome, #Nome do aluno
  a.telefone, #Telefone do aluno
  a.celular, #Celular do aluno
  a.email, #E-mail do aluno
  c.curso, #Curso do aluno
  a.nascimento, #Data de nascimento do aluno
  a.uf, #Estado em que o aluno mora
  a.cidade, #Cidade em que o aluno mora
  a.sexo, #Gênero do aluno
  c.ref_id, #Id de matrícula do curso do aluno
  LEFT(f.processamento, 10) AS processamento, -- Data de matrícula do curso do aluno limitada a 10 caracteres
  c.nivel, #Modalidade de curso do aluno
  f.valor, #Valor do boleto
  f.parcela, #Número da parcela que foi gerada
  f.matricula,
  cc.tipo_ocorrencia

FROM
  alunos a
INNER JOIN
  curso_aluno c ON a.codigo = c.matricula
INNER JOIN
  financeiro f ON f.cliente_fornecedor = c.matricula
INNER JOIN
  cancelados cc ON cc.matricula = c.matricula

WHERE
  f.processamento > '2017-01-01 00:00:00'
  AND f.processamento != '0000-00-00'
  AND f.processamento != '0000-00-00 00:00:00'
  AND f.processamento != ''
  AND cc.tipo_ocorrencia != 'Bloqueado Rematricula'
  AND cc.tipo_ocorrencia != 'Bloqueado Turma/Disciplina - falta de acesso (60 dias)'
  AND cc.tipo_ocorrencia != 'Bloqueio de Acesso'
  AND cc.tipo_ocorrencia != 'Bloqueio de Acesso / Turma'
  AND cc.tipo_ocorrencia != 'Cancelamento após Aula'
  AND cc.tipo_ocorrencia != 'Desistente antes Aula'
  AND cc.tipo_ocorrencia != 'Não Rematriculado'
  AND cc.tipo_ocorrencia != 'Pré-Matriculado - Pendente Documentaçào'
  AND cc.tipo_ocorrencia != 'Processo Seletivo Pendente'
  AND cc.tipo_ocorrencia != 'Trancamento de Matrícula'
  AND cc.tipo_ocorrencia != 'Transferência de Curso/Turno'
  AND cc.tipo_ocorrencia != 'Transferência de Turma'
  AND cc.tipo_ocorrencia != 'Transferência Externa'
  AND cc.tipo_ocorrencia != 'Transferência Interna'
  AND cc.tipo_ocorrencia != 'Troca de Polo'
  AND cc.tipo_ocorrencia != 'Remanejamento'

  AND a.cpf != ''

ORDER BY
    a.nome;