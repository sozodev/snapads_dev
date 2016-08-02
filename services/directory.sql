#------------------------------------------------------------
#        Script de création BD MySQL : *** SNAPADS ***
#------------------------------------------------------------


#------------------------------------------------------------
# Creation de la base
#------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `sozounltsnapads`
DEFAULT CHARACTER SET utf8
COLLATE utf8_general_ci;
USE `sozounltsnapads`;

#------------------------------------------------------------
# Table: ads
#------------------------------------------------------------


DROP TABLE IF EXISTS `ads`;
CREATE TABLE ads(
        id_ad            Int NOT NULL AUTO_INCREMENT ,
        ad_title         Varchar (64) NOT NULL ,
        ad_begin_date    Date NOT NULL ,
        ad_end_date      Date NOT NULL ,
        ad_actual_price  Decimal (20) NOT NULL ,
        ad_old_price     Decimal (20) NOT NULL ,
        ad_pos_longitude Decimal (7) NOT NULL ,
        ad_pos_latitude  Decimal (7) NOT NULL ,
        ad_description   Varchar (255) NOT NULL ,
        ad_photo_name    Varchar (45) NOT NULL,
        ad_photo_folder  Varchar (45) NOT NULL,
        ad_state         TinyINT NOT NULL ,
        ad_activate      TinyINT NOT NULL ,
        id_category      Int NOT NULL ,
        id_location      Int NOT NULL ,
        id_user          Int NOT NULL ,
        PRIMARY KEY (id_ad ) ,
        UNIQUE (ad_description ,ad_photo_name)
)ENGINE=InnoDB;



#------------------------------------------------------------
# Table: categories
#------------------------------------------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE categories(
        id_category       Int NOT NULL AUTO_INCREMENT ,
        category_name     Varchar (45) NOT NULL ,
        category_activate TinyINT NOT NULL ,
        PRIMARY KEY (id_category ) ,
        UNIQUE (category_name )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: companies
#------------------------------------------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE companies(
        id_company    Int NOT NULL AUTO_INCREMENT ,
        company_name  Varchar (45) NOT NULL ,
        company_siret Int NOT NULL ,
        id_location   Int NOT NULL  ,
        id_category   Int NOT NULL  ,
        PRIMARY KEY (id_company ) ,
        UNIQUE (company_siret )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: locations
#------------------------------------------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE locations(
        id_location   Int NOT NULL AUTO_INCREMENT ,
        street_name   Varchar (45) NOT NULL ,
        city_name     Varchar (32) NOT NULL ,
        zipcode       Int NOT NULL ,
        country       Varchar (32) NOT NULL ,
        PRIMARY KEY (id_location )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: settings
#------------------------------------------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE settings(
        id_setting              Int NOT NULL AUTO_INCREMENT ,
        setting_notification    TinyINT NOT NULL ,
        setting_newsletter      TinyINT NOT NULL ,
        setting_radius          TinyINT NOT NULL ,
        setting_user_categories TinyINT NOT NULL ,
        id_user                 Int NOT NULL,
        PRIMARY KEY (id_setting )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: users
#------------------------------------------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE users(
        id_user            Int NOT NULL AUTO_INCREMENT ,
        user_firstname     Varchar (32) NOT NULL ,
        user_lastname      Varchar (32) NOT NULL ,
        user_nickname      Varchar (32) NOT NULL ,
        user_login         Varchar (32) NOT NULL ,
        user_password      Varchar (32) NOT NULL ,
        user_email         Varchar (128) NOT NULL ,
        user_telephone     Int NOT NULL ,
        user_last_pass_gen Datetime NOT NULL ,
        user_active        TinyINT NOT NULL ,
        user_deleted       TinyINT NOT NULL ,
        user_type          TinyINT NOT NULL ,
        id_location        Int NOT NULL ,
        id_company         Int NOT NULL ,
        PRIMARY KEY (id_user ) ,
        INDEX (user_firstname ) ,
        UNIQUE (user_nickname ,user_login ,user_email )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: internaute
#------------------------------------------------------------
DROP TABLE IF EXISTS `internaute`;
CREATE TABLE internaute(
        ip Varchar (25) NOT NULL ,
        PRIMARY KEY (ip )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: interest
#------------------------------------------------------------
DROP TABLE IF EXISTS `interest`;
CREATE TABLE interest(
        id_category Int NOT NULL AUTO_INCREMENT ,
        id_user     Int NOT NULL  ,
        PRIMARY KEY (id_category ,id_user )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: follow
#------------------------------------------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE follow(
        id_ad   Int NOT NULL AUTO_INCREMENT ,
        id_user Int NOT NULL  ,
        PRIMARY KEY (id_ad ,id_user )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: consult
#------------------------------------------------------------
DROP TABLE IF EXISTS `consult`;
CREATE TABLE consult(
        id_ad Int NOT NULL AUTO_INCREMENT ,
        ip    Varchar (25) NOT NULL ,
        PRIMARY KEY (id_ad ,ip )
)ENGINE=InnoDB;

ALTER TABLE ads ADD CONSTRAINT FK_ads_id_category FOREIGN KEY (id_category) REFERENCES categories(id_category);
ALTER TABLE ads ADD CONSTRAINT FK_ads_id_location FOREIGN KEY (id_location) REFERENCES locations(id_location);
ALTER TABLE ads ADD CONSTRAINT FK_ads_id_user FOREIGN KEY (id_user) REFERENCES users(id_user);
ALTER TABLE companies ADD CONSTRAINT FK_companies_id_location FOREIGN KEY (id_location) REFERENCES locations(id_location);
ALTER TABLE companies ADD CONSTRAINT FK_companies_id_category FOREIGN KEY (id_category) REFERENCES categories(id_category);
ALTER TABLE settings ADD CONSTRAINT FK_settings_id_user FOREIGN KEY (id_user) REFERENCES users(id_user);
ALTER TABLE users ADD CONSTRAINT FK_users_id_location FOREIGN KEY (id_location) REFERENCES locations(id_location);
ALTER TABLE users ADD CONSTRAINT FK_users_id_company FOREIGN KEY (id_company) REFERENCES companies(id_company);
ALTER TABLE interest ADD CONSTRAINT FK_interest_id_category FOREIGN KEY (id_category) REFERENCES categories(id_category);
ALTER TABLE interest ADD CONSTRAINT FK_interest_id_user FOREIGN KEY (id_user) REFERENCES users(id_user);
ALTER TABLE follow ADD CONSTRAINT FK_follow_id_ad FOREIGN KEY (id_ad) REFERENCES ads(id_ad);
ALTER TABLE follow ADD CONSTRAINT FK_follow_id_user FOREIGN KEY (id_user) REFERENCES users(id_user);
ALTER TABLE consult ADD CONSTRAINT FK_consult_id_ad FOREIGN KEY (id_ad) REFERENCES ads(id_ad);
ALTER TABLE consult ADD CONSTRAINT FK_consult_ip FOREIGN KEY (ip) REFERENCES internaute(ip);


-
-- OK
--


INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Alimentation', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Vin-Spiritueux', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Auto-Moto', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Restaurants', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Beauté/Bien Être', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Bricolage', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Electro-Ménager', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Décoration', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Mobilier', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Sorties-Spectacles', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Mode', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Informatique', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Audio-Vidéo', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Santé', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Sport', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('nouveautés', '1');

-
-- OK
--
INSERT INTO `sozounltsnapads`.`locations` (`street_name`, `city_name`, `zipcode`, `country`) VALUES ('22 bis avenue du président kennedy', 'Rosny sous bois ', '93110', 'France');


--
--OK
--

INSERT INTO `sozounltsnapads`.`companies` (`id_location`, `id_category`, `company_name`, `company_siret`) VALUES ('1', '2', 'Karrington création', '732 829 320 00074');


--
--OK
--
INSERT INTO `sozounltsnapads`.`users` (`id_location`, `id_company`, `user_firstname`, `user_lastname`, `user_nickname`, `user_login`, `user_password`, `user_email`, `user_telephone`, `user_last_pass_gen`, `user_active`, `user_deleted`, `user_type`) VALUES ('1', '1', 'Alban', 'Mabiala', 'karrington', 'dready92', '415263crap', 'karrington.creation@gmail.com', '0611196737', '415263Cr@p', '1', '1', '1');


--
--OK
--

INSERT INTO `sozounltsnapads`.`ads` (`ad_title`, `ad_begin_date`, `ad_end_date`, `ad_actual_price`, `ad_old_price`, `ad_pos_longitude`, `ad_pos_latitude`, `ad_description`, `ad_photo_name`, `ad_photo_folder`, `ad_state`, `ad_activate`, `id_category`, `id_location`, `id_user`) VALUES ('Moto 2 places', '12/07/1981', '01/08/2016', '35', '56', '11111', '222222', 'lorem ipsum sit dolor', 'qkqkskkqsdsdsqd.jpg', 'photo', '1', '1', '15', '1', '1');







-- Definition des clés uniques
