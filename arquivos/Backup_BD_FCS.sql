/* Apagando as tabelas */

DROP TABLE IF EXISTS VENDA_PRODUTO;

DROP TABLE IF EXISTS VENDA;
DROP SEQUENCE IF EXISTS VENDA_id_seq;

DROP TABLE IF EXISTS FUNCIONARIO;

DROP TABLE IF EXISTS ESTOQUE;

DROP TABLE IF EXISTS SABOR;
DROP SEQUENCE IF EXISTS SABOR_id_seq;

DROP TABLE IF EXISTS PRODUTO;

DROP TABLE IF EXISTS CATEGORIA;

DROP TABLE IF EXISTS CLIENTE;

DROP TABLE IF EXISTS ENDERECO;
DROP SEQUENCE IF EXISTS ENDERECO_id_seq;

DROP TABLE IF EXISTS PEDIDO_ESTADO;
DROP SEQUENCE IF EXISTS PEDIDO_ESTADO_id_seq;

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
    hora_entrega TIME,
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
    lougradoro_nome VARCHAR(60) NOT NULL,
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
    sabor VARCHAR(30),
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
    sabor VARCHAR(25) NOT NULL
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
('551', 'João Pedro da Silva', '4545','Cozinheiro'),
('499', 'Helena Soares', '1313','Cozinheiro'),
('501', 'Maria Eduarda Gomes', '1212','Cozinheiro'),
('356', 'Fernando Ferreira', '2325','Auxiliar de cozinha'),
('480', 'Cláudia Lima', '2426','Cozinheira'),
('485', 'Alice Vieira', '2323','Atendente'),
('552', 'Antonio Carlos', '6872','Atendente'),
('560', 'Felipe Gomes', '3452','Atendente'),
('565', 'Luana Dias', '2015','Atendente'),
('553', 'Mariana Matos', '3032','Atendente'),
('558', 'João Lucas Silva', '1503','Atendente'),
('561', 'Clarisse Soares', '0207','Auxiliar de cozinha'),
('566', 'Eduarda Lopes', '0509','Atendente'),
('567', 'Fernando Couto', '5352','Atendente'),
('570', 'Elias Ferreira', '5629','Atendente'),
('569', 'Alice Constatino', '1224','Atendente'),
('578', 'Antonio Luiz', '2356','Atendente'),
('580', 'Felipe da Mata', '5457','Cozinheiro'),
('571', 'Romário Fariaz', '1369','Atendente'),
('458', 'Samuel Oliveira', '1852','Atendente'),
('559', 'João Pedro Nascimento', '7412','Atendente'),
('562', 'Lucas Soares', '3214','Auxiliar de cozinha'),
('579', 'Lívia Gomes', '7896','Atendente'),
('id5', 'Sandra Ferreira', '6541','Cozinheiro'),
('554', 'Ana Lima', '4563','Atendente'),
('572', 'Rodrigo Vieira', '1596','Atendente'),
('101', 'Thiago Almeida', '3574','Atendente'),
('id9', 'Felipe Araújo', '1874','Atendente'),
('568', 'Clara Oliveira Andrade', '4125','Atendente'),
('459', 'Felipe Andrade', '2369','Atendente'),
('563', 'Cíntia Oliveira', '4526','Atendente'),
('557', 'Vitória Maria da Silva', '2698','Auxiliar de cozinha'),
('102', 'Diego Santos', '2369','Atendente'),
('120', 'Fernando Nascimento', '2586','Cozinheiro'),
('009', 'Eduardo Luiz Augusto', '1324','Atendente'),
('203', 'Luiz Augusto', '4587','Atendente'),
('202', 'Clara Andrade', '1159','Atendente'),
('574', 'Felipe Mota', '0303','Atendente'),
('556', 'Luana Garcia', '8852','Atendente'),
('450', 'Juliana Silva', '3917','Atendente'),
('564', 'Pedro Lucas Lopes', '9135','Cozinheiro'),
('008', 'Helena Soares', '7964','Auxiliar de cozinha'),
('696', 'Gabriela Gomes', '2501','Atendente'),
('705', 'Heitor Ferreira', '2020','Auxiliar de cozinha'),
('808', 'Kaio Lima', '0606','Atendente'),
('010', 'Alice Costa', '5451','Atendente'),
('007', 'Antonio Souto', '2627','Atendente'),
('573', 'Felipe do Carmo', '1819','Atendente'),
('555', 'Luana Pereira', '9896','Atendente');

/* INSERCAO - TABELA ENDERECO */

INSERT INTO ENDERECO(tipo, lougradoro_nome, numero, bairro, municipio, estados_uf, complemento, cep)
VALUES('Rua', 'Lírio dos Vales', 3, 'São Lucas', 'Vitória', 'ES', 'Fundos', '2900000'),
('Avenida','Lima Silva',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900353'),
('Avenida','Avenida Aparecida',154,'São João', 'Vila Velha','ES','Apt 34','2900050'),
('Rua','Constante Sodré ',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900145'),
('Rua','Anacleto Soares',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900400'),
('Avenida','Coelho Mota',325,'', 'Vila Velha','ES','Apt 104','2900300'),
('Avenida','Navegantes',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900152'),
('Rua',' Aleixo Neto',230,'Praia do Canto', 'Vitória','ES','Apt 205','2900562'),
('Avenida','Soares Souza',724,'Vista Alegre', 'Serra','ES','casa','2900500'),
('Avenida','Avenida Barreto Couto',831,'Vila Nova', 'Vila Velha','ES','casa','2900900'),
('Rua',' Paulo de Vasconcelos',3,'São Lucas', 'Vitória','ES','Fundos','2900123'),
('Avenida','Antônio Santos Borges',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900300'),
('Avenida','Sebastião Nestor de Oliveira',154,'São João', 'Vila Velha','ES','Apt 34','2900600'),
('Rua','Professora Jacy Alves Fraga',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900136'),
('Rua','Anacleto Soares',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900453'),
('Avenida','Flamboyan',325,'', 'Vila Velha','ES','Apt 104','2900800'),
('Avenida','Wlademiro da Silveira',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900452'),
('Rua',' Rosa de Sharon',230,'Praia do Canto', 'Vitória','ES','Apt 205','29003867'),
('Avenida','Jurema Barroso',724,'Vista Alegre', 'Serra','ES','casa','2900520'),
('Travessa','Domingos Carneiro',831,'Vila Nova', 'Vila Velha','ES','casa','2900980'),
('Rua',' Epifânio Ribeiro',3,'São Lucas', 'Vitória','ES','Fundos','2900269'),
('Rua','Marilza Paranho Netto',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900303'),
('Avenida','Joaquim José da Vitória',154,'São João', 'Vila Velha','ES','Apt 34','2900336'),
('Rua','Izidro Benezath',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900000'),
('Rua','Tereza Zanoni Coser',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900456'),
('Avenida','Maria Saraiva',325,'', 'Vila Velha','ES','Apt 104','2900300'),
('Avenida','Ruy Pinto Bandeira',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900789'),
('Rua','Arthur Mello',230,'Praia do Canto', 'Vitória','ES','Apt 205','2900911'),
('Rua','São Vicente',724,'Vista Alegre', 'Serra','ES','casa','2900513'),
('Rua','Dulce Brito Espíndula',831,'Vila Nova', 'Vila Velha','ES','casa','2900914'),
('Rua',' Desembargador Homero',3,'São Lucas', 'Vitória','ES','Fundos','2900150'),
('Avenida','Professor Heráclito Pereira	Vitória',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900163'),
('Avenida','Moacir Strauch',154,'São João', 'Vila Velha','ES','Apt 34','2900178'),
('Rua','Izaltino Arão Marques',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900196'),
('Rua','José Passos',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900420'),
('Avenida','São Simão	Vitória',325,'', 'Vila Velha','ES','Apt 104','2900321'),
('Rua','São Mateus',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900022'),
('Rua',' Henrique Novaes',230,'Praia do Canto', 'Vitória','ES','Apt 205','2900230'),
('Avenida','Henry Ford',724,'Vista Alegre', 'Serra','ES','casa','2900524'),
('Avenida','Leonídio Pereira',831,'Vila Nova', 'Vila Velha','ES','casa','2900900'),
('Rua',' Ugo Abílio Rigo',3,'São Lucas', 'Vitória','ES','Fundos','2900000'),
('Avenida','São Marcos I',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900350'),
('Avenida','Júlio Leite	Vitória	',154,'São João', 'Vila Velha','ES','Apt 34','2900376'),
('Rua','Elvira Zílio',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900270'),
('Beco','São Nicolau I',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900286'),
('Avenida','Maria Lisboa',325,'', 'Vila Velha','ES','Apt 104','2900296'),
('Avenida','Navegantes',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900305'),
('Rua',' Esméria Barros Deorce',230,'Praia do Canto', 'Vitória','ES','Apt 205','2900312'),
('Avenida','Doutor João Carlos de Souza',724,'Vista Alegre', 'Serra','ES','casa','2900369'),
('Beco','Beija-Flor	Vitória',831,'Vila Nova', 'Vila Velha','ES','casa','2900521');


/* INSERCAO - TABELA CLIENTE */

INSERT INTO CLIENTE(id, nome, sobrenome, telefone, fk_ENDERECOS_id)
VALUES
('987', 'Maria', 'da Silva', '3222-3531', 1),
('131', 'Alice', 'Soares Barreto', '3233-3332',2),
('151', 'Jonas', 'Gonçalves', '3531-2826',3),
('181', 'Fernando', 'Menezes', '3222-7412',4),
('203', 'Lucas', 'Ferreira Lima', '3635-3839',5),
('208', 'Mateus', 'Vieira de Sá', '3233-3134',6),
('225', 'Clarisse', 'Alencar de Souza', '3230-3534',7),
('240', 'Thiago', 'Alves Rodrigues', '3738-3231',8),
('251', 'Humberto', 'Rocha Siqueira', '3532-2224',9),
('264', 'Felipe', 'Andrade de Azevedo', '3222-4541',10),
('126', 'Samuel', 'da Silva', '3255-3555',11),
('130', 'Elias', 'Soares Barreto', '3233-3152',12),
('153', 'Bernado', 'Gonçalves', '3531-5273',13),
('189', 'Wilson', 'Menezes', '3222-7412',14),
('195', 'Maria', 'Ferreira Lima', '3635-3278',15),
('204', 'Thiago', 'Vieira de Sá', '3233-2697',16),
('209', 'Clarisse', 'Alencar de Souza', '3230-9999',17),
('224', 'Felipe', 'Alves Rodrigues', '3738-7895',18),
('265', 'Carla', 'Rocha Siqueira', '3532-3689',19),
('193', 'Felipe', 'Andrade de Azevedo', '3222-0575',20),
('127', 'Henrique', 'da Silva', '3222-5551',21),
('132', 'Roberto', 'Soares Barreto', '3003-3332',22),
('154', 'Jeferson', 'Gonçalves', '3531-5714',23),
('190', 'Ana', 'Menezes', '3222-7412',24),
('205', 'Luiza', 'Ferreira Lima', '3635-3321',25),
('194', 'Juliana', 'Vieira de Sá', '3783-3134',26),
('222', 'Eduardo', 'Alencar de Souza', '3230-3534',27),
('210', 'Gabriele', 'Alves Rodrigues', '3796-3231',28),
('223', 'Luiz', 'Rocha Siqueira', '357-2224',29),
('196', 'Leonardo', 'Andrade de Azevedo', '3223-4541',30),
('128', 'João Lucas', 'da Silva', '3153-3531',31),
('133', 'Ana Maria', 'Soares Barreto', '3233-3332',32),
('155', 'José Carlos', 'Gonçalves', '3502-2826',33),
('202', 'Poliana', 'Menezes', '3222-047',34),
('207', 'Letícia', 'Ferreira Lima', '3635-1204',35),
('266', 'Jucelino', 'Vieira de Sá', '3233-33257',36),
('231', 'Edson', 'Alencar de Souza', '3230-0145',37),
('220', 'Vitor', 'Alves Rodrigues', '3738-0175',38),
('197', 'Lia', 'Rocha Siqueira', '3532-0147',39),
('191', 'Helenice', 'Andrade de Azevedo', '3222-0475',40),
('129', 'Caroline', 'da Silva', '3222-0155',41),
('134', 'Maria Lúcia', 'Soares Barreto', '3233-05155',42),
('158', 'José Luiz', 'Gonçalves', '3531-0554',43),
('206', 'Ricardo', 'Menezes', '3222-7002',44),
('201', 'Pedro', 'Ferreira Lima', '3635-5559',45),
('192', 'Luiz Carlos', 'Vieira de Sá', '3233-0574',46),
('180', 'Eunice', 'Alencar de Souza', '3230-0514',47),
('150', 'Aline', 'Alves Rodrigues', '3738-1857',48),
('135', 'Érica', 'Rocha Siqueira', '3532-1111',49),
('101', 'Luiz Felipe', 'Andrade de Azevedo', '3222-4444',50);

/* INSERCAO - TABELA CATEGORIA */

INSERT INTO CATEGORIA(id, tipo)
VALUES
('de', 'doce'),
('so', 'salgado');

/* INSERCAO - TABELA PRODUTO */

INSERT INTO PRODUTO (id, nome, valor, fk_CATEGORIAS_id, active)
VALUES
('sonh', 'sonho unid.', 3.5, 'de', true),
('sonB', 'sonho badeja (3 unid.)', 9, 'de', true),
('msoB', 'mini-sonho badeja (6 unid.)', 10, 'de', true),
('erld', 'enrolado', 5, 'so', true),
('ment', 'mentira pct (4 unidade)', 2.5, 'de', true),
('pctr', 'pão caseiro (Tradicional)', 5, 'de', true),
('pcmh', 'pão caseiro (Milho)', 6, 'de', true),
('moss', 'mousse', 5, 'de', true),
('pudm', 'pudim', 5, 'de', true);

/* INSERCAO - TABELA ESTOQUE */

INSERT INTO ESTOQUE(fk_PRODUTOS_id, quantidade)
VALUES
('sonh', 18),
('sonB', 6),
('msoB', 7),
('erld', 7),
('ment', 15),
('pctr', 6),
('pcmh', 10),
('moss', 10),
('pudm', 15);

/* INSERCAO - TABELA PEDIDO_ESTADO */

INSERT INTO PEDIDO_ESTADO(status)
VALUES
('solicitado'),
('pronto'),
('pago'),
('entregue_nao_pago'),
('finalizado');

/* INSERCAO - TABELA SABOR */

INSERT INTO SABOR(fk_PRODUTOS_id, sabor)
VALUES
('pudm', 'tradicional'),
('pudm', 'chocolate'),

('sonh', 'tradicional'),
('sonh', 'doce de leite'),
('sonh', 'chocolate'),
('sonh', 'goiabada'),

('sonB', 'tradicional'),
('sonB', 'doce de leite'),
('sonB', 'chocolate'),
('sonB', 'goiabada'),

('msoB', 'tradicional'),
('msoB', 'doce de leite'),
('msoB', 'chocolate'),
('msoB', 'goiabada'),

('moss', 'leite ninho'),

('erld', 'presunto e queijo');

/* INSERCAO - TABELA FORMA_DE_PAGAMENTO */

INSERT INTO FORMA_DE_PAGAMENTO(tipo)
VALUES
('cartao'),
('picpay'),
('pix'),
('dinheiro');

/* INSERCAO - TABELA VENDA */

INSERT INTO VENDA(fk_CLIENTES_id, fk_FUNCIONARIOS_id, data_registro, data_entrega, hora_entrega, fk_FORMA_DE_PAGAMENTO_tipo, valor_pago, total, fk_PEDIDO_ESTADO_id, obs)
VALUES
('131', '485', '06-03-2020', '06-05-2020', '12:30', 'pix', 75.5, 75.5, 1, 'entregar na portaria de vidro'),
('181', '552', '06-03-2020', '06-05-2020', NULL, 'pix', 9, 9, 1, ''),
('131', '553', '06-03-2020', '06-05-2020', '15:43', 'dinheiro', 61.9, 44.0, 1, 'meu marido vai pegar'),
('203', '485', '06-03-2020', '06-05-2020', '15:58', 'cartao', 35, 35, 1, ''),
('203', '566', '06-07-2020', '06-13-2020', '14:01', 'dinheiro', 14.5, 8.5, 1, ''),
('264', '552', '06-07-2020', '06-13-2020', '14:29', 'cartao', 34, 34, 1, ''),
('264', '553', '06-07-2020', '06-13-2020', '15:06', 'cartao', 78, 78, 1, 'entregar na portaria de vidro'),
('195', '553', '06-08-2020', '06-11-2020', '16:14', 'picpay', 45, 45, 1, ''),
('204', '566', '06-08-2020', '06-11-2020', '16:23', 'pix', 48.5, 48.5, 1, 'meu marido vai pegar'),
('265', '566', '06-08-2020', '06-12-2020', '16:47', 'picpay', 36, 36, 1, 'minha filha vai pegar'),
('193', '568', '06-09-2020', '06-20-2020', '17:23', 'dinheiro', 78.45, 74.0, 1, 'entregar na portaria de vidro'),
('210', '557', '06-09-2020', '06-20-2020', '17:45', 'cartao', 55.0, 55.0, 1, ''),
('194', '568', '07-03-2020', '07-05-2020', '14:35', 'pix', 47.5, 47.5, 1, ''),
('222', '009', '07-03-2020', '07-05-2020', '15:03', 'pix', 5.0, 5.0, 1, 'meu marido vai pegar'),
('210', '554', '07-03-2020', '07-04-2020', '15:25', 'dinheiro', 42.5, 25, 1, ''),
('208', '554', '07-03-2020', '07-04-2020', '15:58', 'picpay', 76.5, 76.5, 1, 'vai vim pegar'),
('266', '554', '07-04-2020', '07-07-2020', '16:23', 'cartao', 34.5, 34.5, 1, 'minha filha vai pegar'),
('222', '009', '07-04-2020', '07-07-2020', '16:42', 'cartao', 20, 20, 1, ''),
('207', '102', '07-05-2020', '07-08-2020', '17:04', 'cartao', 69.5, 69.5, 1, ''),
('196', '450', '07-06-2020', '07-07-2020', '17:27', 'pix', 63.0, 63.0, 1, ''),
('180', '102', '07-09-2020', '07-09-2020', '17:38', 'dinheiro', 9.08, 5.0, 1, ''),
('134', '450', '07-10-2020', '07-14-2020', '17:55', 'dinheiro', 32.8, 21, 1, ''),
('223', '558', '07-10-2020', '07-14-2020', '18:47', 'dinheiro', 149.5, 75.0, 1, ''),
('201', '570', '08-03-2020', '08-04-2020', '14:05', 'dinheiro', 25.15, 15, 1, 'meu filho vai pegar'),
('223', '558', '08-03-2020', '08-05-2020', '14:29', 'dinheiro', 52.55, 49, 1, ''),
('133', '558', '08-03-2020', '08-04-2020', '13:25', 'dinheiro', 65.7, 52.5, 1, ''),
('231', '579', '08-03-2020', '08-05-2020', '11:36', 'picpay', 25.0, 25.0, 1, ''),
('133', '570', '08-03-2020', '08-07-2020', '15:01', 'dinheiro', 64.25, 59.0, 1, ''),
('151', '571', '08-03-2020', '08-06-2020', '15:37', 'picpay', 30, 30, 1, 'minha esposa vai pegar'),
('127', '579', '08-05-2020', '08-08-2020', '15:53', 'pix', 30, 30, 1, ''),
('181', '570', '08-05-2020', '08-07-2020', '16:13', 'picpay', 36.5, 36.5, 1, ''),
('193', '570', '08-06-2020', '08-09-2020', '16:32', 'picpay', 10.5, 10.5, 1, ''),
('129', '579', '08-07-2020', '08-12-2020', '16:47', 'cartao', 57.0, 57.0, 1, 'minha esposa vai pegar'),
('134', '571', '08-07-2020', '08-10-2020', '17:12', 'pix', 35.0, 35.0, 1, ''),
('129', '579', '08-08-2020', '08-14-2020', '17:43', 'pix', 93.5, 93.5, 1, ''),
('231', '571', '08-07-2020', '08-10-2020', NULL, 'cartao', 52.0, 52.0, 1, ''),
('134', '696', '08-08-2020', '08-14-2020', NULL, 'pix', 10, 10, 1, 'minha filha vai pegar'),
('264', '696', '09-03-2020', '09-10-2020', '14:25', 'dinheiro', 159.7, 80, 1, ''),
('207', '696', '09-03-2020', '09-10-2020', '15:07', 'dinheiro', 69.96, 39, 1, ''),
('264', '571', '09-03-2020', '09-11-2020', '15:32', 'picpay', 100, 100, 1, 'meu marido vai pegar'),
('209', '579', '09-03-2020', '09-12-2020', '15:57', 'picpay', 39.0, 39.0, 1, 'vai vim pegar'),
('158', '555', '09-06-2020', '09-08-2020', '16:28', 'picpay', 31, 31, 1, 'vai vim pegar'),
('129', '579', '09-06-2020', '09-09-2020', NULL, 'pix', 78, 78, 1, 'entregar na portaria de vidro'),
('265', '555', '09-06-2020', '09-08-2020', NULL, 'picpay', 62, 62, 1, ''),
('987', '560', '09-06-2020', '09-09-2020', '16:45', 'picpay', 24.0, 24.0, 1, 'meu filho vai pegar'),
('210', '565', '09-08-2020', '09-11-2020', NULL, 'picpay', 78.0, 78.0, 1, ''),
('987', '567', '09-08-2020', '09-11-2020', '17:10', 'pix', 82.5, 82.5, 1, ''),
('191', '101', '09-11-2020', '09-13-2020', '17:31', 'dinheiro', 90.25, 86.0, 1, 'meu filho vai pegar'),
('251', 'id9', '09-13-2020', '09-13-2020', '17:45', 'picpay', 11.0, 11.0, 1, 'minha filha vai pegar'),
('154', '458', '09-25-2020', '10-05-2020', '17:59', 'pix', 15, 15, 1, 'minha esposa vai pegar'),
('127', '458', '11-03-2020', '11-15-2020', '14:02', 'dinheiro', 89.35, 48.5, 1, 'vai vim pegar'),
('210', 'id9', '11-03-2020', '11-15-2020', '14:27', 'picpay', 63.5, 63.5, 1, ''),
('131', '202', '11-03-2020', '11-15-2020', '15:47', 'pix', 62.5, 62.5, 1, 'meu filho vai pegar'),
('158', '202', '11-03-2020', '11-06-2020', '15:56', 'dinheiro', 45.55, 23, 1, ''),
('206', '450', '11-03-2020', '11-05-2020', '16:14', 'pix', 54.5, 54.5, 1, ''),
('132', '459', '11-05-2020', '11-07-2020', '16:28', 'cartao', 44.0, 44.0, 1, ''),
('195', '563', '11-07-2020', '11-09-2020', '16:49', 'dinheiro', 13.15, 10, 1, ''),
('131', '563', '11-07-2020', '11-09-2020', '17:49', 'cartao', 64, 64, 1, 'meu marido vai pegar'),
('134', '009', '11-09-2020', '11-11-2020', '18:47', 'cartao', 5, 5, 1, ''),
('222', '459', '11-09-2020', '11-11-2020', '16:47', 'cartao', 23.5, 23.5, 1, 'minha esposa vai pegar'),
('222', '450', '11-12-2020', '11-12-2020', '17:07', 'picpay', 19.5, 19.5, 1, ''),
('204', '555', '11-12-2020', '11-12-2020', '14:47', 'cartao', 40, 40, 1, ''),
('158', '450', '11-13-2020', '11-15-2020', '17:37', 'cartao', 6, 6, 1, ''),
('130', '555', '11-13-2020', '11-15-2020', '18:27', 'picpay', 27.0, 27.0, 1, 'meu filho vai pegar');

/* INSERCAO - TABELA VENDA_PRODUTO */

INSERT INTO VENDA_PRODUTO(fk_PRODUTOS_id, fk_VENDAS_id, qtd, valor, sabor)
VALUES
('sonB', 1, 3, 27, 'goiabada'),
('pctr', 1, 3, 15, NULL),
('msoB', 1, 3, 30, 'tradicional'),
('sonh', 1, 1, 3.5, 'doce de leite'),
('sonB', 2, 1, 9, 'tradicional'),
('sonh', 3, 2, 7.0, 'chocolate'),
('pudm', 3, 1, 5, 'tradicional'),
('sonh', 3, 4, 14.0, 'tradicional'),
('pcmh', 3, 3, 18, NULL),
('pudm', 4, 3, 15, 'tradicional'),
('erld', 4, 4, 20, 'presunto e queijo'),
('pctr', 5, 1, 5, NULL),
('sonh', 5, 1, 3.5, 'goiabada'),
('msoB', 6, 1, 10, 'chocolate'),
('pcmh', 6, 4, 24, NULL),
('sonB', 7, 1, 9, 'goiabada'),
('pcmh', 7, 2, 12, NULL),
('sonB', 7, 3, 27, 'tradicional'),
('msoB', 7, 3, 30, 'doce de leite'),
('moss', 8, 2, 10, 'leite ninho'),
('erld', 8, 1, 5, 'presunto e queijo'),
('msoB', 8, 3, 30, 'tradicional'),
('sonh', 9, 3, 10.5, 'chocolate'),
('sonB', 9, 2, 18, 'tradicional'),
('moss', 9, 4, 20, 'leite ninho'),
('sonB', 10, 4, 36, 'tradicional'),
('sonh', 11, 4, 14.0, 'doce de leite'),
('msoB', 11, 2, 20, 'chocolate'),
('erld', 11, 3, 15, 'presunto e queijo'),
('pudm', 11, 2, 10, 'chocolate'),
('pctr', 11, 3, 15, NULL),
('pudm', 12, 3, 15, 'tradicional'),
('pctr', 12, 3, 15, NULL),
('erld', 12, 1, 5, 'presunto e queijo'),
('ment', 12, 4, 10.0, NULL),
('moss', 12, 2, 10, 'leite ninho'),
('sonh', 13, 1, 3.5, 'chocolate'),
('pcmh', 13, 4, 24, NULL),
('erld', 13, 4, 20, 'presunto e queijo'),
('ment', 14, 2, 5.0, NULL),
('moss', 15, 4, 20, 'leite ninho'),
('pudm', 15, 1, 5, 'tradicional'),
('pudm', 16, 3, 15, 'tradicional'),
('ment', 16, 3, 7.5, NULL),
('ment', 16, 3, 7.5, NULL),
('sonh', 16, 3, 10.5, 'chocolate'),
('sonB', 16, 4, 36, 'tradicional'),
('sonh', 17, 3, 10.5, 'chocolate'),
('pcmh', 17, 4, 24, NULL),
('pudm', 18, 1, 5, 'tradicional'),
('pudm', 18, 3, 15, 'chocolate'),
('pctr', 19, 1, 5, NULL),
('pudm', 19, 4, 20, 'chocolate'),
('ment', 19, 3, 7.5, NULL),
('pudm', 19, 2, 10, 'tradicional'),
('sonB', 19, 3, 27, 'chocolate'),
('msoB', 20, 3, 30, 'doce de leite'),
('sonh', 20, 3, 10.5, 'chocolate'),
('pcmh', 20, 2, 12, NULL),
('sonh', 20, 3, 10.5, 'doce de leite'),
('ment', 21, 2, 5.0, NULL),
('pcmh', 22, 2, 12, NULL),
('sonB', 22, 1, 9, 'chocolate'),
('moss', 23, 2, 10, 'leite ninho'),
('msoB', 23, 4, 40, 'chocolate'),
('pudm', 23, 3, 15, 'chocolate'),
('ment', 23, 4, 10.0, NULL),
('erld', 24, 3, 15, 'presunto e queijo'),
('pctr', 25, 3, 15, NULL),
('pcmh', 25, 4, 24, NULL),
('erld', 25, 2, 10, 'presunto e queijo'),
('pudm', 26, 1, 5, 'tradicional'),
('msoB', 26, 2, 20, 'goiabada'),
('ment', 26, 1, 2.5, NULL),
('pudm', 26, 3, 15, 'chocolate'),
('pctr', 26, 2, 10, NULL),
('ment', 27, 2, 5.0, NULL),
('pctr', 27, 4, 20, NULL),
('pctr', 28, 2, 10, NULL),
('ment', 28, 4, 10.0, NULL),
('msoB', 28, 2, 20, 'goiabada'),
('pcmh', 28, 2, 12, NULL),
('sonh', 28, 2, 7.0, 'doce de leite'),
('pudm', 29, 2, 10, 'tradicional'),
('moss', 29, 4, 20, 'leite ninho'),
('moss', 30, 1, 5, 'leite ninho'),
('moss', 30, 3, 15, 'leite ninho'),
('moss', 30, 2, 10, 'leite ninho'),
('sonh', 31, 3, 10.5, 'chocolate'),
('pcmh', 31, 1, 6, NULL),
('erld', 31, 4, 20, 'presunto e queijo'),
('sonh', 32, 3, 10.5, 'doce de leite'),
('sonh', 33, 2, 7.0, 'doce de leite'),
('msoB', 33, 2, 20, 'tradicional'),
('msoB', 33, 1, 10, 'tradicional'),
('msoB', 33, 2, 20, 'doce de leite'),
('ment', 34, 2, 5.0, NULL),
('pctr', 34, 3, 15, NULL),
('pctr', 34, 3, 15, NULL),
('sonh', 35, 4, 14.0, 'tradicional'),
('pcmh', 35, 1, 6, NULL),
('msoB', 35, 3, 30, 'doce de leite'),
('msoB', 35, 4, 40, 'chocolate'),
('sonh', 35, 1, 3.5, 'doce de leite'),
('sonh', 36, 2, 7.0, 'chocolate'),
('sonB', 36, 1, 9, 'chocolate'),
('pcmh', 36, 1, 6, NULL),
('msoB', 36, 3, 30, 'doce de leite'),
('moss', 37, 2, 10, 'leite ninho'),
('sonB', 38, 2, 18, 'chocolate'),
('pcmh', 38, 3, 18, NULL),
('moss', 38, 1, 5, 'leite ninho'),
('sonB', 38, 3, 27, 'chocolate'),
('pcmh', 38, 2, 12, NULL),
('pudm', 39, 3, 15, 'tradicional'),
('pcmh', 39, 4, 24, NULL),
('pctr', 40, 3, 15, NULL),
('msoB', 40, 4, 40, 'goiabada'),
('erld', 40, 4, 20, 'presunto e queijo'),
('moss', 40, 1, 5, 'leite ninho'),
('erld', 40, 4, 20, 'presunto e queijo'),
('pudm', 41, 2, 10, 'chocolate'),
('pcmh', 41, 4, 24, NULL),
('ment', 41, 2, 5.0, NULL),
('sonB', 42, 1, 9, 'doce de leite'),
('pcmh', 42, 2, 12, NULL),
('moss', 42, 2, 10, 'leite ninho'),
('erld', 43, 1, 5, 'presunto e queijo'),
('pctr', 43, 3, 15, NULL),
('sonB', 43, 2, 18, 'doce de leite'),
('erld', 43, 4, 20, 'presunto e queijo'),
('msoB', 43, 2, 20, 'chocolate'),
('pudm', 44, 2, 10, 'tradicional'),
('sonB', 44, 4, 36, 'goiabada'),
('pudm', 44, 2, 10, 'chocolate'),
('pcmh', 44, 1, 6, NULL),
('ment', 45, 2, 5.0, NULL),
('sonh', 45, 4, 14.0, 'chocolate'),
('pctr', 45, 1, 5, NULL),
('pcmh', 46, 1, 6, NULL),
('pudm', 46, 4, 20, 'tradicional'),
('erld', 46, 4, 20, 'presunto e queijo'),
('sonB', 46, 2, 18, 'tradicional'),
('sonh', 46, 4, 14.0, 'tradicional'),
('sonh', 47, 1, 3.5, 'chocolate'),
('sonB', 47, 1, 9, 'doce de leite'),
('msoB', 47, 4, 40, 'tradicional'),
('moss', 47, 4, 20, 'leite ninho'),
('pctr', 47, 2, 10, NULL),
('ment', 48, 2, 5.0, NULL),
('msoB', 48, 3, 30, 'tradicional'),
('pcmh', 48, 4, 24, NULL),
('sonB', 48, 3, 27, 'doce de leite'),
('sonh', 49, 1, 3.5, 'goiabada'),
('ment', 49, 3, 7.5, NULL),
('pudm', 50, 2, 10, 'tradicional'),
('pctr', 50, 1, 5, NULL),
('pcmh', 51, 1, 6, NULL),
('erld', 51, 3, 15, 'presunto e queijo'),
('ment', 51, 3, 7.5, NULL),
('pctr', 51, 2, 10, NULL),
('pctr', 51, 2, 10, NULL),
('sonB', 52, 4, 36, 'doce de leite'),
('ment', 52, 3, 7.5, NULL),
('pudm', 52, 4, 20, 'chocolate'),
('ment', 53, 3, 7.5, NULL),
('sonh', 53, 4, 14.0, 'goiabada'),
('sonB', 53, 1, 9, 'tradicional'),
('sonh', 53, 4, 14.0, 'chocolate'),
('sonB', 53, 2, 18, 'doce de leite'),
('sonB', 54, 2, 18, 'goiabada'),
('pudm', 54, 1, 5, 'chocolate'),
('sonh', 55, 2, 7.0, 'tradicional'),
('pudm', 55, 3, 15, 'chocolate'),
('sonh', 55, 2, 7.0, 'doce de leite'),
('sonh', 55, 3, 10.5, 'doce de leite'),
('pudm', 55, 3, 15, 'chocolate'),
('erld', 56, 2, 10, 'presunto e queijo'),
('sonh', 56, 4, 14.0, 'goiabada'),
('moss', 56, 2, 10, 'leite ninho'),
('pctr', 56, 2, 10, NULL),
('moss', 57, 2, 10, 'leite ninho'),
('pudm', 58, 4, 20, 'chocolate'),
('sonB', 58, 1, 9, 'doce de leite'),
('msoB', 58, 2, 20, 'goiabada'),
('moss', 58, 1, 5, 'leite ninho'),
('moss', 58, 2, 10, 'leite ninho'),
('pudm', 59, 1, 5, 'chocolate'),
('sonh', 60, 1, 3.5, 'goiabada'),
('moss', 60, 4, 20, 'leite ninho'),
('sonB', 61, 1, 9, 'chocolate'),
('sonh', 61, 3, 10.5, 'doce de leite'),
('msoB', 62, 4, 40, 'chocolate'),
('pcmh', 63, 1, 6, NULL),
('sonh', 64, 2, 7.0, 'chocolate'),
('moss', 64, 4, 20, 'leite ninho');
