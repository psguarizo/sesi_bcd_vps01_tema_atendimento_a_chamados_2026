DROP DATABASE IF EXISTS atendimento_chamados;
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