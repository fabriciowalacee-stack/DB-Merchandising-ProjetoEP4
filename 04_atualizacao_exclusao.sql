-- #################################################################
-- ARQUIVO 04: ATUALIZAÇÕES E EXCLUSÕES (DML DE MANUTENÇÃO)
-- #################################################################

-- --- EXEMPLOS DE UPDATE ---

-- 1. Corrigir o e-mail de um contato
UPDATE Contato 
SET email = 'gerencia@bardoze.com.br' 
WHERE cliente_id = 1;

-- 2. Atualizar o valor de venda de um material (inflação)
UPDATE Material 
SET valor_unitario_venda = valor_unitario_venda * 1.10 
WHERE marca_id = 1; -- Aumenta 10% em tudo da Heineken

-- 3. Transferir um cliente para um novo vendedor
UPDATE Cliente 
SET vendedor_id = 1 
WHERE cod_cliente = 3;

-- --- EXEMPLOS DE DELETE ---

-- 1. Excluir um endereço antigo (não é o principal)
-- Obs: Como não inserimos o tipo 'Antigo' no script 02, este comando não afetará linhas, mas serve como exemplo de sintaxe.
DELETE FROM Endereco 
WHERE cliente_id = 2 AND tipo_endereco = 'Antigo';

-- 2. Remover um item de entrada lançado incorretamente
-- Primeiro vamos inserir um dado errado só para poder apagar depois:
INSERT INTO Item_Entrada (nota_id, material_id, quantidade, valor_unitario_compra) VALUES (1, 3, 1, 50.00);
-- Agora apagamos:
DELETE FROM Item_Entrada WHERE material_id = 3 AND quantidade = 1;

-- 3. Apagar uma marca que não tem materiais vinculados
-- Criamos a marca para teste:
INSERT INTO Marca (nome) VALUES ('Marca Fantasma');
-- Apagamos a marca:
DELETE FROM Marca WHERE nome = 'Marca Fantasma';
