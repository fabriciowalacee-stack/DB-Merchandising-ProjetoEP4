# Projeto de Banco de Dados: Controle de Estoque de Merchandising

Este é meu  projeto prático de banco de dados.

O objetivo aqui foi criar um banco de dados do zero usando **SQL** para me ajudar a controlar o estoque de materiais de merchandising.

### O que é "Merchandising" aqui?
São aqueles materiais que marcas de bebidas (tipo Heineken, Amstel) mandam para bares e restaurantes:
* Mesas e cadeiras
* Baldes de gelo
* Banners e luminosos

Eu modelei o banco de dados e agora estou na parte de **Implementação** (transformar o desenho em código de verdade!).

---

## Organização dos Arquivos

Aqui você vai encontrar os scripts SQL que eu usei. Eles estão numerados e é **muito importante** que você execute eles nessa ordem para tudo funcionar:

1.  `01_criacao_tabelas.sql`: Onde eu crio toda a estrutura do banco (as tabelas, colunas, etc.).
2.  `02_insercao_dados.sql`: Arquivo para colocar alguns dados de teste (ex: cadastrar a Heineken, um bar, e um item de estoque).
3.  `03_consultas.sql`: Exemplos de como buscar informações, como "Quais materiais o Bar do Zé recebeu?".
4.  `04_atualizacao_exclusao.sql`: Scripts para testar como eu altero ou apago algum dado do banco.

---

## Como rodar o projeto

Se você quiser testar no seu PC, é simples:

1.  Você precisa ter o **PostgreSQL** instalado (é o banco de dados que usei).
2.  Use o **pgAdmin 4** (ou qualquer ferramenta que você goste) para gerenciar o banco.
3.  Crie um novo banco de dados. Eu chamei o meu de `merchandising_db`.
4.  Abra a ferramenta de consulta e execute os arquivos.
    * **Dica:** Comece pelo **01** e vá até o **04**, um de cada vez.

---

## O que eu aprendi de verdade

A parte mais legal foi colocar a mão na massa. Consegui entender melhor:

* Como o **desenho** do banco (o diagrama) vira o código `CREATE TABLE` de verdade.
* A importância do **Foreign Key** (Chave Estrangeira)! Isso evita que a gente cadastre dados errados, tipo um envio para uma marca que nem existe. É o que mantém o banco "limpo".
* Fazer consultas complexas usando **INNER JOIN** para ligar várias tabelas e ter relatórios completos.

---

Feito por Fabricio Walace Silva para a atividade de Banco de Dados.
