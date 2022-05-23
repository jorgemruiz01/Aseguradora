CREATE SCHEMA IF NOT EXISTS `bbddaseguradoratfg` DEFAULT CHARACTER SET utf8 ;
USE `bbddaseguradoratfg` ;

-- -----------------------------------------------------
-- Table `bbddaseguradoratfg`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddaseguradoratfg`.`clientes` (
  `idcliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `edad` INT(11) NULL DEFAULT NULL,
  `antecedentes` TINYINT(4) NULL DEFAULT NULL,
  `fam_numerosa` TINYINT(4) NULL DEFAULT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `empleados_idempleado` INT(11) NULL DEFAULT NULL,
  `servicios_idservicio` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_clientes_empleados1_idx` (`empleados_idempleado` ASC) ,
  INDEX `fk_clientes_servicios1_idx` (`servicios_idservicio` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bbddaseguradoratfg`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddaseguradoratfg`.`empleados` (
  `idempleado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `dni` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` INT(11) NULL DEFAULT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idempleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bbddaseguradoratfg`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddaseguradoratfg`.`servicios` (
  `idservicio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `precio` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`idservicio`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bbddaseguradoratfg`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddaseguradoratfg`.`ventas` (
  `idventa` INT(11) NOT NULL AUTO_INCREMENT,
  `precio` VARCHAR(45) NULL DEFAULT NULL,
  `empleados_idempleado` INT(11) NULL DEFAULT NULL,
  `servicios_idservicio` INT(11) NULL DEFAULT NULL,
  `clientes_idcliente` INT(11) NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idventa`),
  INDEX `fk_ventas_empleados1_idx` (`empleados_idempleado` ASC) ,
  INDEX `fk_ventas_clientes1_idx` (`clientes_idcliente` ASC) ,
  CONSTRAINT `fk_ventas_empleados1`
    FOREIGN KEY (`empleados_idempleado`)
    REFERENCES `bbddaseguradoratfg`.`empleados` (`idempleado`)
    ON DELETE  CASCADE
    ON UPDATE  CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
