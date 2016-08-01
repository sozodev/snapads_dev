

ALTER TABLE `sozounltsnapads`.`users`
CHANGE COLUMN `user_last_pass_gen` `user_last_pass_gen` DATETIME NOT NULL ;





--
-- Reset et Insertions des categories
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
--Reset et insertions des annonces
--

ALTER TABLE ads AUTO_INCREMENT = 1;
INSERT INTO `ads` (`id_ad`, `id_category`, `id_photo`, `id_location`, `id_user`, `ad_title`, `ad_begin_date`, `ad_end_date`, `ad_actual_price`, `ad_old_price`, `ad_pos_longitude`, `ad_pos_latitude`, `ad_description`, `ad_state`, `ad_activate`) VALUES
(2, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(3, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(4, 1, 1, 1, 1, 'annonce2', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(5, 1, 1, 1, 1, 'annonce2', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(6, 1, 1, 1, 1, 'annonce2', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(7, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(8, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(18, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(22, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(23, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(26, 1, 1, 1, 1, 'dsdsdsdsdsdsdsddsdsds', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(41, 1, 1, 1, 1, 'dsdsdsdsdsdsdsddsdsds', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(42, 1, 1, 1, 1, 'dsdsdsdsdsdsdsddsdsds', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(43, 1, 1, 1, 1, 'eazeeazeaeazeazeaz', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(55, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(56, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(57, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(58, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(59, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(63, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(64, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(65, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(66, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(67, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1);


--
-- une photo dépend d'un add
--
ALTER TABLE photos AUTO_INCREMENT = 1;
INSERT INTO `sozounltsnapads`.`photos` (`photo_name`, `photo_folder`) VALUES ('profil.jpg', 'photo');


