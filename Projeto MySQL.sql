create database db_cd;
use db_cd;
drop table estados;
SELECT * FROM funcionarios;
SELECT * FROM dependentes;
SELECT * FROM estados;
SELECT * FROM cidades;
SELECT * FROM clientes;
SELECT * FROM conjuges;
SELECT * FROM artistas;
SELECT * FROM gravadoras;
SELECT * FROM categorias;
SELECT * FROM titulos;
SELECT * FROM titulos_artistas;
SELECT * FROM pedidos;
SELECT * FROM titulos_pedidos;

CREATE TABLE funcionarios
(
    cod_func INT NOT NULL AUTO_INCREMENT,
    nome_func VARCHAR(100) NOT NULL,
    end_func VARCHAR(200) NOT NULL,
    sal_func DECIMAL(10,2) NOT NULL DEFAULT 0,
    sexo_func CHAR(1) NOT NULL DEFAULT 'f',
    
    CONSTRAINT pk_func PRIMARY KEY (cod_func),
    CONSTRAINT ch_func_1 CHECK (sal_func >= 0),
    CONSTRAINT ch_func_2 CHECK (sexo_func IN ('f', 'm', 'o'))
);

INSERT INTO funcionarios VALUES
    (NULL, 'Maria da Silva', 'Rua Fictícia 1', '3000', 'f'),
    (NULL, 'João Oliveira', 'Rua Fictícia 2', '2800', 'm'),
    (NULL, 'Ana Souza', 'Rua Fictícia 3', '3200', 'f'),
    (NULL, 'Carlos Santos', 'Rua Fictícia 4', '2500', 'm'),
    (NULL, 'Patrícia Costa', 'Rua Fictícia 5', '2700', 'f'),
    (NULL, 'Lucas Fernandes', 'Rua Fictícia 6', '2900', 'm'),
    (NULL, 'Aline Pereira', 'Rua Fictícia 7', '3100', 'f'),
    (NULL, 'Fernando Mendes', 'Rua Fictícia 8', '2600', 'm'),
    (NULL, 'Camila Oliveira', 'Rua Fictícia 9', '2800', 'f'),
    (NULL, 'Alexandre Santos', 'Rua Fictícia 10', '2400', 'm'),
    (NULL, 'Andréa Lima', 'Rua Fictícia 11', '2600', 'o'),
    (NULL, 'Ricardo Almeida', 'Rua Fictícia 12', '2900', 'o');

CREATE TABLE dependentes
(
    cod_dep INT NOT NULL AUTO_INCREMENT,
    cod_func INT NOT NULL,
    nome_dep VARCHAR(100) NOT NULL,
    sexo_dep CHAR(1) NOT NULL DEFAULT 'f',
    
    CONSTRAINT pk_dep PRIMARY KEY (cod_dep),
    CONSTRAINT fk_dep FOREIGN KEY (cod_func) REFERENCES funcionarios(cod_func),
    CONSTRAINT ch_dep CHECK (sexo_dep IN ('f', 'm', 'o'))
);

INSERT INTO dependentes VALUES
    (NULL, 1, 'Ana Silva', 'f'),
    (NULL, 1, 'Roberto Silva', 'm'),
    (NULL, 1, 'Celso Silva', 'm'),
    (NULL, 5, 'Brisa Costa', 'o'),
    (NULL, 8, 'Mari Sol Mendes', 'f'),
    (NULL, 12, 'Sonia da Almeida', 'f');

CREATE TABLE estados
(
    sigla_est CHAR(2) NOT NULL,
    nome_est CHAR(50) NOT NULL,

    CONSTRAINT pk_est PRIMARY KEY (sigla_est),
    CONSTRAINT uq_est UNIQUE (nome_est)
);
    
INSERT INTO estados VALUES
	('SP', 'São Paulo'),
	('MG', 'Minas Gerais'),
	('RJ', 'Rio de Janeiro');
    
CREATE TABLE cidades
(
    cod_cid INT NOT NULL AUTO_INCREMENT,
    sigla_est CHAR(2) NOT NULL,
    nome_cid VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_cid PRIMARY KEY (cod_cid),
    CONSTRAINT fk_cid FOREIGN KEY (sigla_est) REFERENCES estados(sigla_est)
);

INSERT INTO cidades VALUES
	(NULL, 'SP', 'São Paulo'),
	(NULL, 'SP', 'Sorocaba'),
	(NULL, 'SP', 'Jundiaí'),
	(NULL, 'SP', 'Americana'),
	(NULL, 'SP', 'Araraquara'),
	(NULL, 'MG', 'Ouro Preto'),
	(NULL, 'RJ', 'Cachoreira de Itapemirim');
    
CREATE TABLE clientes (
    cod_cli INT NOT NULL AUTO_INCREMENT,
    cod_cid INT NOT NULL,
    nome_cli VARCHAR(100) NOT NULL,
    end_cli VARCHAR(200) NOT NULL,
    renda_cli DECIMAL(10,2) NOT NULL DEFAULT 0,
    sexo_cli CHAR(1) NOT NULL DEFAULT 'f',
	
    CONSTRAINT pk_cli PRIMARY KEY(cod_cli),
    CONSTRAINT fk_cli FOREIGN KEY(cod_cid) REFERENCES cidades(cod_cid),
    CONSTRAINT ch_cli_1 CHECK (renda_cli >= 0),
    CONSTRAINT ch_cli_2 CHECK (sexo_cli IN ('f','m','o'))
);

INSERT INTO clientes (cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) VALUES
(1, 'Ricardo Silva', 'Rua X', 1700.50, 'm'),
(1, 'Amanda Oliveira', 'Rua Y', 2100.75, 'f'),
(1, 'Fernanda Santos', 'Rua Z', 1800.25, 'f'),
(1, 'Carlos Almeida', 'Rua W', 1300.90, 'm'),
(1, 'Juliana Ferreira', 'Rua V', 1550.60, 'f'),
(2, 'Lucas Costa', 'Rua U', 1900.40, 'm'),
(2, 'Patricia Souza', 'Rua T', 2250.80, 'f'),
(2, 'Roberto Pereira', 'Rua S', 3100.70, 'o'),
(3, 'Sandra Lima', 'Rua R', 1750.30, 'f'),
(3, 'Pedro Santos', 'Rua Q', 1950.20, 'm');

drop table conjuges;
CREATE TABLE conjuges (
    cod_cli INT NOT NULL,
    nome_conj VARCHAR(100) NOT NULL,
    renda_conj DECIMAL(10,2) NOT NULL DEFAULT 0,
    sexo_conj CHAR(1) NOT NULL DEFAULT 'f',

    CONSTRAINT pk_conj PRIMARY KEY (cod_cli),
    CONSTRAINT fk_conj FOREIGN KEY (cod_cli) REFERENCES clientes (cod_cli),
    CONSTRAINT ch_conj_1 CHECK (renda_conj >= 0),
    CONSTRAINT ch_conj_2 CHECK (sexo_conj IN ('f','m','o'))
);

INSERT INTO conjuges VALUES
(1, 'Maria Nogueira', 2500, 'f'),
(2, 'Antonio Pereira', 5500, 'm'),
(6, 'Ana da Costa', 3000, 'f'),
(7, 'Pedro de Souza', 3250, 'm');

CREATE TABLE artistas (
    cod_art INT NOT NULL AUTO_INCREMENT,
    nome_art VARCHAR(100) NOT NULL,
    
    CONSTRAINT pk_art PRIMARY KEY (cod_art),
    CONSTRAINT uq_art UNIQUE (nome_art)
);

INSERT INTO artistas (cod_art, nome_art) VALUES
    (NULL, 'Ivete Sangalo'),
	(NULL, 'Claudia Leitte'),
	(NULL, 'Gilberto Gil'),
	(NULL, 'Caetano Veloso'),
	(NULL, 'Daniela Mercury'),
    (NULL, 'Roberto Carlos'),
    (NULL, 'Djavan'),
    (NULL, 'Zeca Pagodinho'),
    (NULL, 'Cazuza'),
    (NULL, 'Vanessa da Mata'),
    (NULL, 'Sandy & Junior'),
    (NULL, 'Pitty'),
    (NULL, 'Zé Ramalho'),
    (NULL, 'Raul Seixas'),
    (NULL, 'Legião Urbana'),
    (NULL, 'Tim Maia'),
    (NULL, 'Marcelo D2'),
    (NULL, 'João Gilberto');

CREATE TABLE gravadoras (
    cod_grav INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_grav VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO gravadoras (cod_grav, nome_grav) VALUES 
	(NULL, 'Acústico Records'),
	(NULL, 'Estrela Dourada Records'),
	(NULL, 'Ritmo Celestial Records'),
	(NULL, 'Sintonia Perfeita Records'),
	(NULL, 'Harmonia Musical Records'),
	(NULL, 'Crescendo Rápido Records');

CREATE TABLE categorias (
    cod_cat INT NOT NULL AUTO_INCREMENT,
    nome_cat VARCHAR(50) NOT NULL,
    CONSTRAINT pk_cat PRIMARY KEY (cod_cat),
    CONSTRAINT uq_cat UNIQUE (nome_cat)
);

insert categorias values
	(null,'MPB'),
	(null,'Axé'),
	(null,'Rap'),
    (null,'Rock Nacional');
    
CREATE TABLE titulos (
    cod_tit INT AUTO_INCREMENT,
    cod_cat INT NOT NULL,
    cod_grav INT NOT NULL,
    nome_cd VARCHAR(100) NOT NULL,
    val_compra DECIMAL(10,2) NOT NULL,
    val_cd DECIMAL(10,2) NOT NULL,
    qtd_estq INT NOT NULL,
    
    CONSTRAINT pk_tit PRIMARY KEY(cod_tit),
    CONSTRAINT uq_tit UNIQUE(nome_cd),
    CONSTRAINT fk_tit_1 FOREIGN KEY(cod_cat) REFERENCES categorias(cod_cat),
    CONSTRAINT fk_tit_2 FOREIGN KEY(cod_grav) REFERENCES gravadoras(cod_grav),
    CONSTRAINT ch_tit_1 CHECK(val_cd >= 0),
    CONSTRAINT ch_tit_2 CHECK(qtd_estq >= 0)
);

INSERT INTO titulos (cod_cat, cod_grav, nome_cd, val_compra, val_cd, qtd_estq) VALUES
	(1, 1, 'Axé das Antigas', 30, 150, 1500),
	(1, 3, 'Samba do Brasil', 50, 200, 500),
	(1, 4, 'Carnaval dos Sonhos', 60, 120, 1000),
	(1, 2, 'Festa na Praia', 50, 70, 2000),
	(1, 2, 'Verão Bahiano', 55, 98, 500),
	(1, 4, 'Samba Vibe', 30, 300, 200),
	(3, 4, 'Bossa Nova Collection', 20, 250, 100),
	(4, 2, 'Reggae Roots', 30, 130, 300),
	(1, 5, 'Sertanejo na Estrada', 30, 90, 500),
	(1, 6, 'Hip Hop Nation', 30, 180, 1500);

CREATE TABLE titulos_artistas (
    cod_tit INT NOT NULL,
    cod_art INT NOT NULL,
    
    CONSTRAINT pk_titart PRIMARY KEY (cod_tit, cod_art),
    CONSTRAINT fk1_titart FOREIGN KEY (cod_tit) REFERENCES titulos (cod_tit),
    CONSTRAINT fk2_titart FOREIGN KEY (cod_art) REFERENCES artistas (cod_art)
);

INSERT INTO titulos_artistas VALUES
(1, 1),
(1, 10),
(1, 11),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 14),
(5, 15),
(6, 12),
(7, 13),
(8, 16),
(9, 14),
(10, 1);

CREATE TABLE pedidos (
    num_ped INT NOT NULL AUTO_INCREMENT,
    cod_cli INT NOT NULL,
    cod_func INT NOT NULL,
    data_ped DATETIME NOT NULL,
    
    CONSTRAINT pk_ped PRIMARY KEY (num_ped),
    CONSTRAINT fk_ped_1 FOREIGN KEY (cod_cli) REFERENCES clientes (cod_cli),
    CONSTRAINT fk_ped_2 FOREIGN KEY (cod_func) REFERENCES funcionarios (cod_func)
);

INSERT INTO pedidos VALUES
	(NULL, 1, 2, '2024-05-02'),
	(NULL, 3, 4, '2024-05-02'),
	(NULL, 4, 5, '2024-06-02'),
	(NULL, 1, 4, '2024-03-02'),
	(NULL, 7, 5, '2024-03-02'),
	(NULL, 4, 4, '2024-03-02'),
	(NULL, 5, 5, '2024-03-02'),
	(NULL, 8, 2, '2024-03-02'),
	(NULL, 2, 2, '2024-03-02'),
	(NULL, 7, 1, '2024-03-02');

CREATE TABLE titulos_pedidos (
    num_ped INT NOT NULL,
    cod_tit INT NOT NULL,
    qtd_cd INT NOT NULL,
    val_cd DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT pk_titped PRIMARY KEY (num_ped, cod_tit),
    CONSTRAINT fk_titped1 FOREIGN KEY (cod_tit) REFERENCES titulos (cod_tit),
    CONSTRAINT fk_titped2 FOREIGN KEY (num_ped) REFERENCES pedidos (num_ped),
    CONSTRAINT ch_titped1 CHECK (qtd_cd >= 1),
    CONSTRAINT ch_titped2 CHECK (val_cd >= 0)
);

INSERT INTO titulos_pedidos VALUES
(1, 1, 2, 150),
(1, 2, 3, 200),
(2, 1, 1, 150),
(2, 2, 3, 200),
(3, 1, 2, 150),
(4, 2, 3, 200),
(5, 1, 2, 150),
(6, 2, 3, 200),
(6, 3, 1, 120),
(7, 4, 2, 70),
(8, 1, 4, 150),
(9, 2, 3, 200),
(10, 7, 2, 250);
