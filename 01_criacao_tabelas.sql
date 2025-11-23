-- #################################################################
-- ARQUIVO 01: CRIAÇÃO DA ESTRUTURA (DDL)
-- #################################################################

-- 1. LIMPEZA DO AMBIENTE (Apaga tabelas antigas para evitar erros de recriação)
DROP TABLE IF EXISTS Saida_Material CASCADE;
DROP TABLE IF EXISTS Item_Entrada CASCADE;
DROP TABLE IF EXISTS Nota_Fiscal_Entrada CASCADE;
DROP TABLE IF EXISTS Endereco CASCADE;
DROP TABLE IF EXISTS Contato CASCADE;
DROP TABLE IF EXISTS Material CASCADE;
DROP TABLE IF EXISTS Cliente CASCADE;
DROP TABLE IF EXISTS Colaborador CASCADE;
DROP TABLE IF EXISTS Classificacao_Cliente CASCADE;
DROP TABLE IF EXISTS Cargo CASCADE;
DROP TABLE IF EXISTS Classe_Material CASCADE;
DROP TABLE IF EXISTS Tipo_Material CASCADE;
DROP TABLE IF EXISTS Marca CASCADE;

-- 2. CRIAÇÃO DAS TABELAS

CREATE TABLE Marca (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Tipo_Material (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Classe_Material (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Cargo (
    id SERIAL PRIMARY KEY,
    nome_cargo VARCHAR(50),
    descricao_cargo VARCHAR(255)
);

CREATE TABLE Classificacao_Cliente (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(30),
    regras_comerciais TEXT
);

CREATE TABLE Colaborador (
    colaborador_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    cargo_id INT REFERENCES Cargo(id)
);

CREATE TABLE Cliente (
    cod_cliente SERIAL PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    classificacao_id INT REFERENCES Classificacao_Cliente(id),
    supervisor_id INT REFERENCES Colaborador(colaborador_id),
    vendedor_id INT REFERENCES Colaborador(colaborador_id)
);

CREATE TABLE Material (
    cod_material SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    marca_id INT REFERENCES Marca(id),
    tipo_id INT REFERENCES Tipo_Material(id),
    classe_id INT REFERENCES Classe_Material(id),
    valor_unitario_venda DECIMAL(10, 2),
    estoque_atual INT DEFAULT 0
);

CREATE TABLE Contato (
    contato_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES Cliente(cod_cliente) ON DELETE CASCADE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Endereco (
    endereco_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES Cliente(cod_cliente) ON DELETE CASCADE,
    tipo_endereco VARCHAR(50), -- Ex: Entrega, Cobrança
    cep CHAR(9),
    estado CHAR(2),
    cidade VARCHAR(50),
    bairro VARCHAR(50),
    rua VARCHAR(100),
    numero VARCHAR(10)
);

CREATE TABLE Nota_Fiscal_Entrada (
    nota_id SERIAL PRIMARY KEY,
    numero_nota_fiscal VARCHAR(50) NOT NULL,
    data_emissao DATE,
    valor_total_nota DECIMAL(12, 2) NOT NULL,
    data_lancamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Item_Entrada (
    item_id SERIAL PRIMARY KEY,
    nota_id INT REFERENCES Nota_Fiscal_Entrada(nota_id) ON DELETE CASCADE,
    material_id INT REFERENCES Material(cod_material),
    quantidade INT,
    valor_unitario_compra DECIMAL(12, 2)
);

CREATE TABLE Saida_Material (
    saida_id SERIAL PRIMARY KEY,
    material_id INT REFERENCES Material(cod_material),
    cliente_id INT REFERENCES Cliente(cod_cliente),
    responsavel_retirada_id INT REFERENCES Colaborador(colaborador_id), -- Quem retirou
    supervisor_id INT REFERENCES Colaborador(colaborador_id),           -- Quem autorizou
    data_retirada DATE DEFAULT CURRENT_DATE,
    quantidade_retirada INT
);
