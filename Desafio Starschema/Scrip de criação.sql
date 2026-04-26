CREATE DATABASE IF NOT EXISTS dw_universidade_professor
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE dw_universidade_professor;

CREATE TABLE DIM_PROFESSOR (
    sk_professor INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT NOT NULL,
    nome_professor VARCHAR(100),
    titulo_academico VARCHAR(50),
    data_admissao DATE,
    situacao VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE DIM_DEPARTAMENTO (
    sk_departamento INT AUTO_INCREMENT PRIMARY KEY,
    id_departamento INT NOT NULL,
    nome_departamento VARCHAR(100),
    campus VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE DIM_DISCIPLINA (
    sk_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    id_disciplina INT NOT NULL,
    nome_disciplina VARCHAR(100),
    carga_horaria INT,
    possui_pre_requisito BOOLEAN
) ENGINE=InnoDB;

CREATE TABLE DIM_CURSO (
    sk_curso INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    nome_curso VARCHAR(100),
    nivel VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE DIM_TEMPO (
    sk_tempo INT AUTO_INCREMENT PRIMARY KEY,
    data_completa DATE NOT NULL,
    dia INT,
    mes INT,
    nome_mes VARCHAR(20),
    ano INT,
    trimestre INT,
    semestre INT,
    ano_semestre VARCHAR(10),
    periodo_letivo VARCHAR(10),
    data_inicio_semestre DATE,
    data_fim_semestre DATE
) ENGINE=InnoDB;

CREATE TABLE FATO_PROFESSOR_OFERTA (
    sk_professor INT NOT NULL,
    sk_disciplina INT NOT NULL,
    sk_curso INT NOT NULL,
    sk_departamento INT NOT NULL,
    sk_tempo INT NOT NULL,

    quantidade_disciplinas INT DEFAULT 1,
    carga_horaria_disciplina INT,

    PRIMARY KEY (
        sk_professor,
        sk_disciplina,
        sk_curso,
        sk_departamento,
        sk_tempo
    ),

    CONSTRAINT fk_fato_professor
        FOREIGN KEY (sk_professor)
        REFERENCES DIM_PROFESSOR (sk_professor),

    CONSTRAINT fk_fato_disciplina
        FOREIGN KEY (sk_disciplina)
        REFERENCES DIM_DISCIPLINA (sk_disciplina),

    CONSTRAINT fk_fato_curso
        FOREIGN KEY (sk_curso)
        REFERENCES DIM_CURSO (sk_curso),

    CONSTRAINT fk_fato_departamento
        FOREIGN KEY (sk_departamento)
        REFERENCES DIM_DEPARTAMENTO (sk_departamento),

    CONSTRAINT fk_fato_tempo
        FOREIGN KEY (sk_tempo)
        REFERENCES DIM_TEMPO (sk_tempo)

) ENGINE=InnoDB;