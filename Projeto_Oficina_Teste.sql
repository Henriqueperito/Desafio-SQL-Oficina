-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veículo` (
  `idVeículo` INT NOT NULL,
  `Placa` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Veículocol` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeículo`, `Cliente_idCliente`),
  UNIQUE INDEX `Placa_UNIQUE` (`Placa` ASC) VISIBLE,
  INDEX `fk_Veículo_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Veículo_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecânico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mecânico` (
  `idMecânico` INT NOT NULL,
  `Código` VARCHAR(45) NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecânico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipe` (
  `idEquipe` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecânico_has_Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mecânico_has_Equipe` (
  `Mecânico_idMecânico` INT NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  PRIMARY KEY (`Mecânico_idMecânico`, `Equipe_idEquipe`),
  INDEX `fk_Mecânico_has_Equipe_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_Mecânico_has_Equipe_Mecânico1_idx` (`Mecânico_idMecânico` ASC) VISIBLE,
  CONSTRAINT `fk_Mecânico_has_Equipe_Mecânico1`
    FOREIGN KEY (`Mecânico_idMecânico`)
    REFERENCES `mydb`.`Mecânico` (`idMecânico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecânico_has_Equipe_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OS (Ordem de Serviço)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OS (Ordem de Serviço)` (
  `idOS` INT NOT NULL,
  `Número_OS` VARCHAR(45) NULL,
  `Data_Emissão` DATE NULL,
  `Valor_Total` FLOAT NULL,
  `Status` ENUM('Pendente', 'Autorizado', 'Em Execução', 'Concluído') NULL,
  `Data_Conclusão` DATE NULL,
  `Equipe_idEquipe` INT NOT NULL,
  `Veículo_idVeículo` INT NOT NULL,
  PRIMARY KEY (`idOS`, `Equipe_idEquipe`, `Veículo_idVeículo`),
  INDEX `fk_OS (Ordem de Serviço)_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_OS (Ordem de Serviço)_Veículo1_idx` (`Veículo_idVeículo` ASC) VISIBLE,
  CONSTRAINT `fk_OS (Ordem de Serviço)_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OS (Ordem de Serviço)_Veículo1`
    FOREIGN KEY (`Veículo_idVeículo`)
    REFERENCES `mydb`.`Veículo` (`idVeículo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Serviços (Tabela de Referência de Mão-de-Obra)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Serviços (Tabela de Referência de Mão-de-Obra)` (
  `idServiços (Tabela de Referência de Mão-de-Obra)` INT NOT NULL,
  `Descrição_Serviço` VARCHAR(45) NULL,
  `Valor_Mão_Obra` FLOAT NULL,
  PRIMARY KEY (`idServiços (Tabela de Referência de Mão-de-Obra)`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peças` (
  `idPeças` INT NOT NULL,
  `Nome_Peça` VARCHAR(45) NULL,
  `Valor_Unitario` FLOAT NULL,
  PRIMARY KEY (`idPeças`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OS_has_Serviços`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OS_has_Serviços` (
  `OS (Ordem de Serviço)_idOS` INT NOT NULL,
  `Serviços (Tabela de Referência de Mão-de-Obra)_idServiços (Tabela de Referência de Mão-de-Obra)` INT NOT NULL,
  PRIMARY KEY (`OS (Ordem de Serviço)_idOS`, `Serviços (Tabela de Referência de Mão-de-Obra)_idServiços (Tabela de Referência de Mão-de-Obra)`),
  INDEX `fk_OS (Ordem de Serviço)_has_Serviços (Tabela de Referên_idx` (`Serviços (Tabela de Referência de Mão-de-Obra)_idServiços (Tabela de Referência de Mão-de-Obra)` ASC) VISIBLE,
  INDEX `fk_OS (Ordem de Serviço)_has_Serviços (Tabela de Referên_idx1` (`OS (Ordem de Serviço)_idOS` ASC) VISIBLE,
  CONSTRAINT `fk_OS (Ordem de Serviço)_has_Serviços (Tabela de Referênci1`
    FOREIGN KEY (`OS (Ordem de Serviço)_idOS`)
    REFERENCES `mydb`.`OS (Ordem de Serviço)` (`idOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OS (Ordem de Serviço)_has_Serviços (Tabela de Referênci2`
    FOREIGN KEY (`Serviços (Tabela de Referência de Mão-de-Obra)_idServiços (Tabela de Referência de Mão-de-Obra)`)
    REFERENCES `mydb`.`Serviços (Tabela de Referência de Mão-de-Obra)` (`idServiços (Tabela de Referência de Mão-de-Obra)`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OS_has_Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OS_has_Peças` (
  `OS (Ordem de Serviço)_idOS` INT NOT NULL,
  `Peças_idPeças` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`OS (Ordem de Serviço)_idOS`, `Peças_idPeças`),
  INDEX `fk_OS (Ordem de Serviço)_has_Peças_Peças1_idx` (`Peças_idPeças` ASC) VISIBLE,
  INDEX `fk_OS (Ordem de Serviço)_has_Peças_OS (Ordem de Serviço)_idx` (`OS (Ordem de Serviço)_idOS` ASC) VISIBLE,
  CONSTRAINT `fk_OS (Ordem de Serviço)_has_Peças_OS (Ordem de Serviço)1`
    FOREIGN KEY (`OS (Ordem de Serviço)_idOS`)
    REFERENCES `mydb`.`OS (Ordem de Serviço)` (`idOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OS (Ordem de Serviço)_has_Peças_Peças1`
    FOREIGN KEY (`Peças_idPeças`)
    REFERENCES `mydb`.`Peças` (`idPeças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
