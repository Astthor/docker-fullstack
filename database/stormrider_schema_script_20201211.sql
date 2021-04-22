-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema stormrider
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS stormrider;
CREATE SCHEMA `stormrider` DEFAULT CHARACTER SET utf8 ;
USE stormrider;

-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `first_name` VARCHAR(80) NOT NULL COMMENT 'First name of the customer\n\ne.g. John',
  `last_name` VARCHAR(45) NOT NULL COMMENT 'Last name of the customer\n\ne.g. Green',
  `email` VARCHAR(120) NOT NULL COMMENT 'Email address of the customer\n\ne.g. john.green@gmail.com',
  `phone` VARCHAR(45) NOT NULL COMMENT 'Phone number of the customer\n\ne.g. +45 50 50 50 50 ',
  `cvr_number` VARCHAR(10) NULL COMMENT 'Company\'s registration number (only if customer represents some company)\n\ne.g. 36729929',
  `company_name` VARCHAR(120) NULL COMMENT 'Company\'s name (only if customer represents some company)\n\ne.g. Novo Nordisk',
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product_group_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_group_image` ;

CREATE TABLE IF NOT EXISTS `product_group_image` (
  `product_group_image_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `image` VARCHAR(256) NOT NULL COMMENT 'Link to the image\n\ne.g. ',
  `name` VARCHAR(45) NOT NULL COMMENT 'Name of the image\n\ne.g. ',
  PRIMARY KEY (`product_group_image_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_group` ;

CREATE TABLE IF NOT EXISTS `product_group` (
  `product_group_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `product_group_image_id` INT NOT NULL,
  `base_price` DOUBLE NOT NULL COMMENT 'Base price (net) of the product group\n\nFull price (gross) = base_price + vat\n\ne.g. ',
  `vat` DOUBLE NOT NULL COMMENT 'VAT amount\n\nFull price (gross) = base_price + vat\n\ne.g. ',
  PRIMARY KEY (`product_group_id`),
  CONSTRAINT `product_group_product_group_image_id`
    FOREIGN KEY (`product_group_image_id`)
    REFERENCES `product_group_image` (`product_group_image_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `product_group_product_group_image_id_idx` ON `product_group` (`product_group_image_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `inventory` SMALLINT NOT NULL COMMENT 'Current amount in the invenory of the specified product\n\ne.g. 56, 0',
  `product_group_id` INT NOT NULL COMMENT 'Identifies the product group ID from the product_group table\n\nWorks as a foreign key on:\nproduct.product_group_id = product_group.product_group_id\n\ne.g. 1, 2, 3',
  `last_updated` DATE NOT NULL COMMENT 'Date when the product has been last updated\n\ne.g. ',
  PRIMARY KEY (`product_id`),
  CONSTRAINT `product_product_group_id`
    FOREIGN KEY (`product_group_id`)
    REFERENCES `product_group` (`product_group_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `productgroup_id_idx` ON `product` (`product_group_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `address` VARCHAR(100) NOT NULL COMMENT 'Adress (street, house & apartment number)\n\ne.g. Lygten 37',
  `zip` VARCHAR(15) NOT NULL COMMENT 'Zip code of the address\n\ne.g. 2400',
  `city` VARCHAR(45) NOT NULL COMMENT 'City of the address\n\ne.g. Copenhagen',
  `country` VARCHAR(56) NOT NULL COMMENT 'Country of the address\n\ne.g. Denmark',
  `county` VARCHAR(45) NOT NULL COMMENT 'County of the address\n\ne.g. ',
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cart` ;

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `status` VARCHAR(45) NULL COMMENT 'Status of the cart\n\ne.g. abandoned / ',
  `total_price` DOUBLE NOT NULL COMMENT 'Total NET price of the cart \n\ntotal_price + vat = what customer ends up paying\n\ne.g. 10000',
  `vat` DOUBLE NOT NULL COMMENT 'Total VAT (amount, not the percentage) of the cart \n\ntotal_price + vat = what customer ends up paying\n\ne.g. 2500',
  `total_discount` DOUBLE NOT NULL COMMENT 'Total amount of discount applied through the voucher (**OR PRICE REDUCTIONS ALSO COUNT?)\n\ne.g. 3000',
  `billing_address_id` INT NULL COMMENT 'Identifies the billing address ID from the address table\n\nWorks as a foreign key on:\ncart.billing_address_id = address.address_id\n\ne.g. 1, 2, 3',
  `shipping_address_id` INT NULL COMMENT 'Identifies the shipping address ID from the address table\n\nWorks as a foreign key on:\ncart.shipping_address_id = address.address_id\n\ne.g. 1, 2, 3',
  `customer_id` INT NULL COMMENT 'Identifies the customer ID from the customer table\n\nWorks as a foreign key on:\ncart.customer_id = customer.customer_id\n\ne.g. 1, 2, 3',
  `created` DATE NULL COMMENT 'Date when the cart was first created\n\ne.g. 2020-11-11',
  `voucher_id` INT NULL COMMENT 'Identifies the voucher ID from the voucher table (if used)\n\nWorks as a foreign key on:\ncart.voucher_id = voucher.voucher_id\n\ne.g. 1, 2, 3',
  `tracking_number` VARCHAR(45) NULL COMMENT 'Tracking number for the order, if it has been shipped\n\ne.g. EHT2342353456',
  PRIMARY KEY (`cart_id`),
  CONSTRAINT `cart_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `customer` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `cart_billing_address_id`
    FOREIGN KEY (`billing_address_id`)
    REFERENCES `address` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `cart_shipping_address_id`
    FOREIGN KEY (`shipping_address_id`)
    REFERENCES `address` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `customer_id_idx` ON `cart` (`customer_id` ASC) VISIBLE;

CREATE INDEX `billing_address_id_idx` ON `cart` (`billing_address_id` ASC) VISIBLE;

CREATE INDEX `shipping_address_id_idx` ON `cart` (`shipping_address_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subcategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subcategory` ;

CREATE TABLE IF NOT EXISTS `subcategory` (
  `subcategory_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table',
  PRIMARY KEY (`subcategory_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `admin` ;

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` INT NOT NULL COMMENT 'Unique ID of each row in the table',
  `user_name` VARCHAR(45) NULL COMMENT 'Username of the admin\'s account',
  `password` VARCHAR(45) NULL COMMENT 'Password of the admin\'s account',
  `email` VARCHAR(100) NULL COMMENT 'Email address of the admin\'s account',
  PRIMARY KEY (`admin_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `invoice` ;

CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `date` DATE NOT NULL COMMENT 'Date of the Invoice (date when the cart has been purchased)\n\ne.g. 2020-11-21',
  `cart_id` INT NOT NULL COMMENT 'Identifies the cart ID from the cart table\n\nWorks as a foreign key on:\ninvoice.cart_id = cart.cart_id\n\ne.g. 1, 2, 3',
  `status` VARCHAR(25) NOT NULL COMMENT 'Status of the cart\n\ne.g. abandoned, processed, ready for shipping, shipped',
  `payment_method` VARCHAR(45) NULL COMMENT 'Payment method used\n\ne.g. mastercard',
  `paid` TINYINT(1) NOT NULL COMMENT 'Identifies whether the cart has been paid for \n\ne.g. true - paid; false - unpaid',
  PRIMARY KEY (`invoice_id`),
  CONSTRAINT `invoice_cart_id`
    FOREIGN KEY (`cart_id`)
    REFERENCES `cart` (`cart_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `cart_id_idx` ON `invoice` (`cart_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cart_has_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cart_has_products` ;

CREATE TABLE IF NOT EXISTS `cart_has_products` (
  `cart_has_product_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `product_id` INT NOT NULL COMMENT 'Identifies the product ID from the product table\n\nWorks as a foreign key on:\ncart_has_products.product_id = product.product_id\n\ne.g. 1, 2, 3',
  `amount` INT NOT NULL COMMENT 'Amount of the same product in the cart\n\ne.g. 5, 2',
  `cart_id` INT NOT NULL COMMENT 'Identifies the cart ID from the cart table\n\nWorks as a foreign key on:\ncart_has_products.cart_id = cart.cart_id\n\ne.g. 1, 2, 3',
  PRIMARY KEY (`cart_has_product_id`),
  CONSTRAINT `cart_has_products_cart_id`
    FOREIGN KEY (`cart_id`)
    REFERENCES `cart` (`cart_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `cart_has_products_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `cart_id_idx` ON `cart_has_products` (`cart_id` ASC) VISIBLE;

CREATE INDEX `product_id_idx` ON `cart_has_products` (`product_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `app_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `app_language` ;

CREATE TABLE IF NOT EXISTS `app_language` (
  `code` CHAR(2) NOT NULL COMMENT 'Unique code of each language\n\ne.g. EN, IS',
  `language` VARCHAR(20) NULL COMMENT 'Name of the language\n\ne.g. English, Icelandic',
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_language` ;

CREATE TABLE IF NOT EXISTS `category_language` (
  `category_language_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table',
  `app_language_code` CHAR(2) NOT NULL COMMENT 'Identifies the language code from the app_language table\n\nWorks as a foreign key on:\ncategory_language.app_language_code = app_language.code\n\ne.g. EN, IS',
  `category_id` INT NOT NULL COMMENT 'Identifies the category ID from the category table\n\nWorks as a foreign key on:\ncategory_language.category_id = category.category_id\n\ne.g. 1, 2, 3',
  `name` VARCHAR(100) NOT NULL COMMENT 'Name of the category in a specified language\n\ne.g. ',
  PRIMARY KEY (`category_language_id`),
  CONSTRAINT `category_language_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`category_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `category_language_app_language_code`
    FOREIGN KEY (`app_language_code`)
    REFERENCES `app_language` (`code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_category_id_idx` ON `category_language` (`category_id` ASC) VISIBLE;

CREATE INDEX `fk_app_language_code_idx` ON `category_language` (`app_language_code` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `subcategory_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subcategory_language` ;

CREATE TABLE IF NOT EXISTS `subcategory_language` (
  `category_language_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table',
  `app_language_code` CHAR(2) NOT NULL COMMENT 'Identifies the language code from the app_language table\n\nWorks as a foreign key on:\nsubcategory_language.app_language_code = app_language.code\n\ne.g. EN, IS',
  `subcategory_id` INT NOT NULL COMMENT 'Identifies the subcategory ID from the subcategory table\n\nWorks as a foreign key on:\nsubcategory_language.subcategory_id = subcategory.sub_category_id\n\ne.g. 1, 2, 3',
  `name` VARCHAR(100) NOT NULL COMMENT 'Name of the subcategory in a specified language\n\ne.g. ',
  PRIMARY KEY (`category_language_id`),
  CONSTRAINT `subcategory_language_subcategory_id`
    FOREIGN KEY (`subcategory_id`)
    REFERENCES `subcategory` (`subcategory_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `subcategory_language_app_language_code`
    FOREIGN KEY (`app_language_code`)
    REFERENCES `app_language` (`code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_app_language_code_idx` ON `subcategory_language` (`app_language_code` ASC) VISIBLE;

CREATE INDEX `fk_subcategory_id_idx` ON `subcategory_language` (`subcategory_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `product_group_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_group_language` ;

CREATE TABLE IF NOT EXISTS `product_group_language` (
  `product_group_language_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table',
  `app_language_code` CHAR(2) NOT NULL COMMENT 'Identifies the language code from the app_language table\n\nWorks as a foreign key on:\nproduct_group_language.app_language_code = app_language.code\n\ne.g. EN, IS',
  `product_group_id` INT NOT NULL COMMENT 'Identifies the product group ID from the product_group table\n\nWorks as a foreign key on:\nproduct_group_language.product_group_id = product_group.product_group_id\n\ne.g. 1, 2, 3',
  `product_group_name` VARCHAR(100) NOT NULL COMMENT 'Name of the product group in a specified language\n\ne.g. ',
  `product_group_description` VARCHAR(500) NULL COMMENT 'Description of the product group in a specified language\n\ne.g. ',
  PRIMARY KEY (`product_group_language_id`),
  CONSTRAINT `product_group_language_product_group_id`
    FOREIGN KEY (`product_group_id`)
    REFERENCES `product_group` (`product_group_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `product_group_language_app_language_code`
    FOREIGN KEY (`app_language_code`)
    REFERENCES `app_language` (`code`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_product_group_id_idx` ON `product_group_language` (`product_group_id` ASC) VISIBLE;

CREATE INDEX `fk_app_language_code_idx` ON `product_group_language` (`app_language_code` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `voucher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `voucher` ;

CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table',
  `redeem_code` VARCHAR(25) NULL COMMENT 'Redeem code of the voucher\n\ne.g. ',
  `valid_from` DATE NULL COMMENT 'Date from when the voucher starts to be valid\n\ne.g. 2020-11-22',
  `valid_until` DATE NULL COMMENT 'Date until when the voucher is valid\n\ne.g. 2020-11-22',
  `times_used` INT NULL COMMENT 'Identifies how many times each voucher has been used\n\ne.g. 4',
  `max_times_used` INT NULL COMMENT 'Maximum limit for the times voucher can be used \n\ne.g. 10',
  `active` TINYINT(1) NOT NULL COMMENT 'Identifies whether the voucher is active\n\ne.g. true - active; false - not active',
  `comment` VARCHAR(255) NULL COMMENT 'Any additional comments (if any)\n\ne.g.',
  `discount` DOUBLE NULL COMMENT 'Discount of the voucher (in percentage)\n\ne.g. 25',
  `needs_code` TINYINT(1) NOT NULL,
  PRIMARY KEY (`voucher_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `receipt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `receipt` ;

CREATE TABLE IF NOT EXISTS `receipt` (
  `receipt_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table\n',
  `receipt_info` VARCHAR(255) NULL COMMENT 'Since the receipt is generated only when the cart is paid for, it contains the general payment information \n\ne.g. ',
  `invoice_id` INT NOT NULL,
  PRIMARY KEY (`receipt_id`),
  CONSTRAINT `reiceipt_invoice_id`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `invoice` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `reiceipt_invoice_id_idx` ON `receipt` (`invoice_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `product_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_order` ;

CREATE TABLE IF NOT EXISTS `product_order` (
  `order_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of each row in the table',
  `status` VARCHAR(45) NULL COMMENT 'Status of the order from supplier\n\ne.g. placed, shipped, received',
  `product_id` INT NOT NULL COMMENT 'Identifies the product which has been ordered from the supplier\n\nWorks as a foreign key on:\nproduct_order.product_id = product.product_id\n\ne.g. 1, 2, 3',
  `cost_unit` DOUBLE NULL COMMENT 'GROSS price for each product\n\ncost_unit * unit_amount +  shipping_cost  = total amount of the order before tax\n\ne.g. 3200',
  `unit_amount` INT NULL COMMENT 'Amount of each product ordered\n\ncost_unit * unit_amount +  shipping_cost  = total amount of the order before tax\n\ne.g. 3200',
  `tax_percentage` DOUBLE NULL COMMENT 'Tax percentage for the whole order\n\ne.g. 25%',
  `shipping_cost` DOUBLE NULL COMMENT 'Shipping cost for the order\n\ncost_unit * unit_amount + shipping_cost = total amount of the order before tax\n\ne.g. 120',
  `order_date` DATE NULL COMMENT 'Date when the order has been placed\n\ne.g. 2020-11-22',
  `eta_date` DATE NULL COMMENT 'Estimated delivery date (after delivery - the date when delivered)\n\ne.g. 2020-11-22',
  `comment` VARCHAR(255) NULL COMMENT 'Any additional comments (if any)\n\ne.g.',
  `tracking_number` VARCHAR(45) NULL COMMENT 'Tracking number for the order, if it has been shipped\n\ne.g. EHT2342353456',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `product_order_product_order_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_product_order_product_id_idx` ON `product_order` (`product_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `subcategory_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subcategory_has_category` ;

CREATE TABLE IF NOT EXISTS `subcategory_has_category` (
  `subcategory_id` INT NOT NULL COMMENT 'Identifies the subcategory ID from the subcategory table\n\nWorks as a foreign key on:\nsubcategory_has_category.subcategory_id = subcategory.sub_category_id\n\ne.g. 1, 2, 3',
  `category_id` INT NOT NULL COMMENT 'Identifies the category ID from the category table\n\nWorks as a foreign key on:\nsubcategory_has_category.category_id = category.category_id\n\ne.g. 1, 2, 3',
  PRIMARY KEY (`subcategory_id`, `category_id`),
  CONSTRAINT `subcategory_has_category_subcategory_has_category_subcategory_id`
    FOREIGN KEY (`subcategory_id`)
    REFERENCES `subcategory` (`subcategory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `subcategory_has_category_subcategory_has_category_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_subcategory_has_category_category_id_idx` ON `subcategory_has_category` (`category_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `product_group_has_subcategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_group_has_subcategory` ;

CREATE TABLE IF NOT EXISTS `product_group_has_subcategory` (
  `product_group_id` INT NOT NULL COMMENT 'Identifies the product group ID from the product_group table\n\nWorks as a foreign key on:\nproduct_group_has_subcategory.product_group_id = product_group.product_group_id\n\ne.g. 1, 2, 3',
  `subcategory_id` INT NOT NULL COMMENT 'Identifies the subcategory ID from the subcategory table\n\nWorks as a foreign key on:\nproduct_group_has_subcategory.subcategory_id = subcategory.sub_category_id\n\ne.g. 1, 2, 3',
  PRIMARY KEY (`product_group_id`, `subcategory_id`),
  CONSTRAINT `product_group_has_subcategory_product_group_id`
    FOREIGN KEY (`product_group_id`)
    REFERENCES `product_group` (`product_group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_group_has_subcategory_subcategory_id`
    FOREIGN KEY (`subcategory_id`)
    REFERENCES `subcategory` (`subcategory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_product_group_has_subcategory_subcategory_id_idx` ON `product_group_has_subcategory` (`subcategory_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `variable_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `variable_type` ;

CREATE TABLE IF NOT EXISTS `variable_type` (
  `variable_type_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`variable_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `variable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `variable` ;

CREATE TABLE IF NOT EXISTS `variable` (
  `variable_id` INT NOT NULL AUTO_INCREMENT,
  `variable_type_id` INT NOT NULL,
  PRIMARY KEY (`variable_id`),
  CONSTRAINT `variable_type_id`
    FOREIGN KEY (`variable_type_id`)
    REFERENCES `variable_type` (`variable_type_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `variable_type_id_idx` ON `variable` (`variable_type_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `variable_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `variable_language` ;

CREATE TABLE IF NOT EXISTS `variable_language` (
  `variable_language_id` INT NOT NULL AUTO_INCREMENT,
  `app_language_code` CHAR(2) NOT NULL,
  `variable_name` VARCHAR(45) NOT NULL,
  `variable_comment` VARCHAR(45) NULL,
  `variable_id` INT NOT NULL,
  PRIMARY KEY (`variable_language_id`),
  CONSTRAINT `product_variable_lang_app_lang_id`
    FOREIGN KEY (`app_language_code`)
    REFERENCES `app_language` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `variable_id`
    FOREIGN KEY (`variable_id`)
    REFERENCES `variable` (`variable_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `product_variable_lang_app_lang_id_idx` ON `variable_language` (`app_language_code` ASC) VISIBLE;

CREATE INDEX `variable_id_idx` ON `variable_language` (`variable_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `variable_type_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `variable_type_language` ;

CREATE TABLE IF NOT EXISTS `variable_type_language` (
  `variable_type_language_id` INT NOT NULL AUTO_INCREMENT,
  `app_language_code` CHAR(2) NOT NULL,
  `variable_type_name` VARCHAR(45) NOT NULL,
  `variable_type_comment` VARCHAR(45) NULL,
  `variable_type_id` INT NOT NULL,
  PRIMARY KEY (`variable_type_language_id`),
  CONSTRAINT `variable_type_lang_app_lang_id`
    FOREIGN KEY (`app_language_code`)
    REFERENCES `app_language` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `var_type_lang_variable_type_id`
    FOREIGN KEY (`variable_type_id`)
    REFERENCES `variable_type` (`variable_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `variable_type_lang_app_lang_id_idx` ON `variable_type_language` (`app_language_code` ASC) VISIBLE;

CREATE INDEX `variable_type_id_idx` ON `variable_type_language` (`variable_type_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `product_has_variable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_has_variable` ;

CREATE TABLE IF NOT EXISTS `product_has_variable` (
  `product_id` INT NOT NULL,
  `variable_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `variable_id`),
  CONSTRAINT `product_variable_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_variable_variable_id`
    FOREIGN KEY (`variable_id`)
    REFERENCES `variable` (`variable_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `product_variable_product_id_idx` ON `product_has_variable` (`product_id` ASC) VISIBLE;

CREATE INDEX `product_variable_variable_id_idx` ON `product_has_variable` (`variable_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `voucher_has_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `voucher_has_group` ;

CREATE TABLE IF NOT EXISTS `voucher_has_group` (
  `voucher_group_id` INT NOT NULL,
  `product_id` INT NULL,
  `product_group_id` INT NULL,
  `subcategory_id` INT NULL,
  `category_id` INT NULL,
  `voucher_id` INT NOT NULL,
  PRIMARY KEY (`voucher_group_id`),
  CONSTRAINT `voucher_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `voucher_product_group_id`
    FOREIGN KEY (`product_group_id`)
    REFERENCES `product_group` (`product_group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `voucher_subcategory_id`
    FOREIGN KEY (`subcategory_id`)
    REFERENCES `subcategory` (`subcategory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `voucher_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `voucher_group_voucher_id`
    FOREIGN KEY (`voucher_id`)
    REFERENCES `voucher` (`voucher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `voucher_product_id_idx` ON `voucher_has_group` (`product_id` ASC) VISIBLE;

CREATE INDEX `voucher_product_group_id_idx` ON `voucher_has_group` (`product_group_id` ASC) VISIBLE;

CREATE INDEX `voucher_subcategory_id_idx` ON `voucher_has_group` (`subcategory_id` ASC) VISIBLE;

CREATE INDEX `voucher_category_id_idx` ON `voucher_has_group` (`category_id` ASC) VISIBLE;

CREATE INDEX `voucher_group_voucher_id_idx` ON `voucher_has_group` (`voucher_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `product_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product_image` ;

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `image` VARCHAR(256) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`product_image_id`),
  CONSTRAINT `product_image_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `product_image_product_id_idx` ON `product_image` (`product_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
