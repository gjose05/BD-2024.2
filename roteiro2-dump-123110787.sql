-- Questão 1: 
-- Criação da tabela TAREFAS, para realizar as inserções.
CREATE TABLE tarefas(
    id_tarefa INTEGER,
    tarefa_funcionario TEXT,
    cpf_funcionario VARCHAR(11),
    numero_tarefas INTEGER,
    texto VARCHAR(1)
);

INSERT INTO tarefas VALUES (2147483646, 'limpar chão do corredor central', '98765432111', 0, 'F');

INSERT INTO tarefas VALUES (2147483647, 'limpar janelas da sala 203', '98765432122', 1, 'F');

INSERT INTO tarefas VALUES (null, null, null, null, null);

-- deu erro
INSERT INTO tarefas VALUES (2147483644, 'limpar chão do corredor superior', '987654323211', 0, 'F');
-- deu erro
INSERT INTO tarefas VALUES (2147483643, 'limpar chão do corredor superior', '98765432321', 0, 'FF');

-- Questão 2:
