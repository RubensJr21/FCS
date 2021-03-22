# TRABALHO 01: FCS (Food Control System)
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Graziene Martins: grazienemartins@yahoo.com.br<br>
Lorhan de Souza: lorhan.s160@gmail.com<br>
Rubens Jr: junior.correa2001@gmail.com<br>

### 2.INTRODUÇÃO E MOTIVAÇÃO<br>
Este documento contém a especificação do projeto do banco de dados <nome do projeto> 
<br>e motivação da escolha realizada. <br>

> Em meio à pandemia uma mulher precisou arrumar uma forma para ganhar dinheiro já que não estava trabalhando, foi aí então que surgiu a Doces sonhos, mas como qualquer empresa no ramo de vendas ela necessitou de ter um controle sobre o que era vendido, para saber o faturamento e uma estimativa de produção. Seu filho fez em uma planilha algo que a ajudou bastante um tempo, porém o problema veio quando ela criou novos produtos que não está possível adicionar, pois ele usava uma forma estática o VBA (Visual Basic Advanced) o que está por trás das macros e funções do excel.

### 3.MINI-MUNDO<br>

> Ela então solicitou que fosse feito um sistema de gerenciamento e controle de vendas para a sua empresa. Nesse sistema é necessário saber algumas informações do cliente como: Nome, telefone, endereço. Da venda necessita de ter algumas outras informações como: data de registro, data de entrega, forma de pagamento, se precisa de troco, caso afirmativo para qual valor, quais produtos, qual quantidade desses produtos, e os que tiverem uma especificação qual sabor do produto, saber também o total da vendo, total de troco e um estado de pedido, para saber se já foi entregue e se não, em qual estado está, e informações valor total de cada produto. Do produto se faz necessário saber: nome, valor, quantidade em estoque. E do funcionário é necessário saber: nome. Um cliente deve comprar 1 ou vários produtos. Um produto pode ser vendido para nenhum ou vários clientes. Um funcionário pode vender para nenhum ou vários clientes. Um cliente só pode ter sua venda concluída por apenas um funcionário. Um funcionário pode vender 1 ou vários produtos. Um produto pode ser vendido por 1 ou vários funcionários. 

### 4.PROTOTIPAÇÃO, PERGUNTAS A SEREM RESPONDIDAS E TABELA DE DADOS<br>
#### 4.1 RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
A prototipação foi feita utilizando a ferramenta do balsamiq cloud. Essa prototipação tem como objetivo dar uma ideia de como o projeto pode ser antes de sua realização. <br>

![Balsamiq.clound](https://github.com/RubensJr21/FCS/blob/master/balsamiq.png?raw=true "Title")
[![Protótipo FCS (Food Control System)](/images/Tela_Principal_Prototipo_FCS.png?raw=true "Arquivo PDF do Protótipo Balsamiq feito para Doces Sonhos")](/arquivos/FCS%20-%20Food%20Control%20System.pdf)
#### 4.2 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    a) O sistema proposto poderá fornecer quais tipos de relatórios e informaçes? 
    b) Crie uma lista com os 5 principais relatórios que poderão ser obtidos por meio do sistema proposto!
    
> A Empresa DevCom precisa inicialmente dos seguintes relatórios:
* Relatório que mostre o nome de cada supervisor(a) e a quantidade de empregados supervisionados.
* Relatório relativo aos os supervisores e supervisionados. O resultado deve conter o nome do supervisor e nome do supervisionado além da quantidade total de horas que cada supervisionado tem alocada aos projetos existentes na empresa.
* Relatorio que mostre para cada linha obtida o nome do departamento, o valor individual de cada salario existente no  departamento e a média geral de salarios dentre todos os empregados. Os resultados devem ser apresentados ordenados por departamento.
* Relatório que mostre as informações relacionadas a todos empregados de empresa (sem excluir ninguém). As linhas resultantes devem conter informações sobre: rg, nome, salario do empregado, data de início do salario atual, nomes dos projetos que participa, quantidade de horas e localização nos referidos projetos, numero e nome dos departamentos aos quais está alocado, informações do historico de salário como inicio, fim, e valores de salarios antigos que foram inclusos na referida tabela (caso possuam informações na mesma), além de todas informações relativas aos dependentes. 
>> ##### Observações: <br> a) perceba que este relatório pode conter linhas com alguns dados repetidos (mas não todos). <br>  b) para os empregados que não possuirem alguma destas informações o valor no registro deve aparecer sem informação/nulo. 
* Relatório que obtenha a frequencia absoluta e frequencia relativa da quantidade de cpfs únicos no relatório anterior. Apresente os resultados ordenados de forma decrescente pela frequencia relativa.
 
#### 4.3 TABELA DE DADOS DO SISTEMA:
    a) Esta tabela deve conter todos os atributos do sistema e um mínimo de 10 linhas/registros de dados.
    b) Esta tabela tem a intenção de simular um relatório com todos os dados que serão armazenados 
    
![Exemplo de Tabela de dados da Empresa Devcom](https://github.com/discipbd1/trab01/blob/master/arquivos/TabelaEmpresaDevCom_sample.xlsx?raw=true "Tabela - Empresa Devcom")
    
    
### 5.MODELO CONCEITUAL<br>
        
![Modelo Conceitual](/images/Modelo%20Conceitual%20v2.png "Modelo Conceitual")

#### 5.1 Validação do Modelo Conceitual
    [Grupo01]: [Renato Peres, Eduardo Alves e Thiago Correa]
    [Grupo02]: [Matheus de Souza, Rodrigo Raider e Thaís de Souza]

#### 5.2 Descrição dos dados 
    CATEGORIA: Indica os tipos aos quais um produto pertence (Doce, salgado, frio e etc..)
        id: Identificador único para a categoria 
        tipo: Nome da categoria
    
    PRODUTO: Item a ser vendido
        id: Identificador único para cada produto
        nome: Nome de um produto
        valor: Valor pelo qual o produto será vendido
        active: Indica se o produto está disponível para venda
    
    ESTOQUE: Indica a quantidade de produtos disponíveis para vender
        id_produto: Identificador já criado para um determinado produto
        quantidade: Quatidade de um detereminado produto em estoque
    
    SABORES: Sabores de um produto
        id: Identificador único para cada sabor
        id_produto: Identificador de um determinado produto, este pode ser repetido, pois um produto pode ter vários sabores
        sabor: Nome do sabor; tais como Chocolate, Morango, Tradicional e etc...
    
    FUNCIONARIO: Representa o funcionário da empresa
        id: Identificador único para cada funcionário
        nome_sobrenome: Nome do funcionário
        funcao: Função de cada funcionário
        senha: Guarda a senha do usuário
    
    CLIENTE: Guarda dados do usuário
        id: Identificador único para cada cliente
        nome: Este campo guarda o nome do usuário
        sobrenome: Este campo guarda o sobrenome do usuário
        telefone: Este campo guarda o telefone do usuário
        endereço: Este campo guarda o endereço do usuário
            tipo: Este campo guarda o tipo do endereço do cliente
            logradouro_nome: Este campo guarda o nome do logradouro
            numero: Este campo guarda o numero do endereço do cliente
            bairro: Este campo guarda o bairro do endereço do cliente
            municipio: Este campo guarda o município do endereço do cliente
            estado_uf: Este campo guarda o estado do endereço do cliente
            complemento: Este campo guarda um complemento do endereço do cliente
            cep: Este campo guarda o cep do endereço do cliente
    
    VENDA: Essa tabela guarda informações sobre uma determinada venda
        id: Identificador único para cada venda
        data_registro: Este campo guarda a data que o pedido foi registrado
        data_entrega: Este campo guarda a data para quando o pedido será
        hora_entrega: Este campo guarda a hora para quando o pedido será
        forma_pagamento: Este campo guarda qual será a forma de pagamento do pedido
        valor_pago: Este campo guarda o valor que foi pago
        total: Este campo guarda o valor total da venda
        estado_pedido: Este campo guarda em que estado o pedido está (Se já foi entregue e não pago,
                       se já foi pago e ainda não entregue, ou se já foi concluído)

### 6	MODELO LÓGICO<br>
![Modelo lógico](/images/Modelo%20Lógico.png "Modelo Lógico")

### 7	MODELO FÍSICO
~~~SQL
CREATE TABLE FUNCIONARIO (
    id VARCHAR(3) PRIMARY KEY,
    nome_sobrenome VARCHAR(110) NOT NULL,
    senha VARCHAR(32),
    funcao VARCHAR(30)
);

CREATE TABLE VENDA (
    id SERIAL PRIMARY KEY,
    fk_CLIENTES_id VARCHAR(5),
    fk_FUNCIONARIOS_id VARCHAR(3),
    data_registro DATE NOT NULL,
    data_entrega DATE NOT NULL,
    hora_entrega TIME NOT NULL,
    fk_FORMA_DE_PAGAMENTO_tipo VARCHAR(20) NOT NULL,
    valor_pago DECIMAL NOT NULL,
    total DECIMAL NOT NULL,
    fk_PEDIDO_ESTADO_id INTEGER,
    obs VARCHAR(150)
);

CREATE TABLE PRODUTO (
    id VARCHAR(4) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor FLOAT NOT NULL,
    fk_CATEGORIAS_id VARCHAR(2),
    active BOOLEAN NOT NULL
);
 
CREATE TABLE CATEGORIA (
    id VARCHAR(2) PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL
);

CREATE TABLE CLIENTE (
    id VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    telefone VARCHAR(14),
    fk_ENDERECOS_id INTEGER
);

CREATE TABLE ENDERECO (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(15) NOT NULL,
    lougradoro_nome VARCHAR(30) NOT NULL,
    numero INTEGER,
    bairro VARCHAR(50) NOT NULL,
    municipio VARCHAR(50) NOT NULL,
    estados_uf VARCHAR(2) NOT NULL,
    complemento VARCHAR(230),
    cep VARCHAR(8)
);

CREATE TABLE VENDA_PRODUTO (
    fk_PRODUTOS_id VARCHAR(4),
    fk_VENDAS_id INTEGER,
    qtd INTEGER NOT NULL,
    valor DECIMAL NOT NULL,
    sabor VARCHAR(14),
    obs VARCHAR(150)
);

CREATE TABLE PEDIDO_ESTADO (
    id SERIAl PRIMARY KEY,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE FORMA_DE_PAGAMENTO (
    tipo VARCHAR(20) PRIMARY KEY
);

CREATE TABLE ESTOQUE (
    fk_PRODUTOS_id VARCHAR(4) PRIMARY KEY,
    quantidade INTEGER NOT NULL
);

CREATE TABLE SABOR (
    id SERIAL PRIMARY KEY,
    fk_PRODUTOS_id VARCHAR(4),
    sabor VARCHAR(14) NOT NULL
);

ALTER TABLE VENDA ADD CONSTRAINT VENDAS__fk_CLIENTES_id
    FOREIGN KEY (fk_CLIENTES_id)
    REFERENCES CLIENTE (id);
 
ALTER TABLE VENDA ADD CONSTRAINT VENDAS__fk_FUNCIONARIOS_id
    FOREIGN KEY (fk_FUNCIONARIOS_id)
    REFERENCES FUNCIONARIO (id);
 
ALTER TABLE VENDA ADD CONSTRAINT VENDAS__fk_PEDIDO_ESTADO_id
    FOREIGN KEY (fk_PEDIDO_ESTADO_id)
    REFERENCES PEDIDO_ESTADO (id);
 
ALTER TABLE VENDA ADD CONSTRAINT VENDAS__fk_FORMA_DE_PAGAMENTO_tipo
    FOREIGN KEY (fk_FORMA_DE_PAGAMENTO_tipo)
    REFERENCES FORMA_DE_PAGAMENTO (tipo);

ALTER TABLE PRODUTO ADD CONSTRAINT PRODUTOS__fk_CATEGORIAS_id
    FOREIGN KEY (fk_CATEGORIAS_id)
    REFERENCES CATEGORIA (id);

ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTES__fk_ENDERECOS_id
    FOREIGN KEY (fk_ENDERECOS_id)
    REFERENCES ENDERECO (id);

ALTER TABLE VENDA_PRODUTO ADD CONSTRAINT VENDA_PRODUTO__fk_PRODUTOS_id
    FOREIGN KEY (fk_PRODUTOS_id)
    REFERENCES PRODUTO (id);
 
ALTER TABLE VENDA_PRODUTO ADD CONSTRAINT VENDA_PRODUTO__fk_VENDAS_id
    FOREIGN KEY (fk_VENDAS_id)
    REFERENCES VENDA (id);

ALTER TABLE ESTOQUE ADD CONSTRAINT ESTOQUE__fk_PRODUTOS_id
    FOREIGN KEY (fk_PRODUTOS_id)
    REFERENCES PRODUTO (id);

ALTER TABLE SABOR ADD CONSTRAINT SABORES__fk_PRODUTOS_id
    FOREIGN KEY (fk_PRODUTOS_id)
    REFERENCES PRODUTO (id);
~~~

### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS
~~~SQL
/* INSERCAO - TABELA FUNCIONARIO */

INSERT INTO FUNCIONARIO(id, nome_sobrenome, senha, funcao) 
VALUES('id1', 'Ana da Silva', '1234', 'Atendente'),
('id2', 'João Pedro da Silva', '1234', 'Atendente'),
('id3', 'Helena Soares', '1234', 'Gerente'),
('id4', 'Maria Eduarda Gomes', '1234', 'Atendente'),
('id5', 'Fernando Ferreira', '1234', 'Gerente'),
('id6', 'Cláudia Lima', '1234', 'Atendente'),
('id7', 'Alice Vieira', '1234', 'Atendente'),
('id8', 'Antonio Carlos', '1234', 'Atendente'),
('id9', 'Felipe Gomes', '1234', 'Atendente'),
('id0', 'Luana Dias', '1234', 'Atendente');

/* INSERCAO - TABELA ENDERECO */

INSERT INTO ENDERECO(tipo, lougradoro_nome, numero, bairro, municipio, estados_uf, complemento, cep)
VALUES('Rua', ' Lírio dos Vales', 3, 'São Lucas', 'Vitória', 'ES', 'Fundos', '2900000'),
('Avenida', 'Lima Silva', 124, 'Vista Linda', 'Vila Velha', 'ES', 'Apt 104', '2900300'),
('Avenida', 'Avenida Aparecida', 154, 'São João', 'Vila Velha', 'ES', 'Apt 34', '2900300'),
('Rua', 'Constante Sodré ', 25, 'Santa Lúcia', 'Vitória', 'ES', 'Apt 230', '2900000'),
('Rua', 'Anacleto Soares', 524, 'Jardim das Flores', 'Vila Velha', 'ES', 'Casa', '2900400'),
('Avenida', 'Coelho Mota', 325, '', 'Vila Velha', 'ES', 'Apt 104', '2900300'),
('Avenida', 'Navegantes', 124, 'Praia do Suá', 'Vitória', 'ES', 'Apt 104', '2900000'),
('Rua', ' Aleixo Neto', 230, 'Praia do Canto', 'Vitória', 'ES', 'Apt 205', '2900300'),
('Avenida', 'Soares Souza', 724, 'Vista Alegre', 'Serra', 'ES', 'casa', '2900500'),
('Avenida', 'Avenida Barreto Couto', 831, 'Vila Nova', 'Vila Velha', 'ES', 'casa', '2900900'); 

/* INSERCAO - TABELA CLIENTE */

INSERT INTO CLIENTE(id, nome, sobrenome, telefone, fk_ENDERECOS_id)
VALUES('idA', 'Maria', 'da Silva', '3222-3531', 1),
('idB', 'Alice', 'Soares Barreto', '3233-3332', 2),
('idC', 'Jonas', 'Gonçalves', '3531-2826', 3),
('idD', 'Fernando', 'Menezes', '3222-7412', 4),
('idE', 'Lucas', 'Ferreira Lima', '3635-3839', 5),
('idF', 'Mateus', 'Vieira de Sá', '3233-3134', 6),
('idG', 'Clarisse', 'Alencar de Souza', '3230-3534', 7),
('idH', 'Thiago', 'Alves Rodrigues', '3738-3231', 8),
('idI', 'Humberto', 'Rocha Siqueira', '3532-2224', 9),
('idJ', 'Felipe', 'Andrade de Azevedo', '3222-4541', 10); 

/* INSERCAO - TABELA CATEGORIA */

INSERT INTO CATEGORIA(id, tipo)
VALUES('cA', 'tipoA'),
('cB', 'tipoB'),
('cC', 'tipoC'),
('cD', 'tipoD'),
('cE', 'tipoE'),
('cF', 'tipoF'),
('cG', 'tipoG'),
('cH', 'tipoH'),
('cI', 'tipoI'),
('cJ', 'tipoJ'); 

/* INSERCAO - TABELA PRODUTO */

INSERT INTO PRODUTO (id, nome, valor, fk_CATEGORIAS_id, active)
VALUES('idP1', 'produto1', 15.99, 'cA', true),
('idP2', 'produto2', 10.35, 'cB', false),
('idP3', 'produto3', 18.40, 'cC', true),
('idP4', 'produto4', 21.99, 'cD', false),
('idP5', 'produto5', 13.99, 'cE', true),
('idP6', 'produto6', 9.99, 'cF', true),
('idP7', 'produto7', 23.50, 'cG', true),
('idP8', 'produto8', 14.46, 'cH', true),
('idP9', 'produto9', 15.35, 'cI', false),
('idP0', 'produto10', 20.15, 'cJ', true);  

/* INSERCAO - TABELA ESTOQUE */

INSERT INTO ESTOQUE(fk_PRODUTOS_id, quantidade)
VALUES('idP1', 20),
('idP2', 25),
('idP3', 15),
('idP4', 10),
('idP5', 30),
('idP6', 18),
('idP7', 5),
('idP8', 23),
('idP9', 7),
('idP0', 14); 

/* INSERCAO - TABELA PEDIDO_ESTADO */

INSERT INTO PEDIDO_ESTADO(status)
VALUES('status1'),
('status2'),
('status3'),
('status4'),
('status5'),
('status6'),
('status7'),
('status8'),
('status9'),
('status10');

/* INSERCAO - TABELA SABOR */

INSERT INTO SABOR(fk_PRODUTOS_id, sabor)
VALUES('idP1', 'sabor1'),
('idP1', 'sabor2'),
('idP1', 'sabor3'),
('idP2', 'sabor1'),
('idP2', 'sabor2'),
('idP3', 'sabor1'),
('idP4', 'sabor1'),
('idP5', 'sabor1'),
('idP6', 'sabor1'),
('idP7', 'sabor1');

/* INSERCAO - TABELA FORMA_DE_PAGAMENTO */

INSERT INTO FORMA_DE_PAGAMENTO(tipo)
VALUES('cartao'), ('dinheiro');

/* INSERCAO - TABELA VENDA */

INSERT INTO VENDA(fk_CLIENTES_id, fk_FUNCIONARIOS_id, data_registro, data_entrega, hora_entrega, fk_FORMA_DE_PAGAMENTO_tipo, valor_pago, total, fk_PEDIDO_ESTADO_id, obs)
VALUES('idA', 'id2', '2015-03-05', '2015-03-06', '14:30', 'cartao', 50.00, 50.00, 1, ''),
('idA', 'id3', '2015-03-07', '2015-03-07', '14:35', 'cartao', 35.99, 35.99, 2, ''),
('idA', 'id4', '2015-03-15', '2015-03-15', '14:40', 'cartao', 23.15, 23.15, 3, ''),
('idA', 'id5', '2015-03-05', '2015-03-05', '14:03', 'cartao', 14.26, 14.26, 4, ''),
('idA', 'id6', '2015-03-05', '2015-03-05', '14:10', 'cartao', 10.14, 10.14, 5, ''),
('idA', 'id7', '2015-03-05', '2015-03-05', '14:23', 'cartao', 22.99, 22.99, 6, ''),
('idA', 'id8', '2015-03-07', '2015-03-07', '14:50', 'cartao', 64.50, 64.50, 7, ''),
('idA', 'id9', '2015-03-08', '2015-03-08', '14:07', 'cartao', 14.99, 14.99, 8, ''),
('idA', 'id2', '2015-03-09', '2015-03-09', '14:11', 'cartao', 12.49, 14.99, 9, ''),
('idA', 'id1', '2015-03-10', '2015-03-10', '14:31', 'cartao', 23.99, 23.99, 10, '');

/* INSERCAO - TABELA VENDA_PRODUTO */

INSERT INTO VENDA_PRODUTO(fk_PRODUTOS_id, fk_VENDAS_id, qtd, valor, sabor, obs)
VALUES('idP1', 1, 3, 4, 'sabor1', ''),
('idP1', 2, 3, 3, 'sabor1', ''),
('idP1', 2, 3, 2, 'sabor1', ''),
('idP1', 2, 3, 1, 'sabor1', ''),
('idP1', 3, 3, 1, 'sabor1', ''),
('idP1', 4, 3, 1, 'sabor1', ''),
('idP1', 5, 3, 1, 'sabor1', ''),
('idP1', 1, 3, 1, 'sabor1', '');
~~~
>a) link do arquivo sql referente ao Backup: [Abrir Backup_BD_FCS.sql](/arquivos/Backup_BD_FCS.sql)<br>
>b) link do arquivo de Backup do PgAdmin: [Abrir Backup_BD_FCS.backup](/arquivos/Backup_BD_FCS.backup)<br>

>a) inclusão das instruções de inserção dos dados nas tabelas criadas pelo script de modelo físico<br>
>(Drop para exclusão de tabelas + create definição de para tabelas e estruturas de dados + insert para dados a serem inseridos)<br>
>b) Criar um novo banco de dados para testar a restauracao <br>
>(em caso de falha na restauração o grupo não pontuará neste quesito)<br>
>c) formato .SQL<br>

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 9.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
[![Print_Notebook_Colab_FCS.png](/images/Print_Notebook_Colab_FCS.png?raw=true "Notebook do FCS no Colab")](https://colab.research.google.com/github/RubensJr21/FCS/blob/master/Modelo_BD1_Iten_91_Trabalho_Grupo_Graziene_Lorhan_Rubens.ipynb#scrollTo=N0XOGRZl9nj0)

># Marco de Entrega 01: Do item 1 até o item 9.1<br>

#### 9.2	CONSULTAS DAS TABELAS COM FILTROS WHERE
```SQL
-- OBTER SABORES DE UM PRODUTO [SABOR]
SELECT s.sabor AS "sabores" FROM SABOR AS s
INNER JOIN PRODUTO AS p
ON (p.id = s.fk_PRODUTOS_id)
WHERE p.id = 'idP1'

-- OBTER DE UM DETERMINADO SABOR [SABOR]
SELECT * FROM SABOR
WHERE sabor IN ('sabor1', 'sabor2')

-- OBTER VENDAS COM O TOTAL MAIOR QUE (VALOR) [VENDA]
SELECT * FROM VENDA
WHERE total > 9.5

-- OBTER VENDAS COM HORÁRIO DE ENTREGA MAIOR QUE A MÉDIA [VENDA]
SELECT * FROM VENDA
WHERE id IN (
        SELECT id
        FROM VENDA
        WHERE hora_entrega > (
            SELECT AVG(hora_entrega)
            FROM VENDA
        )
    )
```
#### 9.3	CONSULTAS QUE USAM OPERADORES LÓGICOS, ARITMÉTICOS E TABELAS OU CAMPOS RENOMEADOS (Mínimo 11)
    a) Criar 5 consultas que envolvam os operadores lógicos AND, OR e Not
    b) Criar no mínimo 3 consultas com operadores aritméticos 
    c) Criar no mínimo 3 consultas com operação de renomear nomes de campos ou tabelas

#### 9.4	CONSULTAS QUE USAM OPERADORES LIKE E DATAS<br>
```SQL
::CURDATE::
-- OBTEM HÁ QUANTO TEMPO A VENDA FOI REGISTRADA
SELECT id, data_registro AS "Data de registro", CURRENT_DATE-(data_registro) AS "Registrado há:", total FROM VENDA
WHERE CURRENT_DATE-(data_registro) >= 2207

-- OBTEM A DIFERENÇA ENTRE O HORÁRIO ATUAL E O HORÁRIO DA ENTREGA
SELECT id, data_registro AS "Data de registro",
TO_CHAR(
    TO_TIMESTAMP((CURRENT_TIME(0)-(hora_entrega))::text, 'HH24:MI:SS')
    , 'HH24:MI:SS'
)
AS "Tempo para a entrega", total FROM VENDA

-- OBTEM A DIFERENÇA ENTRE O HORÁRIO ATUAL E O HORÁRIO DA ENTREGA
SELECT id, data_registro AS "Data de registro",
TO_CHAR(
    NOW()-TO_TIMESTAMP(
        hora_entrega::TEXT,
        'HH24:MI:SS'
        ),
    'HH24:MI:SS'
    )
AS "Tempo para a entrega", total FROM VENDA
ORDER BY "Tempo para a entrega"

::AGE()::
-- OBTEM A DIFERENÇA DE TEMPO ENTRE REGISTRO E ENTREGA
SELECT id, data_registro AS "Data de registro", AGE(data_registro, data_entrega) AS "Dierença de tempo entre registro e entrega"
FROM VENDA
ORDER BY "Data de registro"

::DATE_PART()::
-- OBTEM A DIA E MES DA ENTREGA
SELECT id, data_registro AS "Data de registro", CONCAT(
    TO_CHAR(DATE_PART('DAY', data_entrega)::INTEGER, 'FM00'),
    '/',
    TO_CHAR(DATE_PART('MONTH', data_entrega)::INTEGER, 'FM00')
) AS "Dia/mês da entrega"
FROM VENDA
ORDER BY "Data de registro"

::EXTRACT()::
SELECT id, data_registro, data_registro AS "Data de registro", CONCAT(
    TO_CHAR(EXTRACT('day' FROM data_registro), 'FM00'),
    '/',
    TO_CHAR(EXTRACT('month' FROM data_registro), 'FM00')
) AS "Dia/mês da entrega"
FROM VENDA
```

#### 9.5	INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)<br>
    a) Criar minimo 3 de exclusão
    b) Criar minimo 3 de atualização

#### 9.6	CONSULTAS COM INNER JOIN E ORDER BY (Mínimo 6)<br>
    a) Uma junção que envolva todas as tabelas possuindo no mínimo 2 registros no resultado
    b) Outras junções que o grupo considere como sendo as de principal importância para o trabalho

#### 9.7	CONSULTAS COM GROUP BY E FUNÇÕES DE AGRUPAMENTO (Mínimo 6)<br>
    a) Criar minimo 2 envolvendo algum tipo de junção

#### 9.8	CONSULTAS COM LEFT, RIGHT E FULL JOIN (Mínimo 4)<br>
    a) Criar minimo 1 de cada tipo

#### 9.9	CONSULTAS COM SELF JOIN E VIEW (Mínimo 6)<br>
        a) Uma junção que envolva Self Join (caso não ocorra na base justificar e substituir por uma view)
        b) Outras junções com views que o grupo considere como sendo de relevante importância para o trabalho

#### 9.10	SUBCONSULTAS (Mínimo 4)<br>
     a) Criar minimo 1 envolvendo GROUP BY
     b) Criar minimo 1 envolvendo algum tipo de junção

># Marco de Entrega 02: Do item 9.2 até o ítem 9.10<br>

### 10 RELATÓRIOS E GRÁFICOS

#### a) análises e resultados provenientes do banco de dados desenvolvido (usar modelo disponível)
#### b) link com exemplo de relatórios será disponiblizado pelo professor no AVA
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos 5 principais relatórios/resultados visando obter o melhor resultado possível.

    

### 11	AJUSTES DA DOCUMENTAÇÃO, CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 

># Marco de Entrega 03: Itens 10 e 11<br>
<br>
<br>
<br> 



### 12 FORMATACAO NO GIT:<br> 
https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

    
### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. <strong>Caso existam arquivos com conteúdos sigilosos<strong>, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário do git "profmoisesomena", para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://www.sis4.com/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")


