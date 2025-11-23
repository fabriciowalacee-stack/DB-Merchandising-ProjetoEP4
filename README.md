🛒 Sistema de Gestão de Materiais de Merchandising

Trabalho Acadêmico: Experiência Prática IV - Banco de Dados

Aluno: Fabricio Walace Silva

Status: Concluído ✅

📄 Sobre o Projeto

Olá! 👋 Esse repositório contém os scripts SQL do meu projeto de Modelagem de Banco de Dados.

O objetivo desse trabalho foi criar um banco de dados do zero para controlar o estoque de materiais de merchandising (aquelas mesas, cadeiras, baldes de gelo e banners de marcas de bebidas como Heineken e Amstel) que são enviados para bares e restaurantes.

O projeto passou por várias fases (Conceitual, Lógico) e agora chegamos na Implementação Física (SQL).

🛠️ Tecnologias Usadas

🐘 PostgreSQL (Banco de Dados Relacional)

💻 SQL (Linguagem de consulta)

📝 pgAdmin 4 (Para testar os scripts)

📂 O que tem neste repositório?

O arquivo principal é o script_banco_dados_completo.sql. Ele faz tudo o que foi pedido na atividade:

Cria as Tabelas (DDL):

O banco está na 3ª Forma Normal (3FN).

Tabelas principais: Material, Cliente, Colaborador.

Tabelas de movimento: Entrada (Nota Fiscal) e Saida (Retirada por vendedor).

Insere Dados (DML):

Já deixei o script com dados de exemplo (Marcas reais, clientes fictícios) para testar se tudo funciona.

Manipula Dados:

Comandos de UPDATE (ex: reajustar preço, corrigir e-mail).

Comandos de DELETE (ex: apagar registros errados).

Relatórios (SELECT):

Fiz 5 consultas usando JOIN, GROUP BY e filtros para mostrar informações úteis, como "Quem são os clientes que mais pedem material?".

🚀 Como rodar o projeto

Se você quiser testar no seu computador, é bem simples:

Tenha o PostgreSQL e o pgAdmin instalados.

Crie um banco de dados novo (pode chamar de merchandising_db).

Abra a Query Tool (Ferramenta de Consulta).

Copie todo o código do arquivo script_banco_dados_completo.sql.

Cole na ferramenta e aperte o botão de Executar (ou F5).

Pronto! Todas as tabelas serão criadas e os dados inseridos automaticamente.

🧠 O que eu aprendi

Com essa atividade, consegui colocar em prática:

Como transformar o diagrama lógico (desenho) em código CREATE TABLE.

A importância de definir bem as Chaves Estrangeiras (Foreign Keys) para não deixar cadastrar dados órfãos.

Como fazer consultas mais complexas ligando várias tabelas (o famoso INNER JOIN).

Feito por Fabricio Walace Silva para a atividade de Banco de Dados. 🚀
