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


/* INSERÇÃO DOS DADOS */

/* INSERCAO - TABELA FUNCIONARIO */

INSERT INTO FUNCIONARIO(id, nome_sobrenome, senha, funcao) 
VALUES('id1', 'Ana da Silva', '1234', 'Atendente'),
('551', 'João Pedro da Silva', '4545','Atendente'),
('499', 'Helena Soares', '1313','Gerente'),
('501', 'Maria Eduarda Gomes', '1212','Atendente'),
('356', 'Fernando Ferreira', '2325','Gerente'),
('480', 'Cláudia Lima', '2426','Atendente'),
('485', 'Alice Vieira', '2323','Atendente'),
('552', 'Antonio Carlos', '6872','Atendente'),
('560', 'Felipe Gomes', '3452','Atendente'),
('565', 'Luana Dias', '2015','Atendente')
('553', 'Mariana Matos', '3032','Atendente');
('558', 'João Lucas Silva', '1503','Atendente'),
('561', 'Clarisse Soares', '0207','Gerente'),
('566', 'Eduarda Lopes', '0509','Atendente'),
('567', 'Fernando Couto', '5352','Gerente'),
('570', 'Elias Ferreira', '5629','Atendente'),
('569', 'Alice Constatino', '1224','Atendente'),
('578', 'Antonio Luiz', '2356','Atendente'),
('580', 'Felipe da Mata', '5457','Atendente'),
('571', 'Romário Fariaz', '1369','Atendente')
('458', 'Samuel Oliveira', '1852','Atendente');
('559', 'João Pedro Nascimento', '7412','Atendente'),
('562', 'Lucas Soares', '3214','Gerente'),
('579', 'Lívia Gomes', '7896','Atendente'),
('id5', 'Sandra Ferreira', '6541','Gerente'),
('554', 'Ana Lima', '4563','Atendente'),
('572', 'Rodrigo Vieira', '1596','Atendente'),
('101', 'Thiago Almeida', '3574','Atendente'),
('id9', 'Felipe Araújo', '1874','Atendente'),
('568', 'Clara Oliveira Andrade', '4125','Atendente')
('459', 'Felipe Andrade', '2369','Atendente');
('563', 'Cíntia Oliveira', '4526','Atendente'),
('557', 'Vitória Maria da Silva', '2698','Gerente'),
('102', 'Diego Santos', '2369','Atendente'),
('120', 'Fernando Nascimento', '2586','Gerente'),
('009', 'Eduardo Luiz Augusto', '1324','Atendente'),
('203', 'Luiz Augusto', '4587','Atendente'),
('202', 'Clara Andrade', '1159','Atendente'),
('574', 'Felipe Mota', '0303','Atendente'),
('556', 'Luana Garcia', '8852','Atendente')
('450', 'Juliana Silva', '3917','Atendente');
('564', 'Pedro Lucas Lopes', '9135','Atendente'),
('008', 'Helena Soares', '7964','Gerente'),
('696', 'Gabriela Gomes', '2501','Atendente'),
('705', 'Heitor Ferreira', '2020','Gerente'),
('808', 'Kaio Lima', '0606','Atendente'),
('009', 'Alice Costa', '5451','Atendente'),
('007', 'Antonio Souto', '2627','Atendente'),
('573', 'Felipe do Carmo', '1819','Atendente'),
('555', 'Luana Pereira', '9896','Atendente');

/* INSERCAO - TABELA ENDERECO */

INSERT INTO ENDERECO(tipo, lougradoro_nome, numero, bairro, municipio, estados_uf, complemento, cep)
VALUES('Rua', ' Lírio dos Vales', 3, 'São Lucas', 'Vitória', 'ES', 'Fundos', '2900000'),
('Avenida','Lima Silva',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900353'),
('Avenida','Avenida Aparecida',154,'São João', 'Vila Velha','ES','Apt 34','2900050'),
('Rua','Constante Sodré ',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900145'),
('Rua','Anacleto Soares',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900400'),
('Avenida','Coelho Mota',325,'', 'Vila Velha','ES','Apt 104','2900300'),
('Avenida','Navegantes',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900152'),
('Rua',' Aleixo Neto',230,'Praia do Canto', 'Vitória','ES','Apt 205','2900562'),
('Avenida','Soares Souza',724,'Vista Alegre', 'Serra','ES','casa','2900500'),
('Avenida','Avenida Barreto Couto',831,'Vila Nova', 'Vila Velha','ES','casa','2900900')
('Rua',' Paulo de Vasconcelos',3,'São Lucas', 'Vitória','ES','Fundos','2900123')
('Avenida','Antônio Santos Borges',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900300'),
('Avenida','Sebastião Nestor de Oliveira',154,'São João', 'Vila Velha','ES','Apt 34','2900600'),
('Rua','Professora Jacy Alves Fraga',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900136'),
('Rua','Anacleto Soares',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900453'),
('Avenida','Flamboyan',325,'', 'Vila Velha','ES','Apt 104','2900800'),
('Avenida','Wlademiro da Silveira',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900452'),
('Rua',' Rosa de Sharon',230,'Praia do Canto', 'Vitória','ES','Apt 205','29003867'),
('Avenida','Jurema Barroso',724,'Vista Alegre', 'Serra','ES','casa','2900520'),
('Travessa','Domingos Carneiro',831,'Vila Nova', 'Vila Velha','ES','casa','2900980')
('Rua',' Epifânio Ribeiro',3,'São Lucas', 'Vitória','ES','Fundos','2900269')
('Rua','Marilza Paranho Netto',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900303'),
('Avenida','Joaquim José da Vitória',154,'São João', 'Vila Velha','ES','Apt 34','2900336'),
('Rua','Izidro Benezath',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900000'),
('Rua','Tereza Zanoni Coser',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900456'),
('Avenida','Maria Saraiva',325,'', 'Vila Velha','ES','Apt 104','2900300'),
('Avenida','Ruy Pinto Bandeira',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900789'),
('Rua','Arthur Mello',230,'Praia do Canto', 'Vitória','ES','Apt 205','2900911'),
('Rua','São Vicente',724,'Vista Alegre', 'Serra','ES','casa','2900513'),
('Rua','Dulce Brito Espíndula',831,'Vila Nova', 'Vila Velha','ES','casa','2900914')
('Rua',' Desembargador Homero',3,'São Lucas', 'Vitória','ES','Fundos','2900150')
('Avenida','Professor Heráclito Pereira	Vitória',124,'Vista Linda','Vila Velha' ,'ES','Apt 104','2900163'),
('Avenida','Moacir Strauch',154,'São João', 'Vila Velha','ES','Apt 34','2900178'),
('Rua','Izaltino Arão Marques',25,'Santa Lúcia', 'Vitória','ES','Apt 230','2900196'),
('Rua','José Passos',524,'Jardim das Flores', 'Vila Velha','ES','Casa','2900420'),
('Avenida','São Simão	Vitória',325,'', 'Vila Velha','ES','Apt 104','2900321'),
('Rua','São Mateus',124,'Praia do Suá', 'Vitória','ES','Apt 104','2900022'),
('Rua',' Henrique Novaes',230,'Praia do Canto', 'Vitória','ES','Apt 205','2900230'),
('Avenida','Henry Ford',724,'Vista Alegre', 'Serra','ES','casa','2900524'),
('Avenida','Leonídio Pereira',831,'Vila Nova', 'Vila Velha','ES','casa','2900900')
('Rua',' Ugo Abílio Rigo',3,'São Lucas', 'Vitória','ES','Fundos','2900000')
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
('987', 'Maria', 'da Silva', '3222-3531', 1);
('131', 'Alice', 'Soares Barreto', '3233-3332',2),
('151', 'Jonas', 'Gonçalves', '3531-2826',3),
('181', 'Fernando', 'Menezes', '3222-7412',4),
('203', 'Lucas', 'Ferreira Lima', '3635-3839',5),
('208', 'Mateus', 'Vieira de Sá', '3233-3134',6),
('225', 'Clarisse', 'Alencar de Souza', '3230-3534',7),
('240', 'Thiago', 'Alves Rodrigues', '3738-3231',8),
('251', 'Humberto', 'Rocha Siqueira', '3532-2224',9),
('264', 'Felipe', 'Andrade de Azevedo', '3222-4541',10)
('126', 'Samuel', 'da Silva', '3255-3555',11),
('130', 'Elias', 'Soares Barreto', '3233-3152',12),
('153', 'Bernado', 'Gonçalves', '3531-5273',13),
('189', 'Wilson', 'Menezes', '3222-7412',14),
('195', 'Maria', 'Ferreira Lima', '3635-3278',15),
('204', 'Thiago', 'Vieira de Sá', '3233-2697',16),
('209', 'Clarisse', 'Alencar de Souza', '3230-9999',17),
('224', 'Felipe', 'Alves Rodrigues', '3738-7895',18),
('265', 'Carla', 'Rocha Siqueira', '3532-3689',19),
('193', 'Felipe', 'Andrade de Azevedo', '3222-0575',20)
('127', 'Henrique', 'da Silva', '3222-5551',21),
('132', 'Roberto', 'Soares Barreto', '3003-3332',22),
('154', 'Jeferson', 'Gonçalves', '3531-5714',23),
('190', 'Ana', 'Menezes', '3222-7412',24),
('205', 'Luiza', 'Ferreira Lima', '3635-3321',25),
('194', 'Juliana', 'Vieira de Sá', '3783-3134',26),
('222', 'Eduardo', 'Alencar de Souza', '3230-3534',27),
('210', 'Gabriele', 'Alves Rodrigues', '3796-3231',28),
('223', 'Luiz', 'Rocha Siqueira', '357-2224',29),
('196', 'Leonardo', 'Andrade de Azevedo', '3223-4541',30)
('128', 'João Lucas', 'da Silva', '3153-3531'31),
('133', 'Ana Maria', 'Soares Barreto', '3233-3332',32),
('155', 'José Carlos', 'Gonçalves', '3502-2826',33),
('202', 'Poliana', 'Menezes', '3222-047',34),
('207', 'Letícia', 'Ferreira Lima', '3635-1204',35),
('266', 'Jucelino', 'Vieira de Sá', '3233-33257',36),
('231', 'Edson', 'Alencar de Souza', '3230-0145',37),
('220', 'Vitor', 'Alves Rodrigues', '3738-0175',38),
('197', 'Lia', 'Rocha Siqueira', '3532-0147',39),
('191', 'Helenice', 'Andrade de Azevedo', '3222-0475',40)
('129', 'Caroline', 'da Silva', '3222-0155',41),
('134', 'Maria Lúcia', 'Soares Barreto', '3233-05155',42),
('158', 'José Luiz', 'Gonçalves', '3531-0554',43),
('206', 'Ricardo', 'Menezes', '3222-7002',44),
('201', 'Pedro', 'Ferreira Lima', '3635-5559',45),
('192', 'Luiz Carlos', 'Vieira de Sá', '3233-0574',46),
('180', 'Eunice', 'Alencar de Souza', '3230-0514',47),
('150', 'Aline', 'Alves Rodrigues', '3738-1857',48),
('135', 'Érica', 'Rocha Siqueira', '3532-1111',49),
('101', 'Luiz Felipe', 'Andrade de Azevedo', '3222-4444',510);


/* INSERCAO - TABELA CATEGORIA */

INSERT INTO CATEGORIA(id, tipo)
VALUES
('de', 'doce'),
('so', 'salgado')

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
('erpq', 7),
('ment', 15),
('pctr', 6),
('pcmh', 10),
('mslh', 10),
('pudm', 15);

/* INSERCAO - TABELA PEDIDO_ESTADO */

INSERT INTO PEDIDO_ESTADO(status)
VALUES
('solicitado')
('pronto')
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
('131', '485', '06-03-2020', '06-05-2020', '12:30', 0.0, 79, 4, 'minha filha vai pegar'),
('181', '552', '06-03-2020', '06-05-2020', 'NULL', 0.0, 57.5, 4, ''),
('131', '553', '06-03-2020', '06-05-2020', '15:43', 0.0, 61, 4, 'vai vim pegar'),
('203', '485', '06-03-2020', '06-05-2020', '15:58', 0.0, 37.5, 1, ''),
('203', '566', '06-07-2020', '06-13-2020', '14:01', '79.34662519442796', 46, 3, 'vai vim pegar'),
('264', '552', '06-07-2020', '06-13-2020', '14:29', 0.0, 7.0, 1, ''),
('264', '553', '06-07-2020', '06-13-2020', '15:06', 0.0, 10.0, 2, ''),
('195', '553', '06-08-2020', '06-11-2020', '16:14', 0.0, 26, 2, ''),
('204', '566', '06-08-2020', '06-11-2020', '16:23', '51.329050420627496', 40, 3, ''),
('265', '566', '06-08-2020', '06-12-2020', '16:47', '41.557271016635184', 33.0, 3, 'meu marido vai pegar'),
('193', '568', '06-09-2020', '06-20-2020', '17:23', 0.0, 25.5, 4, 'vai vim pegar'),
('210', '557', '06-09-2020', '06-20-2020', '17:45', '65.10118649000907', 53.0, 3, 'minha esposa vai pegar'),
('194', '568', '07-03-2020', '07-05-2020', '14:35', 0.0, 14.0, 4, ''),
('222', '009', '07-03-2020', '07-05-2020', '15:03', 0.0, 36, 2, ''),
('210', '554', '07-03-2020', '07-04-2020', '15:25', 0.0, 57.0, 2, ''),
('208', '554', '07-03-2020', '07-04-2020', '15:58', 0.0, 56, 1, ''),
('266', '554', '07-04-2020', '07-07-2020', '16:23', 0.0, 105, 2, ''),
('222', '009', '07-04-2020', '07-07-2020', '16:42', 0.0, 64.0, 4, ''),
('207', '102', '07-05-2020', '07-08-2020', '17:04', '72.24574546413143', 40, 3, 'vai vim pegar'),
('196', '450', '07-06-2020', '07-07-2020', '17:27', 0.0, 20, 4, ''),
('180', '102', '07-09-2020', '07-09-2020', '17:38', 0.0, 60, 2, ''),
('134', '450', '07-10-2020', '07-14-2020', '17:55', 0.0, 56, 4, ''),
('223', '558', '07-10-2020', '07-14-2020', '18:47', 0.0, 88, 1, ''),
('201', '570', '08-03-2020', '08-04-2020', '14:05', 0.0, 51.0, 1, 'entregar na portaria de vidro'),
('223', '558', '08-03-2020', '08-05-2020', '14:29', 0.0, 64.5, 4, 'vai vim pegar'),
('133', '558', '08-03-2020', '08-04-2020', '13:25', 0.0, 57.0, 4, ''),
('231', '579', '08-03-2020', '08-05-2020', '11:36', 0.0, 92.0, 2, ''),
('133', '570', '08-03-2020', '08-07-2020', '15:01', '60.49739933819334', 56.0, 3, ''),
('151', '571', '08-03-2020', '08-06-2020', '15:37', 0.0, 39, 4, 'minha filha vai pegar'),
('127', '579', '08-05-2020', '08-08-2020', '15:53', 0.0, 38, 2, 'minha filha vai pegar'),
('181', '570', '08-05-2020', '08-07-2020', '16:13', 0.0, 88.5, 1, ''),
('193', '570', '08-06-2020', '08-09-2020', '16:32', '81.66758794928933', 51.0, 3, 'minha filha vai pegar'),
('129', '579', '08-07-2020', '08-12-2020', '16:47', 0.0, 45, 1, ''),
('134', '571', '08-07-2020', '08-10-2020', '17:12', '46.80768214714132', 24, 3, 'entregar na portaria de vidro'),
('129', '579', '08-08-2020', '08-14-2020', '17:43', 0.0, 15, 1, ''),
('231', '571', '08-07-2020', '08-10-2020', 'NULL', '151.781650997841', 85.5, 3, ''),
('134', '696', '08-08-2020', '08-14-2020', 'NULL', 0.0, 56, 4, ''),
('264', '696', '09-03-2020', '09-10-2020', '14:25', 0.0, 45, 2, 'vai vim pegar'),
('207', '696', '09-03-2020', '09-10-2020', '15:07', 0.0, 70, 1, 'minha esposa vai pegar'),
('264', '571', '09-03-2020', '09-11-2020', '15:32', 0.0, 68, 4, ''),
('209', '579', '09-03-2020', '09-12-2020', '15:57', 0.0, 91, 2, 'meu marido vai pegar'),
('158', '555', '09-06-2020', '09-08-2020', '16:28', 0.0, 136, 4, 'meu filho vai pegar'),
('129', '579', '09-06-2020', '09-09-2020', 'NULL', 0.0, 57.0, 1, ''),
('265', '555', '09-06-2020', '09-08-2020', 'NULL', 0.0, 29, 4, ''),
('987', '560', '09-06-2020', '09-09-2020', '16:45', 0.0, 43.5, 1, ''),
('210', '565', '09-08-2020', '09-11-2020', 'NULL', '86.14959802798234', 49, 3, ''),
('987', '567', '09-08-2020', '09-11-2020', '17:10', 0.0, 44, 1, 'vai vim pegar'),
('191', '101', '09-11-2020', '09-13-2020', '17:31', 0.0, 42.0, 4, ''),
('251', 'id9', '09-13-2020', '09-13-2020', '17:45', 0.0, 24, 1, 'meu filho vai pegar'),
('154', '458', '09-25-2020', '10-05-2020', '17:59', 0.0, 55, 2, ''),
('127', '458', '11-03-2020', '11-15-2020', '14:02', '134.74402953162576', 99.0, 3, ''),
('210', 'id9', '11-03-2020', '11-15-2020', '14:27', '45.09789075150879', 34.0, 3, 'vai vim pegar'),
('131', '202', '11-03-2020', '11-15-2020', '15:47', 0.0, 20.0, 4, ''),
('158', '202', '11-03-2020', '11-06-2020', '15:56', 0.0, 20.5, 2, ''),
('206', '450', '11-03-2020', '11-05-2020', '16:14', 0.0, 66.5, 2, ''),
('132', '459', '11-05-2020', '11-07-2020', '16:28', '98.95995901362727', 50, 3, 'entregar na portaria de vidro'),
('195', '563', '11-07-2020', '11-09-2020', '16:49', 0.0, 33, 2, ''),
('131', '563', '11-07-2020', '11-09-2020', '17:49', 0.0, 65.0, 4, ''),
('134', '009', '11-09-2020', '11-11-2020', '18:47', 0.0, 18, 2, ''),
('222', '459', '11-09-2020', '11-11-2020', '16:47', 0.0, 35.0, 4, ''),
('222', '450', '11-12-2020', '11-12-2020', '17:07', 0.0, 66.5, 4, ''),
('204', '555', '11-12-2020', '11-12-2020', '14:47', '24.88299199974043', 15, 3, ''),
('158', '450', '11-13-2020', '11-15-2020', '17:37', 0.0, 48.5, 1, 'meu marido vai pegar'),
('130', '555', '11-13-2020', '11-15-2020', '18:27', 0.0, 27, 4, 'entregar na portaria de vidro');

/* INSERCAO - TABELA VENDA_PRODUTO */

INSERT INTO VENDA_PRODUTO(fk_PRODUTOS_id, fk_VENDAS_id, qtd, valor, sabor)
VALUES
('sonB', 0, 3, 27, 'doce de leite'),
('erld', 0, 2, 10, 'presunto e queijo'),
('sonB', 0, 3, 27, 'chocolate'),
('moss', 0, 3, 15, 'leite ninho'),
('msoB', 1, 2, 20, 'doce de leite'),
('erld', 1, 3, 15, 'presunto e queijo'),
('moss', 1, 4, 20, 'leite ninho'),
('ment', 1, 1, 2.5, 'NULL'),
('sonB', 2, 1, 9, 'goiabada'),
('erld', 2, 2, 10, 'presunto e queijo'),
('pcmh', 2, 2, 12, 'NULL'),
('msoB', 2, 1, 10, 'chocolate'),
('moss', 2, 4, 20, 'leite ninho'),
('erld', 3, 4, 20, 'presunto e queijo'),
('ment', 3, 1, 2.5, 'NULL'),
('pudm', 3, 2, 10, 'chocolate'),
('pudm', 3, 1, 5, 'tradicional'),
('pcmh', 4, 1, 6, 'NULL'),
('pudm', 4, 2, 10, 'chocolate'),
('msoB', 4, 3, 30, 'chocolate'),
('sonh', 5, 2, 7.0, 'goiabada'),
('erld', 6, 1, 5, 'presunto e queijo'),
('ment', 6, 2, 5.0, 'NULL'),
('pcmh', 7, 1, 6, 'NULL'),
('pudm', 7, 4, 20, 'chocolate'),
('msoB', 8, 4, 40, 'goiabada'),
('ment', 9, 2, 5.0, 'NULL'),
('ment', 9, 3, 7.5, 'NULL'),
('pcmh', 9, 2, 12, 'NULL'),
('sonh', 9, 1, 3.5, 'doce de leite'),
('pudm', 9, 1, 5, 'chocolate'),
('erld', 10, 2, 10, 'presunto e queijo'),
('ment', 10, 2, 5.0, 'NULL'),
('sonh', 10, 3, 10.5, 'chocolate'),
('msoB', 11, 2, 20, 'doce de leite'),
('sonh', 11, 3, 10.5, 'tradicional'),
('ment', 11, 3, 7.5, 'NULL'),
('erld', 11, 3, 15, 'presunto e queijo'),
('sonh', 12, 4, 14.0, 'tradicional'),
('sonB', 13, 4, 36, 'doce de leite'),
('ment', 14, 4, 10.0, 'NULL'),
('sonB', 14, 3, 27, 'doce de leite'),
('pctr', 14, 4, 20, 'NULL'),
('pctr', 15, 2, 10, 'NULL'),
('pctr', 15, 2, 10, 'NULL'),
('pcmh', 15, 2, 12, 'NULL'),
('pcmh', 15, 4, 24, 'NULL'),
('msoB', 16, 2, 20, 'doce de leite'),
('sonB', 16, 4, 36, 'goiabada'),
('erld', 16, 4, 20, 'presunto e queijo'),
('sonB', 16, 1, 9, 'chocolate'),
('pudm', 16, 4, 20, 'chocolate'),
('msoB', 17, 3, 30, 'chocolate'),
('pctr', 17, 2, 10, 'NULL'),
('ment', 17, 4, 10.0, 'NULL'),
('sonh', 17, 4, 14.0, 'goiabada'),
('msoB', 18, 3, 30, 'chocolate'),
('pctr', 18, 2, 10, 'NULL'),
('pudm', 19, 2, 10, 'tradicional'),
('msoB', 19, 1, 10, 'tradicional'),
('msoB', 20, 1, 10, 'goiabada'),
('pctr', 20, 2, 10, 'NULL'),
('pctr', 20, 1, 5, 'NULL'),
('moss', 20, 3, 15, 'leite ninho'),
('pudm', 20, 4, 20, 'tradicional'),
('pcmh', 21, 3, 18, 'NULL'),
('moss', 21, 4, 20, 'leite ninho'),
('sonB', 21, 2, 18, 'doce de leite'),
('pctr', 22, 1, 5, 'NULL'),
('msoB', 22, 2, 20, 'tradicional'),
('pcmh', 22, 4, 24, 'NULL'),
('sonB', 22, 1, 9, 'goiabada'),
('msoB', 22, 3, 30, 'chocolate'),
('erld', 23, 4, 20, 'presunto e queijo'),
('pcmh', 23, 2, 12, 'NULL'),
('pudm', 23, 1, 5, 'tradicional'),
('sonh', 23, 4, 14.0, 'chocolate'),
('ment', 24, 3, 7.5, 'NULL'),
('sonB', 24, 3, 27, 'chocolate'),
('moss', 24, 2, 10, 'leite ninho'),
('moss', 24, 4, 20, 'leite ninho'),
('sonB', 25, 2, 18, 'goiabada'),
('moss', 25, 3, 15, 'leite ninho'),
('msoB', 25, 1, 10, 'goiabada'),
('sonh', 25, 4, 14.0, 'doce de leite'),
('moss', 26, 1, 5, 'leite ninho'),
('pcmh', 26, 3, 18, 'NULL'),
('sonh', 26, 4, 14.0, 'tradicional'),
('erld', 26, 3, 15, 'presunto e queijo'),
('msoB', 26, 4, 40, 'goiabada'),
('pudm', 27, 3, 15, 'tradicional'),
('ment', 27, 2, 5.0, 'NULL'),
('sonB', 27, 4, 36, 'chocolate'),
('pctr', 28, 3, 15, 'NULL'),
('pcmh', 28, 4, 24, 'NULL'),
('sonB', 29, 2, 18, 'chocolate'),
('msoB', 29, 2, 20, 'chocolate'),
('ment', 30, 3, 7.5, 'NULL'),
('sonB', 30, 4, 36, 'chocolate'),
('pudm', 30, 3, 15, 'tradicional'),
('pudm', 30, 2, 10, 'tradicional'),
('pudm', 30, 4, 20, 'tradicional'),
('ment', 31, 4, 10.0, 'NULL'),
('sonB', 31, 4, 36, 'chocolate'),
('ment', 31, 2, 5.0, 'NULL'),
('erld', 32, 1, 5, 'presunto e queijo'),
('erld', 32, 2, 10, 'presunto e queijo'),
('msoB', 32, 2, 20, 'tradicional'),
('pudm', 32, 2, 10, 'tradicional'),
('sonB', 33, 1, 9, 'doce de leite'),
('moss', 33, 3, 15, 'leite ninho'),
('moss', 34, 3, 15, 'leite ninho'),
('sonB', 35, 2, 18, 'tradicional'),
('ment', 35, 3, 7.5, 'NULL'),
('erld', 35, 2, 10, 'presunto e queijo'),
('msoB', 35, 4, 40, 'goiabada'),
('ment', 35, 4, 10.0, 'NULL'),
('pcmh', 36, 1, 6, 'NULL'),
('pudm', 36, 2, 10, 'tradicional'),
('moss', 36, 2, 10, 'leite ninho'),
('pudm', 36, 3, 15, 'tradicional'),
('pctr', 36, 3, 15, 'NULL'),
('erld', 37, 3, 15, 'presunto e queijo'),
('msoB', 37, 1, 10, 'tradicional'),
('pudm', 37, 2, 10, 'chocolate'),
('erld', 37, 2, 10, 'presunto e queijo'),
('moss', 38, 1, 5, 'leite ninho'),
('erld', 38, 4, 20, 'presunto e queijo'),
('sonB', 38, 3, 27, 'tradicional'),
('sonB', 38, 2, 18, 'goiabada'),
('moss', 39, 3, 15, 'leite ninho'),
('erld', 39, 3, 15, 'presunto e queijo'),
('pcmh', 39, 3, 18, 'NULL'),
('pudm', 39, 3, 15, 'tradicional'),
('moss', 39, 1, 5, 'leite ninho'),
('moss', 40, 3, 15, 'leite ninho'),
('pctr', 40, 4, 20, 'NULL'),
('erld', 40, 4, 20, 'presunto e queijo'),
('sonB', 40, 4, 36, 'doce de leite'),
('sonB', 41, 4, 36, 'goiabada'),
('msoB', 41, 3, 30, 'doce de leite'),
('msoB', 41, 4, 40, 'doce de leite'),
('moss', 41, 4, 20, 'leite ninho'),
('msoB', 41, 1, 10, 'chocolate'),
('pcmh', 42, 3, 18, 'NULL'),
('sonh', 42, 1, 3.5, 'doce de leite'),
('moss', 42, 4, 20, 'leite ninho'),
('sonh', 42, 1, 3.5, 'chocolate'),
('pcmh', 42, 2, 12, 'NULL'),
('pcmh', 43, 4, 24, 'NULL'),
('erld', 43, 1, 5, 'presunto e queijo'),
('ment', 44, 3, 7.5, 'NULL'),
('pudm', 44, 1, 5, 'chocolate'),
('ment', 44, 1, 2.5, 'NULL'),
('sonB', 44, 2, 18, 'doce de leite'),
('sonh', 44, 3, 10.5, 'tradicional'),
('sonB', 45, 1, 9, 'goiabada'),
('pcmh', 45, 4, 24, 'NULL'),
('pudm', 45, 2, 10, 'chocolate'),
('pcmh', 45, 1, 6, 'NULL'),
('pcmh', 46, 4, 24, 'NULL'),
('pudm', 46, 4, 20, 'tradicional'),
('sonB', 47, 3, 27, 'doce de leite'),
('ment', 47, 4, 10.0, 'NULL'),
('pudm', 47, 1, 5, 'tradicional'),
('pudm', 48, 3, 15, 'chocolate'),
('sonB', 48, 1, 9, 'doce de leite'),
('pctr', 49, 4, 20, 'NULL'),
('moss', 49, 3, 15, 'leite ninho'),
('erld', 49, 4, 20, 'presunto e queijo'),
('moss', 50, 1, 5, 'leite ninho'),
('sonh', 50, 4, 14.0, 'chocolate'),
('msoB', 50, 2, 20, 'goiabada'),
('pcmh', 50, 4, 24, 'NULL'),
('sonB', 50, 4, 36, 'chocolate'),
('sonh', 51, 4, 14.0, 'tradicional'),
('ment', 51, 4, 10.0, 'NULL'),
('pctr', 51, 2, 10, 'NULL'),
('pctr', 52, 3, 15, 'NULL'),
('ment', 52, 2, 5.0, 'NULL'),
('erld', 53, 1, 5, 'presunto e queijo'),
('pcmh', 53, 2, 12, 'NULL'),
('sonh', 53, 1, 3.5, 'doce de leite'),
('moss', 54, 1, 5, 'leite ninho'),
('moss', 54, 4, 20, 'leite ninho'),
('pcmh', 54, 4, 24, 'NULL'),
('ment', 54, 1, 2.5, 'NULL'),
('pudm', 54, 3, 15, 'tradicional'),
('moss', 55, 4, 20, 'leite ninho'),
('pudm', 55, 3, 15, 'chocolate'),
('erld', 55, 3, 15, 'presunto e queijo'),
('sonB', 56, 2, 18, 'doce de leite'),
('moss', 56, 3, 15, 'leite ninho'),
('pctr', 57, 2, 10, 'NULL'),
('moss', 57, 1, 5, 'leite ninho'),
('sonh', 57, 4, 14.0, 'tradicional'),
('sonB', 57, 4, 36, 'tradicional'),
('pcmh', 58, 3, 18, 'NULL'),
('msoB', 59, 3, 30, 'doce de leite'),
('ment', 59, 2, 5.0, 'NULL'),
('sonB', 60, 4, 36, 'chocolate'),
('sonh', 60, 3, 10.5, 'doce de leite'),
('erld', 60, 4, 20, 'presunto e queijo'),
('moss', 61, 3, 15, 'leite ninho'),
('sonh', 62, 3, 10.5, 'goiabada'),
('moss', 62, 1, 5, 'leite ninho'),
('sonB', 62, 2, 18, 'doce de leite'),
('erld', 62, 3, 15, 'presunto e queijo'),
('pcmh', 63, 2, 12, 'NULL'),
('erld', 63, 3, 15, 'presunto e queijo');