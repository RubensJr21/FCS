/* Apagando as tabelas */

DROP TABLE IF EXISTS VENDA_PRODUTO;

DROP TABLE IF EXISTS VENDA;

DROP TABLE IF EXISTS FUNCIONARIO;

DROP TABLE IF EXISTS ESTOQUE;

DROP TABLE IF EXISTS SABOR;

DROP TABLE IF EXISTS PRODUTO;

DROP TABLE IF EXISTS CATEGORIA;

DROP TABLE IF EXISTS CLIENTE;

DROP TABLE IF EXISTS ENDERECO;

DROP TABLE IF EXISTS PEDIDO_ESTADO;

DROP TABLE IF EXISTS FORMA_DE_PAGAMENTO;

/* CRIAÇÃO DAS TABELAS */

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

/* INSERÇÃO DOS DADOS */

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