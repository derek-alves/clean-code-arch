CREATE SCHEMA IF NOT EXISTS `market` DEFAULT CHARACTER SET utf8;
USE `market`;

CREATE TABLE IF NOT EXISTS `market`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` FLOAT NOT NULL,
  `width` FLOAT NULL DEFAULT 0,
  `height` FLOAT NULL DEFAULT 0,
  `length` FLOAT NULL DEFAULT 0,
  `weight` FLOAT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `market`.`coupon` (
  `code` VARCHAR(255) NOT NULL,
  `percentage` FLOAT NOT NULL,
  `expire_date` BIGINT(255),
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `market`.`order` (
  `id`INT NOT NULL AUTO_INCREMENT,
  `coupon` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(255) NOT NULL,
  `freight` FLOAT NOT NULL,
  `issue_date` BIGINT(255),
  `sequence` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `market`.`order_item` (
  `id`INT NOT NULL AUTO_INCREMENT,
  `id_order` INT NOT NULL,
  `id_item` INT NOT NULL,
  `price` FLOAT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
   CONSTRAINT `id_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `market`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
   CONSTRAINT `id_item`
    FOREIGN KEY (`id_item`)
    REFERENCES `market`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

ENGINE = InnoDB;