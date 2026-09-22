# Atendimento a Chamados

---

## MER Conceitual e Lógico

![MER Conceitual/Lógico](DiagramaLógico-Conceitual.png)

---

# Dicionário de Dados

| Entidade | Atributo | Tipo | Tamanho | Descrição |
|-----------|-----------|--------|----------|-------------|
| Usuario | id | INT | 11 | Chave Primária |
| Usuario | nome | VARCHAR | 100 | Nome do usuário |
| Usuario | email | VARCHAR | 100 | E-mail |
| Usuario | telefone | VARCHAR | 20 | Telefone |
| Usuario | departamento | VARCHAR | 50 | Departamento |
| Usuario | cargo | VARCHAR | 50 | Cargo |
| Usuario | status | VARCHAR | 20 | Status |
| Tecnico | id | INT | 11 | Chave Primária |
| Tecnico | nome | VARCHAR | 100 | Nome do técnico |
| Tecnico | email | VARCHAR | 100 | E-mail |
| Tecnico | especialidade | VARCHAR | 100 | Especialidade |
| Tecnico | status | VARCHAR | 20 | Status |
| Categoria | id | INT | 11 | Chave Primária |
| Categoria | nome | VARCHAR | 50 | Nome da categoria |
| Categoria | descricao | VARCHAR | 255 | Descrição |
| Chamado | id | INT | 11 | Chave Primária |
| Chamado | titulo | VARCHAR | 100 | Título |
| Chamado | descricao | VARCHAR | 255 | Descrição |
| Chamado | data_abertura | DATE | - | Data de abertura |
| Chamado | data_fechamento | DATE | - | Data de fechamento |
| Chamado | status | VARCHAR | 20 | Status |
| Chamado | prioridade | VARCHAR | 20 | Prioridade |
| Chamado | id_usuario | INT | 11 | FK Usuario |
| Chamado | id_categoria | INT | 11 | FK Categoria |
| Chamado | id_tecnico | INT | 11 | FK Tecnico |
| Historico_Comentarios | id | INT | 11 | Chave Primária |
| Historico_Comentarios | id_chamado | INT | 11 | FK Chamado |
| Historico_Comentarios | id_usuario | INT | 11 | FK Usuario |
| Historico_Comentarios | data_hora | DATETIME | - | Data e hora |
| Historico_Comentarios | descricao | VARCHAR | 255 | Comentário |
| Historico_Comentarios | tipo | VARCHAR | 30 | Tipo da ação |

---

# Dados de Teste

Os dados de teste estão disponíveis nos arquivos CSV abaixo:

- [usuario.csv](usuario.csv)
- [tecnico.csv](tecnico.csv)
- [categoria.csv](categoria.csv)
- [chamado.csv](chamado.csv)
- [historico.csv](historico.csv)

---

# DDL

```sql
CREATE DATABASE atendimento_chamados;
USE atendimento_chamados;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    departamento VARCHAR(50),
    cargo VARCHAR(50),
    status VARCHAR(20)
);

CREATE TABLE tecnico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    especialidade VARCHAR(100),
    status VARCHAR(20)
);

CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255)
);

CREATE TABLE chamado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descricao VARCHAR(255),
    data_abertura DATE,
    data_fechamento DATE,
    status VARCHAR(20),
    prioridade VARCHAR(20),
    id_usuario INT,
    id_categoria INT,
    id_tecnico INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_tecnico) REFERENCES tecnico(id)
);

CREATE TABLE historico_comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_chamado INT,
    id_usuario INT,
    data_hora DATETIME,
    descricao VARCHAR(255),
    tipo VARCHAR(30),
    FOREIGN KEY (id_chamado) REFERENCES chamado(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

---

# DML

```sql
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
