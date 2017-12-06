/*
	Author: Trung Vo
*/

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `beansCommerce` ;
CREATE SCHEMA IF NOT EXISTS `beansCommerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `beansCommerce` ;


-- -----------------------------------------------------
-- Table `beansCommerce`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beansCommerce`.`customer` ;

CREATE  TABLE IF NOT EXISTS `beansCommerce`.`customer` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(45) NOT NULL ,
	`email` VARCHAR(45) NOT NULL ,
	`phone` VARCHAR(45) NOT NULL ,
	`address` VARCHAR(90) NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB
COMMENT = 'maintains customer details';

-- -----------------------------------------------------
-- Table `beansCommerce`.`customer_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beansCommerce`.`customer_order` ;

CREATE  TABLE IF NOT EXISTS `beansCommerce`.`customer_order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `amount` DECIMAL(6,2) NOT NULL ,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `confirmation_number` INT UNSIGNED NOT NULL ,
  `customer_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_customer_order_customer` (`customer_id` ASC) ,
  CONSTRAINT `fk_customer_order_customer`
    FOREIGN KEY (`customer_id` )
    REFERENCES `beansCommerce`.`customer` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'maintains customer order details';

-- -----------------------------------------------------
-- Table `beansCommerce`.`shipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beansCommerce`.`shipment` ;

CREATE  TABLE IF NOT EXISTS `beansCommerce`.`shipment` (
	`order_number` VARCHAR(45) NOT NULL ,
    `customer_id` INT UNSIGNED NOT NULL ,
	`by` CHAR(10) NOT NULL ,
	`type` CHAR(10) NOT NULL ,
	`address` VARCHAR(90) NOT NULL,
	`fee` FLOAT NOT NULL,
	PRIMARY KEY (`order_number`),
    CONSTRAINT `fk_customer_shipment`
    FOREIGN KEY (`customer_id`) REFERENCES `beansCommerce`.`customer`(`id`)
    ON DELETE CASCADE
	ON UPDATE CASCADE
) ENGINE = InnoDB
COMMENT = 'maintains customer shipment details';

-- -----------------------------------------------------
-- Table `beansCommerce`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beansCommerce`.`category` ;

CREATE  TABLE IF NOT EXISTS `beansCommerce`.`category` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'maintains categories details';

-- -----------------------------------------------------
-- Table `beansCommerce`.`inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beansCommerce`.`inventory` ;

CREATE  TABLE IF NOT EXISTS `beansCommerce`.`inventory` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `price` DECIMAL(5,2) NOT NULL ,
  `description` TINYTEXT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `category_id` TINYINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_inventory_category` (`category_id` ASC) ,
  CONSTRAINT `fk_inventory_category`
    FOREIGN KEY (`category_id` )
    REFERENCES `beansCommerce`.`category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
COMMENT = 'maintains inventory details';

-- -----------------------------------------------------
-- Table `beansCommerce`.`ordered_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beansCommerce`.`ordered_product` ;

CREATE  TABLE IF NOT EXISTS `beansCommerce`.`ordered_product` (
  `customer_order_id` INT UNSIGNED NOT NULL ,
  `product_id` INT UNSIGNED NOT NULL ,
  `quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`customer_order_id`, `product_id`) ,
  INDEX `fk_ordered_product_customer_order` (`customer_order_id` ASC) ,
  INDEX `fk_ordered_product_product` (`product_id` ASC) ,
  CONSTRAINT `fk_ordered_product_customer_order`
    FOREIGN KEY (`customer_order_id` )
    REFERENCES `beansCommerce`.`customer_order` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product`
    FOREIGN KEY (`product_id` )
    REFERENCES `beansCommerce`.`product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;