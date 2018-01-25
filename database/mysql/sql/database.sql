-- MySQL Script generated by MySQL Workbench
-- Thu Jan 25 18:47:36 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `type_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type_user` ;

CREATE TABLE IF NOT EXISTS `type_user` (
  `idtype_user` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`idtype_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `people`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `people` ;

CREATE TABLE IF NOT EXISTS `people` (
  `idpeople` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `cpf` VARCHAR(20) NULL,
  `picture` VARCHAR(60) NULL,
  `dtnasc` DATE NULL,
  `etiny` CHAR(1) NULL,
  `tel1` VARCHAR(20) NULL,
  `tel2` VARCHAR(20) NULL,
  `tel_emerg` VARCHAR(20) NULL,
  `cel` VARCHAR(20) NULL,
  `address` TEXT NULL,
  PRIMARY KEY (`idpeople`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `idpeople` INT NULL,
  `type_user` INT NOT NULL,
  `last_ip` VARCHAR(20) NULL,
  `login` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  `hash` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`iduser`),
  INDEX `type_user_idx` (`type_user` ASC),
  INDEX `id_people_idx` (`idpeople` ASC),
  CONSTRAINT `type_user`
    FOREIGN KEY (`type_user`)
    REFERENCES `type_user` (`idtype_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_people_user`
    FOREIGN KEY (`idpeople`)
    REFERENCES `people` (`idpeople`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `patient` ;

CREATE TABLE IF NOT EXISTS `patient` (
  `idpatient` INT NOT NULL AUTO_INCREMENT,
  `idpeople` INT NULL,
  `iduser` INT NULL,
  `prontuary_number` INT NULL,
  `mv_number` INT NULL,
  PRIMARY KEY (`idpatient`),
  INDEX `id_people_idx` (`idpeople` ASC),
  CONSTRAINT `id_people_pacient`
    FOREIGN KEY (`idpeople`)
    REFERENCES `people` (`idpeople`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `consult` ;

CREATE TABLE IF NOT EXISTS `consult` (
  `idconsult` INT NOT NULL AUTO_INCREMENT,
  `iduser` INT NULL,
  `idpacient` INT NULL,
  `timestamp` DATETIME NULL,
  `date` DATE NULL,
  `ip_user` VARCHAR(20) NULL,
  `free_text` TEXT NULL,
  `have_files` TINYINT NULL,
  PRIMARY KEY (`idconsult`),
  INDEX `idpaciente_idx` (`idpacient` ASC),
  INDEX `iduser_idx` (`iduser` ASC),
  CONSTRAINT `idpaciente_consult`
    FOREIGN KEY (`idpacient`)
    REFERENCES `patient` (`idpatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `iduser_consult`
    FOREIGN KEY (`iduser`)
    REFERENCES `user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anamnese`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `anamnese` ;

CREATE TABLE IF NOT EXISTS `anamnese` (
  `idanamnese` INT NOT NULL AUTO_INCREMENT,
  `idconsult` INT NULL,
  PRIMARY KEY (`idanamnese`),
  INDEX `idconsult_idx` (`idconsult` ASC),
  CONSTRAINT `idconsult_anam`
    FOREIGN KEY (`idconsult`)
    REFERENCES `consult` (`idconsult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `physical_exam`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `physical_exam` ;

CREATE TABLE IF NOT EXISTS `physical_exam` (
  `idphysical_exam` INT NOT NULL AUTO_INCREMENT,
  `idconsult` INT NULL,
  PRIMARY KEY (`idphysical_exam`),
  INDEX `idconsult_idx` (`idconsult` ASC),
  CONSTRAINT `idconsult_physical`
    FOREIGN KEY (`idconsult`)
    REFERENCES `consult` (`idconsult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medicines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicines` ;

CREATE TABLE IF NOT EXISTS `medicines` (
  `idmedicines` INT NOT NULL AUTO_INCREMENT,
  `idconsult` INT NULL,
  PRIMARY KEY (`idmedicines`),
  INDEX `idconsult_idx` (`idconsult` ASC),
  CONSTRAINT `idconsult_medicine`
    FOREIGN KEY (`idconsult`)
    REFERENCES `consult` (`idconsult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `file` ;

CREATE TABLE IF NOT EXISTS `file` (
  `idfile` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(10) NULL,
  PRIMARY KEY (`idfile`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `file__consult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `file__consult` ;

CREATE TABLE IF NOT EXISTS `file__consult` (
  `idfile` INT NOT NULL,
  `idconsult` INT NULL,
  INDEX `idfile_idx` (`idfile` ASC),
  INDEX `idconsult_idx` (`idconsult` ASC),
  CONSTRAINT `idfile`
    FOREIGN KEY (`idfile`)
    REFERENCES `file` (`idfile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idconsult_file`
    FOREIGN KEY (`idconsult`)
    REFERENCES `consult` (`idconsult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp_exam`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp_exam` ;

CREATE TABLE IF NOT EXISTS `comp_exam` (
  `idcomp_exam` INT NOT NULL AUTO_INCREMENT,
  `idconsult` INT NULL,
  PRIMARY KEY (`idcomp_exam`),
  INDEX `idconsult_idx` (`idconsult` ASC),
  CONSTRAINT `idconsult_comp`
    FOREIGN KEY (`idconsult`)
    REFERENCES `consult` (`idconsult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evidences`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evidences` ;

CREATE TABLE IF NOT EXISTS `evidences` (
  `idevidences` INT NOT NULL AUTO_INCREMENT,
  `idconsult` INT NULL,
  PRIMARY KEY (`idevidences`),
  INDEX `idconsult_evidences_idx` (`idconsult` ASC),
  CONSTRAINT `idconsult_evidences`
    FOREIGN KEY (`idconsult`)
    REFERENCES `consult` (`idconsult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interventions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interventions` ;

CREATE TABLE IF NOT EXISTS `interventions` (
  `idinterventions` INT NOT NULL AUTO_INCREMENT,
  `idconsult` INT NULL,
  PRIMARY KEY (`idinterventions`),
  INDEX `idconsult_interventions_idx` (`idconsult` ASC),
  CONSTRAINT `idconsult_interventions`
    FOREIGN KEY (`idconsult`)
    REFERENCES `consult` (`idconsult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `predictors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `predictors` ;

CREATE TABLE IF NOT EXISTS `predictors` (
  `idpredictors` INT NOT NULL AUTO_INCREMENT,
  `idconsult` INT NULL,
  PRIMARY KEY (`idpredictors`),
  INDEX `idconsult_predictors_idx` (`idconsult` ASC),
  CONSTRAINT `idconsult_predictors`
    FOREIGN KEY (`idconsult`)
    REFERENCES `consult` (`idconsult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Placeholder table for view `login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login` (`iduser` INT, `type_user` INT, `login` INT, `pass` INT, `name` INT, `picture` INT);

-- -----------------------------------------------------
-- Placeholder table for view `full_patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full_patient` (`idpatient` INT, `idpeople` INT, `iduser` INT, `nr_prontuario` INT, `nr_mv` INT, `name` INT, `cpf` INT, `picture` INT, `dtnasc` INT, `etiny` INT, `tel1` INT, `tel2` INT, `tel_emerg` INT, `cel` INT, `address` INT);

-- -----------------------------------------------------
-- View `login`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `login` ;
DROP TABLE IF EXISTS `login`;
CREATE  OR REPLACE VIEW `login` AS
SELECT u.iduser , u.type_user, u.login, u.pass, p.name, p.picture FROM user AS u
INNER JOIN people as p ON u.idpeople = p.idpeople;

-- -----------------------------------------------------
-- View `full_patient`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `full_patient` ;
DROP TABLE IF EXISTS `full_patient`;
CREATE  OR REPLACE VIEW `full_patient` AS 
SELECT pa.idpatient, pa.idpeople, pa.iduser,pa.prontuary_number as nr_prontuario, pa.mv_number as nr_mv,
 pe.name, pe.cpf, pe.picture, pe.dtnasc, pe.etiny, pe.tel1, pe.tel2, pe.tel_emerg, pe.cel, pe.address 
 FROM  patient as pa 
INNER JOIN people as pe ON pa.idpeople = pe.idpeople;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
