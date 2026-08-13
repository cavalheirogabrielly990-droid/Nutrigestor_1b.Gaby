-- ddl_tabelas_simples.sql

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL,
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',

    CONSTRAINT ck_usuario_tipo
        CHECK (tipo_usuario IN ('Motorista', 'Operador', 'Agente')),

    CONSTRAINT ck_usuario_status
        CHECK (status IN ('Ativo', 'Inativo'))
);

CREATE TABLE agente_transito (
    id_agente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(30) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150) UNIQUE
);