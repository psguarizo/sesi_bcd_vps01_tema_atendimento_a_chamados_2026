INSERT INTO usuario VALUES
(1,'João Silva','joao@empresa.com','19999999999','Financeiro','Analista','Ativo'),
(2,'Maria Souza','maria@empresa.com','19988888888','RH','Assistente','Ativo'),
(3,'Carlos Lima','carlos@empresa.com','19977777777','TI','Coordenador','Ativo');

INSERT INTO tecnico VALUES
(1,'Pedro Santos','pedro@empresa.com','Hardware','Ativo'),
(2,'Ana Costa','ana@empresa.com','Software','Ativo'),
(3,'Lucas Alves','lucas@empresa.com','Redes','Ativo');

INSERT INTO categoria VALUES
(1,'Hardware','Problemas físicos em equipamentos'),
(2,'Software','Problemas em sistemas e programas'),
(3,'Rede','Falhas de conexão e internet');

INSERT INTO chamado VALUES
(1,'Computador não liga','Equipamento não inicia','2026-09-01','2026-09-02','Fechado','Alta',1,1,1),
(2,'Erro no sistema','Falha ao acessar ERP','2026-09-03',NULL,'Em Andamento','Media',2,2,2),
(3,'Internet lenta','Conexão instável','2026-09-05',NULL,'Aberto','Baixa',3,3,3);

INSERT INTO historico_comentarios VALUES
(1,1,1,'2026-09-01 08:00:00','Abertura do chamado','Abertura'),
(2,1,1,'2026-09-02 14:00:00','Problema resolvido','Solucao'),
(3,2,2,'2026-09-03 10:30:00','Tecnico designado','Atualizacao');