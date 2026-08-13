-- ddl_tabelas_fk_simples.sql

-- VEICULO depende de USUARIO
CREATE TABLE veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INTEGER NOT NULL,
    cor VARCHAR(30) NOT NULL,

    CONSTRAINT fk_veiculo_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE,

    CONSTRAINT ck_veiculo_ano
        CHECK (ano >= 1900)
);


-- CONTATO_CONFIANCA depende de USUARIO
CREATE TABLE contato_confianca (
    id_contato SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    parentesco VARCHAR(50),
    email VARCHAR(150),

    CONSTRAINT fk_contato_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);


-- VIAGEM depende de VEICULO
CREATE TABLE viagem (
    id_viagem SERIAL PRIMARY KEY,
    id_veiculo INTEGER NOT NULL,
    data_inicio TIMESTAMP NOT NULL,
    data_fim TIMESTAMP,
    origem VARCHAR(150) NOT NULL,
    destino VARCHAR(150) NOT NULL,
    distancia_km NUMERIC(8,2) NOT NULL,

    CONSTRAINT fk_viagem_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES veiculo(id_veiculo)
        ON DELETE CASCADE,

    CONSTRAINT ck_viagem_distancia
        CHECK (distancia_km >= 0),

    CONSTRAINT ck_viagem_datas
        CHECK (data_fim IS NULL OR data_fim >= data_inicio)
);


-- ALERTA depende de VIAGEM
CREATE TABLE alerta (
    id_alerta SERIAL PRIMARY KEY,
    id_viagem INTEGER NOT NULL,
    tipo_alerta VARCHAR(30) NOT NULL,
    descricao TEXT,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nivel_risco VARCHAR(10) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',

    CONSTRAINT fk_alerta_viagem
        FOREIGN KEY (id_viagem)
        REFERENCES viagem(id_viagem)
        ON DELETE CASCADE,

    CONSTRAINT ck_alerta_tipo
        CHECK (tipo_alerta IN ('Álcool', 'Velocidade', 'Rota Perigosa')),

    CONSTRAINT ck_alerta_risco
        CHECK (nivel_risco IN ('Baixo', 'Médio', 'Alto')),

    CONSTRAINT ck_alerta_status
        CHECK (status IN ('Ativo', 'Enviado', 'Resolvido'))
);


-- SERVICO_EMERGENCIA depende de ALERTA
CREATE TABLE servico_emergencia (
    id_servico SERIAL PRIMARY KEY,
    id_alerta INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    telefone VARCHAR(20) NOT NULL,

    CONSTRAINT fk_servico_alerta
        FOREIGN KEY (id_alerta)
        REFERENCES alerta(id_alerta)
        ON DELETE CASCADE,

    CONSTRAINT ck_servico_tipo
        CHECK (tipo IN ('Ambulância', 'Bombeiros', 'Polícia'))
);


-- INFRACAO depende de ALERTA e AGENTE_TRANSITO
CREATE TABLE infracao (
    id_infracao SERIAL PRIMARY KEY,
    id_alerta INTEGER NOT NULL,
    id_agente INTEGER NOT NULL,
    tipo_infracao VARCHAR(100) NOT NULL,
    descricao TEXT,
    valor_multa NUMERIC(10,2) NOT NULL,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'Pendente',

    CONSTRAINT fk_infracao_alerta
        FOREIGN KEY (id_alerta)
        REFERENCES alerta(id_alerta)
        ON DELETE CASCADE,

    CONSTRAINT fk_infracao_agente
        FOREIGN KEY (id_agente)
        REFERENCES agente_transito(id_agente)
        ON DELETE RESTRICT,

    CONSTRAINT ck_infracao_valor
        CHECK (valor_multa >= 0),

    CONSTRAINT ck_infracao_status
        CHECK (status IN ('Pendente', 'Paga', 'Cancelada'))
);