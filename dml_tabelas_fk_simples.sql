-- dml_tabelas_fk_simples.sql

-- VEICULO
INSERT INTO veiculo
(id_usuario, placa, modelo, marca, ano, cor)
VALUES
(1, 'ABC1D23', 'Civic', 'Honda', 2022, 'Preto');

INSERT INTO veiculo
(id_usuario, placa, modelo, marca, ano, cor)
VALUES
(1, 'DEF4G56', 'Corolla', 'Toyota', 2021, 'Branco');

INSERT INTO veiculo
(id_usuario, placa, modelo, marca, ano, cor)
VALUES
(2, 'GHI7J89', 'Onix', 'Chevrolet', 2023, 'Prata');

INSERT INTO veiculo
(id_usuario, placa, modelo, marca, ano, cor)
VALUES
(3, 'KLM1N23', 'HB20', 'Hyundai', 2020, 'Vermelho');


-- CONTATO_CONFIANCA
INSERT INTO contato_confianca
(id_usuario, nome, telefone, parentesco, email)
VALUES
(1, 'Maria Silva', '44988880001', 'Mãe', 'maria@email.com');

INSERT INTO contato_confianca
(id_usuario, nome, telefone, parentesco, email)
VALUES
(1, 'Lucas Silva', '44988880002', 'Irmão', 'lucas@email.com');

INSERT INTO contato_confianca
(id_usuario, nome, telefone, parentesco, email)
VALUES
(2, 'Fernanda Costa', '44988880003', 'Mãe', 'fernanda@email.com');


-- VIAGEM
INSERT INTO viagem
(id_veiculo, data_inicio, data_fim, origem, destino, distancia_km)
VALUES
(1, '2026-08-12 07:30:00', '2026-08-12 08:10:00',
 'Maringá', 'Sarandi', 18.50);

INSERT INTO viagem
(id_veiculo, data_inicio, data_fim, origem, destino, distancia_km)
VALUES
(1, '2026-08-12 13:00:00', '2026-08-12 13:45:00',
 'Sarandi', 'Maringá', 19.20);

INSERT INTO viagem
(id_veiculo, data_inicio, data_fim, origem, destino, distancia_km)
VALUES
(2, '2026-08-12 09:00:00', '2026-08-12 10:00:00',
 'Maringá', 'Paiçandu', 22.70);

INSERT INTO viagem
(id_veiculo, data_inicio, data_fim, origem, destino, distancia_km)
VALUES
(3, '2026-08-12 10:00:00', '2026-08-12 10:35:00',
 'Maringá', 'Sarandi', 17.80);


-- ALERTA
INSERT INTO alerta
(id_viagem, tipo_alerta, descricao, nivel_risco, status)
VALUES
(1, 'Velocidade',
 'Veículo ultrapassou o limite de velocidade permitido.',
 'Alto',
 'Ativo');

INSERT INTO alerta
(id_viagem, tipo_alerta, descricao, nivel_risco, status)
VALUES
(2, 'Rota Perigosa',
 'Veículo entrou em uma região considerada perigosa.',
 'Médio',
 'Enviado');

INSERT INTO alerta
(id_viagem, tipo_alerta, descricao, nivel_risco, status)
VALUES
(3, 'Álcool',
 'Possível presença de álcool detectada.',
 'Alto',
 'Resolvido');

INSERT INTO alerta
(id_viagem, tipo_alerta, descricao, nivel_risco, status)
VALUES
(4, 'Velocidade',
 'Velocidade acima do limite permitido.',
 'Baixo',
 'Ativo');


-- SERVICO_EMERGENCIA
INSERT INTO servico_emergencia
(id_alerta, nome, tipo, telefone)
VALUES
(1, 'SAMU Maringá', 'Ambulância', '192');

INSERT INTO servico_emergencia
(id_alerta, nome, tipo, telefone)
VALUES
(1, 'Corpo de Bombeiros', 'Bombeiros', '193');

INSERT INTO servico_emergencia
(id_alerta, nome, tipo, telefone)
VALUES
(2, 'Polícia Militar', 'Polícia', '190');

INSERT INTO servico_emergencia
(id_alerta, nome, tipo, telefone)
VALUES
(3, 'SAMU Maringá', 'Ambulância', '192');


-- INFRACAO
INSERT INTO infracao
(id_alerta, id_agente, tipo_infracao, descricao, valor_multa, status)
VALUES
(1, 1, 'Excesso de velocidade',
 'Veículo registrado acima do limite permitido.',
 293.47,
 'Pendente');

INSERT INTO infracao
(id_alerta, id_agente, tipo_infracao, descricao, valor_multa, status)
VALUES
(3, 2, 'Direção sob influência de álcool',
 'Condutor apresentou indícios de embriaguez.',
 2934.70,
 'Paga');

INSERT INTO infracao
(id_alerta, id_agente, tipo_infracao, descricao, valor_multa, status)
VALUES
(4, 3, 'Excesso de velocidade',
 'Velocidade superior ao limite da via.',
 195.23,
 'Pendente');