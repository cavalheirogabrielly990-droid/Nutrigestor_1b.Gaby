-- dml_tabelas_simples.sql

INSERT INTO usuario
(nome, email, senha, tipo_usuario, status)
VALUES
('Ana Silva', 'ana@email.com', 'senha123', 'Motorista', 'Ativo');

INSERT INTO usuario
(nome, email, senha, tipo_usuario, status)
VALUES
('Bruno Costa', 'bruno@email.com', 'senha456', 'Motorista', 'Ativo');

INSERT INTO usuario
(nome, email, senha, tipo_usuario, status)
VALUES
('Carlos Souza', 'carlos@email.com', 'senha789', 'Operador', 'Ativo');


INSERT INTO agente_transito
(nome, matricula, telefone, email)
VALUES
('João Santos', 'AG001', '44999990001', 'joao@transito.com');

INSERT INTO agente_transito
(nome, matricula, telefone, email)
VALUES
('Marcos Oliveira', 'AG002', '44999990002', 'marcos@transito.com');

INSERT INTO agente_transito
(nome, matricula, telefone, email)
VALUES
('Pedro Almeida', 'AG003', '44999990003', 'pedro@transito.com');