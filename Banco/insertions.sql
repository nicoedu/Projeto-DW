-- MySQL Script generated by MySQL Workbench
-- qui 25 out 2018 20:26:31 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tipo_veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_veiculo` (
  `id_tipo_veiculo` INT NOT NULL,
  `tipo_veiculocol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_veiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`marca` (
  `id_marca` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  PRIMARY KEY (`id_marca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculo` (
  `id_veiculo` INT NOT NULL,
  `id_tipo_veiculo` INT NULL,
  `id_marca` INT NULL,
  `ano_fabricacao_veiculo` INT NULL,
  PRIMARY KEY (`id_veiculo`),
  INDEX `id_marca_idx` (`id_marca` ASC),
  INDEX `id_tipo_veiculo_idx` (`id_tipo_veiculo` ASC),
  CONSTRAINT `id_tipo_veiculo`
    FOREIGN KEY (`id_tipo_veiculo`)
    REFERENCES `mydb`.`tipo_veiculo` (`id_tipo_veiculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_marca`
    FOREIGN KEY (`id_marca`)
    REFERENCES `mydb`.`marca` (`id_marca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sexo` (
  `id_sexo` INT NOT NULL,
  `sexo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sexo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estado_fisico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estado_fisico` (
  `id_estado_fisico` INT NOT NULL,
  `estado_fisico` VARCHAR(45) NULL,
  PRIMARY KEY (`id_estado_fisico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_envolvido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_envolvido` (
  `id_tipo_envolvido` INT NOT NULL,
  `tipo_envolvido` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_envolvido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pessoa` (
  `pes_id` INT NOT NULL,
  `id_tipo_envolvido` INT NULL,
  `idade` INT NULL,
  `id_sexo` INT NULL,
  `id_estado_fisico` INT NULL,
  PRIMARY KEY (`pes_id`),
  INDEX `id_sexo_idx` (`id_sexo` ASC),
  INDEX `id_estado_fisico_idx` (`id_estado_fisico` ASC),
  INDEX `id_tipo_envolvido_idx` (`id_tipo_envolvido` ASC),
  CONSTRAINT `id_sexo`
    FOREIGN KEY (`id_sexo`)
    REFERENCES `mydb`.`sexo` (`id_sexo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_estado_fisico`
    FOREIGN KEY (`id_estado_fisico`)
    REFERENCES `mydb`.`estado_fisico` (`id_estado_fisico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_tipo_envolvido`
    FOREIGN KEY (`id_tipo_envolvido`)
    REFERENCES `mydb`.`tipo_envolvido` (`id_tipo_envolvido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`br`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`br` (
  `id_br` INT NOT NULL,
  `br` VARCHAR(45) NULL,
  PRIMARY KEY (`id_br`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`uf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`uf` (
  `id_uf` INT NOT NULL,
  `uf` VARCHAR(45) NULL,
  PRIMARY KEY (`id_uf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`municipio` (
  `id_municipio` INT NOT NULL,
  `municipio` VARCHAR(45) NULL,
  `id_uf` INT NULL,
  PRIMARY KEY (`id_municipio`),
  INDEX `id_uf_idx` (`id_uf` ASC),
  CONSTRAINT `id_uf`
    FOREIGN KEY (`id_uf`)
    REFERENCES `mydb`.`uf` (`id_uf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `id_endereco` INT NOT NULL,
  `id_br` INT NULL,
  `km` VARCHAR(45) NULL,
  `id_municipio` INT NULL,
  `latitude` INT NULL,
  `longitude` INT NULL,
  INDEX `id_br_idx` (`id_br` ASC),
  INDEX `id_municipio_idx` (`id_municipio` ASC),
  PRIMARY KEY (`id_endereco`),
  CONSTRAINT `id_br`
    FOREIGN KEY (`id_br`)
    REFERENCES `mydb`.`br` (`id_br`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_municipio`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `mydb`.`municipio` (`id_municipio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`data` (
  `id_data` INT NOT NULL,
  `data_inversa` INT NULL,
  `dia_semana` VARCHAR(45) NULL,
  `horario` VARCHAR(45) NULL,
  PRIMARY KEY (`id_data`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`causa_acidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`causa_acidente` (
  `id_causa_acidente` INT unique NOT NULL,
  `causa_acidente` VARCHAR(45) NULL,
  PRIMARY KEY (`id_causa_acidente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_acidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_acidente` (
  `id_tipo_acidente` INT NOT NULL,
  `tipo_acidente` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_acidente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`classificacao_acidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`classificacao_acidente` (
  `id_classificacao_acidente` INT NOT NULL,
  `classificacao_acidente` VARCHAR(45) NULL,
  PRIMARY KEY (`id_classificacao_acidente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fase_dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fase_dia` (
  `id_fase_dia` INT NOT NULL,
  `fase_dia` VARCHAR(45) NULL,
  PRIMARY KEY (`id_fase_dia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sentido_via`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sentido_via` (
  `id_sentido_via` INT NOT NULL,
  `sentido_via` VARCHAR(45) NULL,
  PRIMARY KEY (`id_sentido_via`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`condicao_metereologica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`condicao_metereologica` (
  `id_condicao_metereologica` INT NOT NULL,
  `condicao_metereologica` VARCHAR(45) NULL,
  PRIMARY KEY (`id_condicao_metereologica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_pista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_pista` (
  `id_tipo_pista` INT NOT NULL,
  `tipo_pista` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_pista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trancado_via`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trancado_via` (
  `id_trancado_via` INT NOT NULL,
  `trancado_via` VARCHAR(45) NULL,
  PRIMARY KEY (`id_trancado_via`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`uso_solo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`uso_solo` (
  `id_uso_solo` INT NOT NULL,
  `uso_solo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_uso_solo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pista` (
  `id_pista` VARCHAR(45) NOT NULL,
  `id_fase_dia` INT NULL,
  `id_sentido_via` INT NULL,
  `id_condicao_metereologica` INT NULL,
  `id_tipo_pista` INT NULL,
  `id_tracado_via` INT NULL,
  `id_uso_solo` INT NULL,
  PRIMARY KEY (`id_pista`),
  INDEX `id_fase_dia_idx` (`id_fase_dia` ASC),
  INDEX `id_sentido_via_idx` (`id_sentido_via` ASC),
  INDEX `id_condicao_metereologica_idx` (`id_condicao_metereologica` ASC),
  INDEX `id_tipo_pista_idx` (`id_tipo_pista` ASC),
  INDEX `id_tracadi_via_idx` (`id_tracado_via` ASC),
  INDEX `id_uso_solo_idx` (`id_uso_solo` ASC),
  CONSTRAINT `id_fase_dia`
    FOREIGN KEY (`id_fase_dia`)
    REFERENCES `mydb`.`fase_dia` (`id_fase_dia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_sentido_via`
    FOREIGN KEY (`id_sentido_via`)
    REFERENCES `mydb`.`sentido_via` (`id_sentido_via`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_condicao_metereologica`
    FOREIGN KEY (`id_condicao_metereologica`)
    REFERENCES `mydb`.`condicao_metereologica` (`id_condicao_metereologica`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_tipo_pista`
    FOREIGN KEY (`id_tipo_pista`)
    REFERENCES `mydb`.`tipo_pista` (`id_tipo_pista`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_tracado_via`
    FOREIGN KEY (`id_tracado_via`)
    REFERENCES `mydb`.`trancado_via` (`id_trancado_via`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_uso_solo`
    FOREIGN KEY (`id_uso_solo`)
    REFERENCES `mydb`.`uso_solo` (`id_uso_solo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`acidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`acidente` (
  `id_acidente` INT NOT NULL,
  `id_causa_acidente` INT NULL,
  `id_tipo_acidente` INT NULL,
  `id_classificacao_acidente` INT NULL,
  `id_data` INT NULL,
  `id_pista` VARCHAR(45) NULL,
  `id_endereco` INT NULL,
  PRIMARY KEY (`id_acidente`),
  INDEX `id_tipo_acidente_idx` (`id_tipo_acidente` ASC),
  INDEX `id_classificacao_acidente_idx` (`id_classificacao_acidente` ASC),
  INDEX `id_causa_acidente_idx` (`id_causa_acidente` ASC),
  INDEX `id_data_idx` (`id_data` ASC),
  INDEX `id_pista_idx` (`id_pista` ASC),
  INDEX `id_endereco_idx` (`id_endereco` ASC),
  CONSTRAINT `id_causa_acidente`
    FOREIGN KEY (`id_causa_acidente`)
    REFERENCES `mydb`.`causa_acidente` (`id_causa_acidente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_tipo_acidente`
    FOREIGN KEY (`id_tipo_acidente`)
    REFERENCES `mydb`.`tipo_acidente` (`id_tipo_acidente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_classificacao_acidente`
    FOREIGN KEY (`id_classificacao_acidente`)
    REFERENCES `mydb`.`classificacao_acidente` (`id_classificacao_acidente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_data`
    FOREIGN KEY (`id_data`)
    REFERENCES `mydb`.`data` (`id_data`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_pista`
    FOREIGN KEY (`id_pista`)
    REFERENCES `mydb`.`pista` (`id_pista`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_endereco`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `mydb`.`endereco` (`id_endereco`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`delegacia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`delegacia` (
  `id_delegacia` INT NOT NULL,
  `delegacia` VARCHAR(45) NULL,
  PRIMARY KEY (`id_delegacia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`uop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`uop` (
  `id_uop` INT NOT NULL,
  `uop` VARCHAR(45) NULL,
  `id_municipio` INT NULL,
  `id_delegacia` INT NULL,
  PRIMARY KEY (`id_uop`),
  INDEX `id_municipio_idx` (`id_municipio` ASC),
  INDEX `id_delegacia_idx` (`id_delegacia` ASC),
  CONSTRAINT `id_municipio_uop`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `mydb`.`municipio` (`id_municipio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_delegacia_uop`
    FOREIGN KEY (`id_delegacia`)
    REFERENCES `mydb`.`delegacia` (`id_delegacia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`acidente_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`acidente_pessoa` (
  `id_pessoa` INT NOT NULL,
  `id_acidente` INT NOT NULL,
  PRIMARY KEY (`id_pessoa`, `id_acidente`),
  INDEX `id_acidente_idx` (`id_acidente` ASC),
  CONSTRAINT `id_pessoa`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `mydb`.`pessoa` (`pes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_acidente`
    FOREIGN KEY (`id_acidente`)
    REFERENCES `mydb`.`acidente` (`id_acidente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`acidente_veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`acidente_veiculo` (
  `id_veiculo` INT NOT NULL,
  `id_acidente` INT NOT NULL,
  PRIMARY KEY (`id_veiculo`, `id_acidente`),
  INDEX `id_acidente_idx` (`id_acidente` ASC),
  CONSTRAINT `id_veiculo`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `mydb`.`veiculo` (`id_veiculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_acidente_veiculo`
    FOREIGN KEY (`id_acidente`)
    REFERENCES `mydb`.`acidente` (`id_acidente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
CREATE TABLE IF NOT EXISTS `mydb`.`acidente` (   `id_acidente` INT NOT NULL,   `id_causa_acidente` INT NULL,   `id_tipo_acidente` INT NULL,   `id_classificacao_acidente` INT NULL,   `id_data` INT NULL,   `id_pista` INT NULL,   `id_endereco` INT NULL,   PRIMARY KEY (`id_acidente`),   INDEX `id_tipo_acidente_idx` (`id_tipo_acidente` ASC),   INDEX `id_classificacao_acidente_idx` (`id_classificacao_acidente` ASC),   INDEX `id_causa_acidente_idx` (`id_causa_acidente` ASC),   INDEX `id_data_idx` (`id_data` ASC),   INDEX `id_pista_idx` (`id_pista` ASC),   INDEX `id_endereco_idx` (`id_endereco` ASC),   CONSTRAINT `id_causa_acidente`     FOREIGN KEY (`id_causa_acidente`)     REFERENCES `mydb`.`causa_acidente` (`id_causa_acidente`)     ON DELETE CASCADE     ON UPDATE CASCADE,   CONSTRAINT `id_tipo_acidente`     FOREIGN KEY (`id_tipo_acidente`)     REFERENCES `mydb`.`tipo_acidente` (`id_tipo_acidente`)     ON DELETE CASCADE     ON UPDATE CASCADE,   CONSTRAINT `id_classificacao_acidente`     FOREIGN KEY (`id_classificacao_acidente`)     REFERENCES `mydb`.`classificacao_acidente` (`id_classificacao_acidente`)     ON DELETE CASCADE     ON UPDATE CASCADE,   CONSTRAINT `id_data`     FOREIGN KEY (`id_data`)     REFERENCES `mydb`.`data` (`id_data`)     ON DELETE CASCADE     ON UPDATE CASCADE,   CONSTRAINT `id_pista`     FOREIGN KEY (`id_pista`)     REFERENCES `mydb`.`pista` (`id_pista`)     ON DELETE CASCADE     ON UPDATE CASCADE,   CONSTRAINT `id_endereco`     FOREIGN KEY (`id_endereco`)     REFERENCES `mydb`.`endereco` (`id_endereco`)     ON DELETE CASCADE     ON UPDATE CASCADE) ENGINE = InnoDB
