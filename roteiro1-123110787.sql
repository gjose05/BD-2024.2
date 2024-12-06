CREATE TABLE automovel_seguro(
    placa_carro VARCHAR(20) PRIMARY KEY,
    modelo_carro VARCHAR(20),
    ano_carro VARCHAR(20),
    cor_carro VARCHAR(20)
);

ALTER TABLE automovel_seguro ALTER COLUMN modelo_carro SET NOT NULL;
ALTER TABLE automovel_seguro ALTER COLUMN ano_carro SET NOT NULL;
ALTER TABLE automovel_seguro ALTER COLUMN cor_carro SET NOT NULL;

CREATE TABLE cliente_seguro(
    cpf_cliente VARCHAR(25),
    nome_cliente TEXT,
    data_nascimento VARCHAR(20),
    automovel_cliente VARCHAR(20),
    PRIMARY KEY (cpf_cliente),
    FOREIGN KEY (automovel_cliente) REFERENCES automovel_seguro (placa_carro)
);

CREATE TABLE sinistro_seguro(
    cpf_segurado VARCHAR(25),
    tipo_sinistro TEXT,
    FOREIGN KEY(cpf_segurado) REFERENCES cliente_seguro(cpf_cliente),
    PRIMARY KEY (cpf_segurado)
);

CREATE TABLE perito_seguro(
    cpf_perito VARCHAR(25),
    nome_perito TEXT,
    data_nascimento_perito VARCHAR(25),
    PRIMARY KEY (cpf_perito)
);

CREATE TABLE oficina_seguro(
    cep_oficina VARCHAR(20),
    nome_oficina TEXT,
    PRIMARY KEY (cep_oficina)
);

CREATE TABLE pericia_seguro(
    taxa_dano VARCHAR(20),
    servico_pericia TEXT,
    perito_pericia VARCHAR(25),
    oficina_pericia VARCHAR(20),
    PRIMARY KEY (taxa_dano),
    FOREIGN KEY (perito_pericia) REFERENCES perito_seguro (cpf_perito),
    FOREIGN KEY (oficina_pericia) REFERENCES oficina_seguro(cep_oficina)
);

