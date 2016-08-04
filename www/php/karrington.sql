
-
-- OK
--
ALTER TABLE  karrington.categories AUTO_INCREMENT = 1;

INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Alimentation', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Vin-Spiritueux', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Auto-Moto', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Restaurants', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Beauté/Bien Être', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Bricolage', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Electro-Ménager', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Décoration', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Mobilier', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Sorties-Spectacles', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Mode', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Informatique', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Audio-Vidéo', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Santé', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('Sport', '1');
INSERT INTO `karrington`.`categories` (`category_name`, `category_activate`) VALUES ('nouveautés', '1');

-
-- OK
--
ALTER TABLE  karrington.locations AUTO_INCREMENT = 1;
INSERT INTO `karrington`.`locations` (`street_name`, `city_name`, `zipcode`, `country`) VALUES ('22 bis avenue du président kennedy', 'Rosny sous bois ', '93110', 'France');


--
--OK
--
ALTER TABLE  karrington.companies AUTO_INCREMENT = 1;
INSERT INTO `karrington`.`companies` (`id_location`, `id_category`, `company_name`, `company_siret`) VALUES ('1', '1', 'Karrington création', '732 829 320 00');


--
--OK
--
ALTER TABLE  karrington.users AUTO_INCREMENT = 1;
INSERT INTO `karrington`.`users` (`id_location`, `id_company`, `user_firstname`, `user_lastname`, `user_nickname`, `user_login`, `user_password`, `user_email`, `user_telephone`, `user_last_pass_gen`, `user_active`, `user_deleted`, `user_type`) VALUES ('1', '1', 'Alban', 'Mabiala', 'karrington', 'dready92', '415263crap', 'karrington.creation@gmail.com', '0611196737', '2015-12-17', '1', '1', '1');


--
--KO
--
ALTER TABLE  karrington.ads AUTO_INCREMENT = 1;
INSERT INTO `karrington`.`ads` (`ad_title`, `ad_begin_date`, `ad_end_date`, `ad_actual_price`, `ad_old_price`, `ad_pos_longitude`, `ad_pos_latitude`, `ad_description`, `ad_photo_name`, `ad_photo_folder`, `ad_state`, `ad_activate`, `id_category`, `id_location`, `id_user`) VALUES ('Moto 2 places', '2015-12-17', '2015-12-17', '35', '56', '11111', '222222', 'lorem ipsum sit dolor', 'qkqkskkqsdsdsqd.jpg', 'photo', '1', '1', '15', '1', '1');

