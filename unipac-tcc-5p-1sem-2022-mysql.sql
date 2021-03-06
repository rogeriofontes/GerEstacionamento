-- MySQL Script generated by MySQL Workbench
-- sáb 05 mar 2022 22:24:22
-- Model: Sakila Full    Version: 2.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sakila
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sakila
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sakila` ;
USE `sakila` ;

-- -----------------------------------------------------
-- Table `sakila`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`usuario` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`perfil` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`tipo_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`tipo_empresa` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `idx_title` (`descricao` ASC),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`pais` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `idx_title` (`descricao` ASC),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`estado` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pais_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`descricao` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_estado_pais1_idx` (`pais_id` ASC),
  CONSTRAINT `fk_estado_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `sakila`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`cidade` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`descricao` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_cidade_estado1_idx` (`estado_id` ASC),
  CONSTRAINT `fk_cidade_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `sakila`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`bairro` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cidade_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`descricao` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_bairro_cidade1_idx` (`cidade_id` ASC),
  CONSTRAINT `fk_bairro_cidade1`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `sakila`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`cep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`cep` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bairro_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`descricao` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_cep_bairro1_idx` (`bairro_id` ASC),
  CONSTRAINT `fk_cep_bairro1`
    FOREIGN KEY (`bairro_id`)
    REFERENCES `sakila`.`bairro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`endereco` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rua` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `cep_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`tipo` ASC),
  PRIMARY KEY (`id`, `cep_id`),
  INDEX `fk_endereco_cep1_idx` (`cep_id` ASC),
  CONSTRAINT `fk_endereco_cep1`
    FOREIGN KEY (`cep_id`)
    REFERENCES `sakila`.`cep` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`empresa` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_fantasia` VARCHAR(255) NOT NULL,
  `razao_social` VARCHAR(255) NULL,
  `cnpj` INT(11) NOT NULL,
  `telefone` INT(11) NOT NULL,
  `email` VARCHAR(255) NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_empresa_id` SMALLINT UNSIGNED NOT NULL,
  `usuario_id` SMALLINT UNSIGNED NOT NULL,
  `endereco_id` SMALLINT UNSIGNED NOT NULL,
  `endereco_cep_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`nome_fantasia` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_empresa_tipo_empresa1_idx` (`tipo_empresa_id` ASC),
  INDEX `fk_empresa_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_empresa_endereco1_idx` (`endereco_id` ASC, `endereco_cep_id` ASC),
  CONSTRAINT `fk_empresa_tipo_empresa1`
    FOREIGN KEY (`tipo_empresa_id`)
    REFERENCES `sakila`.`tipo_empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sakila`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_endereco1`
    FOREIGN KEY (`endereco_id` , `endereco_cep_id`)
    REFERENCES `sakila`.`endereco` (`id` , `cep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`cargo` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `experiencia` VARCHAR(45) NULL,
  `area_atuacao` VARCHAR(45) NULL,
  `beneficios` VARCHAR(45) NULL,
  `salario` VARCHAR(45) NULL,
  `habilidades_desejadas` VARCHAR(45) NULL,
  `competencias_desejadas` VARCHAR(45) NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`vaga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`vaga` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `aplicado` TINYINT UNSIGNED NOT NULL,
  `amount` DECIMAL(5,2) NOT NULL,
  `data_oferta_inicio` DATETIME NOT NULL,
  `data_oferta_fim` DATETIME NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `cargo_store_id` TINYINT UNSIGNED NOT NULL,
  `empresa_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vaga_cargo1_idx` (`cargo_store_id` ASC),
  INDEX `fk_vaga_empresa1_idx` (`empresa_id` ASC),
  CONSTRAINT `fk_vaga_cargo1`
    FOREIGN KEY (`cargo_store_id`)
    REFERENCES `sakila`.`cargo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vaga_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `sakila`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`dica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`dica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` DATETIME NOT NULL,
  `descricao` MEDIUMINT UNSIGNED NOT NULL,
  `links_uteis` SMALLINT UNSIGNED NOT NULL,
  `data_publicacao` DATETIME NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cargo_store_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_rental` (`titulo` ASC, `descricao` ASC, `links_uteis` ASC),
  INDEX `fk_dica_cargo1_idx` (`cargo_store_id` ASC),
  CONSTRAINT `fk_dica_cargo1`
    FOREIGN KEY (`cargo_store_id`)
    REFERENCES `sakila`.`cargo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`usuario_perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`usuario_perfil` (
  `usuario_id` SMALLINT UNSIGNED NOT NULL,
  `perfil_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`usuario_id`, `perfil_id`),
  INDEX `fk_usuario_has_perfil_perfil1_idx` (`perfil_id` ASC),
  INDEX `fk_usuario_has_perfil_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_usuario_has_perfil_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sakila`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_perfil_perfil1`
    FOREIGN KEY (`perfil_id`)
    REFERENCES `sakila`.`perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`aluno` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `matricula` VARCHAR(255) NULL,
  `cpf` INT(11) NOT NULL,
  `telefone` INT(11) NOT NULL,
  `email` VARCHAR(255) NULL,
  `estado_civil` TINYINT(1) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_id` SMALLINT UNSIGNED NOT NULL,
  `endereco_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`nome` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_aluno_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_aluno_endereco1_idx` (`endereco_id` ASC),
  CONSTRAINT `fk_aluno_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `sakila`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_endereco1`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `sakila`.`endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`faculdade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`faculdade` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `idx_title` (`nome` ASC),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`curso` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `faculdade_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`descricao` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_curso_faculdade1_idx` (`faculdade_id` ASC),
  CONSTRAINT `fk_curso_faculdade1`
    FOREIGN KEY (`faculdade_id`)
    REFERENCES `sakila`.`faculdade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`turma` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `turno` INT(11) NULL,
  `periodo` INT(11) NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `curso_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`descricao` ASC),
  PRIMARY KEY (`id`, `curso_id`),
  INDEX `fk_turma_curso1_idx` (`curso_id` ASC),
  CONSTRAINT `fk_turma_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `sakila`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`aluno_detalhes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`aluno_detalhes` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `aluno_id` SMALLINT UNSIGNED NOT NULL,
  `ano_de_inicio_curso` VARCHAR(10) NOT NULL,
  `ano_de_conclusao_curso` VARCHAR(10) NULL,
  `turma_id` SMALLINT UNSIGNED NOT NULL,
  `experiencia` TEXT NOT NULL,
  `info_adicionais` TEXT NOT NULL,
  `sobre` TEXT NULL,
  `deficiencia` TINYINT(1) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkedin` VARCHAR(255) NULL,
  `github` VARCHAR(255) NULL,
  `instragram` VARCHAR(255) NULL,
  `twitter` VARCHAR(255) NULL,
  `facebook` VARCHAR(255) NULL,
  `file_curriculo` VARCHAR(255) NULL,
  INDEX `idx_title` (`ano_de_inicio_curso` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_aluno_detalhes_turma1_idx` (`turma_id` ASC),
  INDEX `fk_aluno_detalhes_aluno1_idx` (`aluno_id` ASC),
  CONSTRAINT `fk_aluno_detalhes_turma1`
    FOREIGN KEY (`turma_id`)
    REFERENCES `sakila`.`turma` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_detalhes_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `sakila`.`aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`idioma` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aluno_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`nome` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_idioma_aluno1_idx` (`aluno_id` ASC),
  CONSTRAINT `fk_idioma_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `sakila`.`aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`habilidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`habilidade` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `ultima_alteracao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aluno_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `idx_title` (`nome` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_idioma_aluno1_idx` (`aluno_id` ASC),
  CONSTRAINT `fk_idioma_aluno10`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `sakila`.`aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`aplicacao_aluno_vaga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`aplicacao_aluno_vaga` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_aplicacao` DATETIME NOT NULL,
  `vaga_id` SMALLINT UNSIGNED NOT NULL,
  `aluno_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_aplicacao_aluno_vaga_vaga1_idx` (`vaga_id` ASC),
  INDEX `fk_aplicacao_aluno_vaga_aluno1_idx` (`aluno_id` ASC),
  CONSTRAINT `fk_aplicacao_aluno_vaga_vaga1`
    FOREIGN KEY (`vaga_id`)
    REFERENCES `sakila`.`vaga` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aplicacao_aluno_vaga_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `sakila`.`aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sakila`.`acompanhamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila`.`acompanhamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_aplicacao` DATETIME NOT NULL,
  `aplicacao_aluno_vaga_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acompanhamento_aplicacao_aluno_vaga1_idx` (`aplicacao_aluno_vaga_id` ASC),
  CONSTRAINT `fk_acompanhamento_aplicacao_aluno_vaga1`
    FOREIGN KEY (`aplicacao_aluno_vaga_id`)
    REFERENCES `sakila`.`aplicacao_aluno_vaga` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `sakila`;

DELIMITER $$
USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$

USE `sakila`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `sakila`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `sakila`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

