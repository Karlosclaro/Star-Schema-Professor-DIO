# 📊 Data Base Star Schema – Professor

Este projeto apresenta a modelagem e implementação de um **Data Warehouse** utilizando o **Esquema Estrela (Star Schema)**, com foco na análise de dados relacionados aos **professores**, suas disciplinas ministradas, cursos atendidos, departamentos e períodos acadêmicos.

O modelo foi desenvolvido a partir de um diagrama relacional de uma universidade e transformado em um modelo dimensional, seguindo as **boas práticas de Data Warehouse**.

---

## 🎯 Objetivo do Projeto

O principal objetivo deste projeto é:

- Criar um **modelo dimensional (Star Schema)** a partir de um modelo relacional
- Definir o **Professor como objeto central de análise**
- Permitir análises históricas e gerenciais sobre:
  - Disciplinas ministradas
  - Cursos atendidos
  - Departamentos
  - Períodos acadêmicos (tempo)

📌 **Observação:** Dados relacionados a alunos não fazem parte do escopo deste projeto.

---

## 🧠 Abordagem de Modelagem

Foi adotado o **Star Schema clássico**, no qual:

- Existe **uma única tabela fato** central
- Todas as **tabelas dimensão se relacionam diretamente com a tabela fato**
- **Não há normalização entre dimensões**, evitando o padrão Snowflake
- Utilizam-se **chaves substitutas (surrogate keys)** para garantir independência do modelo relacional

---

## ⭐ Estrutura do Esquema Estrela

### Diagrama Conceitual (Visão Lógica)

              DIM_PROFESSOR
                   |

    DIM_DISCIPLINA — FATO_PROFESSOR_OFERTA — DIM_CURSO
                    |
              DIM_DEPARTAMENTO
                    |
                DIM_TEMPO
---

## 🧱 Tabela Fato

### `FATO_PROFESSOR_OFERTA`

Representa os eventos de **oferta de disciplinas por professores**, relacionados a cursos, departamentos e períodos acadêmicos.

**Granularidade:**
> Um professor ministrando uma disciplina, vinculada a um curso e departamento, em um determinado período acadêmico.

**Principais métricas:**
- Quantidade de disciplinas ofertadas
- Carga horária da disciplina

---

## 📘 Tabelas Dimensão

### 👨‍🏫 `DIM_PROFESSOR`
Armazena os dados descritivos do professor.

**Exemplos de atributos:**
- Nome do professor
- Título acadêmico
- Data de admissão
- Situação funcional

---

### 📚 `DIM_DISCIPLINA`
Representa as disciplinas ministradas.

**Exemplos de atributos:**
- Nome da disciplina
- Carga horária
- Indicador de pré-requisito

---

### 🎓 `DIM_CURSO`
Armazena os cursos oferecidos pela instituição.

**Exemplos de atributos:**
- Nome do curso
- Nível (Graduação, Pós-graduação, etc.)

---

### 🏢 `DIM_DEPARTAMENTO`
Representa os departamentos acadêmicos.

**Exemplos de atributos:**
- Nome do departamento
- Campus

---

### 📅 `DIM_TEMPO`
Dimensão responsável pelo controle temporal do Data Warehouse.

Mesmo não existindo no modelo relacional original, esta dimensão foi criada para permitir **análises históricas**, considerando períodos acadêmicos.

**Exemplos de atributos:**
- Data completa
- Ano
- Semestre
- Período letivo
- Datas de início e fim do semestre

---

## 🗄️ Banco de Dados

O projeto utiliza um banco de dados dedicado ao Data Base:
dw_universidade_professor
- SGBD: **MySQL**
- Engine: **InnoDB**
- Charset: **utf8mb4**

---

## 🚀 Tecnologias Utilizadas

- **MySQL 8.x**
- Modelagem Dimensional
- SQL (DDL)
- Conceitos de Data Warehouse e OLAP

---

## ✅ Principais Características do Modelo

✔ Star Schema puro (sem snowflake)  
✔ Dimensões ligadas diretamente à tabela fato  
✔ Separação clara entre dados transacionais e analíticos  
✔ Pronto para consultas OLAP e ferramentas de BI  
---

## 📈 Exemplos de Análises Possíveis

- Quantas disciplinas cada professor ministrou por semestre
- Carga horária total por professor e departamento
- Professores que atuaram em mais de um curso no mesmo período
- Evolução da atuação docente ao longo dos anos

---

## 📄 Considerações Finais

Este projeto demonstra a aplicação prática da transformação de um modelo relacional em um modelo dimensional, evidenciando as vantagens do **esquema estrela** para análise de dados educacionais, com foco no desempenho, simplicidade e clareza analítica.

---

## 👤 Autor

Projeto desenvolvido para fins acadêmicos, com foco em **Data Warehouse e Modelagem Dimensional**.
