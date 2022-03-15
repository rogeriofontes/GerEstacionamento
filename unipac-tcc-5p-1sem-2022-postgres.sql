-- SQLINES DEMO *** rated by MySQL Workbench
-- SQLINES DEMO *** 22:24:22
-- SQLINES DEMO *** l    Version: 2.0
-- SQLINES DEMO *** orward Engineering

/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES'; */

-- SQLINES DEMO *** ------------------------------------
-- Schema sakila
-- SQLINES DEMO *** ------------------------------------

-- SQLINES DEMO *** ------------------------------------
-- Schema sakila
-- SQLINES DEMO *** ------------------------------------
CREATE SCHEMA IF NOT EXISTS sakila ;
SET SCHEMA 'sakila' ;

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** suario`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.usuario_seq;

CREATE TABLE IF NOT EXISTS sakila.usuario (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.usuario_seq'),
  nome VARCHAR(50) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(45) NOT NULL,
  senha VARCHAR(45) NULL,
  PRIMARY KEY (id))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** erfil`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.perfil_seq;

CREATE TABLE IF NOT EXISTS sakila.perfil (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.perfil_seq'),
  descricao VARCHAR(50) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ipo_empresa`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.tipo_empresa_seq;

CREATE TABLE IF NOT EXISTS sakila.tipo_empresa (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.tipo_empresa_seq'),
  descricao VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
 ,
  PRIMARY KEY (id))
;

CREATE INDEX idx_title ON sakila.tipo_empresa (descricao ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ais`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.pais_seq;

CREATE TABLE IF NOT EXISTS sakila.pais (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.pais_seq'),
  descricao VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
 ,
  PRIMARY KEY (id))
;

CREATE INDEX idx_title ON sakila.pais (descricao ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** stado`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.estado_seq;

CREATE TABLE IF NOT EXISTS sakila.estado (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.estado_seq'),
  descricao VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  pais_id SMALLINT CHECK (pais_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_estado_pais1
    FOREIGN KEY (pais_id)
    REFERENCES sakila.pais (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.estado (descricao ASC);
CREATE INDEX fk_estado_pais1_idx ON sakila.estado (pais_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** idade`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.cidade_seq;

CREATE TABLE IF NOT EXISTS sakila.cidade (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.cidade_seq'),
  descricao VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado_id SMALLINT CHECK (estado_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_cidade_estado1
    FOREIGN KEY (estado_id)
    REFERENCES sakila.estado (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.cidade (descricao ASC);
CREATE INDEX fk_cidade_estado1_idx ON sakila.cidade (estado_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** airro`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.bairro_seq;

CREATE TABLE IF NOT EXISTS sakila.bairro (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.bairro_seq'),
  descricao VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cidade_id SMALLINT CHECK (cidade_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_bairro_cidade1
    FOREIGN KEY (cidade_id)
    REFERENCES sakila.cidade (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.bairro (descricao ASC);
CREATE INDEX fk_bairro_cidade1_idx ON sakila.bairro (cidade_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ep`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.cep_seq;

CREATE TABLE IF NOT EXISTS sakila.cep (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.cep_seq'),
  descricao VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  bairro_id SMALLINT CHECK (bairro_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_cep_bairro1
    FOREIGN KEY (bairro_id)
    REFERENCES sakila.bairro (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.cep (descricao ASC);
CREATE INDEX fk_cep_bairro1_idx ON sakila.cep (bairro_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ndereco`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.endereco_seq;

CREATE TABLE IF NOT EXISTS sakila.endereco (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.endereco_seq'),
  tipo VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  rua VARCHAR(45) NULL,
  numero VARCHAR(45) NULL,
  cep_id SMALLINT CHECK (cep_id > 0) NOT NULL
 ,
  PRIMARY KEY (id, cep_id)
 ,
  CONSTRAINT fk_endereco_cep1
    FOREIGN KEY (cep_id)
    REFERENCES sakila.cep (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.endereco (tipo ASC);
CREATE INDEX fk_endereco_cep1_idx ON sakila.endereco (cep_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** mpresa`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.empresa_seq;

CREATE TABLE IF NOT EXISTS sakila.empresa (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.empresa_seq'),
  nome_fantasia VARCHAR(255) NOT NULL,
  razao_social VARCHAR(255) NULL,
  cnpj INT NOT NULL,
  telefone INT NOT NULL,
  email VARCHAR(255) NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  tipo_empresa_id SMALLINT CHECK (tipo_empresa_id > 0) NOT NULL,
  usuario_id SMALLINT CHECK (usuario_id > 0) NOT NULL,
  endereco_id SMALLINT CHECK (endereco_id > 0) NOT NULL,
  endereco_cep_id SMALLINT CHECK (endereco_cep_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_empresa_tipo_empresa1
    FOREIGN KEY (tipo_empresa_id)
    REFERENCES sakila.tipo_empresa (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_empresa_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES sakila.usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_empresa_endereco1
    FOREIGN KEY (endereco_id , endereco_cep_id)
    REFERENCES sakila.endereco (id , cep_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.empresa (nome_fantasia ASC);
CREATE INDEX fk_empresa_tipo_empresa1_idx ON sakila.empresa (tipo_empresa_id ASC);
CREATE INDEX fk_empresa_usuario1_idx ON sakila.empresa (usuario_id ASC);
CREATE INDEX fk_empresa_endereco1_idx ON sakila.empresa (endereco_id ASC, endereco_cep_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** argo`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.cargo_seq;

CREATE TABLE IF NOT EXISTS sakila.cargo (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.cargo_seq'),
  descricao VARCHAR(255) NOT NULL,
  experiencia VARCHAR(45) NULL,
  area_atuacao VARCHAR(45) NULL,
  beneficios VARCHAR(45) NULL,
  salario VARCHAR(45) NULL,
  habilidades_desejadas VARCHAR(45) NULL,
  competencias_desejadas VARCHAR(45) NULL,
  last_update TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** aga`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.vaga_seq;

CREATE TABLE IF NOT EXISTS sakila.vaga (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.vaga_seq'),
  aplicado SMALLINT CHECK (aplicado > 0) NOT NULL,
  amount DECIMAL(5,2) NOT NULL,
  data_oferta_inicio TIMESTAMP(0) NOT NULL,
  data_oferta_fim TIMESTAMP(0) NULL,
  last_update TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP,
  cargo_store_id SMALLINT CHECK (cargo_store_id > 0) NOT NULL,
  empresa_id SMALLINT CHECK (empresa_id > 0) NOT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_vaga_cargo1
    FOREIGN KEY (cargo_store_id)
    REFERENCES sakila.cargo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_vaga_empresa1
    FOREIGN KEY (empresa_id)
    REFERENCES sakila.empresa (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX fk_vaga_cargo1_idx ON sakila.vaga (cargo_store_id ASC);
CREATE INDEX fk_vaga_empresa1_idx ON sakila.vaga (empresa_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** ica`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.dica_seq;

CREATE TABLE IF NOT EXISTS sakila.dica (
  id INT NOT NULL DEFAULT NEXTVAL ('sakila.dica_seq'),
  titulo TIMESTAMP(0) NOT NULL,
  descricao MEDIUMINT CHECK (descricao > 0) NOT NULL,
  links_uteis SMALLINT CHECK (links_uteis > 0) NOT NULL,
  data_publicacao TIMESTAMP(0) NOT NULL,
  last_update TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cargo_store_id SMALLINT CHECK (cargo_store_id > 0) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT idx_rental UNIQUE  (titulo, descricao, links_uteis)
 ,
  CONSTRAINT fk_dica_cargo1
    FOREIGN KEY (cargo_store_id)
    REFERENCES sakila.cargo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX fk_dica_cargo1_idx ON sakila.dica (cargo_store_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** suario_perfil`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE IF NOT EXISTS sakila.usuario_perfil (
  usuario_id SMALLINT CHECK (usuario_id > 0) NOT NULL,
  perfil_id SMALLINT CHECK (perfil_id > 0) NOT NULL,
  PRIMARY KEY (usuario_id, perfil_id)
 ,
  CONSTRAINT fk_usuario_has_perfil_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES sakila.usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_usuario_has_perfil_perfil1
    FOREIGN KEY (perfil_id)
    REFERENCES sakila.perfil (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX fk_usuario_has_perfil_perfil1_idx ON sakila.usuario_perfil (perfil_id ASC);
CREATE INDEX fk_usuario_has_perfil_usuario1_idx ON sakila.usuario_perfil (usuario_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** luno`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.aluno_seq;

CREATE TABLE IF NOT EXISTS sakila.aluno (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.aluno_seq'),
  nome VARCHAR(255) NOT NULL,
  matricula VARCHAR(255) NULL,
  cpf INT NOT NULL,
  telefone INT NOT NULL,
  email VARCHAR(255) NULL,
  estado_civil SMALLINT NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  usuario_id SMALLINT CHECK (usuario_id > 0) NOT NULL,
  endereco_id SMALLINT CHECK (endereco_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_aluno_usuario1
    FOREIGN KEY (usuario_id)
    REFERENCES sakila.usuario (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_aluno_endereco1
    FOREIGN KEY (endereco_id)
    REFERENCES sakila.endereco (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.aluno (nome ASC);
CREATE INDEX fk_aluno_usuario1_idx ON sakila.aluno (usuario_id ASC);
CREATE INDEX fk_aluno_endereco1_idx ON sakila.aluno (endereco_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** aculdade`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.faculdade_seq;

CREATE TABLE IF NOT EXISTS sakila.faculdade (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.faculdade_seq'),
  nome VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
 ,
  PRIMARY KEY (id))
;

CREATE INDEX idx_title ON sakila.faculdade (nome ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** urso`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.curso_seq;

CREATE TABLE IF NOT EXISTS sakila.curso (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.curso_seq'),
  descricao VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  faculdade_id SMALLINT CHECK (faculdade_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_curso_faculdade1
    FOREIGN KEY (faculdade_id)
    REFERENCES sakila.faculdade (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.curso (descricao ASC);
CREATE INDEX fk_curso_faculdade1_idx ON sakila.curso (faculdade_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** urma`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.turma_seq;

CREATE TABLE IF NOT EXISTS sakila.turma (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.turma_seq'),
  descricao VARCHAR(255) NOT NULL,
  turno INT NULL,
  periodo INT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  curso_id SMALLINT CHECK (curso_id > 0) NOT NULL
 ,
  PRIMARY KEY (id, curso_id)
 ,
  CONSTRAINT fk_turma_curso1
    FOREIGN KEY (curso_id)
    REFERENCES sakila.curso (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.turma (descricao ASC);
CREATE INDEX fk_turma_curso1_idx ON sakila.turma (curso_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** luno_detalhes`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.aluno_detalhes_seq;

CREATE TABLE IF NOT EXISTS sakila.aluno_detalhes (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.aluno_detalhes_seq'),
  aluno_id SMALLINT CHECK (aluno_id > 0) NOT NULL,
  ano_de_inicio_curso VARCHAR(10) NOT NULL,
  ano_de_conclusao_curso VARCHAR(10) NULL,
  turma_id SMALLINT CHECK (turma_id > 0) NOT NULL,
  experiencia TEXT NOT NULL,
  info_adicionais TEXT NOT NULL,
  sobre TEXT NULL,
  deficiencia SMALLINT NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  linkedin VARCHAR(255) NULL,
  github VARCHAR(255) NULL,
  instragram VARCHAR(255) NULL,
  twitter VARCHAR(255) NULL,
  facebook VARCHAR(255) NULL,
  file_curriculo VARCHAR(255) NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_aluno_detalhes_turma1
    FOREIGN KEY (turma_id)
    REFERENCES sakila.turma (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_aluno_detalhes_aluno1
    FOREIGN KEY (aluno_id)
    REFERENCES sakila.aluno (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.aluno_detalhes (ano_de_inicio_curso ASC);
CREATE INDEX fk_aluno_detalhes_turma1_idx ON sakila.aluno_detalhes (turma_id ASC);
CREATE INDEX fk_aluno_detalhes_aluno1_idx ON sakila.aluno_detalhes (aluno_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** dioma`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.idioma_seq;

CREATE TABLE IF NOT EXISTS sakila.idioma (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.idioma_seq'),
  nome VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  aluno_id SMALLINT CHECK (aluno_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_idioma_aluno1
    FOREIGN KEY (aluno_id)
    REFERENCES sakila.aluno (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.idioma (nome ASC);
CREATE INDEX fk_idioma_aluno1_idx ON sakila.idioma (aluno_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** abilidade`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.habilidade_seq;

CREATE TABLE IF NOT EXISTS sakila.habilidade (
  id SMALLINT CHECK (id > 0) NOT NULL DEFAULT NEXTVAL ('sakila.habilidade_seq'),
  nome VARCHAR(255) NOT NULL,
  ultima_alteracao TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  aluno_id SMALLINT CHECK (aluno_id > 0) NOT NULL
 ,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_idioma_aluno10
    FOREIGN KEY (aluno_id)
    REFERENCES sakila.aluno (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX idx_title ON sakila.habilidade (nome ASC);
CREATE INDEX fk_idioma_aluno1_idx ON sakila.habilidade (aluno_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** plicacao_aluno_vaga`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.aplicacao_aluno_vaga_seq;

CREATE TABLE IF NOT EXISTS sakila.aplicacao_aluno_vaga (
  id INT NOT NULL DEFAULT NEXTVAL ('sakila.aplicacao_aluno_vaga_seq'),
  data_aplicacao TIMESTAMP(0) NOT NULL,
  vaga_id SMALLINT CHECK (vaga_id > 0) NOT NULL,
  aluno_id SMALLINT CHECK (aluno_id > 0) NOT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_aplicacao_aluno_vaga_vaga1
    FOREIGN KEY (vaga_id)
    REFERENCES sakila.vaga (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_aplicacao_aluno_vaga_aluno1
    FOREIGN KEY (aluno_id)
    REFERENCES sakila.aluno (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX fk_aplicacao_aluno_vaga_vaga1_idx ON sakila.aplicacao_aluno_vaga (vaga_id ASC);
CREATE INDEX fk_aplicacao_aluno_vaga_aluno1_idx ON sakila.aplicacao_aluno_vaga (aluno_id ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** companhamento`
-- SQLINES DEMO *** ------------------------------------
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE sakila.acompanhamento_seq;

CREATE TABLE IF NOT EXISTS sakila.acompanhamento (
  id INT NOT NULL DEFAULT NEXTVAL ('sakila.acompanhamento_seq'),
  data_aplicacao TIMESTAMP(0) NOT NULL,
  aplicacao_aluno_vaga_id INT NOT NULL,
  PRIMARY KEY (id)
 ,
  CONSTRAINT fk_acompanhamento_aplicacao_aluno_vaga1
    FOREIGN KEY (aplicacao_aluno_vaga_id)
    REFERENCES sakila.aplicacao_aluno_vaga (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX fk_acompanhamento_aplicacao_aluno_vaga1_idx ON sakila.acompanhamento (aplicacao_aluno_vaga_id ASC);

SET SCHEMA 'sakila';

DELIMITER $$
SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER ins_film AFTER INSERT ON film FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER upd_film AFTER UPDATE ON film FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

SET SCHEMA 'sakila'$$

CREATE TRIGGER del_film AFTER DELETE ON film FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$


DELIMITER ;

/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */

