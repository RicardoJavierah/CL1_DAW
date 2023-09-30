-- -----------------------------------------------------
-- Schema full-stack-ecommerce C:\Users\fabri\Documents\Semana 13 Cibertec\DAW\02-creacion-tablas.sql
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `full-stack-ecommerce-daw`;

CREATE SCHEMA `full-stack-ecommerce-daw`;
USE `full-stack-ecommerce-daw` ;

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`user` (
    `id_user` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NULL DEFAULT NULL,
    `second_name` VARCHAR(255) NULL DEFAULT NULL,
    `last_name_pat` VARCHAR(255) NULL DEFAULT NULL,
    `last_name_mat` VARCHAR(255) NULL DEFAULT NULL,
    `age` INT NOT NULL,
    `email` VARCHAR(255) NULL DEFAULT NULL,
    `num_phone` CHAR(9) NULL DEFAULT NULL,
    PRIMARY KEY (`id_user`)
);

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`product_category` 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`product_category` (
    `id_category_product` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `category_name` VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (`id_category_product`)
)  ENGINE=INNODB AUTO_INCREMENT=1;

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`product` (
    `id_product` BIGINT(20) NOT NULL,
    `name` VARCHAR(255) NULL DEFAULT NULL,
    `sku` VARCHAR(255) NULL DEFAULT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `unit_price` DECIMAL(13 , 2 ) DEFAULT NULL,
    `image_url` VARCHAR(255) DEFAULT NULL,
    `units_in_stock` INT(11) DEFAULT NULL,
    `date_created` DATETIME(6) DEFAULT NULL,
    `last_updated` DATETIME(6) DEFAULT NULL,
    `id_category_product` BIGINT(20) NOT NULL,
    PRIMARY KEY (`id_product`),
    KEY `fk_category_product` (`id_category_product`),
    CONSTRAINT `fk_category_product` FOREIGN KEY (`id_category_product`)
        REFERENCES `product_category` (`id_category_product`)
);

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`consoles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`consoles` (
    `id_console` BIGINT(20) NOT NULL,
    `name_console` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `year` VARCHAR(255) NOT NULL,
    `product_id` BIGINT(20) NOT NULL,
    `id_category_product` BIGINT(20) NOT NULL,
    PRIMARY KEY (`id_console`),
    KEY `fk_product_consoles` (`product_id`),
    CONSTRAINT `fk_product_consoles` FOREIGN KEY (`product_id`)
        REFERENCES `product` (`id_product`),
    KEY `fk_category_product_consoles` (`id_category_product`),
    CONSTRAINT `fk_category_product_consoles` FOREIGN KEY (`id_category_product`)
        REFERENCES `product_category` (`id_category_product`)
);

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`categories` (
    `id_category` BIGINT(20) NOT NULL,
    `name_category` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id_category`)
);

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`platforms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`platforms` (
    `id_platforms` BIGINT(20) NOT NULL,
    `plataform_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id_platforms`)
);

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`games` (
    `id_game` BIGINT(20) NOT NULL,
    `name` VARCHAR(255) NULL DEFAULT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `console_id` BIGINT(20) NOT NULL,
    `category_id` BIGINT(20) NOT NULL,
    `platform_id` BIGINT(20) NOT NULL,
    `product_id` BIGINT(20) NOT NULL,
    `id_category_product` BIGINT(20) NOT NULL,
    PRIMARY KEY (`id_game`),
    KEY `fk_console_game` (`console_id`),
    CONSTRAINT `fk_console_game` FOREIGN KEY (`console_id`)
        REFERENCES `consoles` (`id_console`),
    KEY `fk_category_game` (`category_id`),
    CONSTRAINT `fk_category_game` FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id_category`),
    KEY `fk_platform_game` (`platform_id`),
    CONSTRAINT `fk_platform_game` FOREIGN KEY (`platform_id`)
        REFERENCES `platforms` (`id_platforms`),
    KEY `fk_product_game` (`product_id`),
    CONSTRAINT `fk_product_game` FOREIGN KEY (`product_id`)
        REFERENCES `product` (`id_product`),
    KEY `fk_category_product_games` (`id_category_product`),
    CONSTRAINT `fk_category_product_games` FOREIGN KEY (`id_category_product`)
        REFERENCES `product_category` (`id_category_product`)
);

-- -
-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`companies` (
    `id_company` BIGINT(20) NOT NULL,
    `name` VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (`id_company`)
);

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`accesories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce-daw`.`accesories` (
    `id_accessories` BIGINT(20) NOT NULL,
    `name` VARCHAR(255) NULL DEFAULT NULL,
    `description` VARCHAR(255) NULL DEFAULT NULL,
    `product_id` BIGINT(20) NOT NULL,
    `company_id` BIGINT(20) NOT NULL,
    `id_category_product` BIGINT(20) NOT NULL,
    PRIMARY KEY (`id_accessories`),
    KEY `fk_product` (`product_id`),
    CONSTRAINT `fk_product` FOREIGN KEY (`product_id`)
        REFERENCES `product` (`id_product`),
    KEY `fk_company` (`company_id`),
    CONSTRAINT `fk_company` FOREIGN KEY (`company_id`)
        REFERENCES `companies` (`id_company`),
    KEY `fk_category_product_accesories` (`id_category_product`),
    CONSTRAINT `fk_category_product_accesories` FOREIGN KEY (`id_category_product`)
        REFERENCES `product_category` (`id_category_product`)
);

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`order_exchange`
-- -----------------------------------------------------
CREATE TABLE order_exchange (
    id_order BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME,
    user_id_1 INT,
    product_id_1 BIGINT,
    user_id_2 INT,
    product_id_2 BIGINT,
    FOREIGN KEY (user_id_1)
        REFERENCES user (id_user),
    FOREIGN KEY (product_id_1)
        REFERENCES product (id_product),
    FOREIGN KEY (user_id_2)
        REFERENCES user (id_user),
    FOREIGN KEY (product_id_2)
        REFERENCES product (id_product)
);


-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`order_buy`
-- -----------------------------------------------------
CREATE TABLE order_buy (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    order_date DATETIME,
    id_product BIGINT,
    FOREIGN KEY (id_user)
        REFERENCES user (id_user),
    FOREIGN KEY (id_product)
        REFERENCES product (id_product)
);

-- -----------------------------------------------------
-- Table `full-stack-ecommerce-daw`.`admin`
-- -----------------------------------------------------
CREATE TABLE tb_admin (
    id_admin INT PRIMARY KEY,
    fullaname_admin VARCHAR(255),
    surname_admin VARCHAR(255),
    username_admin VARCHAR(255),
    password_admin VARCHAR(255),
    email_admin VARCHAR(255),
    phone_admin INT
);

-- -----------------------------------------------------
-- Hacer alter table por p
-- -----------------------------------------------------
-- cambiando x error de referenciado many to one en consolas con producto por nombre de campo
ALTER TABLE `full-stack-ecommerce-daw`.`consoles` 
DROP FOREIGN KEY `fk_product_consoles`;

ALTER TABLE `full-stack-ecommerce-daw`.`consoles` 
CHANGE COLUMN `product_id` `id_product` BIGINT NOT NULL ;

ALTER TABLE `full-stack-ecommerce-daw`.`consoles` 
ADD CONSTRAINT `fk_product_consoles`
  FOREIGN KEY (`id_product`)
  REFERENCES `full-stack-ecommerce-daw`.`product` (`id_product`);

ALTER TABLE `full-stack-ecommerce-daw`.`accesories` 
DROP FOREIGN KEY `fk_company`,
DROP FOREIGN KEY `fk_product`;

ALTER TABLE `full-stack-ecommerce-daw`.`accesories` 
CHANGE COLUMN `product_id` `id_product` BIGINT NOT NULL ,
CHANGE COLUMN `company_id` `id_company` BIGINT NOT NULL ;

ALTER TABLE `full-stack-ecommerce-daw`.`accesories` 
ADD CONSTRAINT `fk_company`
  FOREIGN KEY (`id_company`)
  REFERENCES `full-stack-ecommerce-daw`.`companies` (`id_company`),
ADD CONSTRAINT `fk_product`
  FOREIGN KEY (`id_product`)
  REFERENCES `full-stack-ecommerce-daw`.`product` (`id_product`);

ALTER TABLE `full-stack-ecommerce-daw`.`games` 
DROP FOREIGN KEY `fk_category_game`,
DROP FOREIGN KEY `fk_console_game`,
DROP FOREIGN KEY `fk_platform_game`,
DROP FOREIGN KEY `fk_product_game`;

ALTER TABLE `full-stack-ecommerce-daw`.`games` 
CHANGE COLUMN `console_id` `id_console` BIGINT NOT NULL ,
CHANGE COLUMN `category_id` `id_category` BIGINT NOT NULL ,
CHANGE COLUMN `platform_id` `id_platforms` BIGINT NOT NULL ,
CHANGE COLUMN `product_id` `id_product` BIGINT NOT NULL ;

ALTER TABLE `full-stack-ecommerce-daw`.`games` 
ADD CONSTRAINT `fk_category_game`
  FOREIGN KEY (`id_category`)
  REFERENCES `full-stack-ecommerce-daw`.`categories` (`id_category`),
ADD CONSTRAINT `fk_console_game`
  FOREIGN KEY (`id_console`)
  REFERENCES `full-stack-ecommerce-daw`.`consoles` (`id_console`),
ADD CONSTRAINT `fk_platform_game`
  FOREIGN KEY (`id_platforms`)
  REFERENCES `full-stack-ecommerce-daw`.`platforms` (`id_platforms`),
ADD CONSTRAINT `fk_product_game`
  FOREIGN KEY (`id_product`)
  REFERENCES `full-stack-ecommerce-daw`.`product` (`id_product`);
  
  ALTER TABLE `full-stack-ecommerce-daw`.`product_category` 
CHANGE COLUMN `id_category_product` `id` BIGINT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `full-stack-ecommerce-daw`.`product` 
DROP FOREIGN KEY `fk_category_product`;

ALTER TABLE `full-stack-ecommerce-daw`.`product` 
CHANGE COLUMN `id_category_product` `category_id` BIGINT NOT NULL ;

ALTER TABLE `full-stack-ecommerce-daw`.`product` 
ADD CONSTRAINT `fk_category_product`
  FOREIGN KEY (`category_id`)
  REFERENCES `full-stack-ecommerce-daw`.`product_category` (`id`);

ALTER TABLE `full-stack-ecommerce-daw`.`product` 
CHANGE COLUMN `id_product` `id` BIGINT NOT NULL ;

ALTER TABLE `full-stack-ecommerce-daw`.`accesories` 
DROP FOREIGN KEY `fk_category_product_accesories`,
DROP FOREIGN KEY `fk_product`;

ALTER TABLE `full-stack-ecommerce-daw`.`accesories` 
CHANGE COLUMN `id_product` `id` BIGINT NOT NULL ,
CHANGE COLUMN `id_category_product` `category_id` BIGINT NOT NULL ;

ALTER TABLE `full-stack-ecommerce-daw`.`accesories` 
ADD CONSTRAINT `fk_category_product_accesories`
  FOREIGN KEY (`category_id`)
  REFERENCES `full-stack-ecommerce-daw`.`product_category` (`id`),
ADD CONSTRAINT `fk_product`
  FOREIGN KEY (`id`)
  REFERENCES `full-stack-ecommerce-daw`.`product` (`id`);

ALTER TABLE `full-stack-ecommerce-daw`.`games` 
DROP FOREIGN KEY `fk_category_product_games`;

ALTER TABLE `full-stack-ecommerce-daw`.`games` 
CHANGE COLUMN `id_category_product` `category_id` BIGINT NOT NULL ;

ALTER TABLE `full-stack-ecommerce-daw`.`games` 
ADD CONSTRAINT `fk_category_product_games`
  FOREIGN KEY (`category_id`)
  REFERENCES `full-stack-ecommerce-daw`.`product_category` (`id`);

-- recordar que para eliminar un producto
  -- primero se debe eliminar en la tabla hijo Ejemplo
  -- si quieres elimar el product con id 3000
  -- tienes que ir a la tabla accesorios y eliminarlo
  -- despues volver a la tabla producto y eliminarlo
  
-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------
insert into user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Fabricio','Alexander','Becerra','Azana',20,'fabricio@gmail.com',999888777);
insert into user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Raul','Daniel','Lopez','Carrasco',18,'raul@gmail.com',999888777);
insert into user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Pedro','Manuel','Gonzales','Rios',27,'pedro@gmail.com',999888777);
insert into user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Juan','Romeo','Vergara','Rodriguez',20,'juan@gmail.com',999888777);
insert into user (first_name,second_name,last_name_pat,last_name_mat,age,email,num_phone)
values ('Luis','Adrian','Tardillo','Sanchez',20,'luis@gmail.com',999888777);



INSERT INTO product_category(category_name) VALUES ('Consoles');
INSERT INTO product_category(category_name) VALUES ('Games');
INSERT INTO product_category(category_name) VALUES ('Accesories');

UPDATE `full-stack-ecommerce-daw`.`product_category` 
SET 
    `category_name` = 'Consolas'
WHERE
    (`id` = '1');
UPDATE `full-stack-ecommerce-daw`.`product_category` 
SET 
    `category_name` = 'Juegos'
WHERE
    (`id` = '2');
UPDATE `full-stack-ecommerce-daw`.`product_category` 
SET 
    `category_name` = 'Accesorios'
WHERE
    (`id` = '3');

SELECT 
    *
FROM
    product_category;


SELECT 
    *
FROM
    product;
-- 1000 para consolas
-- 2000 para juegos
-- 3000 para accesorios
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,id_category_product) VALUES 
('1000','Play Station 5','CONSOLE_00001','Play Station 5 Modelo 2022 1TB Digital','599.99','assets/images/products/consolas/console-luv2code-1000.png','30',NOW(),1);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,id_category_product) VALUES 
('1001','Xbox Series X','CONSOLE_00002','Xbox Series X 1TB Black Version 1TB','599.99','assets/images/products/consolas/console-luv2code-1001.png','30',NOW(),1);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,id_category_product) VALUES 
('1002','PC','CONSOLE_00003','PC GAMING STATION','599.99','assets/images/products/consolas/console-luv2code-1002.png','30',NOW(),1);

-- Ciclo 2023-2
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('1000','Play Station 5','CONSOLE_00001','Play Station 5 Modelo 2022 1TB Digital','599.99','assets/images/products/consolas/console-luv2code-1000.png','30',NOW(),1);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('1001','Xbox Series X','CONSOLE_00002','Xbox Series X 1TB Black Version 1TB','599.99','assets/images/products/consolas/console-luv2code-1001.png','30',NOW(),1);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('1002','PC','CONSOLE_00003','PC GAMING STATION','599.99','assets/images/products/consolas/console-luv2code-1002.png','30',NOW(),1);
--

-- select * from product

INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2000','GTA V PREMIUM EDITION','VIDEOGAME_00001','GTA V PREMIUM EDITION EPIC GAMES VERSION','50.99','assets/images/products/juegos/juegos-luv2code-2000.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2001','RED DEAD REDEMPTION II','VIDEOGAME_00002','RED DEAD REDEMPTION EPIC GAMES VERSION','50.99','assets/images/products/juegos/juegos-luv2code-2001.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2002','CYBERPUNK 2077','VIDEOGAME_00003','CYBERPUNK 2077 GOG VERSION','50.99','assets/images/products/juegos/juegos-luv2code-2002.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2003','Hogwarts Legacy | Deluxe Edition','VIDEOGAME_00004','Hogwarts Legacy | Deluxe Edition (PC)','50.99','assets/images/products/juegos/juegos-luv2code-2003.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2004','The Last of Us Part I (PC)','VIDEOGAME_00005','The Last of Us Part I (PC)','50.99','assets/images/products/juegos/juegos-luv2code-2004.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2005','God of War (PC)','VIDEOGAME_00006','God of War (PC)','50.99','assets/images/products/juegos/juegos-luv2code-2005.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2006','Project Zomboid (PC)','VIDEOGAME_00007','Project Zomboid (PC)','50.99','assets/images/products/juegos/juegos-luv2code-2006.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2007','Far Cry 6 (PC)','VIDEOGAME_00008','Far Cry 6 (PC) - Ubisoft','50.99','assets/images/products/juegos/juegos-luv2code-2007.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2008','No Mans Sky (PC)','VIDEOGAME_00009','No Mans Sky (PC) - Steam','50.99','assets/images/products/juegos/juegos-luv2code-2008.png','30',NOW(),2);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('2009','Farming Simulator 22 (PC)','VIDEOGAME_00010','Farming Simulator 22 (PC)','50.99','assets/images/products/juegos/juegos-luv2code-2009.png','30',NOW(),2);



INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('3000','Teclado Gamer Logitech','ACCESORIES_00001','Teclado Gamer Logitech con red switch 1MS','29.99','assets/images/products/accesorios/accesorios-luv2code-3000.png','30',NOW(),3);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('3001','Audifono Gamer Razer','ACCESORIES_00002','Audifono Gamer Razer 7.1 White Version','29.99','assets/images/products/accesorios/accesorios-luv2code-3001.png','30',NOW(),3);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('3002','Mouse Gamer Corsair','ACCESORIES_00003','Mouse Gamer Corsair Black Version','29.99','assets/images/products/accesorios/accesorios-luv2code-3002.png','30',NOW(),3);
INSERT INTO product (id,name,sku,description,unit_price,image_url,units_in_stock,date_created,category_id) VALUES 
('3003','Mouse Gamer Corsair Test','ACCESORIES_00003','Mouse Gamer Corsair Black Version','29.99','assets/images/products/accesorios/accesorios-luv2code-3002.png','30',NOW(),3);


insert into consoles values (1000,'Play Station 5','Play Station 5 Modelo 2022 1TB Digital','Modelo PS 5 PRO','2022',1000,1);
insert into consoles values (1001,'Xbox Series X','Xbox Series X 1TB Black Version 1TB','Modelo Lanzamiento','2020',1001,1);
insert into consoles values (1002,'PC','PC GAMING STATION','Pc Gamer','2023',1002,1);


INSERT into categories values(1, 'Accion');
INSERT into categories values(2, 'Aventura');
INSERT into categories values(3, 'Rol');
INSERT into categories values(4, 'Simulacion');
INSERT into categories values(5, 'Estrategia');
INSERT into categories values(6, 'Deportes');
INSERT into categories values(7, 'Carreras');
INSERT into categories values(8, 'Realidad Virtual');


insert into platforms values (1,'Steam');
insert into platforms values (2,'Epic Games');
insert into platforms values (3,'GOG');
insert into platforms values (4,'Origin');
insert into platforms values (5,'Ubisoft');
insert into platforms values (6,'Blizzard');



insert into games values (2000,'GTA V PREMIUM EDITION','GTA V PREMIUM EDITION EPIC GAMES VERSION',1002,2,2,2000,2);
insert into games values (2001,'RED DEAD REDEMPTION','RED DEAD REDEMPTION EPIC GAMES VERSION',1002,2,2,2001,2);
insert into games values (2002,'CYBERPUNK 2077','CYBERPUNK 2077 GOG VERSION',1002,2,2,2002,2);
insert into games values (2003,'Hogwarts Legacy (PC)','Hogwarts Legacy | Deluxe Edition (PC)',1002,2,2,2003,2);
insert into games values (2004,'The Last of Us Part I (PC)','The Last of Us Part I (PC)',1002,2,2,2004,2);
insert into games values (2005,'God of War (PC)','God of War (PC)',1002,2,2,2005,2);
insert into games values (2006,'Project Zomboid (PC)','Project Zomboid (PC)',1002,2,2,2006,2);
insert into games values (2007,'Far Cry 6 (PC)','Far Cry 6 (PC) - Ubisoft',1002,2,2,2007,2);
insert into games values (2008,'No Mans Sky (PC)','No Mans Sky (PC) - Steam',1002,2,2,2008,2);
insert into games values (2009,'Farming Simulator 22 (PC)','Farming Simulator 22 (PC)',1002,2,2,2009,2);




INSERT INTO companies VALUES (1,'Logitech');
INSERT INTO companies VALUES (2,'Razer');
INSERT INTO companies VALUES (3,'Corsair');

INSERT INTO accesories (id_accessories,name,description,id,id_company,category_id) VALUES 
('3000','Teclado Gamer Logitech','Teclado Gamer Logitech con red switch 1MS',3000,1,3);
INSERT INTO accesories (id_accessories,name,description,id,id_company,category_id) VALUES 
('3001','Audifono Gamer Razer','Audifono Gamer Razer 7.1 White Version',3001,2,3);
INSERT INTO accesories (id_accessories,name,description,id,id_company,category_id) VALUES 
('3002','Mouse Gamer Corsair','Mouse Gamer Corsair Black Version',3002,3,3);
INSERT INTO accesories (id_accessories,name,description,id,id_company,category_id) VALUES 
('3003','Mouse Gamer Corsair Test','Mouse Gamer Corsair Black Version',3003,3,3);

SELECT 
    *
FROM
    accesories;

-- falta agregar order buy order exchange admin tables 
INSERT INTO order_exchange (order_date,user_id_1,product_id_1,user_id_2,product_id_2) VALUES(now(),1,3000,2,3002);
INSERT INTO order_exchange (order_date,user_id_1,product_id_1,user_id_2,product_id_2) VALUES(now(),3,2000,4,2002);



INSERT INTO order_buy(id_user,order_date,id_product) values(1,now(),1002);
INSERT INTO order_buy(id_user,order_date,id_product) values(1,now(),2002);
INSERT INTO order_buy(id_user,order_date,id_product) values(1,now(),3002);



INSERT INTO tb_admin values(1,'Fabricio Alexander','Becerra Azana','Admin1','12345','admin1@gmail.com','987654321');





-- 17:18:13	UPDATE `full-stack-ecommerce-daw`.`product_category` SET `category_name` = 'Consolas' WHERE (`id` = '1')	Error Code: 1054. Unknown column 'id' in 'where clause'	0.000 sec

