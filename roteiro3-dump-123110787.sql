-- Aluno: Guilherme Jose Araujo Oliveira
CREATE TYPE estados as ENUM ('BA','SE','AL','PB','PE','RN','PI','MA','CE');

CREATE TABLE farmacias(
    id_farmacia INTEGER PRIMARY KEY,
    cep_farmacia VARCHAR(8),
    bairro_farmacia VARCHAR(50) UNIQUE,
    cidade_farmacia VARCHAR(50),
    gerente_farmacia VARCHAR(11) FOREIGN KEY,
    estado_farmacia estados,
    sede_filial VARCHAR(6),
    CONSTRAINT sedeoufilial CHECK (sede_filial = "sede" or sede_filial = "filial"),
    FOREIGN KEY gerente_farmacia REFERENCES funcionarios(cpf_funcionario)
);

CREATE TYPE funcoes as ENUM ('farmaceuticos', 'vendedor', 'entregador', 'caixa', 'administrador');

CREATE TABLE funcionarios(
    cpf_funcionario VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(50),
    funcao funcoes,
    farmacia_funcionario INTEGER,
    FOREIGN KEY (farmacia_funcionario) REFERENCES farmacias(id_farmacia)
);

CREATE TABLE medicamentos(
    nome_medicamento VARCHAR(50) PRIMARY KEY,
    funcao_medicamento VARCHAR(50),
    caracteristica_medicamento VARCHAR(50)
);


CREATE TABLE vendas(
    funcionario_venda VARCHAR(11) FOREIGN KEY,
    funcao_funcionario_venda funcoes,
    medicamento_venda CHARCHAR(50) FOREIGN KEY,
    FOREIGN KEY (funcionario_venda) REFERENCES funcionarios (cpf_funcionario),
    CONTRAINT checa_funcionario CHECK (funcao_funcionario_venda = 'vendedor'),
    FOREIGN KEY (medicamento_venda) REFERENCES medicamentos (nome_medicamento)
);

CREATE TABLE entregas(
    entrega_realizada BOOLEAN,
    cadastro_cliente VARCHAR(11) FOREIGN KEY,
    endereco_entrega VARCHAR(30) FOREIGN KEY,
    FOREIGN KEY (cadastro_cliente) REFERENCES clientes(cpf_cliente),
    FOREIGN KEY (endereco_entrega) REFERENCES clientes(endereco_cliente) NOT NULL
);

CREATE TABLE clientes(
    cpf_cliente VARCHAR(11) PRIMARY KEY,
    nome_cliente TEXT,
    endereco_cliente VARCHAR(30),
    idade_cliente INTEGER,
    CONTRAINT checa_endereco CHECK (endereco_cliente = 'residencia' or endereco_cliente = 'trabalho' or endereco_cliente = 'outro'),
    CONSTRAINT checa_idade CHECK (idade >= 18)
);
