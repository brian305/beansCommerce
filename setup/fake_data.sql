USE `beansCommerce` ;
-- -----------------------------------------------------
-- insert into customer table
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `beansCommerce`.`customer` (`name`, `email`, `phone`, `address`)
VALUES ('Trung Vo', 'trung.vo@stonybrook.edu', '6313277695', '150 Christian Ave, Stony Brook, NY 11790');

INSERT INTO `beansCommerce`.`customer` (`name`, `email`, `phone`, `address`)
VALUES ('David Park', 'david.park@stonybrook.edu', '5345454322', '65 Cedar Ave, Stony Brook, NY 11790');

INSERT INTO `beansCommerce`.`customer` (`name`, `email`, `phone`, `address`)
VALUES ('Brian Lee', 'brian.lee@stonybrook.edu', '5475745460', '75 Rand Ave, Stony Brook, NY 11790');

-- -----------------------------------------------------
-- insert into category table
-- -----------------------------------------------------
INSERT INTO `beansCommerce`.`category` (`name`,`id`) VALUES ('dairy','1');
INSERT INTO `beansCommerce`.`category` (`name`,`id`) VALUES ('meats','2');
INSERT INTO `beansCommerce`.`category` (`name`,`id`) VALUES ('bakery','3');
INSERT INTO `beansCommerce`.`category` (`name`,`id`) VALUES ('fruit & veg','4');

-- -----------------------------------------------------
-- insert into inventory table
-- -----------------------------------------------------

INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (1,'milk', 1.70, 'semi skimmed (1L)', 1);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (2,'cheese', 2.39, 'mild cheddar (330g)', 1);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (3,'butter', 1.09, 'unsalted (250g)', 1);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (4,'free range eggs', 1.76, 'medium-sized (6 eggs)', 1);
`id`,,
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (5,'organic meat patties', 2.29, 'rolled in fresh herbs<br>2 patties (250g)', 2);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (6,'parma ham', 3.49, 'matured, organic (70g)', 2);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (7,'chicken leg', 2.59, 'free range (250g)', 2);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (8,'sausages', 3.55, 'reduced fat, pork<br>3 sausages (350g)', 2);
`id`,,
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (9,'sunflower seed loaf', 1.89, '600g', 3);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (10,'sesame seed bagel', 1.19, '4 bagels', 3);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (11,'pumpkin seed bun', 1.15, '4 buns', 3);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (12,'chocolate cookies', 2.39, 'contain peanuts<br>(3 cookies)', 3);
`id`,,
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (13,'corn on the cob', 1.59, '2 pieces', 4);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (14,'red currants', 2.49, '150g', 4);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (15,'broccoli', 1.29, '500g', 4);
INSERT INTO `inventory` (`id`,`name`, price, description, category_id) VALUES (16,'seedless watermelon', 1.49, '250g', 4);