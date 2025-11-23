📦 Sistema de Gestão de Materiais de Merchandising

Atividade: Experiência Prática IV - Implementação e Manipulação de Dados (SQL)

Curso: Análise e Desenvolvimento de Sistemas

Autor: Fabricio Walace Silva

📖 Sobre o Projeto

Este projeto consiste na implementação física do modelo de banco de dados para um Sistema de Gestão de Materiais de Merchandising. O objetivo é controlar o estoque e a movimentação (entradas e saídas) de itens promocionais (como mesas, cadeiras, cervegelas e banners) utilizados por grandes marcas de bebidas em pontos de venda.

O banco de dados foi modelado seguindo rigorosamente as Formas Normais (até a 3FN) para garantir a integridade e evitar redundância de dados.

🎯 Objetivos da Atividade

Implementação DDL: Criação de tabelas, chaves primárias (PK) e chaves estrangeiras (FK) no PostgreSQL.

Manipulação DML: Inserção de dados realistas, atualizações de registros e exclusões lógicas/físicas.

Consultas DQL: Elaboração de relatórios complexos utilizando JOIN, GROUP BY e funções de agregação.

🛠️ Tecnologias Utilizadas

Linguagem: SQL (Structured Query Language)

Banco de Dados: PostgreSQL

Modelagem: brModelo / DBDiagram.io

Ferramenta de Gestão: pgAdmin 4 / DBeaver

📂 Estrutura do Banco de Dados

O script script_banco_dados_completo.sql contém toda a estrutura necessária para recriar o banco de dados do zero. As principais tabelas são:

Cadastros Principais: Cliente, Colaborador, Material.

Domínios/Categorias: Marca, Tipo_Material, Classe_Material, Cargo.

Transacional: Nota_Fiscal_Entrada, Item_Entrada, Saida_Material.

🚀 Como Executar o Projeto

Pré-requisitos

Ter o PostgreSQL instalado em sua máquina.

Ter uma ferramenta cliente (como pgAdmin ou DBeaver).

Passo a Passo

Clone o repositório:

git clone [https://github.com/SEU-USUARIO/NOME-DO-REPOSITORIO.git](https://github.com/SEU-USUARIO/NOME-DO-REPOSITORIO.git)


Abra o script SQL:
Localize o arquivo script_banco_dados_completo.sql na pasta do projeto.

Execute no Banco de Dados:

Crie um novo banco de dados (ex: merchandising_db).

Abra a ferramenta de Query (SQL Editor).

Copie e cole o conteúdo do script.

Execute o script completo (F5 no pgAdmin).

📊 Funcionalidades Demonstradas no Script

O arquivo SQL não apenas cria as tabelas, mas também executa um roteiro de testes completo:

Carga de Dados: Popula o banco com marcas reais (Heineken, Amstel), colaboradores e clientes fictícios.

Atualizações (UPDATE):

Exemplo: Reajuste de 10% nos preços de produtos de uma marca específica.

Exemplo: Atualização de contato de clientes.

Relatórios (SELECT):

Saldo de estoque valorizado (Qtd * Valor Unitário).

Ranking de clientes que mais solicitam materiais.

Histórico de entradas com detalhes da Nota Fiscal.

📝 Licença

Este projeto foi desenvolvido para fins acadêmicos. Sinta-se à vontade para utilizar como referência de estudo.

Desenvolvido por Fabricio Walace Silva
