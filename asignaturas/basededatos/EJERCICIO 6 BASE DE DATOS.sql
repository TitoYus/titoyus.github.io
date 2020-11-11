-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema VentasInformática
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema VentasInformática
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `VentasInformática` ;
USE `VentasInformática` ;

-- -----------------------------------------------------
-- Table `VentasInformática`.`PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VentasInformática`.`PRODUCTOS` (
  `Codigo` VARCHAR(10) NOT NULL,
  `Descripicion` VARCHAR(50) NOT NULL,
  `Precio` INT(6) NOT NULL,
  `NºExistencias` INT(3) NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VentasInformática`.`CLIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VentasInformática`.`CLIENTES` (
  `Código` VARCHAR(10) NOT NULL,
  `Nombre` CHAR(15) NOT NULL,
  `Apellido` CHAR(30) NOT NULL,
  `Direccion` VARCHAR(50) NOT NULL,
  `Telefono` INT(9) NOT NULL,
  PRIMARY KEY (`Código`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VentasInformática`.`PROVEEDORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VentasInformática`.`PROVEEDORES` (
  `Codigo` VARCHAR(10) NOT NULL,
  `Nombre` CHAR(15) NOT NULL,
  `Apellidos` CHAR(30) NOT NULL,
  `Direccion` VARCHAR(30) NOT NULL,
  `Provincia` CHAR(15) NOT NULL,
  `Tlfn` INT(9) NOT NULL,
  `PROVEEDOREScol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VentasInformática`.`P-P`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VentasInformática`.`P-P` (
  `PROVEEDORES_Codigo` VARCHAR(10) NOT NULL,
  `PRODUCTOS_Codigo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`PROVEEDORES_Codigo`, `PRODUCTOS_Codigo`),
  INDEX `fk_PROVEEDORES_has_PRODUCTOS_PRODUCTOS1_idx` (`PRODUCTOS_Codigo` ASC) VISIBLE,
  INDEX `fk_PROVEEDORES_has_PRODUCTOS_PROVEEDORES_idx` (`PROVEEDORES_Codigo` ASC) VISIBLE,
  CONSTRAINT `fk_PROVEEDORES_has_PRODUCTOS_PROVEEDORES`
    FOREIGN KEY (`PROVEEDORES_Codigo`)
    REFERENCES `VentasInformática`.`PROVEEDORES` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROVEEDORES_has_PRODUCTOS_PRODUCTOS1`
    FOREIGN KEY (`PRODUCTOS_Codigo`)
    REFERENCES `VentasInformática`.`PRODUCTOS` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VentasInformática`.`P-C`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VentasInformática`.`P-C` (
  `PRODUCTOS_Codigo` VARCHAR(10) NOT NULL,
  `CLIENTES_Código` VARCHAR(10) NOT NULL,
  `FechaCompra` DATE NOT NULL,
  PRIMARY KEY (`PRODUCTOS_Codigo`, `CLIENTES_Código`),
  INDEX `fk_PRODUCTOS_has_CLIENTES_CLIENTES1_idx` (`CLIENTES_Código` ASC) VISIBLE,
  INDEX `fk_PRODUCTOS_has_CLIENTES_PRODUCTOS1_idx` (`PRODUCTOS_Codigo` ASC) VISIBLE,
  CONSTRAINT `fk_PRODUCTOS_has_CLIENTES_PRODUCTOS1`
    FOREIGN KEY (`PRODUCTOS_Codigo`)
    REFERENCES `VentasInformática`.`PRODUCTOS` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTOS_has_CLIENTES_CLIENTES1`
    FOREIGN KEY (`CLIENTES_Código`)
    REFERENCES `VentasInformática`.`CLIENTES` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
