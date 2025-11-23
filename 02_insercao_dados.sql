-- #################################################################
-- ARQUIVO 02: INSERÇÃO DE DADOS INICIAIS (DML)
-- #################################################################

-- 1. Tabelas de Domínio (Sem chave estrangeira)
INSERT INTO Marca (nome) VALUES ('Heineken'), ('Amstel'), ('Coca-Cola'), ('Eisenbahn');
INSERT INTO Tipo_Material (nome) VALUES ('Mesa'), ('Cadeira'), ('Cervegela'), ('Banner'), ('Copo');
INSERT INTO Classe_Material (nome) VALUES ('Premium'), ('Standard'), ('Eventos');
INSERT INTO Cargo (nome_cargo, descricao_cargo) VALUES 
('Supervisor', 'Gestão de equipe de vendas'), 
('Vendedor', 'Atendimento direto ao cliente'), 
('Promotor', 'Responsável pela ativação e retirada de materiais');
INSERT INTO Classificacao_Cliente (descricao, regras_comerciais) VALUES 
('Ouro', 'Prioridade alta, investimento mensal'), 
('Prata', 'Investimento trimestral'), 
('Bronze', 'Apenas materiais básicos');

-- 2. Colaboradores (Depende de Cargo)
INSERT INTO Colaborador (nome, matricula, cargo_id) VALUES
('Carlos Silva', 'MAT001', 1), -- Supervisor
('Fernanda Souza', 'MAT002', 2), -- Vendedor
('Roberto Lima', 'MAT003', 3); -- Promotor (Retirada)

-- 3. Clientes (Depende de Classificação e Colaborador)
INSERT INTO Cliente (razao_social, cnpj, classificacao_id, supervisor_id, vendedor_id) VALUES
('Bar do Zé Ltda', '12345678000199', 1, 1, 2),
('Restaurante Sabor Mineiro', '98765432000188', 2, 1, 2),
('Supermercado Preço Bom', '11222333000177', 3, 1, 2);

-- 4. Detalhes do Cliente
INSERT INTO Endereco (cliente_id, tipo_endereco, cep, estado, cidade, bairro, rua, numero) VALUES
(1, 'Principal', '30000-000', 'MG', 'Belo Horizonte', 'Centro', 'Av. Afonso Pena', '1000'),
(2, 'Entrega', '31000-100', 'MG', 'Contagem', 'Industrial', 'Rua das Indústrias', '500');

INSERT INTO Contato (cliente_id, email, telefone) VALUES
(1, 'ze@bardoze.com.br', '(31) 99999-0001'),
(2, 'contato@sabormineiro.com', '(31) 3333-4444');

-- 5. Materiais (Depende de Marca, Tipo e Classe)
INSERT INTO Material (descricao, marca_id, tipo_id, classe_id, valor_unitario_venda, estoque_atual) VALUES
('Mesa de Plástico Verde', 1, 1, 2, 150.00, 0),
('Cervegela 600ml', 1, 3, 2, 15.00, 0),
('Banner Promocional Verão', 2, 4, 3, 50.00, 0),
('Copo Caldereta 350ml', 3, 5, 2, 8.50, 0);

-- 6. Movimentação de Entrada (Abastecimento)
INSERT INTO Nota_Fiscal_Entrada (numero_nota_fiscal, data_emissao, valor_total_nota) VALUES
('NF-001/2023', '2023-10-01', 5000.00),
('NF-002/2023', '2023-10-05', 1200.00);

INSERT INTO Item_Entrada (nota_id, material_id, quantidade, valor_unitario_compra) VALUES
(1, 1, 20, 100.00), -- 20 Mesas
(1, 2, 100, 10.00), -- 100 Cervegelas
(2, 4, 200, 5.00);  -- 200 Copos

-- Simulando trigger de entrada (Atualiza estoque)
UPDATE Material SET estoque_atual = estoque_atual + 20 WHERE cod_material = 1;
UPDATE Material SET estoque_atual = estoque_atual + 100 WHERE cod_material = 2;
UPDATE Material SET estoque_atual = estoque_atual + 200 WHERE cod_material = 4;

-- 7. Movimentação de Saída (Ativação)
INSERT INTO Saida_Material (material_id, cliente_id, responsavel_retirada_id, supervisor_id, data_retirada, quantidade_retirada) VALUES
(1, 1, 3, 1, '2023-10-10', 4), -- 4 Mesas para o Bar do Zé
(2, 1, 3, 1, '2023-10-10', 10); -- 10 Cervegelas para o Bar do Zé

-- Simulando trigger de saída (Baixa estoque)
UPDATE Material SET estoque_atual = estoque_atual - 4 WHERE cod_material = 1;
UPDATE Material SET estoque_atual = estoque_atual - 10 WHERE cod_material = 2;
