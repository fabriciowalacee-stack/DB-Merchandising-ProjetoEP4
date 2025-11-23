-- #################################################################
-- ARQUIVO 03: RELATÓRIOS E CONSULTAS (DQL)
-- #################################################################

-- Consulta 1: Saldo de Estoque Valorizado (Quanto dinheiro tenho parado em materiais?)
SELECT 
    m.descricao AS Material,
    mar.nome AS Marca,
    m.estoque_atual AS Qtd_Estoque,
    m.valor_unitario_venda,
    (m.estoque_atual * m.valor_unitario_venda) AS Valor_Total_Venda
FROM Material m
JOIN Marca mar ON m.marca_id = mar.id
ORDER BY Valor_Total_Venda DESC;

-- Consulta 2: Relatório de Saídas por Cliente (Quem está pedindo mais material?)
SELECT 
    c.razao_social AS Cliente,
    COUNT(s.saida_id) AS Total_Solicitacoes,
    SUM(s.quantidade_retirada) AS Qtd_Itens_Retirados
FROM Saida_Material s
JOIN Cliente c ON s.cliente_id = c.cod_cliente
GROUP BY c.razao_social
HAVING SUM(s.quantidade_retirada) > 5;

-- Consulta 3: Histórico de Entradas com Detalhes da Nota
SELECT 
    nf.numero_nota_fiscal,
    nf.data_emissao,
    m.descricao AS Material,
    ie.quantidade AS Qtd_Comprada,
    ie.valor_unitario_compra
FROM Item_Entrada ie
JOIN Nota_Fiscal_Entrada nf ON ie.nota_id = nf.nota_id
JOIN Material m ON ie.material_id = m.cod_material
WHERE nf.data_emissao > '2023-01-01';

-- Consulta 4: Clientes e seus Responsáveis (Join Triplo)
SELECT 
    cli.razao_social AS Cliente,
    vend.nome AS Vendedor_Responsavel,
    sup.nome AS Supervisor_Responsavel
FROM Cliente cli
JOIN Colaborador vend ON cli.vendedor_id = vend.colaborador_id
JOIN Colaborador sup ON cli.supervisor_id = sup.colaborador_id;

-- Consulta 5: Materiais Sem Estoque (Para reposição)
SELECT * FROM Material WHERE estoque_atual <= 0;
